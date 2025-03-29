Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 125AEC36008
	for <intel-xe@archiver.kernel.org>; Sat, 29 Mar 2025 06:10:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B87310E193;
	Sat, 29 Mar 2025 06:10:19 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 557F810E193;
 Sat, 29 Mar 2025 06:10:18 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8867341645318121416=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Expose_modifiers/formats_s?=
 =?utf-8?q?upported_by_async_flips_=28rev14=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 29 Mar 2025 06:10:18 -0000
Message-ID: <174322861833.17146.16379261841607264988@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250328-asyn-v11-0-a50d13bfea0d@intel.com>
In-Reply-To: <20250328-asyn-v11-0-a50d13bfea0d@intel.com>
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

--===============8867341645318121416==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Expose modifiers/formats supported by async flips (rev14)
URL   : https://patchwork.freedesktop.org/series/140934/
State : failure

== Summary ==

CI Bug Log - changes from xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254_FULL -> xe-pw-140934v14_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-140934v14_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-140934v14_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-140934v14_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_properties@get_properties-sanity-non-atomic:
    - shard-adlp:         [PASS][1] -> [FAIL][2] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-adlp-1/igt@kms_properties@get_properties-sanity-non-atomic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-1/igt@kms_properties@get_properties-sanity-non-atomic.html
    - shard-bmg:          [PASS][3] -> [FAIL][4] +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-bmg-4/igt@kms_properties@get_properties-sanity-non-atomic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-bmg-1/igt@kms_properties@get_properties-sanity-non-atomic.html
    - shard-dg2-set2:     [PASS][5] -> [FAIL][6] +1 other test fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-dg2-435/igt@kms_properties@get_properties-sanity-non-atomic.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-464/igt@kms_properties@get_properties-sanity-non-atomic.html
    - shard-lnl:          [PASS][7] -> [FAIL][8] +1 other test fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-lnl-2/igt@kms_properties@get_properties-sanity-non-atomic.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-lnl-2/igt@kms_properties@get_properties-sanity-non-atomic.html

  
#### Warnings ####

  * igt@kms_content_protection@srm:
    - shard-bmg:          [FAIL][9] ([Intel XE#1178]) -> [INCOMPLETE][10] +1 other test incomplete
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-bmg-2/igt@kms_content_protection@srm.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-bmg-2/igt@kms_content_protection@srm.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          [SKIP][11] ([Intel XE#4596]) -> [SKIP][12] +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-yf.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-yf.html

  
New tests
---------

  New tests have been introduced between xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254_FULL and xe-pw-140934v14_FULL:

### New IGT tests (18) ###

  * igt@kms_pm_rpm@legacy-planes-dpms@plane-43:
    - Statuses : 4 pass(s)
    - Exec time: [2.58, 17.53] s

  * igt@kms_pm_rpm@legacy-planes-dpms@plane-53:
    - Statuses : 4 pass(s)
    - Exec time: [2.45, 17.39] s

  * igt@kms_pm_rpm@legacy-planes-dpms@plane-63:
    - Statuses : 4 pass(s)
    - Exec time: [2.65, 17.38] s

  * igt@kms_pm_rpm@legacy-planes-dpms@plane-73:
    - Statuses : 4 pass(s)
    - Exec time: [2.60, 17.62] s

  * igt@kms_pm_rpm@legacy-planes@plane-43:
    - Statuses : 3 pass(s)
    - Exec time: [1.65, 17.66] s

  * igt@kms_pm_rpm@legacy-planes@plane-53:
    - Statuses : 3 pass(s)
    - Exec time: [1.58, 17.58] s

  * igt@kms_pm_rpm@legacy-planes@plane-63:
    - Statuses : 3 pass(s)
    - Exec time: [1.57, 17.55] s

  * igt@kms_pm_rpm@legacy-planes@plane-73:
    - Statuses : 3 pass(s)
    - Exec time: [1.58, 17.41] s

  * igt@kms_pm_rpm@universal-planes-dpms@plane-43:
    - Statuses : 3 pass(s)
    - Exec time: [2.48, 16.07] s

  * igt@kms_pm_rpm@universal-planes-dpms@plane-53:
    - Statuses : 3 pass(s)
    - Exec time: [2.45, 17.45] s

  * igt@kms_pm_rpm@universal-planes-dpms@plane-63:
    - Statuses : 3 pass(s)
    - Exec time: [2.44, 16.26] s

  * igt@kms_pm_rpm@universal-planes-dpms@plane-73:
    - Statuses : 3 pass(s)
    - Exec time: [2.38, 17.60] s

  * igt@kms_pm_rpm@universal-planes-dpms@plane-83:
    - Statuses : 3 pass(s)
    - Exec time: [2.41, 17.58] s

  * igt@kms_pm_rpm@universal-planes@plane-43:
    - Statuses : 4 pass(s)
    - Exec time: [1.71, 17.69] s

  * igt@kms_pm_rpm@universal-planes@plane-53:
    - Statuses : 4 pass(s)
    - Exec time: [1.61, 17.59] s

  * igt@kms_pm_rpm@universal-planes@plane-63:
    - Statuses : 4 pass(s)
    - Exec time: [1.64, 16.01] s

  * igt@kms_pm_rpm@universal-planes@plane-73:
    - Statuses : 4 pass(s)
    - Exec time: [1.68, 16.34] s

  * igt@kms_pm_rpm@universal-planes@plane-83:
    - Statuses : 4 pass(s)
    - Exec time: [1.66, 16.29] s

  

Known issues
------------

  Here are the changes found in xe-pw-140934v14_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-bmg:          [PASS][13] -> [FAIL][14] ([Intel XE#827]) +1 other test fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-4-4-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#3767]) +7 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-463/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-4-4-rc-ccs-cc.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         NOTRUN -> [SKIP][16] ([Intel XE#1124]) +5 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][17] ([Intel XE#316]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-1/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2327])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-bmg-3/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#316]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-464/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#1124]) +5 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-432/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#1124]) +2 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-bmg-3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [PASS][22] -> [SKIP][23] ([Intel XE#2314] / [Intel XE#2894])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#2191]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-6/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#367])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-8/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#367]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-bmg-8/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#2907]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-464/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#787]) +26 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-6/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][29] ([Intel XE#455] / [Intel XE#787]) +17 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-8/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#787]) +139 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-2.html

  * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#455] / [Intel XE#787]) +29 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-432/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-2.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2652] / [Intel XE#787]) +7 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-bmg-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#3442])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-1/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#3432])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html

  * igt@kms_cdclk@mode-transition@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#4417]) +3 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe-a-dp-2.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#306])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-464/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#306])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-1/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_frames@hdmi-crc-single:
    - shard-adlp:         NOTRUN -> [SKIP][38] ([Intel XE#373]) +5 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-8/igt@kms_chamelium_frames@hdmi-crc-single.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2252]) +2 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-bmg-3/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@hdmi-hpd-fast:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#373]) +3 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-464/igt@kms_chamelium_hpd@hdmi-hpd-fast.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][41] ([Intel XE#1178]) +1 other test fail
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-466/igt@kms_content_protection@atomic-dpms@pipe-a-dp-4.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#307]) +2 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-8/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@srm:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][43] ([Intel XE#4132]) +1 other test incomplete
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-432/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][44] ([Intel XE#1188])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-466/igt@kms_content_protection@uevent@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#308]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-1/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#308])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-464/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#309]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-464/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#323])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-adlp:         NOTRUN -> [SKIP][49] ([Intel XE#309]) +3 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-1/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-bmg:          [PASS][50] -> [SKIP][51] ([Intel XE#2291]) +2 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-dg2-set2:     [PASS][52] -> [SKIP][53] ([Intel XE#309]) +3 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-dg2-435/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-adlp:         NOTRUN -> [SKIP][54] ([Intel XE#4302])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-1/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-dg2-set2:     [PASS][55] -> [SKIP][56] ([Intel XE#4331])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-dg2-435/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-464/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
    - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#4422])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-8/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-dg2-set2:     [PASS][58] -> [SKIP][59] ([Intel XE#310]) +7 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-dg2-463/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-464/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:
    - shard-bmg:          [PASS][60] -> [FAIL][61] ([Intel XE#3321]) +2 other tests fail
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][62] ([Intel XE#301]) +2 other tests fail
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][63] ([Intel XE#3321]) +4 other tests fail
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][64] -> [FAIL][65] ([Intel XE#301]) +2 other tests fail
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-panning:
    - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#310]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-464/igt@kms_flip@2x-flip-vs-panning.html

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][67] ([Intel XE#310]) +1 other test skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-8/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check@ad-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][68] ([Intel XE#2049]) +1 other test incomplete
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-bmg-8/igt@kms_flip@2x-plain-flip-ts-check@ad-dp2-hdmi-a3.html

  * igt@kms_flip@2x-plain-flip-ts-check@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][69] -> [INCOMPLETE][70] ([Intel XE#2049]) +1 other test incomplete
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-dg2-435/igt@kms_flip@2x-plain-flip-ts-check@cd-hdmi-a6-dp4.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-436/igt@kms_flip@2x-plain-flip-ts-check@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-bmg:          [PASS][71] -> [SKIP][72] ([Intel XE#2316]) +3 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-bmg-3/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-bmg-4/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-lnl:          [PASS][73] -> [FAIL][74] ([Intel XE#301]) +1 other test fail
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@kms_flip@wf_vblank-ts-check@a-edp1:
    - shard-lnl:          [PASS][75] -> [FAIL][76] ([Intel XE#886]) +1 other test fail
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-lnl-5/igt@kms_flip@wf_vblank-ts-check@a-edp1.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-lnl-4/igt@kms_flip@wf_vblank-ts-check@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-adlp:         NOTRUN -> [SKIP][77] ([Intel XE#455]) +5 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x:
    - shard-adlp:         [PASS][78] -> [DMESG-FAIL][79] ([Intel XE#4543]) +2 other tests dmesg-fail
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     NOTRUN -> [SKIP][80] ([Intel XE#651]) +11 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-modesetfrombusy:
    - shard-adlp:         NOTRUN -> [SKIP][81] ([Intel XE#651]) +8 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][82] ([Intel XE#656]) +24 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [PASS][83] -> [SKIP][84] ([Intel XE#656]) +5 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#4141]) +3 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-adlp:         NOTRUN -> [SKIP][86] ([Intel XE#1151])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#2311]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:
    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#2313]) +3 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
    - shard-adlp:         NOTRUN -> [SKIP][89] ([Intel XE#653]) +6 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][90] ([Intel XE#653]) +9 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][91] ([Intel XE#656]) +6 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#656])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-bmg:          [PASS][93] -> [SKIP][94] ([Intel XE#1503])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-bmg-6/igt@kms_hdr@static-toggle-suspend.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-bmg-4/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-dg2-set2:     [PASS][95] -> [SKIP][96] ([Intel XE#4328])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-dg2-435/igt@kms_joiner@basic-force-big-joiner.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-464/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#4298])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-432/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-bmg:          [PASS][98] -> [SKIP][99] ([Intel XE#3012])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-bmg-8/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-bmg-4/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-adlp:         NOTRUN -> [SKIP][100] ([Intel XE#356])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-8/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-adlp:         [PASS][101] -> [DMESG-WARN][102] ([Intel XE#4173]) +3 other tests dmesg-warn
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-adlp-2/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-4/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][103] ([Intel XE#455]) +4 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-432/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-dg2-set2:     [PASS][104] -> [SKIP][105] ([Intel XE#4596])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-dg2-463/igt@kms_plane_multiple@2x-tiling-none.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-bmg:          [PASS][106] -> [SKIP][107] ([Intel XE#4596])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-x.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][108] ([Intel XE#4212])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-2.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [ABORT][109] ([Intel XE#4540])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-adlp:         NOTRUN -> [SKIP][110] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a:
    - shard-adlp:         NOTRUN -> [SKIP][111] ([Intel XE#2763]) +2 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-bmg:          NOTRUN -> [SKIP][112] ([Intel XE#2392])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-bmg-3/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-dg2-set2:     NOTRUN -> [SKIP][113] ([Intel XE#836])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-464/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-dg2-set2:     [PASS][114] -> [SKIP][115] ([Intel XE#836])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-dg2-463/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-464/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][116] ([Intel XE#1489]) +3 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-432/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-adlp:         NOTRUN -> [SKIP][117] ([Intel XE#1489]) +3 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-8/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [FAIL][118] ([Intel XE#4570]) +2 other tests fail
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][119] ([Intel XE#1489]) +1 other test skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-bmg-3/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@fbc-psr-primary-render:
    - shard-bmg:          NOTRUN -> [SKIP][120] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-bmg-3/igt@kms_psr@fbc-psr-primary-render.html

  * igt@kms_psr@fbc-psr2-primary-blt:
    - shard-adlp:         NOTRUN -> [SKIP][121] ([Intel XE#2850] / [Intel XE#929]) +7 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-1/igt@kms_psr@fbc-psr2-primary-blt.html

  * igt@kms_psr@psr-sprite-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][122] ([Intel XE#2850] / [Intel XE#929]) +6 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-432/igt@kms_psr@psr-sprite-blt.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-adlp:         NOTRUN -> [SKIP][123] ([Intel XE#2939])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][124] ([Intel XE#1127])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][125] ([Intel XE#3414]) +1 other test skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-dg2-set2:     [PASS][126] -> [SKIP][127] ([Intel XE#455]) +1 other test skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-dg2-435/igt@kms_setmode@clone-exclusive-crtc.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-464/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     NOTRUN -> [FAIL][128] ([Intel XE#1729])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-bmg:          NOTRUN -> [SKIP][129] ([Intel XE#1499])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-bmg-3/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg2-set2:     NOTRUN -> [SKIP][130] ([Intel XE#1091] / [Intel XE#2849])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-464/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_ccs@ctrl-surf-copy-new-ctx:
    - shard-adlp:         NOTRUN -> [SKIP][131] ([Intel XE#455] / [Intel XE#488])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-8/igt@xe_ccs@ctrl-surf-copy-new-ctx.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][132] ([Intel XE#1123])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-464/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_copy_basic@mem-set-linear-0x369:
    - shard-adlp:         NOTRUN -> [SKIP][133] ([Intel XE#1126])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-8/igt@xe_copy_basic@mem-set-linear-0x369.html

  * igt@xe_eu_stall@unprivileged-access:
    - shard-dg2-set2:     NOTRUN -> [SKIP][134] ([Intel XE#4497])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-432/igt@xe_eu_stall@unprivileged-access.html

  * igt@xe_eudebug@basic-exec-queues:
    - shard-adlp:         NOTRUN -> [SKIP][135] ([Intel XE#2905]) +6 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-8/igt@xe_eudebug@basic-exec-queues.html

  * igt@xe_eudebug_online@preempt-breakpoint:
    - shard-dg2-set2:     NOTRUN -> [SKIP][136] ([Intel XE#2905]) +5 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-464/igt@xe_eudebug_online@preempt-breakpoint.html

  * igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram:
    - shard-bmg:          NOTRUN -> [SKIP][137] ([Intel XE#2905]) +1 other test skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-bmg-3/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram.html

  * igt@xe_evict@evict-beng-large:
    - shard-adlp:         NOTRUN -> [SKIP][138] ([Intel XE#261] / [Intel XE#688]) +1 other test skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-6/igt@xe_evict@evict-beng-large.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen:
    - shard-adlp:         NOTRUN -> [SKIP][139] ([Intel XE#688])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-8/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][140] ([Intel XE#2322]) +1 other test skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:
    - shard-adlp:         NOTRUN -> [SKIP][141] ([Intel XE#1392]) +3 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:
    - shard-dg2-set2:     [PASS][142] -> [SKIP][143] ([Intel XE#1392]) +3 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-dg2-436/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-once-null:
    - shard-lnl:          NOTRUN -> [SKIP][144] ([Intel XE#1392])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-lnl-6/igt@xe_exec_basic@multigpu-once-null.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][145] ([Intel XE#288]) +10 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-464/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-prefetch.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate:
    - shard-adlp:         NOTRUN -> [SKIP][146] ([Intel XE#288]) +13 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_mmio_probe_early:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][147] ([Intel XE#4173]) +1 other test dmesg-warn
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-1/igt@xe_fault_injection@inject-fault-probe-function-xe_mmio_probe_early.html

  * igt@xe_oa@non-zero-reason:
    - shard-adlp:         NOTRUN -> [SKIP][148] ([Intel XE#2541] / [Intel XE#3573]) +3 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-8/igt@xe_oa@non-zero-reason.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][149] ([Intel XE#2248])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-bmg-3/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_oa@rc6-disable:
    - shard-dg2-set2:     NOTRUN -> [SKIP][150] ([Intel XE#2541] / [Intel XE#3573])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-432/igt@xe_oa@rc6-disable.html

  * igt@xe_oa@syncs-syncobj-cfg:
    - shard-adlp:         NOTRUN -> [SKIP][151] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-8/igt@xe_oa@syncs-syncobj-cfg.html

  * igt@xe_oa@syncs-ufence-wait:
    - shard-dg2-set2:     NOTRUN -> [SKIP][152] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-432/igt@xe_oa@syncs-ufence-wait.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-adlp:         [PASS][153] -> [ABORT][154] ([Intel XE#1794])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-adlp-2/igt@xe_pm@s4-multiple-execs.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-adlp:         NOTRUN -> [SKIP][155] ([Intel XE#944])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-6/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-gt-list:
    - shard-dg2-set2:     NOTRUN -> [SKIP][156] ([Intel XE#944]) +1 other test skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-464/igt@xe_query@multigpu-query-gt-list.html

  * igt@xe_sriov_flr@flr-twice:
    - shard-dg2-set2:     NOTRUN -> [SKIP][157] ([Intel XE#4273])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-464/igt@xe_sriov_flr@flr-twice.html

  
#### Possible fixes ####

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-adlp:         [FAIL][158] ([Intel XE#3908]) -> [PASS][159] +3 other tests pass
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-adlp-4/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-8/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-adlp:         [DMESG-WARN][160] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][161]
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][162] ([Intel XE#2191]) -> [PASS][163]
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-433/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [INCOMPLETE][164] ([Intel XE#3862]) -> [PASS][165] +1 other test pass
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][166] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) -> [PASS][167]
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-dg2-set2:     [SKIP][168] ([Intel XE#309]) -> [PASS][169] +2 other tests pass
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-dg2-464/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-463/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-bmg:          [SKIP][170] ([Intel XE#2291]) -> [PASS][171] +2 other tests pass
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_dp_aux_dev:
    - shard-bmg:          [SKIP][172] ([Intel XE#3009]) -> [PASS][173]
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-bmg-4/igt@kms_dp_aux_dev.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-bmg-6/igt@kms_dp_aux_dev.html

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
    - shard-dg2-set2:     [SKIP][174] ([Intel XE#310]) -> [PASS][175] +10 other tests pass
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-dg2-464/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-435/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][176] ([Intel XE#3321]) -> [PASS][177]
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-suspend@cd-dp2-hdmi-a3:
    - shard-bmg:          [INCOMPLETE][178] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][179] +1 other test pass
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-bmg-6/igt@kms_flip@2x-flip-vs-suspend@cd-dp2-hdmi-a3.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-bmg-8/igt@kms_flip@2x-flip-vs-suspend@cd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [SKIP][180] ([Intel XE#2316]) -> [PASS][181] +9 other tests pass
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank:
    - shard-bmg:          [FAIL][182] ([Intel XE#2882]) -> [PASS][183] +1 other test pass
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-bmg-4/igt@kms_flip@flip-vs-blocking-wf-vblank.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-bmg-8/igt@kms_flip@flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1:
    - shard-lnl:          [FAIL][184] ([Intel XE#886]) -> [PASS][185] +1 other test pass
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-lnl-5/igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-lnl-4/igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][186] ([Intel XE#656]) -> [PASS][187] +6 other tests pass
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_hdr@static-toggle:
    - shard-bmg:          [SKIP][188] ([Intel XE#1503]) -> [PASS][189]
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-bmg-4/igt@kms_hdr@static-toggle.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-bmg-6/igt@kms_hdr@static-toggle.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-dg2-set2:     [SKIP][190] ([Intel XE#4328]) -> [PASS][191]
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-dg2-464/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-435/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-adlp:         [DMESG-WARN][192] ([Intel XE#4173]) -> [PASS][193] +3 other tests pass
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-adlp-6/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-1/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-dg2-set2:     [SKIP][194] ([Intel XE#836]) -> [PASS][195]
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-dg2-464/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-463/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_vrr@negative-basic:
    - shard-dg2-set2:     [SKIP][196] ([Intel XE#455]) -> [PASS][197]
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-dg2-464/igt@kms_vrr@negative-basic.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-433/igt@kms_vrr@negative-basic.html

  * igt@xe_exec_basic@multigpu-once-rebind:
    - shard-dg2-set2:     [SKIP][198] ([Intel XE#1392]) -> [PASS][199] +3 other tests pass
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-dg2-432/igt@xe_exec_basic@multigpu-once-rebind.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-463/igt@xe_exec_basic@multigpu-once-rebind.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-adlp:         [ABORT][200] ([Intel XE#1794]) -> [PASS][201] +1 other test pass
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-6/igt@xe_pm@s4-vm-bind-prefetch.html

  
#### Warnings ####

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][202] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][203] ([Intel XE#787]) +13 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][204] ([Intel XE#787]) -> [SKIP][205] ([Intel XE#455] / [Intel XE#787]) +13 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2-set2:     [SKIP][206] ([Intel XE#4440]) -> [SKIP][207] ([Intel XE#4418])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-dg2-464/igt@kms_cdclk@mode-transition-all-outputs.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-463/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [FAIL][208] ([Intel XE#1178]) -> [SKIP][209] ([Intel XE#2341])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-bmg-3/igt@kms_content_protection@atomic.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-bmg-4/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2-set2:     [SKIP][210] ([Intel XE#455]) -> [FAIL][211] ([Intel XE#1178]) +1 other test fail
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-dg2-464/igt@kms_content_protection@atomic-dpms.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-466/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     [SKIP][212] ([Intel XE#455]) -> [FAIL][213] ([Intel XE#1188])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-dg2-464/igt@kms_content_protection@uevent.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-466/igt@kms_content_protection@uevent.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-dg2-set2:     [SKIP][214] ([Intel XE#310]) -> [FAIL][215] ([Intel XE#301])
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
    - shard-lnl:          [ABORT][216] -> [SKIP][217] ([Intel XE#1397] / [Intel XE#1745])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-lnl:          [ABORT][218] -> [SKIP][219] ([Intel XE#1397])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][220] ([Intel XE#651]) -> [SKIP][221] ([Intel XE#656]) +16 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][222] ([Intel XE#2311]) -> [SKIP][223] ([Intel XE#2312]) +10 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][224] ([Intel XE#4141]) -> [SKIP][225] ([Intel XE#2312]) +4 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][226] ([Intel XE#2312]) -> [SKIP][227] ([Intel XE#4141]) +7 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][228] ([Intel XE#2312]) -> [SKIP][229] ([Intel XE#2311]) +16 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][230] ([Intel XE#656]) -> [SKIP][231] ([Intel XE#651]) +17 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][232] ([Intel XE#656]) -> [SKIP][233] ([Intel XE#653]) +16 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][234] ([Intel XE#2313]) -> [SKIP][235] ([Intel XE#2312]) +12 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][236] ([Intel XE#653]) -> [SKIP][237] ([Intel XE#656]) +14 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][238] ([Intel XE#2312]) -> [SKIP][239] ([Intel XE#2313]) +17 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][240] ([Intel XE#1500]) -> [SKIP][241] ([Intel XE#362])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_module_load@load:
    - shard-adlp:         ([PASS][242], [PASS][243], [PASS][244], [PASS][245], [PASS][246], [PASS][247], [PASS][248], [PASS][249], [PASS][250], [PASS][251], [PASS][252], [PASS][253], [PASS][254], [PASS][255], [PASS][256], [PASS][257], [PASS][258], [PASS][259], [DMESG-WARN][260], [PASS][261], [SKIP][262], [PASS][263], [PASS][264], [PASS][265], [PASS][266], [PASS][267]) ([Intel XE#378] / [Intel XE#4173]) -> ([PASS][268], [PASS][269], [PASS][270], [PASS][271], [PASS][272], [PASS][273], [PASS][274], [PASS][275], [PASS][276], [PASS][277], [PASS][278], [PASS][279], [PASS][280], [PASS][281], [PASS][282], [PASS][283], [PASS][284], [PASS][285], [SKIP][286], [PASS][287], [PASS][288], [PASS][289], [PASS][290], [PASS][291], [PASS][292], [PASS][293]) ([Intel XE#378])
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-adlp-8/igt@xe_module_load@load.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-adlp-4/igt@xe_module_load@load.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-adlp-8/igt@xe_module_load@load.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-adlp-8/igt@xe_module_load@load.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-adlp-1/igt@xe_module_load@load.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-adlp-2/igt@xe_module_load@load.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-adlp-4/igt@xe_module_load@load.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-adlp-4/igt@xe_module_load@load.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-adlp-2/igt@xe_module_load@load.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-adlp-2/igt@xe_module_load@load.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-adlp-2/igt@xe_module_load@load.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-adlp-9/igt@xe_module_load@load.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-adlp-9/igt@xe_module_load@load.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-adlp-9/igt@xe_module_load@load.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-adlp-4/igt@xe_module_load@load.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-adlp-6/igt@xe_module_load@load.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-adlp-6/igt@xe_module_load@load.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-adlp-6/igt@xe_module_load@load.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-adlp-9/igt@xe_module_load@load.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-adlp-6/igt@xe_module_load@load.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-adlp-2/igt@xe_module_load@load.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-adlp-1/igt@xe_module_load@load.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-adlp-1/igt@xe_module_load@load.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-adlp-1/igt@xe_module_load@load.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-adlp-1/igt@xe_module_load@load.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-adlp-8/igt@xe_module_load@load.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-4/igt@xe_module_load@load.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-4/igt@xe_module_load@load.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-6/igt@xe_module_load@load.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-6/igt@xe_module_load@load.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-6/igt@xe_module_load@load.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-6/igt@xe_module_load@load.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-6/igt@xe_module_load@load.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-4/igt@xe_module_load@load.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-2/igt@xe_module_load@load.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-8/igt@xe_module_load@load.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-4/igt@xe_module_load@load.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-2/igt@xe_module_load@load.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-2/igt@xe_module_load@load.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-2/igt@xe_module_load@load.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-9/igt@xe_module_load@load.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-9/igt@xe_module_load@load.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-1/igt@xe_module_load@load.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-9/igt@xe_module_load@load.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-9/igt@xe_module_load@load.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-1/igt@xe_module_load@load.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-1/igt@xe_module_load@load.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-8/igt@xe_module_load@load.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-8/igt@xe_module_load@load.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-8/igt@xe_module_load@load.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-8/igt@xe_module_load@load.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-1/igt@xe_module_load@load.html

  
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#4132]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4132
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
  [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4328
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
  [Intel XE#4418]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4440]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4440
  [Intel XE#4497]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4497
  [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4540
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4570]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4570
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254 -> xe-pw-140934v14

  IGT_8292: 8292
  xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254: 496a62a301bd05e24f3cbe6a0ecd189ca8b0b254
  xe-pw-140934v14: 140934v14

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/index.html

--===============8867341645318121416==
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
<tr><td><b>Series:</b></td><td>Expose modifiers/formats supported by async =
flips (rev14)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/140934/">https://patchwork.freedesktop.org/series/140934/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-140934v14/index.html">https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-140934v14/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca=
8b0b254_FULL -&gt; xe-pw-140934v14_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-140934v14_FULL absolutely need=
 to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-140934v14_FULL, please notify your bug team (I915-ci-=
infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1409=
34v14_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_properties@get_properties-sanity-non-atomic:<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-adlp-1/igt@kms_pro=
perties@get_properties-sanity-non-atomic.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-1/igt@km=
s_properties@get_properties-sanity-non-atomic.html">FAIL</a> +1 other test =
fail</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-bmg-4/igt@kms_prop=
erties@get_properties-sanity-non-atomic.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-bmg-1/igt@kms_=
properties@get_properties-sanity-non-atomic.html">FAIL</a> +1 other test fa=
il</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-dg2-435/igt@kms_pr=
operties@get_properties-sanity-non-atomic.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-464/igt@=
kms_properties@get_properties-sanity-non-atomic.html">FAIL</a> +1 other tes=
t fail</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-lnl-2/igt@kms_prop=
erties@get_properties-sanity-non-atomic.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-lnl-2/igt@kms_=
properties@get_properties-sanity-non-atomic.html">FAIL</a> +1 other test fa=
il</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-bmg-2/igt@kms_cont=
ent_protection@srm.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-bmg-2/igt@kms_content=
_protection@srm.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-bmg-4/igt@kms_plan=
e_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-bmg-6/igt@kms_pl=
ane_multiple@2x-tiling-yf.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-2869-496a62a301bd05e24f3cbe6a0=
ecd189ca8b0b254_FULL and xe-pw-140934v14_FULL:</p>
<h3>New IGT tests (18)</h3>
<ul>
<li>
<p>igt@kms_pm_rpm@legacy-planes-dpms@plane-43:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [2.58, 17.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes-dpms@plane-53:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [2.45, 17.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes-dpms@plane-63:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [2.65, 17.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes-dpms@plane-73:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [2.60, 17.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes@plane-43:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.65, 17.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes@plane-53:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.58, 17.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes@plane-63:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.57, 17.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes@plane-73:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.58, 17.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms@plane-43:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.48, 16.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms@plane-53:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.45, 17.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms@plane-63:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.44, 16.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms@plane-73:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.38, 17.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms@plane-83:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.41, 17.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes@plane-43:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.71, 17.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes@plane-53:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.61, 17.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes@plane-63:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.64, 16.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes@plane-73:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.68, 16.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes@plane-83:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.66, 16.29] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-140934v14_FULL that come from known =
issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-bmg-7/igt@kms_asyn=
c_flips@alternate-sync-async-flip.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-bmg-8/igt@kms_async_=
flips@alternate-sync-async-flip.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>) +1 other test fa=
il</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-4-=
4-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-dg2-463/igt@kms_async_flips@async-flip=
-with-page-flip-events-atomic@pipe-b-dp-4-4-rc-ccs-cc.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767">Intel XE#37=
67</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-adlp-6/igt@kms_big_fb@4-tiled-max-hw-s=
tride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-adlp-1/igt@kms_big_fb@linear-32bpp-rot=
ate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-bmg-3/igt@kms_big_fb@linear-64bpp-rota=
te-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-dg2-464/igt@kms_big_fb@x-tiled-8bpp-ro=
tate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-dg2-432/igt@kms_big_fb@yf-tiled-16bpp-=
rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-bmg-3/igt@kms_big_fb@yf-tiled-max-hw-s=
tride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-bmg-6/igt@kms_bw@c=
onnected-linear-tiling-2-displays-1920x1080p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-bmg-4/i=
gt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#=
2314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-adlp-6/igt@kms_bw@connected-linear-til=
ing-3-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-adlp-8/igt@kms_bw@linear-tiling-1-disp=
lays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-bmg-8/igt@kms_bw@linear-tiling-2-displ=
ays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-dg2-464/igt@kms_ccs@bad-rotation-90-4-=
tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2907">Intel XE#2907</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-adlp-6/igt@kms_ccs@bad-rotation-90-4-t=
iled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +26 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-adlp-8/igt@kms_ccs@ccs-on-another-bo-4=
-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +17 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-=
4-tiled-mtl-rc-ccs-cc@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +139 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-dg2-432/igt@kms_ccs@crc-primary-basic-=
yf-tiled-ccs@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +29 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-bmg-6/igt@kms_ccs@crc-primary-rotation=
-180-4-tiled-lnl-ccs@pipe-b-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +=
7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-adlp-1/igt@kms_ccs@crc-primary-suspend=
-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3442">Intel XE#3442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-=
4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-dg2-432/igt@kms_cdclk@mode-transition@=
pipe-a-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4417">Intel XE#4417</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-dg2-464/igt@kms_chamelium_color@ctm-0-=
75.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-adlp-1/igt@kms_chamelium_color@ctm-red=
-to-blue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-single:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-adlp-8/igt@kms_chamelium_frames@hdmi-c=
rc-single.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/373">Intel XE#373</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-bmg-3/igt@kms_chamelium_hpd@common-hpd=
-after-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2252">Intel XE#2252</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-fast:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-dg2-464/igt@kms_chamelium_hpd@hdmi-hpd=
-fast.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-dg2-466/igt@kms_content_protection@ato=
mic-dpms@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-adlp-8/igt@kms_content_protection@dp-m=
st-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/307">Intel XE#307</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-dg2-432/igt@kms_content_protection@srm=
.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4132">Intel XE#4132</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-dg2-466/igt@kms_content_protection@uev=
ent@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-adlp-1/igt@kms_cursor_crc@cursor-onscr=
een-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-dg2-464/igt@kms_cursor_crc@cursor-rand=
om-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-dg2-464/igt@kms_cursor_legacy@2x-flip-=
vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-dg2-432/igt@kms_cursor_legacy@basic-bu=
sy-flip-before-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-adlp-1/igt@kms_cursor_legacy@cursora-v=
s-flipb-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/309">Intel XE#309</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-bmg-3/igt@kms_curs=
or_legacy@cursorb-vs-flipa-legacy.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-bmg-4/igt@kms_cursor=
_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +2 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-dg2-435/igt@kms_cu=
rsor_legacy@cursorb-vs-flipa-varying-size.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-464/igt@=
kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) =
+3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-adlp-1/igt@kms_display_modes@extended-=
mode-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4302">Intel XE#4302</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-dg2-435/igt@kms_dp=
_linktrain_fallback@dp-fallback.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-464/igt@kms_dp_lin=
ktrain_fallback@dp-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4331">Intel XE#4331</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-adlp-8/igt@kms_fbc_dirty_rect@fbc-dirt=
y-rectangle-out-visible-area.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-dg2-463/igt@kms_fl=
ip@2x-flip-vs-absolute-wf_vblank.html">PASS</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-464/igt@kms_flip@=
2x-flip-vs-absolute-wf_vblank.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +7 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-bmg-1/igt@kms_flip=
@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shar=
d-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3321">Intel XE#3321</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-dg2-433/igt@kms_flip@2x-flip-vs-expire=
d-vblank-interruptible@cd-hdmi-a6-dp4.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +2 other t=
ests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-=
vblank@ab-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-dg2-466/igt@kms_fl=
ip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-466/ig=
t@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</=
a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-dg2-464/igt@kms_flip@2x-flip-vs-pannin=
g.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/310">Intel XE#310</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-adlp-8/igt@kms_flip@2x-flip-vs-wf_vbla=
nk-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/310">Intel XE#310</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-bmg-8/igt@kms_flip@2x-plain-flip-ts-ch=
eck@ad-dp2-hdmi-a3.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) +1 other test incompl=
ete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-dg2-435/igt@kms_fl=
ip@2x-plain-flip-ts-check@cd-hdmi-a6-dp4.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-436/igt@k=
ms_flip@2x-plain-flip-ts-check@cd-hdmi-a6-dp4.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049=
</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-bmg-3/igt@kms_flip=
@2x-wf_vblank-ts-check-interruptible.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-bmg-4/igt@kms_fli=
p@2x-wf_vblank-ts-check-interruptible.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +3 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-lnl-5/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@c-edp1.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-lnl-4/i=
gt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#3=
01</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-lnl-5/igt@kms_flip=
@wf_vblank-ts-check@a-edp1.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-lnl-4/igt@kms_flip@wf_vblan=
k-ts-check@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-adlp-8/igt@kms_flip_scaled_crc@flip-32=
bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-adlp-8/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adl=
p-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html">DME=
SG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4543">Intel XE#4543</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-dg2-432/igt@kms_frontbuffer_tracking@d=
rrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +11 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-modesetfrombusy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-adlp-1/igt@kms_frontbuffer_tracking@dr=
rs-modesetfrombusy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/651">Intel XE#651</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-adlp-1/igt@kms_frontbuffer_tracking@fb=
c-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +24 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-dg2-463/igt@kms_fr=
ontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-=
dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/656">Intel XE#656</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc=
-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +3 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-adlp-8/igt@kms_frontbuffer_tracking@fb=
c-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1151">Intel XE#1151</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc=
drrs-1p-offscren-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +1 oth=
er test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc=
psr-1p-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2313">Intel XE#2313</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-adlp-8/igt@kms_frontbuffer_tracking@fb=
cpsr-indfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-dg2-464/igt@kms_frontbuffer_tracking@p=
sr-1p-offscren-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +9 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-dg2-464/igt@kms_frontbuffer_tracking@p=
sr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +6 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-lnl-6/igt@kms_frontbuffer_tracking@psr=
-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-bmg-6/igt@kms_hdr@=
static-toggle-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-140934v14/shard-bmg-4/igt@kms_hdr@static-toggle-=
suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-dg2-435/igt@kms_jo=
iner@basic-force-big-joiner.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-464/igt@kms_joiner@bas=
ic-force-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4328">Intel XE#4328</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-dg2-432/igt@kms_joiner@basic-max-non-j=
oiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4298">Intel XE#4298</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-bmg-8/igt@kms_join=
er@invalid-modeset-force-big-joiner.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-bmg-4/igt@kms_join=
er@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-adlp-8/igt@kms_multipipe_modeset@basic=
-max-pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-adlp-2/igt@kms_pla=
ne@plane-panning-bottom-right-suspend.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-4/igt@kms_p=
lane@plane-panning-bottom-right-suspend.html">DMESG-WARN</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) =
+3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-dg2-432/igt@kms_plane_lowres@tiling-y.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/455">Intel XE#455</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-dg2-463/igt@kms_pl=
ane_multiple@2x-tiling-none.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-464/igt@kms_plane_mult=
iple@2x-tiling-none.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-bmg-6/igt@kms_plan=
e_multiple@2x-tiling-x.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-140934v14/shard-bmg-4/igt@kms_plane_multiple@2x=
-tiling-x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-dg2-432/igt@kms_plane_scaling@intel-ma=
x-src-size@pipe-a-dp-2.html">DMESG-WARN</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-dg2-432/igt@kms_plane_scaling@intel-ma=
x-src-size@pipe-a-hdmi-a-2.html">ABORT</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4540">Intel XE#4540</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-adlp-8/igt@kms_plane_scaling@planes-up=
scale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) =
+1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a:=
</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-adlp-8/igt@kms_plane_scaling@planes-up=
scale-20x20-downscale-factor-0-25@pipe-a.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-bmg-3/igt@kms_pm_dc@dc5-psr.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392">=
Intel XE#2392</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-dg2-464/igt@kms_pm_rpm@dpms-non-lpsp.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-dg2-463/igt@kms_pm=
_rpm@modeset-non-lpsp-stress.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-464/igt@kms_pm_rpm@mo=
deset-non-lpsp-stress.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-dg2-432/igt@kms_psr2_sf@fbc-pr-overlay=
-plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-adlp-8/igt@kms_psr2_sf@fbc-psr2-cursor=
-plane-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-overlay=
-plane-move-continuous-sf@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4570">Intel XE#4570</a>) +2 othe=
r tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-bmg-3/igt@kms_psr2_sf@pr-cursor-plane-=
move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-bmg-3/igt@kms_psr@fbc-psr-primary-rend=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-adlp-1/igt@kms_psr@fbc-psr2-primary-bl=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/929">Intel XE#929</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-dg2-432/igt@kms_psr@psr-sprite-blt.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/929">Intel XE#929</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-adlp-6/igt@kms_psr_stress_test@flip-pr=
imary-invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-dg2-432/igt@kms_rotation_crc@primary-y=
f-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-dg2-432/igt@kms_rotation_crc@sprite-ro=
tation-90-pos-100-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3414">Intel XE#3414</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-dg2-435/igt@kms_se=
tmode@clone-exclusive-crtc.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-464/igt@kms_setmode@clo=
ne-exclusive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-dg2-432/igt@kms_tiled_display@basic-te=
st-pattern.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-bmg-3/igt@kms_vrr@seamless-rr-switch-v=
rr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-dg2-464/igt@sriov_basic@enable-vfs-bin=
d-unbind-each-numvfs-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-adlp-8/igt@xe_ccs@ctrl-surf-copy-new-c=
tx.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/488">Intel XE#488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-dg2-464/igt@xe_copy_basic@mem-copy-lin=
ear-0xfffe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x369:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-adlp-8/igt@xe_copy_basic@mem-set-linea=
r-0x369.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@unprivileged-access:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-dg2-432/igt@xe_eu_stall@unprivileged-a=
ccess.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4497">Intel XE#4497</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-exec-queues:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-adlp-8/igt@xe_eudebug@basic-exec-queue=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2905">Intel XE#2905</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@preempt-breakpoint:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-dg2-464/igt@xe_eudebug_online@preempt-=
breakpoint.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2905">Intel XE#2905</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-bmg-3/igt@xe_eudebug_online@writes-cac=
hing-vram-bb-vram-target-vram.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-adlp-6/igt@xe_evict@evict-beng-large.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/261">Intel XE#261</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-adlp-8/igt@xe_evict_ccs@evict-overcomm=
it-standalone-nofree-reopen.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-bmg-3/igt@xe_exec_basic@multigpu-many-=
execqueues-many-vm-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>=
) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-adlp-1/igt@xe_exec_basic@multigpu-many=
-execqueues-many-vm-null-defer-bind.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +3 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-dg2-436/igt@xe_exe=
c_basic@multigpu-no-exec-userptr-invalidate-race.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-4=
32/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Int=
el XE#1392</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-lnl-6/igt@xe_exec_basic@multigpu-once-=
null.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-dg2-464/igt@xe_exec_fault_mode@many-ex=
ecqueues-userptr-invalidate-prefetch.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +10 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-adlp-1/igt@xe_exec_fault_mode@twice-bi=
ndexecqueue-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +13 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_mmio_probe_early:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-adlp-1/igt@xe_fault_injection@inject-f=
ault-probe-function-xe_mmio_probe_early.html">DMESG-WARN</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) =
+1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-zero-reason:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-adlp-8/igt@xe_oa@non-zero-reason.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3573">Intel XE#3573</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-bmg-3/igt@xe_oa@oa-tlb-invalidate.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2248">Intel XE#2248</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@rc6-disable:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-dg2-432/igt@xe_oa@rc6-disable.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541=
">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-cfg:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-adlp-8/igt@xe_oa@syncs-syncobj-cfg.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3573">Intel XE#3573</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-ufence-wait:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-dg2-432/igt@xe_oa@syncs-ufence-wait.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3573">Intel XE#3573</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-adlp-2/igt@xe_pm@s=
4-multiple-execs.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-140934v14/shard-adlp-9/igt@xe_pm@s4-multiple-execs.ht=
ml">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-adlp-6/igt@xe_query@multigpu-query-cs-=
cycles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-gt-list:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-dg2-464/igt@xe_query@multigpu-query-gt=
-list.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-twice:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-dg2-464/igt@xe_sriov_flr@flr-twice.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4273">Intel XE#4273</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-adlp-4/igt@kms_ato=
mic_transition@plane-toggle-modeset-transition.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3908">Intel XE#3908</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14=
/shard-adlp-8/igt@kms_atomic_transition@plane-toggle-modeset-transition.htm=
l">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-adlp-4/igt@kms_big=
_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">DMESG-WARN</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#295=
3</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173=
">Intel XE#4173</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-140934v14/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bp=
p-rotate-0-hflip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-dg2-464/igt@kms_bw=
@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14=
/shard-dg2-433/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.htm=
l">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-bmg-8/igt@kms_ccs@=
crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shar=
d-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> +1 o=
ther test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel=
 XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-464/igt@k=
ms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-dg2-464/igt@kms_cu=
rsor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-4=
63/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">PASS</a> +2 other t=
ests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-bmg-4/igt@kms_curs=
or_legacy@cursorb-vs-flipb-legacy.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-bmg-6/=
igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">PASS</a> +2 other tests=
 pass</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-bmg-4/igt@kms_dp_a=
ux_dev.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3009">Intel XE#3009</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-140934v14/shard-bmg-6/igt@kms_dp_aux_dev.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-dg2-464/igt@kms_fl=
ip@2x-absolute-wf_vblank-interruptible.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2=
-435/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html">PASS</a> +10 ot=
her tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-bmg-1/igt@kms_flip=
@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#=
3321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
140934v14/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@=
cd-dp2-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-bmg-6/igt@kms_flip=
@2x-flip-vs-suspend@cd-dp2-hdmi-a3.html">INCOMPLETE</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2=
597</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
40934v14/shard-bmg-8/igt@kms_flip@2x-flip-vs-suspend@cd-dp2-hdmi-a3.html">P=
ASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-bmg-4/igt@kms_flip=
@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard=
-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">PASS</a> =
+9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-bmg-4/igt@kms_flip=
@flip-vs-blocking-wf-vblank.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-bmg-8/igt@km=
s_flip@flip-vs-blocking-wf-vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-lnl-5/igt@kms_flip=
@wf_vblank-ts-check-interruptible@a-edp1.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-l=
nl-4/igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1.html">PASS</a> +1=
 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1409=
34v14/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-=
draw-blt.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-bmg-4/igt@kms_hdr@=
static-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-bmg-6/igt@kms_hdr@static-t=
oggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-dg2-464/igt@kms_jo=
iner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4328">Intel XE#4328</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg=
2-435/igt@kms_joiner@invalid-modeset-force-big-joiner.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-adlp-6/igt@kms_pip=
e_crc_basic@suspend-read-crc.html">DMESG-WARN</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-=
1/igt@kms_pipe_crc_basic@suspend-read-crc.html">PASS</a> +3 other tests pas=
s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-dg2-464/igt@kms_pm=
_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-4=
63/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-dg2-464/igt@kms_vr=
r@negative-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-433/igt@kms_vrr@negat=
ive-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-once-rebind.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-463/igt=
@xe_exec_basic@multigpu-once-rebind.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-adlp-9/igt@xe_pm@s=
4-vm-bind-prefetch.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-6/igt@xe_pm@s4-=
vm-bind-prefetch.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi=
-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-dg2-464/igt@kms_cc=
s@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"=
>Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/787">Intel XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-dg2-463/igt@kms_ccs@crc-primary-rotati=
on-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +=
13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-dg2-435/igt@kms_cc=
s@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE=
#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
140934v14/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs=
@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-dg2-464/igt@kms_cd=
clk@mode-transition-all-outputs.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4440">Intel XE#4440</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-463=
/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4418">Intel XE#4418</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-bmg-3/igt@kms_cont=
ent_protection@atomic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-bmg-4/igt@kms_cont=
ent_protection@atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-dg2-464/igt@kms_co=
ntent_protection@atomic-dpms.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-466/igt@k=
ms_content_protection@atomic-dpms.html">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other tes=
t fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-dg2-464/igt@kms_co=
ntent_protection@uevent.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-dg2-466/igt@kms_co=
ntent_protection@uevent.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-dg2-464/igt@kms_fl=
ip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard=
-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Inte=
l XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-lnl-8/igt@kms_flip=
_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html">ABORT</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/sha=
rd-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscalin=
g.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1397">Intel XE#1397</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-lnl-8/igt@kms_flip=
_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode=
.html">ABORT</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-140934v14/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32=
bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-dg2-463/igt@kms_fr=
ontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934=
v14/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-o=
noff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/656">Intel XE#656</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE=
#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-140934v14/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-in=
dfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2312">Intel XE#2312</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v=
14/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2312">Intel XE#2312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2=
312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
40934v14/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb=
-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4141">Intel XE#4141</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel=
 XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-140934v14/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-=
cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +16 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#6=
56</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
0934v14/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indf=
b-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/651">Intel XE#651</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1409=
34v14/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-ind=
fb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/653">Intel XE#653</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel X=
E#2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-140934v14/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri=
-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-dg2-463/igt@kms_fr=
ontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934=
v14/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/656">Intel XE#656</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
140934v14/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indf=
b-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2313">Intel XE#2313</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-dg2-432/igt@kms_ti=
led_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/=
shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
62">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-adlp-8/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-adlp-4/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-adlp-8/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-ad=
lp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/sha=
rd-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b25=
4/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8=
b0b254/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd1=
89ca8b0b254/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a=
0ecd189ca8b0b254/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3=
cbe6a0ecd189ca8b0b254/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05=
e24f3cbe6a0ecd189ca8b0b254/shard-adlp-2/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a30=
1bd05e24f3cbe6a0ecd189ca8b0b254/shard-adlp-9/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a=
62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-adlp-9/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869=
-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-adlp-9/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-adlp-4/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-adlp-6/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-adlp-6/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-adlp-6/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-ad=
lp-9/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b2=
54/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca=
8b0b254/shard-adlp-2/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cbe6a0ecd=
189ca8b0b254/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e24f3cb=
e6a0ecd189ca8b0b254/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301bd05e2=
4f3cbe6a0ecd189ca8b0b254/shard-adlp-1/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62a301b=
d05e24f3cbe6a0ecd189ca8b0b254/shard-adlp-1/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2869-496a62=
a301bd05e24f3cbe6a0ecd189ca8b0b254/shard-adlp-8/igt@xe_module_load@load.htm=
l">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/378">Intel XE#378</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4173">Intel XE#4173</a>) -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-4/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-140934v14/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-6/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-140934v14/shard-adlp-6/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v=
14/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-6/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-140934v14/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-=
adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-2/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-140934v14/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-4/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-140934v14/shard-adlp-2/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1409=
34v14/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-2/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-140934v14/shard-adlp-9/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/sha=
rd-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-1/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-140934v14/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-9=
/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-1/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140=
934v14/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-8/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-140934v14/shard-adlp-8/igt@xe_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/sh=
ard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v14/shard-adlp-8/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-140934v14/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>) (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#37=
8</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254 -&gt; xe-pw-140=
934v14</li>
</ul>
<p>IGT_8292: 8292<br />
  xe-2869-496a62a301bd05e24f3cbe6a0ecd189ca8b0b254: 496a62a301bd05e24f3cbe6=
a0ecd189ca8b0b254<br />
  xe-pw-140934v14: 140934v14</p>

</body>
</html>

--===============8867341645318121416==--
