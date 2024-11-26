Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92B24D3B9B6
	for <intel-xe@archiver.kernel.org>; Tue, 26 Nov 2024 16:09:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D2ED10E91D;
	Tue, 26 Nov 2024 16:09:55 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 978A510E91B;
 Tue, 26 Nov 2024 16:09:54 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0977325055261842841=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Plane_Color_Pipeline_suppo?=
 =?utf-8?q?rt_for_Intel_platforms?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Uma Shankar" <uma.shankar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 26 Nov 2024 16:09:54 -0000
Message-ID: <173263739459.3394481.2879252571048564393@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241126132730.1192571-1-uma.shankar@intel.com>
In-Reply-To: <20241126132730.1192571-1-uma.shankar@intel.com>
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

--===============0977325055261842841==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Plane Color Pipeline support for Intel platforms
URL   : https://patchwork.freedesktop.org/series/141788/
State : failure

== Summary ==

CI Bug Log - changes from xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e_full -> xe-pw-141788v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-141788v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-141788v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-141788v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@core_getversion@basic:
    - shard-bmg:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-6/igt@core_getversion@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@core_getversion@basic.html

  * igt@kms_cursor_edge_walk@128x128-right-edge:
    - shard-bmg:          [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-3/igt@kms_cursor_edge_walk@128x128-right-edge.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-6/igt@kms_cursor_edge_walk@128x128-right-edge.html

  * igt@kms_cursor_edge_walk@128x128-right-edge@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][5]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-6/igt@kms_cursor_edge_walk@128x128-right-edge@pipe-a-hdmi-a-3.html

  * igt@kms_hdr@static-toggle-suspend@pipe-a-dp-2:
    - shard-bmg:          [PASS][6] -> [SKIP][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-7/igt@kms_hdr@static-toggle-suspend@pipe-a-dp-2.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-6/igt@kms_hdr@static-toggle-suspend@pipe-a-dp-2.html

  * igt@kms_properties@plane-properties-legacy@pipe-a-hdmi-a-1:
    - shard-adlp:         [PASS][8] -> [FAIL][9] +11 other tests fail
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-adlp-6/igt@kms_properties@plane-properties-legacy@pipe-a-hdmi-a-1.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-8/igt@kms_properties@plane-properties-legacy@pipe-a-hdmi-a-1.html

  * igt@kms_properties@plane-properties-legacy@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][10] +7 other tests fail
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_properties@plane-properties-legacy@pipe-a-hdmi-a-6.html

  * igt@kms_properties@plane-properties-legacy@pipe-b-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [FAIL][11] +7 other tests fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-5/igt@kms_properties@plane-properties-legacy@pipe-b-hdmi-a-3.html

  * igt@kms_properties@plane-properties-legacy@pipe-c-edp-1:
    - shard-lnl:          [PASS][12] -> [FAIL][13] +7 other tests fail
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-lnl-4/igt@kms_properties@plane-properties-legacy@pipe-c-edp-1.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-lnl-7/igt@kms_properties@plane-properties-legacy@pipe-c-edp-1.html

  
#### Warnings ####

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         [DMESG-FAIL][14] ([Intel XE#324]) -> [FAIL][15]
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_cursor_crc@cursor-random-256x256:
    - shard-bmg:          [SKIP][16] ([Intel XE#2423]) -> [SKIP][17]
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_cursor_crc@cursor-random-256x256.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-6/igt@kms_cursor_crc@cursor-random-256x256.html

  * igt@kms_properties@plane-properties-legacy:
    - shard-dg2-set2:     [SKIP][18] ([Intel XE#2423] / [i915#2575]) -> [FAIL][19] +1 other test fail
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-466/igt@kms_properties@plane-properties-legacy.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_properties@plane-properties-legacy.html
    - shard-bmg:          [SKIP][20] ([Intel XE#2423]) -> [FAIL][21] +1 other test fail
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_properties@plane-properties-legacy.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-5/igt@kms_properties@plane-properties-legacy.html

  * igt@xe_module_load@reload-no-display:
    - shard-bmg:          [DMESG-WARN][22] ([Intel XE#3467]) -> [FAIL][23]
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-3/igt@xe_module_load@reload-no-display.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@xe_module_load@reload-no-display.html

  
New tests
---------

  New tests have been introduced between xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e_full and xe-pw-141788v1_full:

### New IGT tests (18) ###

  * igt@kms_pm_rpm@legacy-planes-dpms@plane-119:
    - Statuses : 2 pass(s)
    - Exec time: [8.09, 17.48] s

  * igt@kms_pm_rpm@legacy-planes-dpms@plane-128:
    - Statuses : 2 pass(s)
    - Exec time: [8.00, 17.20] s

  * igt@kms_pm_rpm@legacy-planes-dpms@plane-61:
    - Statuses : 2 pass(s)
    - Exec time: [8.10, 17.24] s

  * igt@kms_pm_rpm@legacy-planes-dpms@plane-90:
    - Statuses : 2 pass(s)
    - Exec time: [8.12, 17.35] s

  * igt@kms_pm_rpm@legacy-planes@plane-119:
    - Statuses : 3 pass(s)
    - Exec time: [3.84, 17.33] s

  * igt@kms_pm_rpm@legacy-planes@plane-128:
    - Statuses : 3 pass(s)
    - Exec time: [3.94, 17.62] s

  * igt@kms_pm_rpm@legacy-planes@plane-61:
    - Statuses : 3 pass(s)
    - Exec time: [3.82, 17.68] s

  * igt@kms_pm_rpm@legacy-planes@plane-90:
    - Statuses : 3 pass(s)
    - Exec time: [3.86, 17.44] s

  * igt@kms_pm_rpm@universal-planes-dpms@plane-119:
    - Statuses : 3 pass(s)
    - Exec time: [3.86, 17.36] s

  * igt@kms_pm_rpm@universal-planes-dpms@plane-128:
    - Statuses : 3 pass(s)
    - Exec time: [4.37, 17.37] s

  * igt@kms_pm_rpm@universal-planes-dpms@plane-137:
    - Statuses : 3 pass(s)
    - Exec time: [4.17, 17.57] s

  * igt@kms_pm_rpm@universal-planes-dpms@plane-61:
    - Statuses : 3 pass(s)
    - Exec time: [4.31, 17.24] s

  * igt@kms_pm_rpm@universal-planes-dpms@plane-90:
    - Statuses : 3 pass(s)
    - Exec time: [4.04, 17.40] s

  * igt@kms_pm_rpm@universal-planes@plane-119:
    - Statuses : 1 dmesg-warn(s) 2 pass(s)
    - Exec time: [3.47, 15.97] s

  * igt@kms_pm_rpm@universal-planes@plane-128:
    - Statuses : 1 dmesg-warn(s) 2 pass(s)
    - Exec time: [3.60, 16.09] s

  * igt@kms_pm_rpm@universal-planes@plane-137:
    - Statuses : 1 dmesg-warn(s) 2 pass(s)
    - Exec time: [5.08, 16.12] s

  * igt@kms_pm_rpm@universal-planes@plane-61:
    - Statuses : 1 dmesg-warn(s) 2 pass(s)
    - Exec time: [4.26, 17.57] s

  * igt@kms_pm_rpm@universal-planes@plane-90:
    - Statuses : 1 dmesg-warn(s) 2 pass(s)
    - Exec time: [3.70, 17.33] s

  

Known issues
------------

  Here are the changes found in xe-pw-141788v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotreplug:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#1885])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@core_hotunplug@hotreplug.html

  * igt@core_hotunplug@unbind-rebind:
    - shard-dg2-set2:     [PASS][25] -> [SKIP][26] ([Intel XE#1885])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-435/igt@core_hotunplug@unbind-rebind.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-434/igt@core_hotunplug@unbind-rebind.html

  * igt@core_hotunplug@unplug-rescan:
    - shard-bmg:          [PASS][27] -> [DMESG-WARN][28] ([Intel XE#3468]) +8 other tests dmesg-warn
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-4/igt@core_hotunplug@unplug-rescan.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-4/igt@core_hotunplug@unplug-rescan.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#1885])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-466/igt@core_hotunplug@unplug-rescan.html

  * igt@core_setmaster@master-drop-set-shared-fd:
    - shard-bmg:          [PASS][30] -> [SKIP][31] ([Intel XE#3453])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-7/igt@core_setmaster@master-drop-set-shared-fd.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@core_setmaster@master-drop-set-shared-fd.html

  * igt@core_setmaster@master-drop-set-user:
    - shard-bmg:          [PASS][32] -> [FAIL][33] ([Intel XE#3339])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-4/igt@core_setmaster@master-drop-set-user.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@core_setmaster@master-drop-set-user.html

  * igt@fbdev@read:
    - shard-dg2-set2:     [PASS][34] -> [SKIP][35] ([Intel XE#2134]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-435/igt@fbdev@read.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-466/igt@fbdev@read.html

  * igt@fbdev@unaligned-write:
    - shard-bmg:          [PASS][36] -> [SKIP][37] ([Intel XE#2134]) +2 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-2/igt@fbdev@unaligned-write.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@fbdev@unaligned-write.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:
    - shard-adlp:         [PASS][38] -> [DMESG-FAIL][39] ([Intel XE#1033] / [Intel XE#1727]) +2 other tests dmesg-fail
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1:
    - shard-adlp:         [PASS][40] -> [DMESG-FAIL][41] ([Intel XE#1033] / [Intel XE#1727] / [Intel XE#324])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
    - shard-dg2-set2:     [PASS][42] -> [SKIP][43] ([Intel XE#829])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-435/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg2-set2:     [PASS][44] -> [SKIP][45] ([Intel XE#2136]) +29 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-435/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-434/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          [PASS][46] -> [SKIP][47] ([Intel XE#2136]) +21 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2136]) +33 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         NOTRUN -> [SKIP][49] ([Intel XE#1124])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2327]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-7/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-0:
    - shard-adlp:         [PASS][51] -> [FAIL][52] ([Intel XE#1874]) +5 other tests fail
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-adlp-4/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-9/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [PASS][53] -> [FAIL][54] ([Intel XE#1231]) +1 other test fail
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][55] ([Intel XE#316])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-3/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#1124])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-5/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2328])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-6/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#610])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-4/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#367])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-436/igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#367]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-7/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#787]) +69 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][62] ([Intel XE#2907])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-4/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2887]) +3 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-2/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#455] / [Intel XE#787]) +11 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-436/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#787]) +11 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#2652] / [Intel XE#787]) +19 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][67] ([Intel XE#455] / [Intel XE#787]) +7 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-4/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#2325])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-2/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
    - shard-adlp:         NOTRUN -> [SKIP][69] ([Intel XE#373])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-6/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html

  * igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#2252]) +2 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-4/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#373])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html

  * igt@kms_color@deep-color:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#2423]) +20 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_color@deep-color.html

  * igt@kms_content_protection@legacy@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][73] ([Intel XE#1178]) +2 other tests fail
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_content_protection@legacy@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-adlp:         NOTRUN -> [SKIP][74] ([Intel XE#455])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-1/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_edge_walk@64x64-top-bottom:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][75] ([Intel XE#3468]) +4 other tests dmesg-fail
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-2/igt@kms_cursor_edge_walk@64x64-top-bottom.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#2286])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:
    - shard-bmg:          [PASS][77] -> [SKIP][78] ([Intel XE#2291]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-adlp:         NOTRUN -> [SKIP][79] ([Intel XE#309])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-bmg:          [PASS][80] -> [SKIP][81] ([Intel XE#1340])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_draw_crc@draw-method-mmap-wc:
    - shard-bmg:          [PASS][82] -> [DMESG-FAIL][83] ([Intel XE#3468]) +4 other tests dmesg-fail
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-6/igt@kms_draw_crc@draw-method-mmap-wc.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-5/igt@kms_draw_crc@draw-method-mmap-wc.html

  * igt@kms_draw_crc@draw-method-mmap-wc@rgb565-4tiled:
    - shard-bmg:          [PASS][84] -> [DMESG-WARN][85] ([Intel XE#2705])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-6/igt@kms_draw_crc@draw-method-mmap-wc@rgb565-4tiled.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-5/igt@kms_draw_crc@draw-method-mmap-wc@rgb565-4tiled.html

  * igt@kms_draw_crc@draw-method-render:
    - shard-bmg:          [PASS][86] -> [INCOMPLETE][87] ([Intel XE#1727] / [Intel XE#3468]) +1 other test incomplete
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-4/igt@kms_draw_crc@draw-method-render.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-2/igt@kms_draw_crc@draw-method-render.html

  * igt@kms_draw_crc@draw-method-render@rgb565-4tiled:
    - shard-bmg:          [PASS][88] -> [DMESG-FAIL][89] ([Intel XE#1727] / [Intel XE#3468])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-4/igt@kms_draw_crc@draw-method-render@rgb565-4tiled.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-2/igt@kms_draw_crc@draw-method-render@rgb565-4tiled.html

  * igt@kms_fbcon_fbt@psr:
    - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#776])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-6/igt@kms_fbcon_fbt@psr.html

  * igt@kms_flip@2x-flip-vs-rmfb:
    - shard-adlp:         NOTRUN -> [SKIP][91] ([Intel XE#310]) +1 other test skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-8/igt@kms_flip@2x-flip-vs-rmfb.html

  * igt@kms_flip@2x-plain-flip-ts-check@bc-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][92] ([Intel XE#3468]) +17 other tests dmesg-warn
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-5/igt@kms_flip@2x-plain-flip-ts-check@bc-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank:
    - shard-lnl:          [PASS][93] -> [FAIL][94] ([Intel XE#886]) +3 other tests fail
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-lnl-7/igt@kms_flip@flip-vs-blocking-wf-vblank.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-lnl-3/igt@kms_flip@flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2:
    - shard-bmg:          NOTRUN -> [FAIL][95] ([Intel XE#3486]) +1 other test fail
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:
    - shard-dg2-set2:     [PASS][96] -> [SKIP][97] ([Intel XE#2136] / [Intel XE#2351]) +9 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#455]) +5 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#2293] / [Intel XE#2380])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-adlp:         [PASS][100] -> [DMESG-FAIL][101] ([Intel XE#324]) +1 other test dmesg-fail
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#2293]) +5 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-4:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][103] ([Intel XE#2705] / [Intel XE#3468])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-5/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-4.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][104] ([Intel XE#1727] / [Intel XE#3468])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-5/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x.html

  * igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
    - shard-dg2-set2:     NOTRUN -> [SKIP][105] ([Intel XE#2136]) +41 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#2311]) +8 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][107] ([Intel XE#2136] / [Intel XE#2351]) +16 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-suspend.html
    - shard-adlp:         NOTRUN -> [SKIP][108] ([Intel XE#651])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
    - shard-adlp:         [PASS][109] -> [FAIL][110] ([Intel XE#1861]) +2 other tests fail
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [FAIL][111] ([Intel XE#2333]) +2 other tests fail
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][112] ([Intel XE#2312]) +2 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][113] ([Intel XE#656]) +6 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear:
    - shard-dg2-set2:     NOTRUN -> [SKIP][114] ([Intel XE#651]) +2 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][115] ([Intel XE#653]) +3 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary:
    - shard-adlp:         NOTRUN -> [SKIP][116] ([Intel XE#653]) +1 other test skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][117] ([Intel XE#2313]) +6 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_getfb@getfb-handle-closed:
    - shard-dg2-set2:     [PASS][118] -> [DMESG-WARN][119] ([Intel XE#1727])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-436/igt@kms_getfb@getfb-handle-closed.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_getfb@getfb-handle-closed.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-bmg:          [PASS][120] -> [DMESG-WARN][121] ([Intel XE#3451])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-7/igt@kms_hdr@static-toggle-suspend.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-6/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_invalid_mode@zero-clock:
    - shard-dg2-set2:     [PASS][122] -> [SKIP][123] ([Intel XE#2423] / [i915#2575]) +87 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-435/igt@kms_invalid_mode@zero-clock.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-434/igt@kms_invalid_mode@zero-clock.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - shard-dg2-set2:     NOTRUN -> [SKIP][124] ([Intel XE#2423] / [i915#2575]) +42 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-434/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  * igt@kms_plane_lowres@tiling-none:
    - shard-bmg:          [PASS][125] -> [INCOMPLETE][126] ([Intel XE#3452]) +1 other test incomplete
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-7/igt@kms_plane_lowres@tiling-none.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-5/igt@kms_plane_lowres@tiling-none.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d:
    - shard-adlp:         NOTRUN -> [SKIP][127] ([Intel XE#2763] / [Intel XE#455]) +3 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][128] ([Intel XE#2763]) +14 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][129] ([Intel XE#2763] / [Intel XE#455]) +5 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a:
    - shard-bmg:          NOTRUN -> [SKIP][130] ([Intel XE#2763]) +3 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-3/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c:
    - shard-adlp:         NOTRUN -> [SKIP][131] ([Intel XE#2763]) +5 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-9/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [PASS][132] -> [FAIL][133] ([Intel XE#1430])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-lnl-4/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_lpsp@kms-lpsp@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][134] ([Intel XE#3527])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_pm_lpsp@kms-lpsp@pipe-a-hdmi-a-6.html

  * igt@kms_pm_rpm@cursor:
    - shard-dg2-set2:     [PASS][135] -> [SKIP][136] ([Intel XE#2446])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-435/igt@kms_pm_rpm@cursor.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-434/igt@kms_pm_rpm@cursor.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-dg2-set2:     NOTRUN -> [SKIP][137] ([Intel XE#2446]) +1 other test skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-466/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@legacy-planes-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][138] ([Intel XE#2446])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_pm_rpm@legacy-planes-dpms.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-bmg:          NOTRUN -> [SKIP][139] ([Intel XE#1439] / [Intel XE#3141])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-4/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-bmg:          [PASS][140] -> [SKIP][141] ([Intel XE#2446]) +3 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-2/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@modeset-stress-extra-wait:
    - shard-bmg:          [PASS][142] -> [INCOMPLETE][143] ([Intel XE#1727] / [Intel XE#2864] / [Intel XE#3468])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-4/igt@kms_pm_rpm@modeset-stress-extra-wait.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-7/igt@kms_pm_rpm@modeset-stress-extra-wait.html

  * igt@kms_pm_rpm@universal-planes:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][144] ([Intel XE#2042] / [Intel XE#3468])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-463/igt@kms_pm_rpm@universal-planes.html

  * {igt@kms_pm_rpm@universal-planes@plane-119} (NEW):
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][145] ([Intel XE#3468]) +4 other tests dmesg-warn
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-463/igt@kms_pm_rpm@universal-planes@plane-119.html

  * {igt@kms_pm_rpm@universal-planes@plane-137} (NEW):
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][146] ([Intel XE#1727] / [Intel XE#3468])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-463/igt@kms_pm_rpm@universal-planes@plane-137.html

  * igt@kms_properties@connector-properties-atomic:
    - shard-dg2-set2:     [PASS][147] -> [SKIP][148] ([Intel XE#2924]) +2 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-435/igt@kms_properties@connector-properties-atomic.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_properties@connector-properties-atomic.html

  * igt@kms_properties@connector-properties-legacy:
    - shard-bmg:          [PASS][149] -> [SKIP][150] ([Intel XE#2423]) +95 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-6/igt@kms_properties@connector-properties-legacy.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_properties@connector-properties-legacy.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][151] ([Intel XE#2924]) +3 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html
    - shard-adlp:         NOTRUN -> [SKIP][152] ([Intel XE#1489]) +1 other test skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-4/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][153] ([Intel XE#1489]) +2 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-adlp:         NOTRUN -> [SKIP][154] ([Intel XE#1122])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-1/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-psr-cursor-render:
    - shard-adlp:         NOTRUN -> [SKIP][155] ([Intel XE#2850] / [Intel XE#929])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-2/igt@kms_psr@fbc-psr-cursor-render.html

  * igt@kms_psr@fbc-psr-no-drrs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][156] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-436/igt@kms_psr@fbc-psr-no-drrs.html

  * igt@kms_psr@psr-primary-blt:
    - shard-bmg:          NOTRUN -> [SKIP][157] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-2/igt@kms_psr@psr-primary-blt.html

  * igt@kms_vrr@cmrr:
    - shard-adlp:         NOTRUN -> [SKIP][158] ([Intel XE#2168])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-4/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][159] -> [FAIL][160] ([Intel XE#2159]) +1 other test fail
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01:
    - shard-dg2-set2:     NOTRUN -> [DMESG-FAIL][161] ([Intel XE#1727] / [Intel XE#3468]) +7 other tests dmesg-fail
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01.html

  * igt@xe_copy_basic@mem-copy-linear-0xfd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][162] ([Intel XE#1123])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0xfd.html

  * igt@xe_eudebug@basic-vm-access:
    - shard-dg2-set2:     NOTRUN -> [SKIP][163] ([Intel XE#2905]) +1 other test skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-436/igt@xe_eudebug@basic-vm-access.html
    - shard-adlp:         NOTRUN -> [SKIP][164] ([Intel XE#2905]) +1 other test skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-1/igt@xe_eudebug@basic-vm-access.html

  * igt@xe_eudebug_online@stopped-thread:
    - shard-bmg:          NOTRUN -> [SKIP][165] ([Intel XE#2905]) +3 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-7/igt@xe_eudebug_online@stopped-thread.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          NOTRUN -> [TIMEOUT][166] ([Intel XE#1473])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-6/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-beng-mixed-threads-large-multi-vm:
    - shard-adlp:         NOTRUN -> [SKIP][167] ([Intel XE#261] / [Intel XE#688])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-6/igt@xe_evict@evict-beng-mixed-threads-large-multi-vm.html

  * igt@xe_evict_ccs@evict-overcommit-simple:
    - shard-adlp:         NOTRUN -> [SKIP][168] ([Intel XE#688])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-3/igt@xe_evict_ccs@evict-overcommit-simple.html

  * igt@xe_exec_balancer@twice-cm-virtual-basic:
    - shard-adlp:         [PASS][169] -> [TIMEOUT][170] ([Intel XE#1033] / [Intel XE#1727]) +2 other tests timeout
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-adlp-6/igt@xe_exec_balancer@twice-cm-virtual-basic.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-9/igt@xe_exec_balancer@twice-cm-virtual-basic.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][171] ([Intel XE#1392]) +1 other test skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][172] ([Intel XE#2322]) +2 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-3/igt@xe_exec_basic@multigpu-once-null-rebind.html

  * igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race:
    - shard-bmg:          [PASS][173] -> [SKIP][174] ([Intel XE#1130]) +236 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-5/igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][175] ([Intel XE#288]) +2 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-prefetch.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-race-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][176] ([Intel XE#288]) +1 other test skip
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-1/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
    - shard-adlp:         NOTRUN -> [SKIP][177] ([Intel XE#2360])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-8/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html

  * igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:
    - shard-bmg:          [PASS][178] -> [DMESG-WARN][179] ([Intel XE#3467] / [Intel XE#3468])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early:
    - shard-adlp:         [PASS][180] -> [DMESG-WARN][181] ([Intel XE#3086]) +4 other tests dmesg-warn
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-adlp-1/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-4/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][182] ([Intel XE#3467] / [Intel XE#3468])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init.html

  * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][183] ([Intel XE#3467])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html

  * igt@xe_intel_bb@lot-of-buffers:
    - shard-bmg:          [PASS][184] -> [DMESG-WARN][185] ([Intel XE#1727]) +2 other tests dmesg-warn
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-3/igt@xe_intel_bb@lot-of-buffers.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-4/igt@xe_intel_bb@lot-of-buffers.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-dg2-set2:     NOTRUN -> [SKIP][186] ([Intel XE#2229])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-434/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
    - shard-bmg:          NOTRUN -> [SKIP][187] ([Intel XE#2229])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_module_load@load:
    - shard-bmg:          NOTRUN -> [SKIP][188] ([Intel XE#2457])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-2/igt@xe_module_load@load.html

  * igt@xe_oa@mmio-triggered-reports@ccs-0:
    - shard-lnl:          [PASS][189] -> [FAIL][190] ([Intel XE#2249]) +1 other test fail
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-lnl-7/igt@xe_oa@mmio-triggered-reports@ccs-0.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-lnl-5/igt@xe_oa@mmio-triggered-reports@ccs-0.html

  * igt@xe_oa@syncs-ufence-wait:
    - shard-dg2-set2:     NOTRUN -> [SKIP][191] ([Intel XE#1130]) +75 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-434/igt@xe_oa@syncs-ufence-wait.html

  * igt@xe_pm@d3cold-basic:
    - shard-adlp:         NOTRUN -> [SKIP][192] ([Intel XE#2284] / [Intel XE#366])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-1/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@s2idle-vm-bind-prefetch:
    - shard-adlp:         [PASS][193] -> [DMESG-WARN][194] ([Intel XE#2953] / [Intel XE#3086]) +5 other tests dmesg-warn
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-adlp-6/igt@xe_pm@s2idle-vm-bind-prefetch.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-1/igt@xe_pm@s2idle-vm-bind-prefetch.html

  * igt@xe_pm@s2idle-vm-bind-unbind-all:
    - shard-bmg:          [PASS][195] -> [DMESG-WARN][196] ([Intel XE#1616] / [Intel XE#1727] / [Intel XE#3468])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-4/igt@xe_pm@s2idle-vm-bind-unbind-all.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-4/igt@xe_pm@s2idle-vm-bind-unbind-all.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          [PASS][197] -> [FAIL][198] ([Intel XE#958])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-lnl-1/igt@xe_pm_residency@toggle-gt-c6.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-lnl-3/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-bmg:          NOTRUN -> [SKIP][199] ([Intel XE#944])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-3/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_tlb@basic-tlb:
    - shard-adlp:         [PASS][200] -> [CRASH][201] ([Intel XE#3212])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-adlp-1/igt@xe_tlb@basic-tlb.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-1/igt@xe_tlb@basic-tlb.html
    - shard-lnl:          [PASS][202] -> [CRASH][203] ([Intel XE#3212])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-lnl-6/igt@xe_tlb@basic-tlb.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-lnl-8/igt@xe_tlb@basic-tlb.html

  * igt@xe_vm@bind-no-array-conflict:
    - shard-bmg:          NOTRUN -> [SKIP][204] ([Intel XE#1130]) +47 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@xe_vm@bind-no-array-conflict.html

  * igt@xe_vm@large-binds-1073741824:
    - shard-dg2-set2:     [PASS][205] -> [SKIP][206] ([Intel XE#1130]) +148 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-435/igt@xe_vm@large-binds-1073741824.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-434/igt@xe_vm@large-binds-1073741824.html

  * igt@xe_vm@large-split-binds-33554432:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][207] ([Intel XE#1727])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@xe_vm@large-split-binds-33554432.html

  
#### Possible fixes ####

  * igt@core_getversion@all-cards:
    - shard-bmg:          [FAIL][208] ([Intel XE#3249]) -> [PASS][209]
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@core_getversion@all-cards.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-5/igt@core_getversion@all-cards.html

  * igt@core_getversion@basic:
    - shard-dg2-set2:     [FAIL][210] ([Intel XE#3440]) -> [PASS][211]
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-434/igt@core_getversion@basic.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@core_getversion@basic.html

  * igt@core_hotunplug@hotreplug-lateclose:
    - shard-dg2-set2:     [SKIP][212] ([Intel XE#1885]) -> [PASS][213]
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-466/igt@core_hotunplug@hotreplug-lateclose.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-436/igt@core_hotunplug@hotreplug-lateclose.html

  * igt@core_hotunplug@hotunbind-rebind:
    - shard-bmg:          [SKIP][214] ([Intel XE#1885]) -> [PASS][215] +2 other tests pass
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@core_hotunplug@hotunbind-rebind.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-4/igt@core_hotunplug@hotunbind-rebind.html

  * igt@core_setmaster@master-drop-set-root:
    - shard-bmg:          [FAIL][216] -> [PASS][217]
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@core_setmaster@master-drop-set-root.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-5/igt@core_setmaster@master-drop-set-root.html

  * igt@core_setmaster@master-drop-set-user:
    - shard-dg2-set2:     [FAIL][218] ([Intel XE#3339]) -> [PASS][219]
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-466/igt@core_setmaster@master-drop-set-user.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@core_setmaster@master-drop-set-user.html

  * igt@fbdev@write:
    - shard-dg2-set2:     [SKIP][220] ([Intel XE#2134]) -> [PASS][221] +1 other test pass
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-466/igt@fbdev@write.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@fbdev@write.html

  * igt@kms_addfb_basic@basic:
    - shard-bmg:          [SKIP][222] ([Intel XE#2423]) -> [PASS][223] +73 other tests pass
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_addfb_basic@basic.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-6/igt@kms_addfb_basic@basic.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:
    - shard-adlp:         [DMESG-WARN][224] ([Intel XE#324]) -> [PASS][225] +2 other tests pass
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][226] ([Intel XE#2136]) -> [PASS][227] +19 other tests pass
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-466/igt@kms_big_fb@4-tiled-addfb-size-overflow.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][228] ([Intel XE#2136] / [Intel XE#2351]) -> [PASS][229] +6 other tests pass
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-434/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_big_fb@linear-8bpp-rotate-180:
    - shard-bmg:          [SKIP][230] ([Intel XE#2136]) -> [PASS][231] +19 other tests pass
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_big_fb@linear-8bpp-rotate-180.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-4/igt@kms_big_fb@linear-8bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [FAIL][232] ([Intel XE#1231]) -> [PASS][233] +1 other test pass
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         [FAIL][234] ([Intel XE#3052]) -> [PASS][235]
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-adlp:         [FAIL][236] ([Intel XE#1874]) -> [PASS][237] +1 other test pass
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-bmg:          [INCOMPLETE][238] ([Intel XE#1727] / [Intel XE#3468]) -> [PASS][239]
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-3/igt@kms_cursor_crc@cursor-suspend.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-6/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_edge_walk@256x256-right-edge:
    - shard-bmg:          [DMESG-FAIL][240] ([Intel XE#3468]) -> [PASS][241] +3 other tests pass
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-7/igt@kms_cursor_edge_walk@256x256-right-edge.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-4/igt@kms_cursor_edge_walk@256x256-right-edge.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-dg2-set2:     [SKIP][242] ([Intel XE#2423] / [i915#2575]) -> [PASS][243] +49 other tests pass
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-466/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_feature_discovery@display-2x:
    - shard-bmg:          [SKIP][244] ([Intel XE#2373]) -> [PASS][245]
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-6/igt@kms_feature_discovery@display-2x.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-3/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-busy-flip:
    - shard-bmg:          [SKIP][246] ([Intel XE#2316]) -> [PASS][247] +1 other test pass
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-6/igt@kms_flip@2x-busy-flip.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-3/igt@kms_flip@2x-busy-flip.html

  * igt@kms_flip@absolute-wf_vblank@a-dp2:
    - shard-bmg:          [DMESG-FAIL][248] ([Intel XE#1727] / [Intel XE#3468]) -> [PASS][249] +1 other test pass
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-2/igt@kms_flip@absolute-wf_vblank@a-dp2.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-3/igt@kms_flip@absolute-wf_vblank@a-dp2.html

  * igt@kms_flip@plain-flip-fb-recreate@b-edp1:
    - shard-lnl:          [FAIL][250] ([Intel XE#886]) -> [PASS][251] +6 other tests pass
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-lnl-3/igt@kms_flip@plain-flip-fb-recreate@b-edp1.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-lnl-5/igt@kms_flip@plain-flip-fb-recreate@b-edp1.html

  * igt@kms_flip@plain-flip-fb-recreate@c-edp1:
    - shard-lnl:          [FAIL][252] ([Intel XE#3149] / [Intel XE#886]) -> [PASS][253] +1 other test pass
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-lnl-3/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-lnl-5/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html

  * igt@kms_flip@wf_vblank-ts-check:
    - shard-bmg:          [INCOMPLETE][254] ([Intel XE#2635]) -> [PASS][255] +1 other test pass
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-6/igt@kms_flip@wf_vblank-ts-check.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-4/igt@kms_flip@wf_vblank-ts-check.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         [DMESG-FAIL][256] ([Intel XE#324]) -> [PASS][257] +5 other tests pass
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@basic:
    - shard-dg2-set2:     [SKIP][258] ([Intel XE#2351]) -> [PASS][259]
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-434/igt@kms_frontbuffer_tracking@basic.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
    - shard-adlp:         [FAIL][260] ([Intel XE#1861]) -> [PASS][261] +2 other tests pass
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [INCOMPLETE][262] -> [PASS][263] +1 other test pass
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-3/igt@kms_hdr@invalid-hdr.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-4/igt@kms_hdr@invalid-hdr.html

  * igt@kms_invalid_mode@bad-hsync-start:
    - shard-dg2-set2:     [DMESG-WARN][264] ([Intel XE#1727]) -> [PASS][265] +1 other test pass
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-463/igt@kms_invalid_mode@bad-hsync-start.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-436/igt@kms_invalid_mode@bad-hsync-start.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-bmg:          [SKIP][266] ([Intel XE#3012]) -> [PASS][267]
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-7/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:
    - shard-bmg:          [DMESG-WARN][268] ([Intel XE#3468] / [Intel XE#877]) -> [PASS][269] +1 other test pass
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-6/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-2/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [FAIL][270] ([Intel XE#718]) -> [PASS][271] +1 other test pass
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-lnl-6/igt@kms_pm_dc@dc5-psr.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-lnl-4/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_rpm@cursor-dpms:
    - shard-dg2-set2:     [INCOMPLETE][272] ([Intel XE#1727] / [Intel XE#3468]) -> [PASS][273]
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-463/igt@kms_pm_rpm@cursor-dpms.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_pm_rpm@cursor-dpms.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-bmg:          [DMESG-WARN][274] ([Intel XE#1727] / [Intel XE#3468]) -> [PASS][275]
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-5/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-6/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@drm-resources-equal:
    - shard-bmg:          [SKIP][276] ([Intel XE#2446]) -> [PASS][277] +1 other test pass
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_pm_rpm@drm-resources-equal.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-6/igt@kms_pm_rpm@drm-resources-equal.html

  * igt@kms_pm_rpm@modeset-stress-extra-wait:
    - shard-adlp:         [FAIL][278] -> [PASS][279]
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-adlp-1/igt@kms_pm_rpm@modeset-stress-extra-wait.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-3/igt@kms_pm_rpm@modeset-stress-extra-wait.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-dg2-set2:     [SKIP][280] ([Intel XE#2446]) -> [PASS][281] +2 other tests pass
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-434/igt@kms_pm_rpm@system-suspend-modeset.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-436/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
    - shard-lnl:          [FAIL][282] ([Intel XE#899]) -> [PASS][283] +2 other tests pass
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-bmg:          [INCOMPLETE][284] ([Intel XE#1473] / [Intel XE#3468]) -> [PASS][285]
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-5/igt@xe_evict@evict-beng-mixed-threads-large.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-3/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_exec_balancer@many-cm-virtual-userptr-invalidate:
    - shard-dg2-set2:     [SKIP][286] ([Intel XE#1130]) -> [PASS][287] +123 other tests pass
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-434/igt@xe_exec_balancer@many-cm-virtual-userptr-invalidate.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-463/igt@xe_exec_balancer@many-cm-virtual-userptr-invalidate.html

  * igt@xe_live_ktest@xe_mocs:
    - shard-lnl:          [SKIP][288] ([Intel XE#1192]) -> [PASS][289]
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-lnl-5/igt@xe_live_ktest@xe_mocs.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-lnl-6/igt@xe_live_ktest@xe_mocs.html

  * igt@xe_module_load@many-reload:
    - shard-adlp:         [DMESG-WARN][290] ([Intel XE#2953] / [Intel XE#3086]) -> [PASS][291]
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-adlp-1/igt@xe_module_load@many-reload.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-8/igt@xe_module_load@many-reload.html

  * igt@xe_oa@oa-regs-whitelisted@rcs-0:
    - shard-lnl:          [FAIL][292] ([Intel XE#2514]) -> [PASS][293] +1 other test pass
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-lnl-1/igt@xe_oa@oa-regs-whitelisted@rcs-0.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-lnl-6/igt@xe_oa@oa-regs-whitelisted@rcs-0.html

  * igt@xe_pm@d3hot-mocs:
    - shard-lnl:          [DMESG-WARN][294] ([Intel XE#3184]) -> [PASS][295]
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-lnl-4/igt@xe_pm@d3hot-mocs.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-lnl-6/igt@xe_pm@d3hot-mocs.html

  * igt@xe_pm@s2idle-vm-bind-userptr:
    - shard-bmg:          [DMESG-WARN][296] ([Intel XE#1616] / [Intel XE#1727] / [Intel XE#3468]) -> [PASS][297]
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-2/igt@xe_pm@s2idle-vm-bind-userptr.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-6/igt@xe_pm@s2idle-vm-bind-userptr.html

  * igt@xe_pm@s3-mocs:
    - shard-adlp:         [DMESG-WARN][298] ([Intel XE#3086]) -> [PASS][299] +2 other tests pass
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-adlp-1/igt@xe_pm@s3-mocs.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-4/igt@xe_pm@s3-mocs.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-adlp:         [ABORT][300] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][301]
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-2/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-adlp:         [FAIL][302] ([Intel XE#958]) -> [PASS][303]
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-adlp-9/igt@xe_pm_residency@toggle-gt-c6.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-1/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:
    - shard-bmg:          [DMESG-WARN][304] ([Intel XE#3468]) -> [PASS][305] +53 other tests pass
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-3/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-6/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html

  * igt@xe_vm@bind-once:
    - shard-bmg:          [SKIP][306] ([Intel XE#1130]) -> [PASS][307] +162 other tests pass
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@xe_vm@bind-once.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-6/igt@xe_vm@bind-once.html

  
#### Warnings ####

  * igt@core_hotunplug@hotunplug-rescan:
    - shard-dg2-set2:     [INCOMPLETE][308] ([Intel XE#1727] / [Intel XE#3468]) -> [SKIP][309] ([Intel XE#1885])
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-435/igt@core_hotunplug@hotunplug-rescan.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-466/igt@core_hotunplug@hotunplug-rescan.html

  * igt@kms_addfb_basic@too-wide:
    - shard-dg2-set2:     [DMESG-WARN][310] ([Intel XE#1727]) -> [SKIP][311] ([Intel XE#2423] / [i915#2575])
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-436/igt@kms_addfb_basic@too-wide.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-466/igt@kms_addfb_basic@too-wide.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-adlp:         [DMESG-WARN][312] ([Intel XE#3086]) -> [DMESG-FAIL][313] ([Intel XE#1033] / [Intel XE#1727] / [Intel XE#324])
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-dg2-set2:     [DMESG-WARN][314] ([Intel XE#3468]) -> [SKIP][315] ([Intel XE#2423] / [i915#2575])
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-435/igt@kms_async_flips@async-flip-suspend-resume.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-466/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-bmg:          [SKIP][316] ([Intel XE#873]) -> [SKIP][317] ([Intel XE#2423])
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-5/igt@kms_async_flips@invalid-async-flip.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_async_flips@test-time-stamp:
    - shard-dg2-set2:     [INCOMPLETE][318] ([Intel XE#1727]) -> [SKIP][319] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-463/igt@kms_async_flips@test-time-stamp.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-466/igt@kms_async_flips@test-time-stamp.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-bmg:          [SKIP][320] ([Intel XE#2136]) -> [SKIP][321] ([Intel XE#2327]) +3 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-3/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
    - shard-dg2-set2:     [SKIP][322] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][323] ([Intel XE#316])
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-466/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-436/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][324] ([Intel XE#2136]) -> [SKIP][325] ([Intel XE#316])
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-434/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-436/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
    - shard-bmg:          [DMESG-FAIL][326] ([Intel XE#3468]) -> [SKIP][327] ([Intel XE#2136]) +4 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-3/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][328] ([Intel XE#316]) -> [SKIP][329] ([Intel XE#2136] / [Intel XE#2351])
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-435/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-466/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0:
    - shard-bmg:          [DMESG-WARN][330] ([Intel XE#3468]) -> [SKIP][331] ([Intel XE#2136])
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-4/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-bmg:          [SKIP][332] ([Intel XE#2327]) -> [SKIP][333] ([Intel XE#2136]) +6 other tests skip
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-7/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][334] ([Intel XE#316]) -> [SKIP][335] ([Intel XE#2136]) +1 other test skip
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-436/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-466/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][336] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][337] ([Intel XE#829])
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-466/igt@kms_big_fb@x-tiled-addfb-size-overflow.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_big_fb@x-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-dg2-set2:     [SKIP][338] ([Intel XE#619]) -> [SKIP][339] ([Intel XE#2136] / [Intel XE#2351])
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-435/igt@kms_big_fb@y-tiled-addfb.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [DMESG-WARN][340] ([Intel XE#324]) -> [FAIL][341] ([Intel XE#1231] / [Intel XE#3052])
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          [SKIP][342] ([Intel XE#1124]) -> [SKIP][343] ([Intel XE#2136]) +15 other tests skip
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-4/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][344] ([Intel XE#1124]) -> [SKIP][345] ([Intel XE#2136]) +12 other tests skip
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-436/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-466/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - shard-bmg:          [SKIP][346] ([Intel XE#2136]) -> [SKIP][347] ([Intel XE#1124]) +12 other tests skip
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-3/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-bmg:          [SKIP][348] ([Intel XE#607]) -> [SKIP][349] ([Intel XE#2136])
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-2/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
    - shard-dg2-set2:     [SKIP][350] ([Intel XE#2136]) -> [SKIP][351] ([Intel XE#607])
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][352] ([Intel XE#1124]) -> [SKIP][353] ([Intel XE#2136] / [Intel XE#2351]) +2 other tests skip
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][354] ([Intel XE#2136]) -> [SKIP][355] ([Intel XE#1124]) +5 other tests skip
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-dg2-set2:     [SKIP][356] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][357] ([Intel XE#1124]) +3 other tests skip
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][358] ([Intel XE#2191]) -> [SKIP][359] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-463/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-bmg:          [SKIP][360] ([Intel XE#2314] / [Intel XE#2894]) -> [SKIP][361] ([Intel XE#2423]) +2 other tests skip
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-7/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-bmg:          [SKIP][362] ([Intel XE#2423]) -> [SKIP][363] ([Intel XE#2314] / [Intel XE#2894]) +1 other test skip
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-2/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][364] ([Intel XE#2423] / [i915#2575]) -> [SKIP][365] ([Intel XE#2191])
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-bmg:          [SKIP][366] ([Intel XE#367]) -> [SKIP][367] ([Intel XE#2423]) +3 other tests skip
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-4/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][368] ([Intel XE#2423] / [i915#2575]) -> [SKIP][369] ([Intel XE#367]) +1 other test skip
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-466/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-436/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - shard-bmg:          [SKIP][370] ([Intel XE#2423]) -> [SKIP][371] ([Intel XE#367])
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-2/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][372] ([Intel XE#367]) -> [SKIP][373] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-436/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-466/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][374] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][375] ([Intel XE#829])
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-463/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][376] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][377] ([Intel XE#2136]) +4 other tests skip
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-463/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-434/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     [SKIP][378] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][379] ([Intel XE#455] / [Intel XE#787])
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][380] ([Intel XE#2652] / [Intel XE#787]) -> [SKIP][381] ([Intel XE#2136]) +1 other test skip
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-4/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
    - shard-bmg:          [SKIP][382] ([Intel XE#2136]) -> [SKIP][383] ([Intel XE#2887]) +8 other tests skip
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-7/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][384] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][385] ([Intel XE#2136] / [Intel XE#2351]) +1 other test skip
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-436/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-434/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][386] ([Intel XE#2907]) -> [SKIP][387] ([Intel XE#2136]) +1 other test skip
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][388] ([Intel XE#2136]) -> [SKIP][389] ([Intel XE#2907])
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][390] ([Intel XE#2136]) -> [SKIP][391] ([Intel XE#829]) +4 other tests skip
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-bmg:          [SKIP][392] ([Intel XE#3432]) -> [SKIP][393] ([Intel XE#2136]) +2 other tests skip
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
    - shard-dg2-set2:     [INCOMPLETE][394] ([Intel XE#1727] / [Intel XE#3468]) -> [SKIP][395] ([Intel XE#2136]) +1 other test skip
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][396] ([Intel XE#2136]) -> [SKIP][397] ([Intel XE#2652] / [Intel XE#787]) +1 other test skip
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
    - shard-bmg:          [SKIP][398] ([Intel XE#2136]) -> [SKIP][399] ([Intel XE#3432]) +1 other test skip
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [FAIL][400] ([Intel XE#616]) -> [SKIP][401] ([Intel XE#2136])
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs:
    - shard-bmg:          [SKIP][402] ([Intel XE#2887]) -> [SKIP][403] ([Intel XE#2136]) +19 other tests skip
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][404] ([Intel XE#2136]) -> [SKIP][405] ([Intel XE#455] / [Intel XE#787]) +6 other tests skip
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-466/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_cdclk@mode-transition:
    - shard-dg2-set2:     [SKIP][406] ([Intel XE#2136]) -> [SKIP][407] ([Intel XE#2924]) +8 other tests skip
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-466/igt@kms_cdclk@mode-transition.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-bmg:          [SKIP][408] ([Intel XE#2136]) -> [SKIP][409] ([Intel XE#2724])
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_cdclk@mode-transition-all-outputs.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-2/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-bmg:          [SKIP][410] ([Intel XE#2325]) -> [SKIP][411] ([Intel XE#2423]) +4 other tests skip
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-7/igt@kms_chamelium_color@ctm-0-25.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-bmg:          [SKIP][412] ([Intel XE#2423]) -> [SKIP][413] ([Intel XE#2325]) +2 other tests skip
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_chamelium_color@ctm-0-50.html
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-5/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-dg2-set2:     [SKIP][414] ([Intel XE#2423] / [i915#2575]) -> [SKIP][415] ([Intel XE#306]) +1 other test skip
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-466/igt@kms_chamelium_color@ctm-0-75.html
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     [SKIP][416] ([Intel XE#306]) -> [SKIP][417] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-435/igt@kms_chamelium_color@gamma.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-466/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-bmg:          [SKIP][418] ([Intel XE#2423]) -> [SKIP][419] ([Intel XE#2252]) +10 other tests skip
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-2/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-dg2-set2:     [SKIP][420] ([Intel XE#373]) -> [SKIP][421] ([Intel XE#2423] / [i915#2575]) +6 other tests skip
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-463/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-434/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_chamelium_frames@hdmi-frame-dump:
    - shard-dg2-set2:     [SKIP][422] ([Intel XE#2423] / [i915#2575]) -> [SKIP][423] ([Intel XE#373]) +8 other tests skip
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-466/igt@kms_chamelium_frames@hdmi-frame-dump.html
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-436/igt@kms_chamelium_frames@hdmi-frame-dump.html

  * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
    - shard-bmg:          [SKIP][424] ([Intel XE#2252]) -> [SKIP][425] ([Intel XE#2423]) +11 other tests skip
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-6/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [FAIL][426] ([Intel XE#1178]) -> [INCOMPLETE][427] ([Intel XE#2715] / [Intel XE#3468]) +1 other test incomplete
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-3/igt@kms_content_protection@atomic.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-4/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2-set2:     [SKIP][428] ([Intel XE#2423] / [i915#2575]) -> [FAIL][429] ([Intel XE#1178])
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-466/igt@kms_content_protection@atomic-dpms.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     [SKIP][430] ([Intel XE#2423] / [i915#2575]) -> [SKIP][431] ([Intel XE#307])
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-434/igt@kms_content_protection@dp-mst-lic-type-0.html
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-436/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-bmg:          [SKIP][432] ([Intel XE#2390]) -> [SKIP][433] ([Intel XE#2423]) +1 other test skip
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-4/igt@kms_content_protection@dp-mst-lic-type-1.html
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_content_protection@dp-mst-lic-type-1.html
    - shard-dg2-set2:     [SKIP][434] ([Intel XE#307]) -> [SKIP][435] ([Intel XE#2423] / [i915#2575])
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-435/igt@kms_content_protection@dp-mst-lic-type-1.html
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-466/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-bmg:          [SKIP][436] ([Intel XE#2423]) -> [SKIP][437] ([Intel XE#2390]) +1 other test skip
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_content_protection@dp-mst-type-1.html
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-5/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [FAIL][438] ([Intel XE#1178]) -> [SKIP][439] ([Intel XE#2423]) +1 other test skip
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-4/igt@kms_content_protection@legacy.html
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-0:
    - shard-bmg:          [FAIL][440] ([Intel XE#1178]) -> [SKIP][441] ([Intel XE#2341])
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-7/igt@kms_content_protection@lic-type-0.html
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-6/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@lic-type-1:
    - shard-bmg:          [SKIP][442] ([Intel XE#2423]) -> [SKIP][443] ([Intel XE#2341])
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_content_protection@lic-type-1.html
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-2/igt@kms_content_protection@lic-type-1.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     [SKIP][444] ([Intel XE#308]) -> [SKIP][445] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-436/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-466/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-32x10:
    - shard-bmg:          [SKIP][446] ([Intel XE#2423]) -> [SKIP][447] ([Intel XE#2320]) +3 other tests skip
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-32x10.html
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-32x10.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-bmg:          [SKIP][448] ([Intel XE#2321]) -> [SKIP][449] ([Intel XE#2423])
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-4/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-max-size:
    - shard-bmg:          [SKIP][450] ([Intel XE#2320]) -> [SKIP][451] ([Intel XE#2423]) +9 other tests skip
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-max-size.html
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-max-size.html

  * igt@kms_cursor_crc@cursor-random-max-size:
    - shard-dg2-set2:     [SKIP][452] ([Intel XE#2423] / [i915#2575]) -> [SKIP][453] ([Intel XE#455]) +3 other tests skip
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-434/igt@kms_cursor_crc@cursor-random-max-size.html
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-436/igt@kms_cursor_crc@cursor-random-max-size.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-bmg:          [SKIP][454] ([Intel XE#2423]) -> [SKIP][455] ([Intel XE#2321])
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-3/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-dg2-set2:     [SKIP][456] ([Intel XE#2423] / [i915#2575]) -> [SKIP][457] ([Intel XE#308])
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-436/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-dg2-set2:     [INCOMPLETE][458] ([Intel XE#1727] / [Intel XE#3468]) -> [SKIP][459] ([Intel XE#2423] / [i915#2575])
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-435/igt@kms_cursor_crc@cursor-suspend.html
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-434/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-bmg:          [SKIP][460] ([Intel XE#2286]) -> [SKIP][461] ([Intel XE#2423])
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
    - shard-dg2-set2:     [SKIP][462] ([Intel XE#2423] / [i915#2575]) -> [SKIP][463] ([Intel XE#323])
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-466/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-bmg:          [DMESG-WARN][464] ([Intel XE#877]) -> [SKIP][465] ([Intel XE#2423])
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-bmg:          [SKIP][466] ([Intel XE#2423]) -> [SKIP][467] ([Intel XE#2286])
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-2:
    - shard-bmg:          [DMESG-FAIL][468] ([Intel XE#3468]) -> [FAIL][469] ([Intel XE#2141]) +2 other tests fail
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-5/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-2.html
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-2/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-2.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][470] ([Intel XE#1508]) -> [SKIP][471] ([Intel XE#2136]) +1 other test skip
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-4/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dp_aux_dev:
    - shard-bmg:          [SKIP][472] ([Intel XE#3009]) -> [SKIP][473] ([Intel XE#2423])
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-6/igt@kms_dp_aux_dev.html
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_dp_aux_dev.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg2-set2:     [SKIP][474] ([Intel XE#2351]) -> [SKIP][475] ([Intel XE#455])
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-466/igt@kms_dsc@dsc-basic.html
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-436/igt@kms_dsc@dsc-basic.html
    - shard-bmg:          [SKIP][476] ([Intel XE#2136]) -> [SKIP][477] ([Intel XE#2244])
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_dsc@dsc-basic.html
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-3/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-bmg:          [SKIP][478] ([Intel XE#2244]) -> [SKIP][479] ([Intel XE#2136]) +2 other tests skip
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-4/igt@kms_dsc@dsc-fractional-bpp.html
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2-set2:     [SKIP][480] ([Intel XE#455]) -> [SKIP][481] ([Intel XE#2136] / [Intel XE#2351]) +1 other test skip
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-436/igt@kms_dsc@dsc-with-bpc-formats.html
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-434/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-dg2-set2:     [SKIP][482] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][483] ([Intel XE#455]) +1 other test skip
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-435/igt@kms_dsc@dsc-with-formats.html
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-436/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-bmg:          [SKIP][484] ([Intel XE#2136]) -> [FAIL][485] ([Intel XE#1695])
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_fbcon_fbt@fbc.html
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-7/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          [FAIL][486] ([Intel XE#1695]) -> [SKIP][487] ([Intel XE#2136])
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-7/igt@kms_fbcon_fbt@fbc-suspend.html
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-bmg:          [SKIP][488] ([Intel XE#776]) -> [SKIP][489] ([Intel XE#2136])
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-6/igt@kms_fbcon_fbt@psr-suspend.html
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_fbcon_fbt@psr-suspend.html
    - shard-dg2-set2:     [SKIP][490] ([Intel XE#2136]) -> [SKIP][491] ([Intel XE#776])
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-434/igt@kms_fbcon_fbt@psr-suspend.html
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-436/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-3x:
    - shard-bmg:          [SKIP][492] ([Intel XE#2373]) -> [SKIP][493] ([Intel XE#2423])
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-5/igt@kms_feature_discovery@display-3x.html
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_feature_discovery@display-3x.html
    - shard-dg2-set2:     [SKIP][494] ([Intel XE#703]) -> [SKIP][495] ([Intel XE#2423] / [i915#2575])
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-435/igt@kms_feature_discovery@display-3x.html
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-434/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg2-set2:     [SKIP][496] ([Intel XE#2423] / [i915#2575]) -> [SKIP][497] ([Intel XE#1138])
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-434/igt@kms_feature_discovery@display-4x.html
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_feature_discovery@display-4x.html
    - shard-bmg:          [SKIP][498] ([Intel XE#1138]) -> [SKIP][499] ([Intel XE#2423])
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-7/igt@kms_feature_discovery@display-4x.html
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-bmg:          [SKIP][500] ([Intel XE#2375]) -> [SKIP][501] ([Intel XE#2423])
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-2/igt@kms_feature_discovery@dp-mst.html
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-bmg:          [DMESG-FAIL][502] ([Intel XE#3468]) -> [FAIL][503] ([Intel XE#2882]) +2 other tests fail
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank.html
    - shard-dg2-set2:     [FAIL][504] ([Intel XE#301]) -> [SKIP][505] ([Intel XE#2423] / [i915#2575])
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [FAIL][506] ([Intel XE#2882]) -> [SKIP][507] ([Intel XE#2423])
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
    - shard-dg2-set2:     [FAIL][508] ([Intel XE#301]) -> [SKIP][509] ([Intel XE#2924])
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
    - shard-bmg:          [DMESG-WARN][510] ([Intel XE#3468]) -> [FAIL][511] ([Intel XE#2882]) +1 other test fail
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-rmfb:
    - shard-bmg:          [SKIP][512] ([Intel XE#2423]) -> [SKIP][513] ([Intel XE#2316])
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_flip@2x-flip-vs-rmfb.html
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-rmfb.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-dg2-set2:     [DMESG-FAIL][514] ([Intel XE#1727] / [Intel XE#3468]) -> [SKIP][515] ([Intel XE#2423] / [i915#2575])
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-463/igt@kms_flip@2x-flip-vs-suspend.html
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-434/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [DMESG-WARN][516] ([Intel XE#3468]) -> [SKIP][517] ([Intel XE#2316])
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-5/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-bmg:          [SKIP][518] ([Intel XE#2316]) -> [SKIP][519] ([Intel XE#2423])
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-6/igt@kms_flip@2x-plain-flip-interruptible.html
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [SKIP][520] ([Intel XE#2423]) -> [FAIL][521] ([Intel XE#2882])
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-rmfb-interruptible:
    - shard-bmg:          [DMESG-WARN][522] ([Intel XE#3468]) -> [SKIP][523] ([Intel XE#2423]) +2 other tests skip
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-5/igt@kms_flip@flip-vs-rmfb-interruptible.html
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_flip@flip-vs-rmfb-interruptible.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [SKIP][524] ([Intel XE#2423]) -> [DMESG-FAIL][525] ([Intel XE#3468])
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_flip@plain-flip-fb-recreate-interruptible.html
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-4/igt@kms_flip@plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-bmg:          [SKIP][526] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][527] ([Intel XE#2136]) +6 other tests skip
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][528] ([Intel XE#2136]) -> [SKIP][529] ([Intel XE#455]) +2 other tests skip
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
    - shard-dg2-set2:     [SKIP][530] ([Intel XE#455]) -> [SKIP][531] ([Intel XE#2924])
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-dg2-set2:     [SKIP][532] ([Intel XE#455]) -> [SKIP][533] ([Intel XE#2136]) +3 other tests skip
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:
    - shard-bmg:          [SKIP][534] ([Intel XE#2136]) -> [SKIP][535] ([Intel XE#2293] / [Intel XE#2380]) +4 other tests skip
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html

  * igt@kms_flip_tiling@flip-change-tiling:
    - shard-bmg:          [SKIP][536] ([Intel XE#2136]) -> [INCOMPLETE][537] ([Intel XE#1727] / [Intel XE#3468])
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_flip_tiling@flip-change-tiling.html
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-5/igt@kms_flip_tiling@flip-change-tiling.html

  * igt@kms_force_connector_basic@force-connector-state:
    - shard-dg2-set2:     [SKIP][538] ([Intel XE#2423] / [i915#2575]) -> [SKIP][539] ([Intel XE#540])
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-466/igt@kms_force_connector_basic@force-connector-state.html
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][540] ([Intel XE#651]) -> [SKIP][541] ([Intel XE#2136]) +15 other tests skip
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][542] ([Intel XE#2311]) -> [SKIP][543] ([Intel XE#2312]) +4 other tests skip
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][544] ([Intel XE#2312]) -> [SKIP][545] ([Intel XE#2136]) +4 other tests skip
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render.html
   [545]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render.html
    - shard-dg2-set2:     [SKIP][546] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][547] ([Intel XE#2924])
   [546]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render.html
   [547]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-slowdraw:
    - shard-dg2-set2:     [SKIP][548] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][549] ([Intel XE#651]) +4 other tests skip
   [548]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-slowdraw.html
   [549]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-slowdraw.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [FAIL][550] ([Intel XE#2333]) -> [DMESG-FAIL][551] ([Intel XE#3468]) +2 other tests dmesg-fail
   [550]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc.html
   [551]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][552] ([Intel XE#2312]) -> [FAIL][553] ([Intel XE#2333]) +1 other test fail
   [552]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html
   [553]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-bmg:          [DMESG-FAIL][554] ([Intel XE#3468]) -> [FAIL][555] ([Intel XE#2333]) +4 other tests fail
   [554]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html
   [555]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [FAIL][556] ([Intel XE#2333]) -> [SKIP][557] ([Intel XE#2136]) +18 other tests skip
   [556]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [557]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt:
    - shard-bmg:          [DMESG-FAIL][558] ([Intel XE#3468]) -> [SKIP][559] ([Intel XE#2312])
   [558]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html
   [559]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][560] ([Intel XE#2136]) -> [FAIL][561] ([Intel XE#2333]) +6 other tests fail
   [560]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [561]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-bmg:          [SKIP][562] ([Intel XE#2136]) -> [SKIP][563] ([Intel XE#2352])
   [562]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [563]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][564] ([Intel XE#2312]) -> [SKIP][565] ([Intel XE#2311]) +5 other tests skip
   [564]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html
   [565]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-onoff:
    - shard-adlp:         [SKIP][566] ([Intel XE#656]) -> [TIMEOUT][567] ([Intel XE#1033] / [Intel XE#1727])
   [566]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-onoff.html
   [567]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][568] ([Intel XE#2311]) -> [SKIP][569] ([Intel XE#2136]) +38 other tests skip
   [568]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html
   [569]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][570] ([Intel XE#2136]) -> [SKIP][571] ([Intel XE#2311]) +29 other tests skip
   [570]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt.html
   [571]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][572] ([Intel XE#651]) -> [SKIP][573] ([Intel XE#2136] / [Intel XE#2351]) +17 other tests skip
   [572]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html
   [573]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary:
    - shard-dg2-set2:     [SKIP][574] ([Intel XE#2136]) -> [SKIP][575] ([Intel XE#651]) +20 other tests skip
   [574]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary.html
   [575]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-dg2-set2:     [SKIP][576] ([Intel XE#658]) -> [SKIP][577] ([Intel XE#2136] / [Intel XE#2351])
   [576]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [577]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][578] ([Intel XE#653]) -> [SKIP][579] ([Intel XE#2136]) +25 other tests skip
   [578]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
   [579]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][580] ([Intel XE#2312]) -> [SKIP][581] ([Intel XE#2313]) +6 other tests skip
   [580]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [581]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-bmg:          [FAIL][582] ([Intel XE#2333]) -> [INCOMPLETE][583] ([Intel XE#1727] / [Intel XE#2050] / [Intel XE#3468])
   [582]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-7/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
   [583]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-7/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-b-dp-2:
    - shard-bmg:          [FAIL][584] ([Intel XE#2333]) -> [INCOMPLETE][585] ([Intel XE#1727] / [Intel XE#3468])
   [584]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-7/igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-b-dp-2.html
   [585]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-7/igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-b-dp-2.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-bmg:          [SKIP][586] ([Intel XE#2350]) -> [SKIP][587] ([Intel XE#2136])
   [586]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-5/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [587]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][588] ([Intel XE#2136]) -> [SKIP][589] ([Intel XE#2313]) +23 other tests skip
   [588]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt.html
   [589]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][590] ([Intel XE#653]) -> [SKIP][591] ([Intel XE#2924])
   [590]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff.html
   [591]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:
    - shard-dg2-set2:     [SKIP][592] ([Intel XE#2136]) -> [SKIP][593] ([Intel XE#653]) +14 other tests skip
   [592]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html
   [593]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][594] ([Intel XE#2313]) -> [SKIP][595] ([Intel XE#2312]) +4 other tests skip
   [594]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html
   [595]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][596] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][597] ([Intel XE#653]) +2 other tests skip
   [596]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [597]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][598] ([Intel XE#653]) -> [SKIP][599] ([Intel XE#2136] / [Intel XE#2351]) +11 other tests skip
   [598]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [599]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][600] ([Intel XE#2136]) -> [SKIP][601] ([Intel XE#2312]) +3 other tests skip
   [600]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-msflip-blt.html
   [601]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][602] ([Intel XE#2313]) -> [SKIP][603] ([Intel XE#2136]) +34 other tests skip
   [602]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [603]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-bmg:          [SKIP][604] ([Intel XE#2502]) -> [SKIP][605] ([Intel XE#2423])
   [604]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-5/igt@kms_getfb@getfb-reject-ccs.html
   [605]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_getfb@getfb-reject-ccs.html
    - shard-dg2-set2:     [SKIP][606] ([Intel XE#605]) -> [SKIP][607] ([Intel XE#2423] / [i915#2575])
   [606]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-436/igt@kms_getfb@getfb-reject-ccs.html
   [607]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-434/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_getfb@getfb-repeated-different-handles:
    - shard-dg2-set2:     [SKIP][608] ([Intel XE#2423] / [i915#2575]) -> [SKIP][609] ([Intel XE#687])
   [608]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-466/igt@kms_getfb@getfb-repeated-different-handles.html
   [609]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_getfb@getfb-repeated-different-handles.html

  * igt@kms_getfb@getfb2-accept-ccs:
    - shard-bmg:          [SKIP][610] ([Intel XE#2340]) -> [SKIP][611] ([Intel XE#2423])
   [610]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-7/igt@kms_getfb@getfb2-accept-ccs.html
   [611]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_getfb@getfb2-accept-ccs.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-bmg:          [DMESG-FAIL][612] ([Intel XE#2705] / [Intel XE#3468]) -> [SKIP][613] ([Intel XE#2423])
   [612]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-3/igt@kms_hdr@bpc-switch-suspend.html
   [613]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][614] ([Intel XE#3544]) -> [SKIP][615] ([Intel XE#2423])
   [614]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html
   [615]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          [SKIP][616] ([Intel XE#2934]) -> [SKIP][617] ([Intel XE#2136])
   [616]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-5/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [617]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-bmg:          [SKIP][618] ([Intel XE#2136]) -> [SKIP][619] ([Intel XE#2927])
   [618]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [619]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-4/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_lease@possible-crtcs-filtering:
    - shard-bmg:          [SKIP][620] ([Intel XE#2423]) -> [DMESG-WARN][621] ([Intel XE#1727]) +1 other test dmesg-warn
   [620]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_lease@possible-crtcs-filtering.html
   [621]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-5/igt@kms_lease@possible-crtcs-filtering.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-bmg:          [SKIP][622] ([Intel XE#2501]) -> [SKIP][623] ([Intel XE#2423])
   [622]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-3/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [623]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - shard-bmg:          [SKIP][624] ([Intel XE#2423]) -> [DMESG-WARN][625] ([Intel XE#3468]) +1 other test dmesg-warn
   [624]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_pipe_crc_basic@nonblocking-crc.html
   [625]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-2/igt@kms_pipe_crc_basic@nonblocking-crc.html

  * igt@kms_plane@pixel-format-source-clamping:
    - shard-bmg:          [INCOMPLETE][626] ([Intel XE#1035] / [Intel XE#2566] / [Intel XE#3468]) -> [SKIP][627] ([Intel XE#2423])
   [626]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-3/igt@kms_plane@pixel-format-source-clamping.html
   [627]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_plane@pixel-format-source-clamping.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          [SKIP][628] ([Intel XE#2423]) -> [SKIP][629] ([Intel XE#2493])
   [628]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_plane_multiple@tiling-yf.html
   [629]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-3/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-bmg:          [DMESG-WARN][630] ([Intel XE#3468]) -> [SKIP][631] ([Intel XE#2685] / [Intel XE#3307])
   [630]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-5/igt@kms_plane_scaling@intel-max-src-size.html
   [631]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-6/igt@kms_plane_scaling@intel-max-src-size.html
    - shard-dg2-set2:     [FAIL][632] ([Intel XE#361]) -> [SKIP][633] ([Intel XE#2423] / [i915#2575])
   [632]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size.html
   [633]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-bmg:          [SKIP][634] ([Intel XE#2763]) -> [SKIP][635] ([Intel XE#2423]) +3 other tests skip
   [634]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
   [635]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2-set2:     [SKIP][636] ([Intel XE#2423] / [i915#2575]) -> [SKIP][637] ([Intel XE#2763] / [Intel XE#455]) +3 other tests skip
   [636]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
   [637]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-bmg:          [SKIP][638] ([Intel XE#2423]) -> [SKIP][639] ([Intel XE#2763])
   [638]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
   [639]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-3/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][640] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][641] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [640]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-436/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
   [641]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-dg2-set2:     [SKIP][642] ([Intel XE#870]) -> [SKIP][643] ([Intel XE#2136]) +2 other tests skip
   [642]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-436/igt@kms_pm_backlight@bad-brightness.html
   [643]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-466/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg2-set2:     [SKIP][644] ([Intel XE#2938]) -> [SKIP][645] ([Intel XE#2136])
   [644]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-435/igt@kms_pm_backlight@brightness-with-dpms.html
   [645]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-434/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-bmg:          [SKIP][646] ([Intel XE#2136]) -> [FAIL][647] ([Intel XE#1430])
   [646]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_pm_dc@dc6-dpms.html
   [647]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-6/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg2-set2:     [SKIP][648] ([Intel XE#1129]) -> [SKIP][649] ([Intel XE#2136] / [Intel XE#2351])
   [648]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-435/igt@kms_pm_dc@dc6-psr.html
   [649]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-466/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-dg2-set2:     [SKIP][650] ([Intel XE#2136] / [Intel XE#2351]) -> [DMESG-WARN][651] ([Intel XE#3468])
   [650]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-434/igt@kms_pm_dc@dc9-dpms.html
   [651]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-bmg:          [SKIP][652] ([Intel XE#2505]) -> [SKIP][653] ([Intel XE#2136])
   [652]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-7/igt@kms_pm_dc@deep-pkgc.html
   [653]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-dg2-set2:     [SKIP][654] ([Intel XE#2136]) -> [FAIL][655] ([Intel XE#3527])
   [654]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-434/igt@kms_pm_lpsp@kms-lpsp.html
   [655]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_pm_lpsp@kms-lpsp.html
    - shard-bmg:          [SKIP][656] ([Intel XE#2499]) -> [SKIP][657] ([Intel XE#2136])
   [656]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-2/igt@kms_pm_lpsp@kms-lpsp.html
   [657]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - shard-dg2-set2:     [DMESG-WARN][658] ([Intel XE#1727] / [Intel XE#3468]) -> [SKIP][659] ([Intel XE#2446])
   [658]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-435/igt@kms_pm_rpm@basic-pci-d3-state.html
   [659]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-466/igt@kms_pm_rpm@basic-pci-d3-state.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          [SKIP][660] ([Intel XE#2446]) -> [SKIP][661] ([Intel XE#1439])
   [660]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [661]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-2/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-dg2-set2:     [DMESG-WARN][662] ([Intel XE#3468]) -> [SKIP][663] ([Intel XE#2446])
   [662]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-436/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [663]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-466/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-bmg:          [SKIP][664] ([Intel XE#1439] / [Intel XE#3141]) -> [SKIP][665] ([Intel XE#2446])
   [664]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-4/igt@kms_pm_rpm@modeset-lpsp.html
   [665]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg2-set2:     [SKIP][666] ([Intel XE#2446]) -> [SKIP][667] ([Intel XE#2924])
   [666]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-434/igt@kms_pm_rpm@modeset-non-lpsp.html
   [667]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-bmg:          [SKIP][668] ([Intel XE#1489]) -> [SKIP][669] ([Intel XE#2136]) +13 other tests skip
   [668]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-7/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html
   [669]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][670] ([Intel XE#1489]) -> [SKIP][671] ([Intel XE#2924])
   [670]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-435/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html
   [671]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-cursor-plane-update-sf:
    - shard-dg2-set2:     [SKIP][672] ([Intel XE#2136]) -> [SKIP][673] ([Intel XE#1489]) +7 other tests skip
   [672]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-434/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html
   [673]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-436/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-dg2-set2:     [SKIP][674] ([Intel XE#1489]) -> [SKIP][675] ([Intel XE#2136]) +6 other tests skip
   [674]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-436/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html
   [675]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-434/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:
    - shard-bmg:          [SKIP][676] ([Intel XE#2136]) -> [SKIP][677] ([Intel XE#1489]) +7 other tests skip
   [676]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html
   [677]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-6/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-bmg:          [SKIP][678] ([Intel XE#2136]) -> [SKIP][679] ([Intel XE#2387])
   [678]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_psr2_su@page_flip-p010.html
   [679]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-3/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-pr-cursor-blt:
    - shard-bmg:          [SKIP][680] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][681] ([Intel XE#2136]) +21 other tests skip
   [680]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-6/igt@kms_psr@fbc-pr-cursor-blt.html
   [681]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_psr@fbc-pr-cursor-blt.html

  * igt@kms_psr@fbc-pr-dpms:
    - shard-dg2-set2:     [SKIP][682] ([Intel XE#2136]) -> [SKIP][683] ([Intel XE#2850] / [Intel XE#929]) +6 other tests skip
   [682]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-466/igt@kms_psr@fbc-pr-dpms.html
   [683]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_psr@fbc-pr-dpms.html

  * igt@kms_psr@fbc-pr-no-drrs:
    - shard-dg2-set2:     [SKIP][684] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][685] ([Intel XE#2136] / [Intel XE#2351]) +5 other tests skip
   [684]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-463/igt@kms_psr@fbc-pr-no-drrs.html
   [685]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-466/igt@kms_psr@fbc-pr-no-drrs.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     [SKIP][686] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][687] ([Intel XE#2924]) +1 other test skip
   [686]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-463/igt@kms_psr@fbc-psr2-primary-render.html
   [687]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@fbc-psr2-suspend:
    - shard-dg2-set2:     [SKIP][688] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][689] ([Intel XE#2136]) +7 other tests skip
   [688]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-435/igt@kms_psr@fbc-psr2-suspend.html
   [689]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-434/igt@kms_psr@fbc-psr2-suspend.html

  * igt@kms_psr@pr-dpms:
    - shard-dg2-set2:     [SKIP][690] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][691] ([Intel XE#2850] / [Intel XE#929]) +3 other tests skip
   [690]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-434/igt@kms_psr@pr-dpms.html
   [691]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-436/igt@kms_psr@pr-dpms.html

  * igt@kms_psr@psr2-no-drrs:
    - shard-bmg:          [SKIP][692] ([Intel XE#2136]) -> [SKIP][693] ([Intel XE#2234] / [Intel XE#2850]) +12 other tests skip
   [692]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_psr@psr2-no-drrs.html
   [693]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-6/igt@kms_psr@psr2-no-drrs.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg2-set2:     [SKIP][694] ([Intel XE#2136]) -> [SKIP][695] ([Intel XE#2939])
   [694]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-466/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [695]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-dg2-set2:     [SKIP][696] ([Intel XE#2423] / [i915#2575]) -> [SKIP][697] ([Intel XE#3414]) +2 other tests skip
   [696]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-466/igt@kms_rotation_crc@primary-rotation-270.html
   [697]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-436/igt@kms_rotation_crc@primary-rotation-270.html
    - shard-bmg:          [SKIP][698] ([Intel XE#2423]) -> [SKIP][699] ([Intel XE#3414]) +2 other tests skip
   [698]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_rotation_crc@primary-rotation-270.html
   [699]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-3/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2-set2:     [SKIP][700] ([Intel XE#1127]) -> [SKIP][701] ([Intel XE#2423] / [i915#2575])
   [700]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [701]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-bmg:          [SKIP][702] ([Intel XE#2330]) -> [SKIP][703] ([Intel XE#2423])
   [702]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [703]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
    - shard-dg2-set2:     [SKIP][704] ([Intel XE#2423] / [i915#2575]) -> [SKIP][705] ([Intel XE#1127])
   [704]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [705]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-bmg:          [SKIP][706] ([Intel XE#3414]) -> [SKIP][707] ([Intel XE#2423]) +2 other tests skip
   [706]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
   [707]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-dg2-set2:     [SKIP][708] ([Intel XE#3414]) -> [SKIP][709] ([Intel XE#2423] / [i915#2575]) +4 other tests skip
   [708]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-435/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [709]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-466/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - shard-bmg:          [SKIP][710] ([Intel XE#2413]) -> [SKIP][711] ([Intel XE#2423]) +2 other tests skip
   [710]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-6/igt@kms_scaling_modes@scaling-mode-none.html
   [711]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_scaling_modes@scaling-mode-none.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-bmg:          [SKIP][712] ([Intel XE#2423]) -> [SKIP][713] ([Intel XE#1435])
   [712]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_setmode@basic-clone-single-crtc.html
   [713]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-3/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-bmg:          [SKIP][714] ([Intel XE#1435]) -> [SKIP][715] ([Intel XE#2423]) +1 other test skip
   [714]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-5/igt@kms_setmode@invalid-clone-exclusive-crtc.html
   [715]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [FAIL][716] ([Intel XE#1729]) -> [SKIP][717] ([Intel XE#2423] / [i915#2575])
   [716]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern.html
   [717]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-bmg:          [SKIP][718] ([Intel XE#2450]) -> [SKIP][719] ([Intel XE#2423])
   [718]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-7/igt@kms_tv_load_detect@load-detect.html
   [719]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-bmg:          [SKIP][720] ([Intel XE#2423]) -> [SKIP][721] ([Intel XE#1499])
   [720]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_vrr@flip-basic-fastset.html
   [721]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-2/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@flip-dpms:
    - shard-dg2-set2:     [SKIP][722] ([Intel XE#455]) -> [SKIP][723] ([Intel XE#2423] / [i915#2575]) +5 other tests skip
   [722]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-435/igt@kms_vrr@flip-dpms.html
   [723]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-466/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     [SKIP][724] ([Intel XE#2423] / [i915#2575]) -> [SKIP][725] ([Intel XE#2924]) +12 other tests skip
   [724]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-466/igt@kms_vrr@flipline.html
   [725]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_vrr@flipline.html

  * igt@kms_vrr@lobf:
    - shard-bmg:          [SKIP][726] ([Intel XE#2423]) -> [SKIP][727] ([Intel XE#2168]) +1 other test skip
   [726]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_vrr@lobf.html
   [727]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-3/igt@kms_vrr@lobf.html
    - shard-dg2-set2:     [SKIP][728] ([Intel XE#2168]) -> [SKIP][729] ([Intel XE#2423] / [i915#2575])
   [728]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-463/igt@kms_vrr@lobf.html
   [729]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-466/igt@kms_vrr@lobf.html

  * igt@kms_vrr@max-min:
    - shard-bmg:          [SKIP][730] ([Intel XE#1499]) -> [SKIP][731] ([Intel XE#2423]) +3 other tests skip
   [730]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-5/igt@kms_vrr@max-min.html
   [731]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_vrr@max-min.html

  * igt@kms_writeback@writeback-check-output:
    - shard-dg2-set2:     [SKIP][732] ([Intel XE#756]) -> [SKIP][733] ([Intel XE#2423] / [i915#2575])
   [732]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-435/igt@kms_writeback@writeback-check-output.html
   [733]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-434/igt@kms_writeback@writeback-check-output.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-bmg:          [SKIP][734] ([Intel XE#1091] / [Intel XE#2849]) -> [SKIP][735] ([Intel XE#2423])
   [734]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-4/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [735]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_ccs@suspend-resume:
    - shard-dg2-set2:     [SKIP][736] ([Intel XE#1130]) -> [DMESG-FAIL][737] ([Intel XE#1727] / [Intel XE#3468])
   [736]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-434/igt@xe_ccs@suspend-resume.html
   [737]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@xe_ccs@suspend-resume.html

  * igt@xe_compute_preempt@compute-preempt:
    - shard-dg2-set2:     [SKIP][738] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][739] ([Intel XE#1130]) +1 other test skip
   [738]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-435/igt@xe_compute_preempt@compute-preempt.html
   [739]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-466/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-dg2-set2:     [SKIP][740] ([Intel XE#1130]) -> [SKIP][741] ([Intel XE#1126]) +1 other test skip
   [740]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfd.html
   [741]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-dg2-set2:     [SKIP][742] ([Intel XE#1130]) -> [SKIP][743] ([Intel XE#944]) +3 other tests skip
   [742]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-466/igt@xe_create@multigpu-create-massive-size.html
   [743]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@xe_create@multigpu-create-massive-size.html
    - shard-bmg:          [SKIP][744] ([Intel XE#2504]) -> [SKIP][745] ([Intel XE#1130])
   [744]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-3/igt@xe_create@multigpu-create-massive-size.html
   [745]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_drm_fdinfo@utilization-single-idle:
    - shard-bmg:          [SKIP][746] ([Intel XE#1130]) -> [DMESG-WARN][747] ([Intel XE#3468]) +2 other tests dmesg-warn
   [746]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@xe_drm_fdinfo@utilization-single-idle.html
   [747]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-2/igt@xe_drm_fdinfo@utilization-single-idle.html

  * igt@xe_eudebug@basic-close:
    - shard-dg2-set2:     [SKIP][748] ([Intel XE#2905]) -> [SKIP][749] ([Intel XE#1130]) +12 other tests skip
   [748]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-435/igt@xe_eudebug@basic-close.html
   [749]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-466/igt@xe_eudebug@basic-close.html

  * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
    - shard-bmg:          [SKIP][750] ([Intel XE#1130]) -> [SKIP][751] ([Intel XE#2905]) +14 other tests skip
   [750]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html
   [751]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-5/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html

  * igt@xe_eudebug@vma-ufence:
    - shard-bmg:          [SKIP][752] ([Intel XE#2905]) -> [SKIP][753] ([Intel XE#1130]) +14 other tests skip
   [752]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-2/igt@xe_eudebug@vma-ufence.html
   [753]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@xe_eudebug@vma-ufence.html

  * igt@xe_eudebug_online@basic-breakpoint:
    - shard-dg2-set2:     [SKIP][754] ([Intel XE#1130]) -> [SKIP][755] ([Intel XE#2905]) +8 other tests skip
   [754]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-434/igt@xe_eudebug_online@basic-breakpoint.html
   [755]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-463/igt@xe_eudebug_online@basic-breakpoint.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - shard-bmg:          [FAIL][756] ([Intel XE#2364]) -> [SKIP][757] ([Intel XE#1130])
   [756]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-3/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [757]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_evict@evict-large-multi-vm-cm:
    - shard-dg2-set2:     [FAIL][758] ([Intel XE#1600]) -> [SKIP][759] ([Intel XE#1130])
   [758]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-463/igt@xe_evict@evict-large-multi-vm-cm.html
   [759]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-466/igt@xe_evict@evict-large-multi-vm-cm.html
    - shard-bmg:          [SKIP][760] ([Intel XE#1130]) -> [FAIL][761] ([Intel XE#2364])
   [760]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@xe_evict@evict-large-multi-vm-cm.html
   [761]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-3/igt@xe_evict@evict-large-multi-vm-cm.html

  * igt@xe_exec_balancer@twice-parallel-rebind:
    - shard-dg2-set2:     [SKIP][762] ([Intel XE#1130]) -> [DMESG-WARN][763] ([Intel XE#1727])
   [762]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-434/igt@xe_exec_balancer@twice-parallel-rebind.html
   [763]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@xe_exec_balancer@twice-parallel-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-bmg:          [SKIP][764] ([Intel XE#1130]) -> [SKIP][765] ([Intel XE#2322]) +6 other tests skip
   [764]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
   [765]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:
    - shard-bmg:          [SKIP][766] ([Intel XE#2322]) -> [SKIP][767] ([Intel XE#1130]) +12 other tests skip
   [766]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html
   [767]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html

  * igt@xe_exec_compute_mode@once-bindexecqueue:
    - shard-bmg:          [SKIP][768] ([Intel XE#1130]) -> [DMESG-WARN][769] ([Intel XE#1727])
   [768]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@xe_exec_compute_mode@once-bindexecqueue.html
   [769]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-4/igt@xe_exec_compute_mode@once-bindexecqueue.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate:
    - shard-bmg:          [DMESG-WARN][770] ([Intel XE#1727]) -> [SKIP][771] ([Intel XE#1130])
   [770]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-2/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate.html
   [771]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate.html

  * igt@xe_exec_fault_mode@once-userptr-imm:
    - shard-dg2-set2:     [SKIP][772] ([Intel XE#1130]) -> [SKIP][773] ([Intel XE#288]) +21 other tests skip
   [772]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-466/igt@xe_exec_fault_mode@once-userptr-imm.html
   [773]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-436/igt@xe_exec_fault_mode@once-userptr-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     [SKIP][774] ([Intel XE#288]) -> [SKIP][775] ([Intel XE#1130]) +30 other tests skip
   [774]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
   [775]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     [SKIP][776] ([Intel XE#1130]) -> [SKIP][777] ([Intel XE#2360])
   [776]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-466/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
   [777]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:
    - shard-bmg:          [DMESG-WARN][778] ([Intel XE#3467] / [Intel XE#3468]) -> [SKIP][779] ([Intel XE#1130])
   [778]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html
   [779]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init:
    - shard-dg2-set2:     [SKIP][780] ([Intel XE#1130]) -> [DMESG-WARN][781] ([Intel XE#3343])
   [780]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html
   [781]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-463/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:
    - shard-dg2-set2:     [DMESG-WARN][782] ([Intel XE#3343]) -> [SKIP][783] ([Intel XE#1130])
   [782]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-463/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html
   [783]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init:
    - shard-bmg:          [DMESG-WARN][784] ([Intel XE#3467]) -> [SKIP][785] ([Intel XE#1130])
   [784]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init.html
   [785]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early:
    - shard-dg2-set2:     [SKIP][786] ([Intel XE#1130]) -> [DMESG-WARN][787] ([Intel XE#3467])
   [786]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-434/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html
   [787]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:
    - shard-bmg:          [DMESG-WARN][788] ([Intel XE#3343]) -> [DMESG-WARN][789] ([Intel XE#3343] / [Intel XE#3468])
   [788]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
   [789]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html

  * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create:
    - shard-bmg:          [FAIL][790] ([Intel XE#3499]) -> [DMESG-FAIL][791] ([Intel XE#3467])
   [790]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-2/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html
   [791]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-2/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html

  * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:
    - shard-bmg:          [DMESG-FAIL][792] ([Intel XE#3467]) -> [SKIP][793] ([Intel XE#1130])
   [792]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-4/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html
   [793]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html

  * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run:
    - shard-bmg:          [SKIP][794] ([Intel XE#1130]) -> [FAIL][795] ([Intel XE#3499])
   [794]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html
   [795]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-3/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html

  * igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc:
    - shard-dg2-set2:     [DMESG-WARN][796] ([Intel XE#3467]) -> [SKIP][797] ([Intel XE#1130]) +2 other tests skip
   [796]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-436/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html
   [797]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-466/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html
    - shard-bmg:          [DMESG-FAIL][798] ([Intel XE#3467] / [Intel XE#3468]) -> [FAIL][799] ([Intel XE#3499])
   [798]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-5/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html
   [799]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-6/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html

  * igt@xe_fault_injection@vm-create-fail-xe_pt_create:
    - shard-bmg:          [DMESG-WARN][800] ([Intel XE#3467]) -> [DMESG-WARN][801] ([Intel XE#3467] / [Intel XE#3468])
   [800]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-3/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html
   [801]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-4/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html

  * igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:
    - shard-bmg:          [DMESG-WARN][802] ([Intel XE#3467] / [Intel XE#3468]) -> [DMESG-WARN][803] ([Intel XE#3467]) +1 other test dmesg-warn
   [802]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-7/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html
   [803]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-4/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     [SKIP][804] ([Intel XE#255]) -> [SKIP][805] ([Intel XE#1130])
   [804]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-435/igt@xe_huc_copy@huc_copy.html
   [805]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-466/igt@xe_huc_copy@huc_copy.html

  * igt@xe_intel_bb@blit-reloc:
    - shard-dg2-set2:     [INCOMPLETE][806] ([Intel XE#2594]) -> [SKIP][807] ([Intel XE#1130])
   [806]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-463/igt@xe_intel_bb@blit-reloc.html
   [807]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-434/igt@xe_intel_bb@blit-reloc.html

  * igt@xe_media_fill@media-fill:
    - shard-dg2-set2:     [SKIP][808] ([Intel XE#560]) -> [SKIP][809] ([Intel XE#1130])
   [808]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-436/igt@xe_media_fill@media-fill.html
   [809]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-466/igt@xe_media_fill@media-fill.html

  * igt@xe_module_load@reload-no-display:
    - shard-dg2-set2:     [FAIL][810] ([Intel XE#3546]) -> [DMESG-FAIL][811] ([Intel XE#3467])
   [810]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-466/igt@xe_module_load@reload-no-display.html
   [811]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@xe_module_load@reload-no-display.html

  * igt@xe_oa@map-oa-buffer:
    - shard-dg2-set2:     [SKIP][812] ([Intel XE#3573]) -> [SKIP][813] ([Intel XE#1130]) +5 other tests skip
   [812]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-435/igt@xe_oa@map-oa-buffer.html
   [813]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-466/igt@xe_oa@map-oa-buffer.html

  * igt@xe_oa@non-system-wide-paranoid:
    - shard-dg2-set2:     [SKIP][814] ([Intel XE#1130]) -> [SKIP][815] ([Intel XE#3573]) +10 other tests skip
   [814]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-466/igt@xe_oa@non-system-wide-paranoid.html
   [815]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@xe_oa@non-system-wide-paranoid.html

  * igt@xe_oa@unprivileged-single-ctx-counters:
    - shard-bmg:          [SKIP][816] ([Intel XE#1130]) -> [SKIP][817] ([Intel XE#2248])
   [816]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@xe_oa@unprivileged-single-ctx-counters.html
   [817]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-5/igt@xe_oa@unprivileged-single-ctx-counters.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-dg2-set2:     [SKIP][818] ([Intel XE#1337]) -> [SKIP][819] ([Intel XE#1130])
   [818]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-436/igt@xe_pat@display-vs-wb-transient.html
   [819]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-434/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-bmg:          [SKIP][820] ([Intel XE#1420]) -> [SKIP][821] ([Intel XE#1130])
   [820]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-3/igt@xe_pat@pat-index-xehpc.html
   [821]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pm@d3cold-basic:
    - shard-bmg:          [SKIP][822] ([Intel XE#1130]) -> [SKIP][823] ([Intel XE#2284])
   [822]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@xe_pm@d3cold-basic.html
   [823]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-4/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][824] ([Intel XE#1130]) -> [SKIP][825] ([Intel XE#2284] / [Intel XE#366]) +3 other tests skip
   [824]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-434/igt@xe_pm@d3cold-basic-exec.html
   [825]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@d3hot-multiple-execs:
    - shard-dg2-set2:     [DMESG-WARN][826] ([Intel XE#1727] / [Intel XE#3468]) -> [DMESG-WARN][827] ([Intel XE#3468])
   [826]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-436/igt@xe_pm@d3hot-multiple-execs.html
   [827]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@xe_pm@d3hot-multiple-execs.html
    - shard-bmg:          [DMESG-WARN][828] ([Intel XE#1727] / [Intel XE#3468]) -> [SKIP][829] ([Intel XE#1130])
   [828]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-5/igt@xe_pm@d3hot-multiple-execs.html
   [829]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@xe_pm@d3hot-multiple-execs.html

  * igt@xe_pm@s2idle-basic-exec:
    - shard-dg2-set2:     [SKIP][830] ([Intel XE#1130]) -> [DMESG-WARN][831] ([Intel XE#1727] / [Intel XE#3468])
   [830]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-434/igt@xe_pm@s2idle-basic-exec.html
   [831]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-436/igt@xe_pm@s2idle-basic-exec.html

  * igt@xe_pm@s2idle-vm-bind-unbind-all:
    - shard-dg2-set2:     [DMESG-WARN][832] ([Intel XE#1727] / [Intel XE#3468]) -> [SKIP][833] ([Intel XE#1130])
   [832]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-463/igt@xe_pm@s2idle-vm-bind-unbind-all.html
   [833]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-466/igt@xe_pm@s2idle-vm-bind-unbind-all.html

  * igt@xe_pm@s3-exec-after:
    - shard-bmg:          [SKIP][834] ([Intel XE#1130]) -> [DMESG-WARN][835] ([Intel XE#1727] / [Intel XE#3468] / [Intel XE#569])
   [834]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@xe_pm@s3-exec-after.html
   [835]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-5/igt@xe_pm@s3-exec-after.html
    - shard-dg2-set2:     [SKIP][836] ([Intel XE#1130]) -> [DMESG-WARN][837] ([Intel XE#1727] / [Intel XE#3468] / [Intel XE#569])
   [836]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-466/igt@xe_pm@s3-exec-after.html
   [837]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@xe_pm@s3-exec-after.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-dg2-set2:     [DMESG-WARN][838] ([Intel XE#1727] / [Intel XE#3468] / [Intel XE#569]) -> [SKIP][839] ([Intel XE#1130])
   [838]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-463/igt@xe_pm@s3-multiple-execs.html
   [839]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-434/igt@xe_pm@s3-multiple-execs.html

  * igt@xe_pm@s4-d3cold-basic-exec:
    - shard-bmg:          [SKIP][840] ([Intel XE#2284]) -> [SKIP][841] ([Intel XE#1130])
   [840]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-6/igt@xe_pm@s4-d3cold-basic-exec.html
   [841]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@xe_pm@s4-d3cold-basic-exec.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     [SKIP][842] ([Intel XE#579]) -> [SKIP][843] ([Intel XE#1130])
   [842]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-435/igt@xe_pm@vram-d3cold-threshold.html
   [843]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-434/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-bmg:          [DMESG-WARN][844] ([Intel XE#3468]) -> [SKIP][845] ([Intel XE#1130]) +5 other tests skip
   [844]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-5/igt@xe_pm_residency@toggle-gt-c6.html
   [845]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-bmg:          [SKIP][846] ([Intel XE#944]) -> [SKIP][847] ([Intel XE#1130]) +3 other tests skip
   [846]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-5/igt@xe_query@multigpu-query-mem-usage.html
   [847]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_query@multigpu-query-topology-l3-bank-mask:
    - shard-bmg:          [SKIP][848] ([Intel XE#1130]) -> [SKIP][849] ([Intel XE#944]) +2 other tests skip
   [848]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@xe_query@multigpu-query-topology-l3-bank-mask.html
   [849]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-3/igt@xe_query@multigpu-query-topology-l3-bank-mask.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-dg2-set2:     [SKIP][850] ([Intel XE#944]) -> [SKIP][851] ([Intel XE#1130]) +4 other tests skip
   [850]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-436/igt@xe_query@multigpu-query-uc-fw-version-huc.html
   [851]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-434/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-dg2-set2:     [SKIP][852] ([Intel XE#1130]) -> [SKIP][853] ([Intel XE#3342])
   [852]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-466/igt@xe_sriov_flr@flr-each-isolation.html
   [853]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-436/igt@xe_sriov_flr@flr-each-isolation.html

  * igt@xe_vm@mixed-userptr-binds-1611661312:
    - shard-dg2-set2:     [DMESG-WARN][854] ([Intel XE#1727]) -> [SKIP][855] ([Intel XE#1130]) +4 other tests skip
   [854]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-463/igt@xe_vm@mixed-userptr-binds-1611661312.html
   [855]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-434/igt@xe_vm@mixed-userptr-binds-1611661312.html

  * igt@xe_wedged@basic-wedged:
    - shard-adlp:         [DMESG-WARN][856] ([Intel XE#2919] / [Intel XE#3086]) -> [DMESG-WARN][857] ([Intel XE#2919])
   [856]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-adlp-3/igt@xe_wedged@basic-wedged.html
   [857]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-6/igt@xe_wedged@basic-wedged.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
  [Intel XE#1695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1695
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
  [Intel XE#2050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2141
  [Intel XE#2159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
  [Intel XE#2249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249
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
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
  [Intel XE#2501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501
  [Intel XE#2502]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2502
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
  [Intel XE#2514]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2635]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2685]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2685
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2715]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2864]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2919]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919
  [Intel XE#2924]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2924
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#3052]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3052
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3184]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184
  [Intel XE#3212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3212
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#3249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3249
  [Intel XE#3307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307
  [Intel XE#3339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3339
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3440]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3440
  [Intel XE#3451]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3451
  [Intel XE#3452]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3452
  [Intel XE#3453]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3453
  [Intel XE#3467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467
  [Intel XE#3468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468
  [Intel XE#3486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3486
  [Intel XE#3499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3499
  [Intel XE#3527]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3527
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3546]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3546
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/540
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#687]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/687
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * IGT: IGT_8125 -> IGT_8126
  * Linux: xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e -> xe-pw-141788v1

  IGT_8125: fbfda23ba003aab3454436d95c233dcf5e3bee54 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8126: 8126
  xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e: 7cd4d1589e461d61330ec272c448bc6d1b9da35e
  xe-pw-141788v1: 141788v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/index.html

--===============0977325055261842841==
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
<tr><td><b>Series:</b></td><td>Plane Color Pipeline support for Intel platforms</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/141788/">https://patchwork.freedesktop.org/series/141788/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e_full -&gt; xe-pw-141788v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-141788v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-141788v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-141788v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_getversion@basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-6/igt@core_getversion@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@core_getversion@basic.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@128x128-right-edge:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-3/igt@kms_cursor_edge_walk@128x128-right-edge.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-6/igt@kms_cursor_edge_walk@128x128-right-edge.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@128x128-right-edge@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-6/igt@kms_cursor_edge_walk@128x128-right-edge@pipe-a-hdmi-a-3.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-7/igt@kms_hdr@static-toggle-suspend@pipe-a-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-6/igt@kms_hdr@static-toggle-suspend@pipe-a-dp-2.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-legacy@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-adlp-6/igt@kms_properties@plane-properties-legacy@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-8/igt@kms_properties@plane-properties-legacy@pipe-a-hdmi-a-1.html">FAIL</a> +11 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-legacy@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_properties@plane-properties-legacy@pipe-a-hdmi-a-6.html">FAIL</a> +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-legacy@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-5/igt@kms_properties@plane-properties-legacy@pipe-b-hdmi-a-3.html">FAIL</a> +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-legacy@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-lnl-4/igt@kms_properties@plane-properties-legacy@pipe-c-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-lnl-7/igt@kms_properties@plane-properties-legacy@pipe-c-edp-1.html">FAIL</a> +7 other tests fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x256:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_cursor_crc@cursor-random-256x256.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-6/igt@kms_cursor_crc@cursor-random-256x256.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-466/igt@kms_properties@plane-properties-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_properties@plane-properties-legacy.html">FAIL</a> +1 other test fail</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_properties@plane-properties-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-5/igt@kms_properties@plane-properties-legacy.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-3/igt@xe_module_load@reload-no-display.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@xe_module_load@reload-no-display.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e_full and xe-pw-141788v1_full:</p>
<h3>New IGT tests (18)</h3>
<ul>
<li>
<p>igt@kms_pm_rpm@legacy-planes-dpms@plane-119:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [8.09, 17.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes-dpms@plane-128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [8.00, 17.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes-dpms@plane-61:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [8.10, 17.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes-dpms@plane-90:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [8.12, 17.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes@plane-119:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [3.84, 17.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes@plane-128:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [3.94, 17.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes@plane-61:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [3.82, 17.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes@plane-90:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [3.86, 17.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms@plane-119:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [3.86, 17.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms@plane-128:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [4.37, 17.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms@plane-137:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [4.17, 17.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms@plane-61:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [4.31, 17.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms@plane-90:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [4.04, 17.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes@plane-119:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s) 2 pass(s)</li>
<li>Exec time: [3.47, 15.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes@plane-128:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s) 2 pass(s)</li>
<li>Exec time: [3.60, 16.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes@plane-137:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s) 2 pass(s)</li>
<li>Exec time: [5.08, 16.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes@plane-61:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s) 2 pass(s)</li>
<li>Exec time: [4.26, 17.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes@plane-90:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s) 2 pass(s)</li>
<li>Exec time: [3.70, 17.33] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-141788v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@core_hotunplug@hotreplug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-435/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-434/igt@core_hotunplug@unbind-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@unplug-rescan:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-4/igt@core_hotunplug@unplug-rescan.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-4/igt@core_hotunplug@unplug-rescan.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +8 other tests dmesg-warn</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-466/igt@core_hotunplug@unplug-rescan.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>)</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-shared-fd:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-7/igt@core_setmaster@master-drop-set-shared-fd.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@core_setmaster@master-drop-set-shared-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3453">Intel XE#3453</a>)</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-4/igt@core_setmaster@master-drop-set-user.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@core_setmaster@master-drop-set-user.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3339">Intel XE#3339</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-435/igt@fbdev@read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-466/igt@fbdev@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@unaligned-write:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-2/igt@fbdev@unaligned-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@fbdev@unaligned-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-435/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-435/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-434/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-7/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-adlp-4/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-9/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-3/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-5/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-6/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328">Intel XE#2328</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-4/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-436/igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-7/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +69 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-4/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-2/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-436/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-4/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-2/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-6/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-4/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_color@deep-color.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_content_protection@legacy@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-1/igt@kms_cursor_crc@cursor-offscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@64x64-top-bottom:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-2/igt@kms_cursor_edge_walk@64x64-top-bottom.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +4 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340">Intel XE#1340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-6/igt@kms_draw_crc@draw-method-mmap-wc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-5/igt@kms_draw_crc@draw-method-mmap-wc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +4 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-wc@rgb565-4tiled:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-6/igt@kms_draw_crc@draw-method-mmap-wc@rgb565-4tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-5/igt@kms_draw_crc@draw-method-mmap-wc@rgb565-4tiled.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-4/igt@kms_draw_crc@draw-method-render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-2/igt@kms_draw_crc@draw-method-render.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-render@rgb565-4tiled:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-4/igt@kms_draw_crc@draw-method-render@rgb565-4tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-2/igt@kms_draw_crc@draw-method-render@rgb565-4tiled.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-6/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-8/igt@kms_flip@2x-flip-vs-rmfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-5/igt@kms_flip@2x-plain-flip-ts-check@bc-dp2-hdmi-a3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +17 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-lnl-7/igt@kms_flip@flip-vs-blocking-wf-vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-lnl-3/igt@kms_flip@flip-vs-blocking-wf-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3486">Intel XE#3486</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-4:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-5/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-4.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-5/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +41 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +16 other tests skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-handle-closed:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-436/igt@kms_getfb@getfb-handle-closed.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_getfb@getfb-handle-closed.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-7/igt@kms_hdr@static-toggle-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-6/igt@kms_hdr@static-toggle-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3451">Intel XE#3451</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-clock:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-435/igt@kms_invalid_mode@zero-clock.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-434/igt@kms_invalid_mode@zero-clock.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +87 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-434/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +42 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-none:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-7/igt@kms_plane_lowres@tiling-none.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-5/igt@kms_plane_lowres@tiling-none.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3452">Intel XE#3452</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-3/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-9/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-lnl-4/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_pm_lpsp@kms-lpsp@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3527">Intel XE#3527</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-435/igt@kms_pm_rpm@cursor.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-434/igt@kms_pm_rpm@cursor.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-466/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_pm_rpm@legacy-planes-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-4/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-2/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-stress-extra-wait:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-4/igt@kms_pm_rpm@modeset-stress-extra-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-7/igt@kms_pm_rpm@modeset-stress-extra-wait.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864">Intel XE#2864</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-463/igt@kms_pm_rpm@universal-planes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042">Intel XE#2042</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>{igt@kms_pm_rpm@universal-planes@plane-119} (NEW):</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-463/igt@kms_pm_rpm@universal-planes@plane-119.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>{igt@kms_pm_rpm@universal-planes@plane-137} (NEW):</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-463/igt@kms_pm_rpm@universal-planes@plane-137.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-435/igt@kms_properties@connector-properties-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_properties@connector-properties-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2924">Intel XE#2924</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-6/igt@kms_properties@connector-properties-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_properties@connector-properties-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +95 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2924">Intel XE#2924</a>) +3 other tests skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-4/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-1/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-2/igt@kms_psr@fbc-psr-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-436/igt@kms_psr@fbc-psr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-2/igt@kms_psr@psr-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-4/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159">Intel XE#2159</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +7 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-436/igt@xe_eudebug@basic-vm-access.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-1/igt@xe_eudebug@basic-vm-access.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@stopped-thread:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-7/igt@xe_eudebug_online@stopped-thread.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-6/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large-multi-vm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-6/igt@xe_evict@evict-beng-mixed-threads-large-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-simple:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-3/igt@xe_evict_ccs@evict-overcommit-simple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-cm-virtual-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-adlp-6/igt@xe_exec_balancer@twice-cm-virtual-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-9/igt@xe_exec_balancer@twice-cm-virtual-basic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +2 other tests timeout</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-3/igt@xe_exec_basic@multigpu-once-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-5/igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +236 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-1/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-race-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-8/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-adlp-1/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-4/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@lot-of-buffers:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-3/igt@xe_intel_bb@lot-of-buffers.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-4/igt@xe_intel_bb@lot-of-buffers.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-434/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-2/igt@xe_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports@ccs-0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-lnl-7/igt@xe_oa@mmio-triggered-reports@ccs-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-lnl-5/igt@xe_oa@mmio-triggered-reports@ccs-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249">Intel XE#2249</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-ufence-wait:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-434/igt@xe_oa@syncs-ufence-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +75 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-1/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-prefetch:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-adlp-6/igt@xe_pm@s2idle-vm-bind-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-1/igt@xe_pm@s2idle-vm-bind-prefetch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-unbind-all:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-4/igt@xe_pm@s2idle-vm-bind-unbind-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-4/igt@xe_pm@s2idle-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616">Intel XE#1616</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-lnl-1/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-lnl-3/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-3/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_tlb@basic-tlb:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-adlp-1/igt@xe_tlb@basic-tlb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-1/igt@xe_tlb@basic-tlb.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3212">Intel XE#3212</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-lnl-6/igt@xe_tlb@basic-tlb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-lnl-8/igt@xe_tlb@basic-tlb.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3212">Intel XE#3212</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@bind-no-array-conflict:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@xe_vm@bind-no-array-conflict.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +47 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-binds-1073741824:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-435/igt@xe_vm@large-binds-1073741824.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-434/igt@xe_vm@large-binds-1073741824.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +148 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-binds-33554432:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@xe_vm@large-split-binds-33554432.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_getversion@all-cards:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@core_getversion@all-cards.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3249">Intel XE#3249</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-5/igt@core_getversion@all-cards.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@core_getversion@basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-434/igt@core_getversion@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3440">Intel XE#3440</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@core_getversion@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotreplug-lateclose:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-466/igt@core_hotunplug@hotreplug-lateclose.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-436/igt@core_hotunplug@hotreplug-lateclose.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotunbind-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@core_hotunplug@hotunbind-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-4/igt@core_hotunplug@hotunbind-rebind.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-root:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@core_setmaster@master-drop-set-root.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-5/igt@core_setmaster@master-drop-set-root.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-466/igt@core_setmaster@master-drop-set-user.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3339">Intel XE#3339</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@core_setmaster@master-drop-set-user.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-466/igt@fbdev@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@fbdev@write.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_addfb_basic@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-6/igt@kms_addfb_basic@basic.html">PASS</a> +73 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-466/igt@kms_big_fb@4-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_big_fb@4-tiled-addfb-size-overflow.html">PASS</a> +19 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-434/igt@kms_big_fb@linear-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_big_fb@linear-64bpp-rotate-180.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_big_fb@linear-8bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-4/igt@kms_big_fb@linear-8bpp-rotate-180.html">PASS</a> +19 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3052">Intel XE#3052</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-3/igt@kms_cursor_crc@cursor-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-6/igt@kms_cursor_crc@cursor-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-right-edge:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-7/igt@kms_cursor_edge_walk@256x256-right-edge.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-4/igt@kms_cursor_edge_walk@256x256-right-edge.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-466/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">PASS</a> +49 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-6/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373">Intel XE#2373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-3/igt@kms_feature_discovery@display-2x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-busy-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-6/igt@kms_flip@2x-busy-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-3/igt@kms_flip@2x-busy-flip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-2/igt@kms_flip@absolute-wf_vblank@a-dp2.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-3/igt@kms_flip@absolute-wf_vblank@a-dp2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-lnl-3/igt@kms_flip@plain-flip-fb-recreate@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-lnl-5/igt@kms_flip@plain-flip-fb-recreate@b-edp1.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-lnl-3/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-lnl-5/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-6/igt@kms_flip@wf_vblank-ts-check.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635">Intel XE#2635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-4/igt@kms_flip@wf_vblank-ts-check.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-434/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-3/igt@kms_hdr@invalid-hdr.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-4/igt@kms_hdr@invalid-hdr.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-start:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-463/igt@kms_invalid_mode@bad-hsync-start.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-436/igt@kms_invalid_mode@bad-hsync-start.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-7/igt@kms_joiner@invalid-modeset-force-big-joiner.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-6/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-2/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-lnl-6/igt@kms_pm_dc@dc5-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-lnl-4/igt@kms_pm_dc@dc5-psr.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-463/igt@kms_pm_rpm@cursor-dpms.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_pm_rpm@cursor-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-5/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-6/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@drm-resources-equal:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_pm_rpm@drm-resources-equal.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-6/igt@kms_pm_rpm@drm-resources-equal.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-stress-extra-wait:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-adlp-1/igt@kms_pm_rpm@modeset-stress-extra-wait.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-3/igt@kms_pm_rpm@modeset-stress-extra-wait.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-434/igt@kms_pm_rpm@system-suspend-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-436/igt@kms_pm_rpm@system-suspend-modeset.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-5/igt@xe_evict@evict-beng-mixed-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-3/igt@xe_evict@evict-beng-mixed-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-cm-virtual-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-434/igt@xe_exec_balancer@many-cm-virtual-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-463/igt@xe_exec_balancer@many-cm-virtual-userptr-invalidate.html">PASS</a> +123 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-lnl-5/igt@xe_live_ktest@xe_mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-lnl-6/igt@xe_live_ktest@xe_mocs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-adlp-1/igt@xe_module_load@many-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-8/igt@xe_module_load@many-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted@rcs-0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-lnl-1/igt@xe_oa@oa-regs-whitelisted@rcs-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514">Intel XE#2514</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-lnl-6/igt@xe_oa@oa-regs-whitelisted@rcs-0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mocs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-lnl-4/igt@xe_pm@d3hot-mocs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184">Intel XE#3184</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-lnl-6/igt@xe_pm@d3hot-mocs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-2/igt@xe_pm@s2idle-vm-bind-userptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616">Intel XE#1616</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-6/igt@xe_pm@s2idle-vm-bind-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-mocs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-adlp-1/igt@xe_pm@s3-mocs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-4/igt@xe_pm@s3-mocs.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-2/igt@xe_pm@s4-multiple-execs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-adlp-9/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-1/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-3/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-6/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html">PASS</a> +53 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_vm@bind-once:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@xe_vm@bind-once.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-6/igt@xe_vm@bind-once.html">PASS</a> +162 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunplug-rescan:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-435/igt@core_hotunplug@hotunplug-rescan.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-466/igt@core_hotunplug@hotunplug-rescan.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@too-wide:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-436/igt@kms_addfb_basic@too-wide.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-466/igt@kms_addfb_basic@too-wide.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-435/igt@kms_async_flips@async-flip-suspend-resume.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-466/igt@kms_async_flips@async-flip-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-5/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-463/igt@kms_async_flips@test-time-stamp.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-466/igt@kms_async_flips@test-time-stamp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-3/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +3 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-466/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-436/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-434/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-436/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-3/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-435/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-466/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-4/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-7/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-436/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-466/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-466/igt@kms_big_fb@x-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_big_fb@x-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-435/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3052">Intel XE#3052</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-4/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-436/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-466/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-3/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-2/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-463/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-7/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-2/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-4/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-466/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-436/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-2/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-436/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-466/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-463/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-463/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-434/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-4/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-7/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-436/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-434/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +2 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-466/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-466/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2924">Intel XE#2924</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-2/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-7/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-5/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-466/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-435/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-466/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-2/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-463/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-434/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-frame-dump:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-466/igt@kms_chamelium_frames@hdmi-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-436/igt@kms_chamelium_frames@hdmi-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-6/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-3/igt@kms_content_protection@atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-4/igt@kms_content_protection@atomic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715">Intel XE#2715</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-466/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_content_protection@atomic-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-434/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-436/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-4/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-435/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-466/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-5/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-4/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-7/igt@kms_content_protection@lic-type-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-6/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-2/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-436/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-466/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x10:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-4/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-max-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-max-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-434/igt@kms_cursor_crc@cursor-random-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-436/igt@kms_cursor_crc@cursor-random-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-3/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-436/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-435/igt@kms_cursor_crc@cursor-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-434/igt@kms_cursor_crc@cursor-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-466/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-5/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-2.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-2/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2141">Intel XE#2141</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-4/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-6/igt@kms_dp_aux_dev.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Intel XE#3009</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_dp_aux_dev.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-466/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-436/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-3/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-4/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-436/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-434/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-435/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-436/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_fbcon_fbt@fbc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-7/igt@kms_fbcon_fbt@fbc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1695">Intel XE#1695</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-7/igt@kms_fbcon_fbt@fbc-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1695">Intel XE#1695</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_fbcon_fbt@fbc-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-6/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-434/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-436/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-5/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373">Intel XE#2373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-435/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-434/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-434/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-7/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-2/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375">Intel XE#2375</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +2 other tests fail</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2924">Intel XE#2924</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_flip@2x-flip-vs-rmfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-rmfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-463/igt@kms_flip@2x-flip-vs-suspend.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-434/igt@kms_flip@2x-flip-vs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-5/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-6/igt@kms_flip@2x-plain-flip-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_flip@2x-plain-flip-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-5/igt@kms_flip@flip-vs-rmfb-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_flip@flip-vs-rmfb-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_flip@plain-flip-fb-recreate-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-4/igt@kms_flip@plain-flip-fb-recreate-interruptible.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2924">Intel XE#2924</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_flip_tiling@flip-change-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-5/igt@kms_flip_tiling@flip-change-tiling.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-466/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/540">Intel XE#540</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +4 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2924">Intel XE#2924</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-onoff.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +38 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-7/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-7/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050">Intel XE#2050</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-7/igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-b-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-7/igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-b-dp-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-5/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350">Intel XE#2350</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2924">Intel XE#2924</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-5/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2502">Intel XE#2502</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-436/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">Intel XE#605</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-434/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-repeated-different-handles:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-466/igt@kms_getfb@getfb-repeated-different-handles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_getfb@getfb-repeated-different-handles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/687">Intel XE#687</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-accept-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-7/igt@kms_getfb@getfb2-accept-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340">Intel XE#2340</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_getfb@getfb2-accept-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-3/igt@kms_hdr@bpc-switch-suspend.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_hdr@bpc-switch-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-5/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934">Intel XE#2934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-4/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_lease@possible-crtcs-filtering:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_lease@possible-crtcs-filtering.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-5/igt@kms_lease@possible-crtcs-filtering.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-3/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501">Intel XE#2501</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_pipe_crc_basic@nonblocking-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-2/igt@kms_pipe_crc_basic@nonblocking-crc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-3/igt@kms_plane@pixel-format-source-clamping.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_plane@pixel-format-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-3/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493">Intel XE#2493</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-5/igt@kms_plane_scaling@intel-max-src-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-6/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2685">Intel XE#2685</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307">Intel XE#3307</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-3/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-436/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-436/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-466/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-435/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-434/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-6/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-435/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-466/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-434/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_pm_dc@dc9-dpms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-7/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505">Intel XE#2505</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-434/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_pm_lpsp@kms-lpsp.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3527">Intel XE#3527</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-2/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499">Intel XE#2499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-435/igt@kms_pm_rpm@basic-pci-d3-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-466/igt@kms_pm_rpm@basic-pci-d3-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-2/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-436/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-466/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-4/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-434/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2924">Intel XE#2924</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-7/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-435/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2924">Intel XE#2924</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-434/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-436/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-436/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-434/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-6/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-3/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-6/igt@kms_psr@fbc-pr-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_psr@fbc-pr-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-466/igt@kms_psr@fbc-pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_psr@fbc-pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-463/igt@kms_psr@fbc-pr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-466/igt@kms_psr@fbc-pr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-463/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2924">Intel XE#2924</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-435/igt@kms_psr@fbc-psr2-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-434/igt@kms_psr@fbc-psr2-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-434/igt@kms_psr@pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-436/igt@kms_psr@pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-no-drrs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_psr@psr2-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-6/igt@kms_psr@psr2-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-466/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-466/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-436/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) +2 other tests skip</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-3/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-435/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-466/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-6/igt@kms_scaling_modes@scaling-mode-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_scaling_modes@scaling-mode-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-3/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-5/igt@kms_setmode@invalid-clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_setmode@invalid-clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-7/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450">Intel XE#2450</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-2/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-435/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-466/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-466/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2924">Intel XE#2924</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-3/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-463/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-466/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-5/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-435/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-434/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-4/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-434/igt@xe_ccs@suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@xe_ccs@suspend-resume.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-435/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-466/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-466/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +3 other tests skip</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-3/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504">Intel XE#2504</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@utilization-single-idle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@xe_drm_fdinfo@utilization-single-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-2/igt@xe_drm_fdinfo@utilization-single-idle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-close:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-435/igt@xe_eudebug@basic-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-466/igt@xe_eudebug@basic-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-metadata-discovery:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-5/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@vma-ufence:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-2/igt@xe_eudebug@vma-ufence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@xe_eudebug@vma-ufence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@basic-breakpoint:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-434/igt@xe_eudebug_online@basic-breakpoint.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-463/igt@xe_eudebug_online@basic-breakpoint.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-3/igt@xe_evict@evict-beng-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364">Intel XE#2364</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@xe_evict@evict-beng-large-multi-vm-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-463/igt@xe_evict@evict-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600">Intel XE#1600</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-466/igt@xe_evict@evict-large-multi-vm-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@xe_evict@evict-large-multi-vm-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-3/igt@xe_evict@evict-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364">Intel XE#2364</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-parallel-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-434/igt@xe_exec_balancer@twice-parallel-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@xe_exec_balancer@twice-parallel-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@once-bindexecqueue:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@xe_exec_compute_mode@once-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-4/igt@xe_exec_compute_mode@once-bindexecqueue.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-2/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-466/igt@xe_exec_fault_mode@once-userptr-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-436/igt@xe_exec_fault_mode@once-userptr-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-466/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-463/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-463/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-434/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-2/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3499">Intel XE#3499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-2/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-4/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-3/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3499">Intel XE#3499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-436/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-466/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +2 other tests skip</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-5/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-6/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3499">Intel XE#3499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_pt_create:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-3/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-4/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-7/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-4/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-435/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-466/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@blit-reloc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-463/igt@xe_intel_bb@blit-reloc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594">Intel XE#2594</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-434/igt@xe_intel_bb@blit-reloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-436/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/560">Intel XE#560</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-466/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-466/igt@xe_module_load@reload-no-display.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3546">Intel XE#3546</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@xe_module_load@reload-no-display.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@map-oa-buffer:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-435/igt@xe_oa@map-oa-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-466/igt@xe_oa@map-oa-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-system-wide-paranoid:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-466/igt@xe_oa@non-system-wide-paranoid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@xe_oa@non-system-wide-paranoid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@xe_oa@unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-5/igt@xe_oa@unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248">Intel XE#2248</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-436/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-434/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-3/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-4/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-434/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-436/igt@xe_pm@d3hot-multiple-execs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@xe_pm@d3hot-multiple-execs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-5/igt@xe_pm@d3hot-multiple-execs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@xe_pm@d3hot-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-434/igt@xe_pm@s2idle-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-436/igt@xe_pm@s2idle-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-unbind-all:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-463/igt@xe_pm@s2idle-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-466/igt@xe_pm@s2idle-vm-bind-unbind-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-exec-after:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@xe_pm@s3-exec-after.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-5/igt@xe_pm@s3-exec-after.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-466/igt@xe_pm@s3-exec-after.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-435/igt@xe_pm@s3-exec-after.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-463/igt@xe_pm@s3-multiple-execs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-434/igt@xe_pm@s3-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-6/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-435/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-434/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-5/igt@xe_pm_residency@toggle-gt-c6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@xe_pm_residency@toggle-gt-c6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-5/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-1/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology-l3-bank-mask:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-bmg-1/igt@xe_query@multigpu-query-topology-l3-bank-mask.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-bmg-3/igt@xe_query@multigpu-query-topology-l3-bank-mask.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-436/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-434/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-466/igt@xe_sriov_flr@flr-each-isolation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-436/igt@xe_sriov_flr@flr-each-isolation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@mixed-userptr-binds-1611661312:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-dg2-463/igt@xe_vm@mixed-userptr-binds-1611661312.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-dg2-434/igt@xe_vm@mixed-userptr-binds-1611661312.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e/shard-adlp-3/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919">Intel XE#2919</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v1/shard-adlp-6/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919">Intel XE#2919</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8125 -&gt; IGT_8126</li>
<li>Linux: xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e -&gt; xe-pw-141788v1</li>
</ul>
<p>IGT_8125: fbfda23ba003aab3454436d95c233dcf5e3bee54 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8126: 8126<br />
  xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e: 7cd4d1589e461d61330ec272c448bc6d1b9da35e<br />
  xe-pw-141788v1: 141788v1</p>

</body>
</html>

--===============0977325055261842841==--
