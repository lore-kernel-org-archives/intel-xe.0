Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78C39CCA490
	for <intel-xe@archiver.kernel.org>; Sat, 17 Oct 2026 02:44:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D534A10E1AF;
	Sat, 17 Oct 2026 02:44:36 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 936A110E1AF;
 Sat, 17 Oct 2026 02:44:35 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5761315084106817174=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_FD_close_cleanup_for_XE_?=
 =?utf-8?q?=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniel Charles" <daniel.charles@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 17 Oct 2026 02:44:35 -0000
Message-ID: <179220507558.36601.2305273476279517812@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261016195904.1377149-1-daniel.charles@intel.com>
In-Reply-To: <20261016195904.1377149-1-daniel.charles@intel.com>
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

--===============5761315084106817174==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: FD close cleanup for XE (rev4)
URL   : https://patchwork.freedesktop.org/series/175996/
State : failure

== Summary ==

CI Bug Log - changes from xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89_FULL -> xe-pw-175996v4_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-175996v4_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-175996v4_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-175996v4_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@hotunplug-rescan-with-load:
    - shard-bmg:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-bmg-5/igt@core_hotunplug@hotunplug-rescan-with-load.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-6/igt@core_hotunplug@hotunplug-rescan-with-load.html

  
#### Warnings ####

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][3], [PASS][4], [PASS][5], [PASS][6], [PASS][7], [PASS][8], [PASS][9], [PASS][10], [PASS][11], [PASS][12], [PASS][13], [PASS][14], [PASS][15], [PASS][16], [PASS][17], [PASS][18], [PASS][19], [PASS][20], [PASS][21], [PASS][22], [PASS][23], [PASS][24], [PASS][25], [SKIP][26], [PASS][27], [PASS][28]) ([Intel XE#2457] / [Intel XE#7405]) -> ([PASS][29], [PASS][30], [PASS][31], [PASS][32], [PASS][33], [PASS][34], [PASS][35], [PASS][36], [DMESG-WARN][37], [PASS][38], [PASS][39], [SKIP][40], [PASS][41], [PASS][42], [PASS][43], [PASS][44], [PASS][45], [PASS][46], [PASS][47], [PASS][48], [PASS][49], [PASS][50], [PASS][51], [PASS][52], [PASS][53], [PASS][54]) ([Intel XE#2457] / [Intel XE#7405])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-bmg-5/igt@xe_module_load@load.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-bmg-7/igt@xe_module_load@load.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-bmg-7/igt@xe_module_load@load.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-bmg-1/igt@xe_module_load@load.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-bmg-1/igt@xe_module_load@load.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-bmg-9/igt@xe_module_load@load.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-bmg-8/igt@xe_module_load@load.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-bmg-8/igt@xe_module_load@load.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-bmg-10/igt@xe_module_load@load.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-bmg-4/igt@xe_module_load@load.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-bmg-4/igt@xe_module_load@load.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-bmg-4/igt@xe_module_load@load.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-bmg-8/igt@xe_module_load@load.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-bmg-3/igt@xe_module_load@load.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-bmg-6/igt@xe_module_load@load.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-bmg-6/igt@xe_module_load@load.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-bmg-3/igt@xe_module_load@load.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-bmg-10/igt@xe_module_load@load.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-bmg-5/igt@xe_module_load@load.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-bmg-5/igt@xe_module_load@load.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-bmg-2/igt@xe_module_load@load.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-bmg-2/igt@xe_module_load@load.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-bmg-2/igt@xe_module_load@load.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-bmg-9/igt@xe_module_load@load.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-bmg-9/igt@xe_module_load@load.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-bmg-9/igt@xe_module_load@load.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-8/igt@xe_module_load@load.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-5/igt@xe_module_load@load.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-5/igt@xe_module_load@load.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-10/igt@xe_module_load@load.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-6/igt@xe_module_load@load.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-1/igt@xe_module_load@load.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-1/igt@xe_module_load@load.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-10/igt@xe_module_load@load.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-6/igt@xe_module_load@load.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-3/igt@xe_module_load@load.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-7/igt@xe_module_load@load.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-7/igt@xe_module_load@load.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-2/igt@xe_module_load@load.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-2/igt@xe_module_load@load.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-4/igt@xe_module_load@load.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-5/igt@xe_module_load@load.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-4/igt@xe_module_load@load.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-8/igt@xe_module_load@load.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-8/igt@xe_module_load@load.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-9/igt@xe_module_load@load.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-7/igt@xe_module_load@load.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-7/igt@xe_module_load@load.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-1/igt@xe_module_load@load.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-9/igt@xe_module_load@load.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-9/igt@xe_module_load@load.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-3/igt@xe_module_load@load.html

  
New tests
---------

  New tests have been introduced between xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89_FULL and xe-pw-175996v4_FULL:

### New IGT tests (7) ###

  * igt@kms_invalid_mode@bad-vtotal@pipe-d-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_invalid_mode@int-max-clock@pipe-d-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_invalid_mode@zero-vdisplay@pipe-d-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_sequence@queue-idle@pipe-d-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.35] s

  * igt@kms_vblank@accuracy-idle@pipe-d-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.34] s

  * igt@kms_vblank@wait-busy@pipe-d-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.47] s

  * igt@kms_vblank@wait-forked@pipe-d-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.39] s

  

Known issues
------------

  Here are the changes found in xe-pw-175996v4_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@intel_hwmon@hwmon-write:
    - shard-ptl:          NOTRUN -> [SKIP][55] ([Intel XE#7225])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-2/igt@intel_hwmon@hwmon-write.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-bmg:          [PASS][56] -> [FAIL][57] ([Intel XE#8098] / [Intel XE#9561]) +1 other test fail
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-bmg-8/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-1/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-ptl:          NOTRUN -> [SKIP][58] ([Intel XE#5901])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#7059] / [Intel XE#7085])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-8/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#2327]) +2 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-8/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#1124]) +1 other test skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-8/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-ptl:          NOTRUN -> [SKIP][62] ([Intel XE#5808]) +6 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-1/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-ptl:          NOTRUN -> [SKIP][63] ([Intel XE#5851]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-2/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_bw@connected-linear-tiling-2-displays-target-2560x1440p:
    - shard-ptl:          NOTRUN -> [SKIP][64] ([Intel XE#7679]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-7/igt@kms_bw@connected-linear-tiling-2-displays-target-2560x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-target-1920x1080p:
    - shard-ptl:          NOTRUN -> [SKIP][65] ([Intel XE#367]) +2 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-7/igt@kms_bw@linear-tiling-3-displays-target-1920x1080p.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs:
    - shard-ptl:          NOTRUN -> [SKIP][66] ([Intel XE#5822]) +5 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-7/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#2652]) +3 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-4/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#2887]) +7 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-1/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1:
    - shard-ptl:          NOTRUN -> [SKIP][69] ([Intel XE#5823] / [Intel XE#6918]) +9 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-c-edp-1:
    - shard-ptl:          [PASS][70] -> [DMESG-WARN][71] ([Intel XE#9389])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-8/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-c-edp-1.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-5/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-c-edp-1.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#2325] / [Intel XE#7358])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-8/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d:
    - shard-ptl:          NOTRUN -> [SKIP][73] ([Intel XE#8391]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-2/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-ptl:          NOTRUN -> [SKIP][74] ([Intel XE#2252]) +4 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-7/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#2252]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-8/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_sharpness_filter@filter-basic:
    - shard-ptl:          NOTRUN -> [SKIP][76] ([Intel XE#6507])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-7/igt@kms_chamelium_sharpness_filter@filter-basic.html

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-d-plane-4:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#6969]) +7 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-8/igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-d-plane-4.html

  * igt@kms_content_protection@legacy:
    - shard-ptl:          NOTRUN -> [SKIP][78] ([Intel XE#7642]) +2 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-1/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][79] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +1 other test fail
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-5/igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-1:
    - shard-bmg:          NOTRUN -> [FAIL][80] ([Intel XE#3304] / [Intel XE#7374]) +3 other tests fail
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-7/igt@kms_content_protection@lic-type-0@pipe-a-dp-1.html

  * igt@kms_content_protection@uevent@pipe-a-dp-1:
    - shard-bmg:          NOTRUN -> [FAIL][81] ([Intel XE#6707] / [Intel XE#7439])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-7/igt@kms_content_protection@uevent@pipe-a-dp-1.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-ptl:          NOTRUN -> [SKIP][82] ([Intel XE#5846]) +1 other test skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-1/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#2320]) +2 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-rapid-movement-256x85:
    - shard-ptl:          NOTRUN -> [SKIP][84] ([Intel XE#5900]) +2 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-1/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#2321] / [Intel XE#7355])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-9/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1:
    - shard-ptl:          [PASS][86] -> [ABORT][87] ([Intel XE#9362]) +6 other tests abort
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-8/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-7/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-ptl:          NOTRUN -> [SKIP][88] ([Intel XE#5962]) +2 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-ptl:          NOTRUN -> [SKIP][89] ([Intel XE#5962] / [Intel XE#7343])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-1/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][90] -> [FAIL][91] ([Intel XE#7809])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-ptl:          NOTRUN -> [SKIP][92] ([Intel XE#6035])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#1508])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-1/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dp_link_training@non-uhbr-mst-direct-train:
    - shard-ptl:          NOTRUN -> [SKIP][94] ([Intel XE#9532])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-1/igt@kms_dp_link_training@non-uhbr-mst-direct-train.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-ptl:          NOTRUN -> [SKIP][95] ([Intel XE#9533])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-7/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dp_link_training@uhbr-sst-tbtalt-train:
    - shard-ptl:          NOTRUN -> [SKIP][96] ([Intel XE#9537])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-1/igt@kms_dp_link_training@uhbr-sst-tbtalt-train.html

  * igt@kms_dsc@dsc-with-bpc-ultrajoiner:
    - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#8265])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-8/igt@kms_dsc@dsc-with-bpc-ultrajoiner.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-ptl:          NOTRUN -> [SKIP][98] ([Intel XE#5907]) +1 other test skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-2/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#8680])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-8/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#2372] / [Intel XE#7359])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-8/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-3x:
    - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#2373] / [Intel XE#7448])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-1/igt@kms_feature_discovery@display-3x.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-ptl:          NOTRUN -> [SKIP][102] ([Intel XE#2316]) +2 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-1/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [PASS][103] -> [FAIL][104] ([Intel XE#301])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [PASS][105] -> [FAIL][106] ([Intel XE#301] / [Intel XE#3149]) +2 other tests fail
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip@modeset-vs-vblank-race@c-hdmi-a3:
    - shard-bmg:          [PASS][107] -> [FAIL][108] ([Intel XE#3098]) +1 other test fail
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-bmg-10/igt@kms_flip@modeset-vs-vblank-race@c-hdmi-a3.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-5/igt@kms_flip@modeset-vs-vblank-race@c-hdmi-a3.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][109] ([Intel XE#7178] / [Intel XE#7351]) +2 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x:
    - shard-ptl:          NOTRUN -> [SKIP][110] ([Intel XE#7179])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-2/igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-ptl:          NOTRUN -> [SKIP][111] ([Intel XE#7178]) +2 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:
    - shard-ptl:          NOTRUN -> [SKIP][112] ([Intel XE#5800] / [Intel XE#6312]) +8 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-render:
    - shard-ptl:          NOTRUN -> [SKIP][113] ([Intel XE#7061]) +3 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-2/igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@drrshdr-slowdraw:
    - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#2311]) +22 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-8/igt@kms_frontbuffer_tracking@drrshdr-slowdraw.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          NOTRUN -> [SKIP][115] ([Intel XE#4141]) +6 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-ptl:          NOTRUN -> [SKIP][116] ([Intel XE#5812]) +38 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-ptl:          NOTRUN -> [SKIP][117] ([Intel XE#6312]) +11 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-7/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-mmap-wc:
    - shard-ptl:          NOTRUN -> [SKIP][118] ([Intel XE#7061] / [Intel XE#7356])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-1/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][119] ([Intel XE#7061] / [Intel XE#7356]) +2 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-ptl:          NOTRUN -> [SKIP][120] ([Intel XE#5865] / [Intel XE#7399])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-2/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][121] ([Intel XE#7061]) +3 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-ptl:          NOTRUN -> [SKIP][122] ([Intel XE#7865]) +11 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-move:
    - shard-bmg:          NOTRUN -> [SKIP][123] ([Intel XE#2313]) +27 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-8/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-move.html

  * igt@kms_hdmi_audio_bw@audio-bw-hblank80:
    - shard-ptl:          NOTRUN -> [SKIP][124] ([Intel XE#9312])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-2/igt@kms_hdmi_audio_bw@audio-bw-hblank80.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-ptl:          NOTRUN -> [SKIP][125] ([Intel XE#6900])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-bmg:          NOTRUN -> [SKIP][126] ([Intel XE#7591])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_pipe_stress@stress-xrgb8888-xtiled:
    - shard-ptl:          NOTRUN -> [SKIP][127] ([Intel XE#6912])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-2/igt@kms_pipe_stress@stress-xrgb8888-xtiled.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier:
    - shard-ptl:          NOTRUN -> [SKIP][128] ([Intel XE#7283]) +1 other test skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-1/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier.html

  * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping:
    - shard-bmg:          NOTRUN -> [SKIP][129] ([Intel XE#7283]) +3 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-8/igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-ptl:          NOTRUN -> [SKIP][130] ([Intel XE#5879] / [Intel XE#7343])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b:
    - shard-ptl:          NOTRUN -> [SKIP][131] ([Intel XE#6886]) +9 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-7/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][132] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-8/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc3co-after-dc6@pr-xrgb8888:
    - shard-ptl:          NOTRUN -> [SKIP][133] ([Intel XE#8395] / [Intel XE#8396]) +1 other test skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-2/igt@kms_pm_dc@dc3co-after-dc6@pr-xrgb8888.html

  * igt@kms_pm_dc@dc3co-after-dc6@psr2-yuv420:
    - shard-ptl:          NOTRUN -> [SKIP][134] ([Intel XE#8396]) +1 other test skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-2/igt@kms_pm_dc@dc3co-after-dc6@psr2-yuv420.html

  * igt@kms_pm_rpm@package-g7:
    - shard-bmg:          NOTRUN -> [SKIP][135] ([Intel XE#6814] / [Intel XE#7428])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-8/igt@kms_pm_rpm@package-g7.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1:
    - shard-ptl:          NOTRUN -> [SKIP][136] ([Intel XE#5858]) +1 other test skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-b-edp-1:
    - shard-ptl:          NOTRUN -> [SKIP][137] ([Intel XE#5858] / [Intel XE#7304]) +3 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-2/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-b-edp-1.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][138] ([Intel XE#1489]) +4 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-9/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][139] ([Intel XE#2387] / [Intel XE#7429])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-9/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-ptl:          NOTRUN -> [SKIP][140] ([Intel XE#7413])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-7/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-psr-sprite-render:
    - shard-bmg:          NOTRUN -> [SKIP][141] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-1/igt@kms_psr@fbc-psr-sprite-render.html

  * igt@kms_psr@fbc-psr2-primary-page-flip@edp-1:
    - shard-ptl:          NOTRUN -> [SKIP][142] ([Intel XE#1406] / [Intel XE#5835]) +1 other test skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-7/igt@kms_psr@fbc-psr2-primary-page-flip@edp-1.html

  * igt@kms_psr@pr-sprite-plane-onoff:
    - shard-ptl:          NOTRUN -> [SKIP][143] ([Intel XE#1406]) +2 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-7/igt@kms_psr@pr-sprite-plane-onoff.html

  * igt@kms_psr@psr2-primary-render:
    - shard-bmg:          NOTRUN -> [SKIP][144] ([Intel XE#2234])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-8/igt@kms_psr@psr2-primary-render.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-ptl:          NOTRUN -> [SKIP][145] ([Intel XE#5813])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-ptl:          NOTRUN -> [SKIP][146] ([Intel XE#5821])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-2/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_setmode@basic-no-cpu-idle@pipe-a-edp-1:
    - shard-lnl:          [PASS][147] -> [FAIL][148] ([Intel XE#8618]) +2 other tests fail
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-lnl-3/igt@kms_setmode@basic-no-cpu-idle@pipe-a-edp-1.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-lnl-7/igt@kms_setmode@basic-no-cpu-idle@pipe-a-edp-1.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-ptl:          NOTRUN -> [SKIP][149] ([Intel XE#5910])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-7/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_sharpness_filter@filter-toggle:
    - shard-bmg:          NOTRUN -> [SKIP][150] ([Intel XE#6503]) +1 other test skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-8/igt@kms_sharpness_filter@filter-toggle.html

  * igt@kms_vrr@cmrr-desktop-mode:
    - shard-ptl:          NOTRUN -> [SKIP][151] ([Intel XE#9277])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-1/igt@kms_vrr@cmrr-desktop-mode.html

  * igt@kms_vrr@cmrr-desktop-mode@pipe-a-edp-1:
    - shard-ptl:          NOTRUN -> [SKIP][152] ([Intel XE#9277] / [Intel XE#9278])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-1/igt@kms_vrr@cmrr-desktop-mode@pipe-a-edp-1.html

  * igt@kms_vrr@flip-dpms@pipe-a-edp-1:
    - shard-ptl:          [PASS][153] -> [FAIL][154] ([Intel XE#4227] / [Intel XE#7397]) +1 other test fail
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-7/igt@kms_vrr@flip-dpms@pipe-a-edp-1.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-1/igt@kms_vrr@flip-dpms@pipe-a-edp-1.html

  * igt@kms_vrr@lobf-dc3co:
    - shard-ptl:          NOTRUN -> [SKIP][155] ([Intel XE#8397])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-7/igt@kms_vrr@lobf-dc3co.html

  * igt@sriov_basic@pf-unbind-with-vf-probed:
    - shard-ptl:          NOTRUN -> [ABORT][156] ([Intel XE#8868])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-2/igt@sriov_basic@pf-unbind-with-vf-probed.html

  * igt@xe_create@create-big-vram:
    - shard-ptl:          NOTRUN -> [SKIP][157] ([Intel XE#5853] / [Intel XE#7457])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-2/igt@xe_create@create-big-vram.html

  * igt@xe_evict@evict-beng-threads-large-multi-vm:
    - shard-ptl:          NOTRUN -> [SKIP][158] ([Intel XE#5764]) +7 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-2/igt@xe_evict@evict-beng-threads-large-multi-vm.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:
    - shard-ptl:          NOTRUN -> [SKIP][159] ([Intel XE#6144])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-1/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html

  * igt@xe_exec_balancer@twice-cm-virtual-userptr-rebind:
    - shard-ptl:          NOTRUN -> [SKIP][160] ([Intel XE#7482]) +7 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-1/igt@xe_exec_balancer@twice-cm-virtual-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][161] ([Intel XE#2322] / [Intel XE#7372]) +2 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-8/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue:
    - shard-ptl:          NOTRUN -> [SKIP][162] ([Intel XE#5575] / [Intel XE#7484]) +3 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-7/igt@xe_exec_basic@multigpu-once-bindexecqueue.html

  * igt@xe_exec_fault_mode@many-multi-queue-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][163] ([Intel XE#8374]) +5 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-9/igt@xe_exec_fault_mode@many-multi-queue-rebind.html

  * igt@xe_exec_fault_mode@once-multi-queue-invalid-fault:
    - shard-ptl:          NOTRUN -> [SKIP][164] ([Intel XE#8374]) +5 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-2/igt@xe_exec_fault_mode@once-multi-queue-invalid-fault.html

  * igt@xe_exec_mix_modes@exec-multi-queue-spinner-interrupted-lr:
    - shard-ptl:          NOTRUN -> [SKIP][165] ([Intel XE#9003])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-1/igt@xe_exec_mix_modes@exec-multi-queue-spinner-interrupted-lr.html

  * igt@xe_exec_multi_queue@max-queues-preempt-mode-priority:
    - shard-ptl:          NOTRUN -> [SKIP][166] ([Intel XE#8364]) +15 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-2/igt@xe_exec_multi_queue@max-queues-preempt-mode-priority.html

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority:
    - shard-bmg:          NOTRUN -> [SKIP][167] ([Intel XE#8364]) +14 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-1/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority.html

  * igt@xe_exec_reset@gt-stress-reset-mixed-engine-usage:
    - shard-bmg:          [PASS][168] -> [DMESG-WARN][169] ([Intel XE#8652])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-bmg-10/igt@xe_exec_reset@gt-stress-reset-mixed-engine-usage.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-5/igt@xe_exec_reset@gt-stress-reset-mixed-engine-usage.html
    - shard-lnl:          [PASS][170] -> [DMESG-WARN][171] ([Intel XE#8652])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-lnl-8/igt@xe_exec_reset@gt-stress-reset-mixed-engine-usage.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-lnl-4/igt@xe_exec_reset@gt-stress-reset-mixed-engine-usage.html

  * igt@xe_exec_reset@multi-queue-cat-error-on-secondary:
    - shard-bmg:          NOTRUN -> [SKIP][172] ([Intel XE#8369])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-1/igt@xe_exec_reset@multi-queue-cat-error-on-secondary.html

  * igt@xe_exec_reset@multi-queue-gt-reset:
    - shard-ptl:          NOTRUN -> [SKIP][173] ([Intel XE#8369])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-7/igt@xe_exec_reset@multi-queue-gt-reset.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-multi-vma:
    - shard-ptl:          NOTRUN -> [SKIP][174] ([Intel XE#6196])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-2/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-multi-vma.html

  * igt@xe_exec_threads@threads-hang-userptr-invalidate-race:
    - shard-bmg:          [PASS][175] -> [FAIL][176] ([Intel XE#9096])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-bmg-9/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-7/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][177] ([Intel XE#8378]) +5 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-1/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr.html

  * igt@xe_exec_threads@threads-multi-queue-shared-vm-basic:
    - shard-ptl:          NOTRUN -> [SKIP][178] ([Intel XE#8378]) +5 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-2/igt@xe_exec_threads@threads-multi-queue-shared-vm-basic.html

  * igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_create:
    - shard-bmg:          [PASS][179] -> [ABORT][180] ([Intel XE#9463])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-bmg-5/igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_create.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-1/igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_create.html

  * igt@xe_gpgpu_fill@offset-4x4:
    - shard-bmg:          NOTRUN -> [SKIP][181] ([Intel XE#7954])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-1/igt@xe_gpgpu_fill@offset-4x4.html

  * igt@xe_mmap@pci-membarrier-bad-object:
    - shard-ptl:          NOTRUN -> [SKIP][182] ([Intel XE#5100] / [Intel XE#7408])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-1/igt@xe_mmap@pci-membarrier-bad-object.html

  * igt@xe_mmap@small-bar:
    - shard-ptl:          NOTRUN -> [SKIP][183] ([Intel XE#5867])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-2/igt@xe_mmap@small-bar.html

  * igt@xe_multigpu_svm@mgpu-latency-basic:
    - shard-bmg:          NOTRUN -> [SKIP][184] ([Intel XE#6964])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-1/igt@xe_multigpu_svm@mgpu-latency-basic.html

  * igt@xe_page_reclaim@basic-mixed:
    - shard-bmg:          NOTRUN -> [SKIP][185] ([Intel XE#7793])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-1/igt@xe_page_reclaim@basic-mixed.html

  * igt@xe_page_reclaim@many-vma-same-bo:
    - shard-ptl:          NOTRUN -> [SKIP][186] ([Intel XE#7793]) +1 other test skip
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-1/igt@xe_page_reclaim@many-vma-same-bo.html

  * igt@xe_pat@pat-index-xelp:
    - shard-bmg:          NOTRUN -> [SKIP][187] ([Intel XE#2245] / [Intel XE#7590])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-8/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@xa-app-transient-media-off:
    - shard-bmg:          NOTRUN -> [SKIP][188] ([Intel XE#7590])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-9/igt@xe_pat@xa-app-transient-media-off.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-bmg:          NOTRUN -> [SKIP][189] ([Intel XE#2284] / [Intel XE#7370])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-8/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@d3hot-mmap-vram:
    - shard-ptl:          NOTRUN -> [SKIP][190] ([Intel XE#5834])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-1/igt@xe_pm@d3hot-mmap-vram.html

  * igt@xe_pm@s3-basic:
    - shard-ptl:          NOTRUN -> [SKIP][191] ([Intel XE#6867])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-2/igt@xe_pm@s3-basic.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-lnl:          [PASS][192] -> [ABORT][193] ([Intel XE#9362]) +2 other tests abort
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-lnl-1/igt@xe_pm@s4-vm-bind-unbind-all.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-lnl-5/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-ptl:          NOTRUN -> [SKIP][194] ([Intel XE#5611] / [Intel XE#7456])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-1/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pxp@pxp-termination-key-update-post-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][195] ([Intel XE#4733] / [Intel XE#7417]) +1 other test skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-1/igt@xe_pxp@pxp-termination-key-update-post-suspend.html

  * igt@xe_query@multigpu-query-pxp-status:
    - shard-bmg:          NOTRUN -> [SKIP][196] ([Intel XE#944])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-8/igt@xe_query@multigpu-query-pxp-status.html

  * igt@xe_query@multigpu-query-topology:
    - shard-ptl:          NOTRUN -> [SKIP][197] ([Intel XE#6019]) +1 other test skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-2/igt@xe_query@multigpu-query-topology.html

  * igt@xe_sriov_vram@vf-access-provisioned:
    - shard-ptl:          NOTRUN -> [SKIP][198] ([Intel XE#6376] / [Intel XE#7422])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-2/igt@xe_sriov_vram@vf-access-provisioned.html

  * igt@xe_vm@overcommit-fault-vram-lr-no-overcommit:
    - shard-ptl:          NOTRUN -> [SKIP][199] ([Intel XE#9597])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-2/igt@xe_vm@overcommit-fault-vram-lr-no-overcommit.html

  
#### Possible fixes ####

  * igt@kms_bw@linear-tiling-1-displays-target-2160x1440p:
    - shard-bmg:          [SKIP][200] ([Intel XE#367]) -> [PASS][201]
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-bmg-9/igt@kms_bw@linear-tiling-1-displays-target-2160x1440p.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-2160x1440p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [INCOMPLETE][202] ([Intel XE#7084] / [Intel XE#8150]) -> [PASS][203] +1 other test pass
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-edp-1:
    - shard-ptl:          [DMESG-WARN][204] ([Intel XE#9412]) -> [PASS][205]
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-8/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-edp-1.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-5/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-edp-1.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-bmg:          [ABORT][206] ([Intel XE#9362]) -> [PASS][207] +1 other test pass
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-bmg-4/igt@kms_flip@2x-flip-vs-suspend.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-9/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [FAIL][208] ([Intel XE#301]) -> [PASS][209]
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][210] ([Intel XE#6321] / [Intel XE#8355]) -> [PASS][211]
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-bmg-8/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-8/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][212], [PASS][213], [PASS][214], [PASS][215], [PASS][216], [PASS][217], [PASS][218], [PASS][219], [PASS][220], [SKIP][221], [PASS][222], [PASS][223], [PASS][224], [PASS][225], [PASS][226], [PASS][227], [PASS][228], [PASS][229], [PASS][230], [PASS][231], [PASS][232], [PASS][233], [PASS][234], [PASS][235], [PASS][236], [PASS][237]) ([Intel XE#378] / [Intel XE#7405]) -> ([PASS][238], [PASS][239], [PASS][240], [PASS][241], [PASS][242], [PASS][243], [PASS][244], [PASS][245], [PASS][246], [PASS][247], [PASS][248], [PASS][249], [PASS][250], [PASS][251], [PASS][252], [PASS][253], [PASS][254], [PASS][255], [PASS][256], [PASS][257], [PASS][258], [PASS][259], [PASS][260], [PASS][261], [PASS][262])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-lnl-8/igt@xe_module_load@load.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-lnl-1/igt@xe_module_load@load.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-lnl-7/igt@xe_module_load@load.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-lnl-7/igt@xe_module_load@load.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-lnl-1/igt@xe_module_load@load.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-lnl-7/igt@xe_module_load@load.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-lnl-2/igt@xe_module_load@load.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-lnl-2/igt@xe_module_load@load.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-lnl-4/igt@xe_module_load@load.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-lnl-1/igt@xe_module_load@load.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-lnl-6/igt@xe_module_load@load.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-lnl-6/igt@xe_module_load@load.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-lnl-6/igt@xe_module_load@load.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-lnl-5/igt@xe_module_load@load.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-lnl-5/igt@xe_module_load@load.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-lnl-4/igt@xe_module_load@load.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-lnl-5/igt@xe_module_load@load.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-lnl-3/igt@xe_module_load@load.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-lnl-3/igt@xe_module_load@load.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-lnl-1/igt@xe_module_load@load.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-lnl-3/igt@xe_module_load@load.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-lnl-4/igt@xe_module_load@load.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-lnl-2/igt@xe_module_load@load.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-lnl-2/igt@xe_module_load@load.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-lnl-8/igt@xe_module_load@load.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-lnl-8/igt@xe_module_load@load.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-lnl-5/igt@xe_module_load@load.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-lnl-3/igt@xe_module_load@load.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-lnl-3/igt@xe_module_load@load.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-lnl-2/igt@xe_module_load@load.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-lnl-2/igt@xe_module_load@load.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-lnl-8/igt@xe_module_load@load.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-lnl-8/igt@xe_module_load@load.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-lnl-3/igt@xe_module_load@load.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-lnl-4/igt@xe_module_load@load.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-lnl-7/igt@xe_module_load@load.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-lnl-4/igt@xe_module_load@load.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-lnl-4/igt@xe_module_load@load.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-lnl-5/igt@xe_module_load@load.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-lnl-5/igt@xe_module_load@load.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-lnl-6/igt@xe_module_load@load.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-lnl-6/igt@xe_module_load@load.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-lnl-6/igt@xe_module_load@load.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-lnl-1/igt@xe_module_load@load.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-lnl-8/igt@xe_module_load@load.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-lnl-7/igt@xe_module_load@load.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-lnl-5/igt@xe_module_load@load.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-lnl-1/igt@xe_module_load@load.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-lnl-1/igt@xe_module_load@load.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-lnl-7/igt@xe_module_load@load.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-lnl-2/igt@xe_module_load@load.html
    - shard-ptl:          ([PASS][263], [PASS][264], [PASS][265], [PASS][266], [PASS][267], [PASS][268], [PASS][269], [SKIP][270], [PASS][271], [PASS][272], [PASS][273], [PASS][274], [PASS][275], [PASS][276], [PASS][277], [PASS][278], [PASS][279], [PASS][280], [PASS][281], [PASS][282], [PASS][283], [PASS][284], [PASS][285], [PASS][286], [PASS][287], [PASS][288]) ([Intel XE#9286]) -> ([PASS][289], [PASS][290], [PASS][291], [PASS][292], [PASS][293], [PASS][294], [PASS][295], [PASS][296], [PASS][297], [PASS][298], [PASS][299], [PASS][300], [PASS][301], [PASS][302], [PASS][303], [PASS][304], [PASS][305], [PASS][306], [PASS][307], [PASS][308], [PASS][309], [PASS][310], [PASS][311], [PASS][312], [PASS][313])
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-6/igt@xe_module_load@load.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-2/igt@xe_module_load@load.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-2/igt@xe_module_load@load.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-2/igt@xe_module_load@load.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-7/igt@xe_module_load@load.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-7/igt@xe_module_load@load.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-6/igt@xe_module_load@load.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-3/igt@xe_module_load@load.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-3/igt@xe_module_load@load.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-7/igt@xe_module_load@load.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-7/igt@xe_module_load@load.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-5/igt@xe_module_load@load.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-5/igt@xe_module_load@load.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-5/igt@xe_module_load@load.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-6/igt@xe_module_load@load.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-8/igt@xe_module_load@load.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-3/igt@xe_module_load@load.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-4/igt@xe_module_load@load.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-4/igt@xe_module_load@load.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-1/igt@xe_module_load@load.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-6/igt@xe_module_load@load.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-4/igt@xe_module_load@load.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-1/igt@xe_module_load@load.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-1/igt@xe_module_load@load.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-8/igt@xe_module_load@load.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-8/igt@xe_module_load@load.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-5/igt@xe_module_load@load.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-5/igt@xe_module_load@load.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-8/igt@xe_module_load@load.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-8/igt@xe_module_load@load.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-1/igt@xe_module_load@load.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-1/igt@xe_module_load@load.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-4/igt@xe_module_load@load.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-7/igt@xe_module_load@load.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-7/igt@xe_module_load@load.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-2/igt@xe_module_load@load.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-1/igt@xe_module_load@load.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-3/igt@xe_module_load@load.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-3/igt@xe_module_load@load.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-7/igt@xe_module_load@load.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-6/igt@xe_module_load@load.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-4/igt@xe_module_load@load.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-6/igt@xe_module_load@load.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-4/igt@xe_module_load@load.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-2/igt@xe_module_load@load.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-8/igt@xe_module_load@load.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-6/igt@xe_module_load@load.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-2/igt@xe_module_load@load.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-1/igt@xe_module_load@load.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-5/igt@xe_module_load@load.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-3/igt@xe_module_load@load.html

  * igt@xe_module_load@reload:
    - shard-bmg:          [ABORT][314] ([Intel XE#9463]) -> [PASS][315]
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-bmg-1/igt@xe_module_load@reload.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-8/igt@xe_module_load@reload.html

  * igt@xe_pmu@engine-activity-accuracy-90:
    - shard-lnl:          [FAIL][316] ([Intel XE#9461]) -> [PASS][317] +1 other test pass
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-lnl-3/igt@xe_pmu@engine-activity-accuracy-90.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-lnl-7/igt@xe_pmu@engine-activity-accuracy-90.html

  * igt@xe_pmu@engine-activity-suspend:
    - shard-ptl:          [ABORT][318] ([Intel XE#9362]) -> [PASS][319] +4 other tests pass
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-4/igt@xe_pmu@engine-activity-suspend.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-2/igt@xe_pmu@engine-activity-suspend.html

  
#### Warnings ####

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-ptl:          [ABORT][320] ([Intel XE#7084] / [Intel XE#9378]) -> [ABORT][321] ([Intel XE#7084] / [Intel XE#9364] / [Intel XE#9378])
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-8/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-5/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-ptl:          [ABORT][322] ([Intel XE#9375]) -> [ABORT][323] ([Intel XE#9362])
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-8/igt@kms_cursor_crc@cursor-suspend.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-7/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-lnl:          [FAIL][324] ([Intel XE#301]) -> [FAIL][325] ([Intel XE#301] / [Intel XE#3149])
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][326] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][327] ([Intel XE#3544])
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][328] ([Intel XE#2426] / [Intel XE#5848]) -> [FAIL][329] ([Intel XE#1729] / [Intel XE#7424])
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][330] ([Intel XE#2509] / [Intel XE#7437]) -> [SKIP][331] ([Intel XE#2426] / [Intel XE#5848])
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
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
  [Intel XE#2372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5100]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5611]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5611
  [Intel XE#5764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
  [Intel XE#5800]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800
  [Intel XE#5808]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808
  [Intel XE#5812]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#5821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5821
  [Intel XE#5822]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822
  [Intel XE#5823]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5823
  [Intel XE#5834]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5834
  [Intel XE#5835]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5835
  [Intel XE#5846]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5846
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5851]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5851
  [Intel XE#5853]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5853
  [Intel XE#5858]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858
  [Intel XE#5865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5865
  [Intel XE#5867]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5867
  [Intel XE#5879]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5879
  [Intel XE#5900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5900
  [Intel XE#5901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5901
  [Intel XE#5907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907
  [Intel XE#5910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5910
  [Intel XE#5962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962
  [Intel XE#6019]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6019
  [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
  [Intel XE#6144]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6144
  [Intel XE#6196]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6196
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6507]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507
  [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
  [Intel XE#6814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6814
  [Intel XE#6867]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6867
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6900
  [Intel XE#6912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912
  [Intel XE#6918]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6918
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
  [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
  [Intel XE#7225]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7225
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7359]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7359
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
  [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
  [Intel XE#7408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7408
  [Intel XE#7413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7413
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7422
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7428
  [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439
  [Intel XE#7448]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7448
  [Intel XE#7456]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7456
  [Intel XE#7457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7457
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7484]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7591]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7591
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7809]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7809
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7954]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7954
  [Intel XE#8098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8098
  [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8391
  [Intel XE#8395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395
  [Intel XE#8396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396
  [Intel XE#8397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8397
  [Intel XE#8618]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8618
  [Intel XE#8652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8652
  [Intel XE#8680]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8680
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#8868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8868
  [Intel XE#9003]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9003
  [Intel XE#9096]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096
  [Intel XE#9277]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9277
  [Intel XE#9278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9278
  [Intel XE#9286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9286
  [Intel XE#9312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9312
  [Intel XE#9362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362
  [Intel XE#9364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9364
  [Intel XE#9375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9375
  [Intel XE#9378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9378
  [Intel XE#9389]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9389
  [Intel XE#9412]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9412
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#9461]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9461
  [Intel XE#9463]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463
  [Intel XE#9532]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9532
  [Intel XE#9533]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9533
  [Intel XE#9537]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9537
  [Intel XE#9561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9561
  [Intel XE#9597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9597


Build changes
-------------

  * Linux: xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89 -> xe-pw-175996v4

  IGT_9150: 18811c476bfde62ffbb4c0af55cd6f57e36e0dca @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89: 173c9ebb628f22cdfb18e080e0ef46b728649f89
  xe-pw-175996v4: 175996v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/index.html

--===============5761315084106817174==
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
<tr><td><b>Series:</b></td><td>FD close cleanup for XE (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/175996/">https://patchwork.freedesktop.org/series/175996/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-175996v4/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-175996v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5964-173c9ebb628f22cdfb18e080e0ef46b72=
8649f89_FULL -&gt; xe-pw-175996v4_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-175996v4_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-175996v4_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1759=
96v4_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@core_hotunplug@hotunplug-rescan-with-load:<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-bmg-5/igt@core_hot=
unplug@hotunplug-rescan-with-load.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-6/igt@core_hotunp=
lug@hotunplug-rescan-with-load.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-bmg-5/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-bmg-7/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-bmg-7/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-bmg-1=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-b=
mg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/sha=
rd-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89=
/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b72864=
9f89/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b7=
28649f89/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0e=
f46b728649f89/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e=
080e0ef46b728649f89/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdf=
b18e080e0ef46b728649f89/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f2=
2cdfb18e080e0ef46b728649f89/shard-bmg-8/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb6=
28f22cdfb18e080e0ef46b728649f89/shard-bmg-3/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9=
ebb628f22cdfb18e080e0ef46b728649f89/shard-bmg-6/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-1=
73c9ebb628f22cdfb18e080e0ef46b728649f89/shard-bmg-6/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-59=
64-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-bmg-3/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-bmg-10/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-bmg-5/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-bmg-5/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-bmg-2/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-bmg-=
2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-=
bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/sh=
ard-bmg-9/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f8=
9/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b7286=
49f89/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405">Intel XE=
#7405</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-175996v4/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-5/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-175996v4/shard-bmg-5/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shar=
d-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-6/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-175996v4/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-1/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-175996v4/shard-bmg-10/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/sh=
ard-bmg-6/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-3/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-175996v4/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-7=
/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-2/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-17599=
6v4/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-4/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-175996v4/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-4=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-8/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-17599=
6v4/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-9/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-175996v4/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-7=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-1/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-17599=
6v4/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-9/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-175996v4/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#=
2457</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7=
405">Intel XE#7405</a>)</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-5964-173c9ebb628f22cdfb18e080e=
0ef46b728649f89_FULL and xe-pw-175996v4_FULL:</p>
<h3>New IGT tests (7)</h3>
<ul>
<li>
<p>igt@kms_invalid_mode@bad-vtotal@pipe-d-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@int-max-clock@pipe-d-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-vdisplay@pipe-d-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@queue-idle@pipe-d-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@accuracy-idle@pipe-d-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-busy@pipe-d-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked@pipe-d-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.39] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-175996v4_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-ptl-2/igt@intel_hwmon@hwmon-write.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7=
225">Intel XE#7225</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-bmg-8/igt@kms_atom=
ic_transition@plane-toggle-modeset-transition.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-1/ig=
t@kms_atomic_transition@plane-toggle-modeset-transition.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8098">Intel XE#=
8098</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9=
561">Intel XE#9561</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-ptl-1/igt@kms_big_fb@4-tiled-max-hw-str=
ide-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/5901">Intel XE#5901</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-bmg-8/igt@kms_big_fb@linear-max-hw-stri=
de-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7059">Intel XE#7059</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-bmg-8/igt@kms_big_fb@x-tiled-64bpp-rota=
te-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2327">Intel XE#2327</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-bmg-8/igt@kms_big_fb@y-tiled-64bpp-rota=
te-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-ptl-1/igt@kms_big_fb@yf-tiled-64bpp-rot=
ate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/5808">Intel XE#5808</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-ptl-2/igt@kms_big_fb@yf-tiled-addfb-siz=
e-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/5851">Intel XE#5851</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-target-2560x1440p:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-ptl-7/igt@kms_bw@connected-linear-tilin=
g-2-displays-target-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-target-1920x1080p:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-ptl-7/igt@kms_bw@linear-tiling-3-displa=
ys-target-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-ptl-7/igt@kms_ccs@bad-rotation-90-y-til=
ed-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/5822">Intel XE#5822</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-bmg-4/igt@kms_ccs@crc-primary-basic-4-t=
iled-lnl-ccs@pipe-b-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +3 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-bmg-1/igt@kms_ccs@crc-primary-basic-4-t=
iled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2887">Intel XE#2887</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-ptl-1/igt@kms_ccs@crc-primary-suspend-4=
-tiled-bmg-ccs@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/5823">Intel XE#5823</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/6918">Intel XE#6918</a>) +9 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-c-edp-1:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-8/igt@kms_ccs@=
crc-primary-suspend-4-tiled-lnl-ccs@pipe-c-edp-1.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-5/=
igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-c-edp-1.html">DMESG-WA=
RN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9389=
">Intel XE#9389</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-bmg-8/igt@kms_chamelium_color@ctm-blue-=
to-red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2325">Intel XE#2325</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d:=
</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-ptl-2/igt@kms_chamelium_color_pipeline@=
plane-fixed-matrix-yuv-rgb-bt601-lut1d.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/8391">Intel XE#8391</a>) +1 othe=
r test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-ptl-7/igt@kms_chamelium_edid@dp-edid-ch=
ange-during-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-bmg-8/igt@kms_chamelium_edid@dp-edid-re=
solution-list.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_sharpness_filter@filter-basic:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-ptl-7/igt@kms_chamelium_sharpness_filte=
r@filter-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/6507">Intel XE#6507</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-d-plane-4:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-bmg-8/igt@kms_color_pipeline@plane-lut1=
d-ctm3x4-lut1d@pipe-d-plane-4.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a>) +7 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-ptl-1/igt@kms_content_protection@legacy=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/7642">Intel XE#7642</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-bmg-5/igt@kms_content_protection@lic-ty=
pe-0-hdcp14@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374=
</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-bmg-7/igt@kms_content_protection@lic-ty=
pe-0@pipe-a-dp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +3 other tests =
fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-bmg-7/igt@kms_content_protection@uevent=
@pipe-a-dp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/6707">Intel XE#6707</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7439">Intel XE#7439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-ptl-1/igt@kms_cursor_crc@cursor-offscre=
en-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/5846">Intel XE#5846</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-bmg-8/igt@kms_cursor_crc@cursor-onscree=
n-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2320">Intel XE#2320</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-256x85:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-ptl-1/igt@kms_cursor_crc@cursor-rapid-m=
ovement-256x85.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/5900">Intel XE#5900</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-bmg-9/igt@kms_cursor_crc@cursor-sliding=
-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2321">Intel XE#2321</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-8/igt@kms_curs=
or_crc@cursor-suspend@pipe-a-edp-1.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-7/igt@kms_cursor=
_crc@cursor-suspend@pipe-a-edp-1.html">ABORT</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) +6 other tes=
ts abort</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-ptl-7/igt@kms_cursor_legacy@2x-flip-vs-=
cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/5962">Intel XE#5962</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-ptl-1/igt@kms_cursor_legacy@cursorb-vs-=
flipa-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/5962">Intel XE#5962</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-bmg-4/igt@kms_curs=
or_legacy@flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-4/igt@kms_cursor_le=
gacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7809">Intel XE#7809</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-ptl-2/igt@kms_cursor_legacy@short-busy-=
flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035">Intel XE#6035=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-bmg-1/igt@kms_dirtyfb@psr-dirtyfb-ioctl=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst-direct-train:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-ptl-1/igt@kms_dp_link_training@non-uhbr=
-mst-direct-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/9532">Intel XE#9532</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-ptl-7/igt@kms_dp_link_training@uhbr-mst=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/9533">Intel XE#9533</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst-tbtalt-train:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-ptl-1/igt@kms_dp_link_training@uhbr-sst=
-tbtalt-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/9537">Intel XE#9537</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-ultrajoiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-bmg-8/igt@kms_dsc@dsc-with-bpc-ultrajoi=
ner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-ptl-2/igt@kms_dsc@dsc-with-formats.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
5907">Intel XE#5907</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-bmg-8/igt@kms_fbcon_fbt@psr-suspend.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/8680">Intel XE#8680</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-bmg-8/igt@kms_feature_discovery@chameli=
um.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2372">Intel XE#2372</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7359">Intel XE#7359</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-bmg-1/igt@kms_feature_discovery@display=
-3x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2373">Intel XE#2373</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7448">Intel XE#7448</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-ptl-1/igt@kms_flip@2x-single-buffer-fli=
p-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +2 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-lnl-1/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-lnl-7/ig=
t@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#30=
1</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-lnl-3/igt@kms_flip=
@flip-vs-expired-vblank@c-edp1.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-lnl-7/igt@kms_flip@flip-=
vs-expired-vblank@c-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) +2 other =
tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race@c-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-bmg-10/igt@kms_fli=
p@modeset-vs-vblank-race@c-hdmi-a3.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-5/igt@kms_flip@m=
odeset-vs-vblank-race@c-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>) +1 other test =
fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE=
#7351</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflec=
t-x:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-ptl-2/igt@kms_flip_scaled_crc@flip-32bp=
p-yuv-linear-to-32bpp-yuv-linear-reflect-x.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7179">Intel XE#7179</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-ptl-1/igt@kms_flip_scaled_crc@flip-64bp=
p-xtile-to-16bpp-xtile-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a>) +2 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-ptl-2/igt@kms_frontbuffer_tracking@drrs=
-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/5800">Intel XE#5800</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +8 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-render:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-ptl-2/igt@kms_frontbuffer_tracking@drrs=
hdr-abgr161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +3 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-slowdraw:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs=
hdr-slowdraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2311">Intel XE#2311</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-=
1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +6 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-ptl-2/igt@kms_frontbuffer_tracking@fbc-=
2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/5812">Intel XE#5812</a>) +38 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-mmap-wc=
:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-ptl-7/igt@kms_frontbuffer_tracking@fbcd=
rrs-1p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +11 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-ptl-1/igt@kms_frontbuffer_tracking@fbcd=
rrs-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcd=
rrs-argb161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +2 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-ptl-2/igt@kms_frontbuffer_tracking@fbcd=
rrs-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/5865">Intel XE#5865</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcd=
rrshdr-argb161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +3 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-w=
c:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-ptl-1/igt@kms_frontbuffer_tracking@fbcp=
srhdr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +11 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-bmg-8/igt@kms_frontbuffer_tracking@psrh=
dr-2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +27 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@audio-bw-hblank80:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-ptl-2/igt@kms_hdmi_audio_bw@audio-bw-hb=
lank80.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/9312">Intel XE#9312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-ptl-1/igt@kms_joiner@invalid-modeset-fo=
rce-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/6900">Intel XE#6900</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-bmg-1/igt@kms_multipipe_modeset@basic-m=
ax-pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7591">Intel XE#7591</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-xtiled:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-ptl-2/igt@kms_pipe_stress@stress-xrgb88=
88-xtiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/6912">Intel XE#6912</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-ptl-1/igt@kms_plane@pixel-format-4-tile=
d-dg2-rc-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-bmg-8/igt@kms_plane@pixel-format-yf-til=
ed-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +3 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-ptl-1/igt@kms_plane_scaling@2x-scaler-m=
ulti-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/5879">Intel XE#5879</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-ptl-7/igt@kms_plane_scaling@planes-down=
scale-factor-0-75@pipe-b.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +9 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-bmg-8/igt@kms_pm_backlight@fade-with-dp=
ms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/7376">Intel XE#7376</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7760">Intel XE#7760</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-after-dc6@pr-xrgb8888:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-ptl-2/igt@kms_pm_dc@dc3co-after-dc6@pr-=
xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/8395">Intel XE#8395</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-after-dc6@psr2-yuv420:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-ptl-2/igt@kms_pm_dc@dc3co-after-dc6@psr=
2-yuv420.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/8396">Intel XE#8396</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@package-g7:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-bmg-8/igt@kms_pm_rpm@package-g7.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/681=
4">Intel XE#6814</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/7428">Intel XE#7428</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pi=
pe-a-edp-1:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-ptl-1/igt@kms_psr2_sf@fbc-psr2-cursor-p=
lane-move-continuous-exceed-fully-sf@pipe-a-edp-1.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858">Intel XE#5858=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-b-edp-1:<=
/p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-ptl-2/igt@kms_psr2_sf@fbc-psr2-primary-=
plane-update-sf-dmg-area@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/5858">Intel XE#5858</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304=
</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-bmg-9/igt@kms_psr2_sf@pr-cursor-plane-m=
ove-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-bmg-9/igt@kms_psr2_su@frontbuffer-xrgb8=
888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2387">Intel XE#2387</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7429">Intel XE#7429</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-ptl-7/igt@kms_psr2_su@page_flip-nv12.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/7413">Intel XE#7413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-bmg-1/igt@kms_psr@fbc-psr-sprite-render=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-page-flip@edp-1:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-ptl-7/igt@kms_psr@fbc-psr2-primary-page=
-flip@edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/5835">Intel XE#5835</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-onoff:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-ptl-7/igt@kms_psr@pr-sprite-plane-onoff=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1406">Intel XE#1406</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-bmg-8/igt@kms_psr@psr2-primary-render.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2234">Intel XE#2234</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-ptl-2/igt@kms_rotation_crc@primary-yf-t=
iled-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/5813">Intel XE#5813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-ptl-2/igt@kms_rotation_crc@sprite-rotat=
ion-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/5821">Intel XE#5821</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-no-cpu-idle@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-lnl-3/igt@kms_setm=
ode@basic-no-cpu-idle@pipe-a-edp-1.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-lnl-7/igt@kms_setmod=
e@basic-no-cpu-idle@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/8618">Intel XE#8618</a>) +2 other test=
s fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-ptl-7/igt@kms_setmode@invalid-clone-exc=
lusive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/5910">Intel XE#5910</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-toggle:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-bmg-8/igt@kms_sharpness_filter@filter-t=
oggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/6503">Intel XE#6503</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr-desktop-mode:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-ptl-1/igt@kms_vrr@cmrr-desktop-mode.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/9277">Intel XE#9277</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr-desktop-mode@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-ptl-1/igt@kms_vrr@cmrr-desktop-mode@pip=
e-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/9277">Intel XE#9277</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/9278">Intel XE#9278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-7/igt@kms_vrr@=
flip-dpms@pipe-a-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-1/igt@kms_vrr@flip-dpms@pipe=
-a-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4227">Intel XE#4227</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf-dc3co:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-ptl-7/igt@kms_vrr@lobf-dc3co.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8397">=
Intel XE#8397</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@pf-unbind-with-vf-probed:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-ptl-2/igt@sriov_basic@pf-unbind-with-vf=
-probed.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/8868">Intel XE#8868</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@create-big-vram:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-ptl-2/igt@xe_create@create-big-vram.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/5853">Intel XE#5853</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7457">Intel XE#7457</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large-multi-vm:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-ptl-2/igt@xe_evict@evict-beng-threads-l=
arge-multi-vm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/5764">Intel XE#5764</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-ptl-1/igt@xe_evict_ccs@evict-overcommit=
-standalone-instantfree-reopen.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/6144">Intel XE#6144</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-cm-virtual-userptr-rebind:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-ptl-1/igt@xe_exec_balancer@twice-cm-vir=
tual-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-bmg-8/igt@xe_exec_basic@multigpu-no-exe=
c-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +2 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-ptl-7/igt@xe_exec_basic@multigpu-once-b=
indexecqueue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/5575">Intel XE#5575</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7484">Intel XE#7484</a>) +3 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-bmg-9/igt@xe_exec_fault_mode@many-multi=
-queue-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/8374">Intel XE#8374</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-invalid-fault:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-ptl-2/igt@xe_exec_fault_mode@once-multi=
-queue-invalid-fault.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-multi-queue-spinner-interrupted-lr:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-ptl-1/igt@xe_exec_mix_modes@exec-multi-=
queue-spinner-interrupted-lr.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/9003">Intel XE#9003</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@max-queues-preempt-mode-priority:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-ptl-2/igt@xe_exec_multi_queue@max-queue=
s-preempt-mode-priority.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +15 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-bmg-1/igt@xe_exec_multi_queue@two-queue=
s-preempt-mode-fault-priority.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +14 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-stress-reset-mixed-engine-usage:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-bmg-10/igt@xe_exec=
_reset@gt-stress-reset-mixed-engine-usage.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-5/igt@xe_=
exec_reset@gt-stress-reset-mixed-engine-usage.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8652">Intel XE#8652=
</a>)</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-lnl-8/igt@xe_exec_=
reset@gt-stress-reset-mixed-engine-usage.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-lnl-4/igt@xe_e=
xec_reset@gt-stress-reset-mixed-engine-usage.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8652">Intel XE#8652=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-cat-error-on-secondary:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-bmg-1/igt@xe_exec_reset@multi-queue-cat=
-error-on-secondary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/8369">Intel XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-gt-reset:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-ptl-7/igt@xe_exec_reset@multi-queue-gt-=
reset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/8369">Intel XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-multi-vma=
:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-ptl-2/igt@xe_exec_system_allocator@pat-=
index-madvise-pat-idx-uc-comp-multi-vma.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/6196">Intel XE#6196</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-bmg-9/igt@xe_exec_=
threads@threads-hang-userptr-invalidate-race.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-7/ig=
t@xe_exec_threads@threads-hang-userptr-invalidate-race.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096">Intel XE#9=
096</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-bmg-1/igt@xe_exec_threads@threads-multi=
-queue-mixed-fd-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +5 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-shared-vm-basic:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-ptl-2/igt@xe_exec_threads@threads-multi=
-queue-shared-vm-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_create:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-bmg-5/igt@xe_fault=
_injection@exec-queue-create-fail-xe_exec_queue_create.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-=
bmg-1/igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_create.ht=
ml">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/9463">Intel XE#9463</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_gpgpu_fill@offset-4x4:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-bmg-1/igt@xe_gpgpu_fill@offset-4x4.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7954">Intel XE#7954</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier-bad-object:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-ptl-1/igt@xe_mmap@pci-membarrier-bad-ob=
ject.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/5100">Intel XE#5100</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7408">Intel XE#7408</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-ptl-2/igt@xe_mmap@small-bar.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5867">I=
ntel XE#5867</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-latency-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-bmg-1/igt@xe_multigpu_svm@mgpu-latency-=
basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@basic-mixed:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-bmg-1/igt@xe_page_reclaim@basic-mixed.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@many-vma-same-bo:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-ptl-1/igt@xe_page_reclaim@many-vma-same=
-bo.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/7793">Intel XE#7793</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-bmg-8/igt@xe_pat@pat-index-xelp.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/224=
5">Intel XE#2245</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@xa-app-transient-media-off:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-bmg-9/igt@xe_pat@xa-app-transient-media=
-off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-bmg-8/igt@xe_pm@d3cold-multiple-execs.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-vram:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-ptl-1/igt@xe_pm@d3hot-mmap-vram.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/583=
4">Intel XE#5834</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-ptl-2/igt@xe_pm@s3-basic.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6867">Inte=
l XE#6867</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-lnl-1/igt@xe_pm@s4=
-vm-bind-unbind-all.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-175996v4/shard-lnl-5/igt@xe_pm@s4-vm-bind-unbind-a=
ll.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/9362">Intel XE#9362</a>) +2 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-ptl-1/igt@xe_pm@vram-d3cold-threshold.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/5611">Intel XE#5611</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/7456">Intel XE#7456</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-bmg-1/igt@xe_pxp@pxp-termination-key-up=
date-post-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-pxp-status:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-bmg-8/igt@xe_query@multigpu-query-pxp-s=
tatus.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-ptl-2/igt@xe_query@multigpu-query-topol=
ogy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/6019">Intel XE#6019</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_vram@vf-access-provisioned:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-ptl-2/igt@xe_sriov_vram@vf-access-provi=
sioned.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/6376">Intel XE#6376</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7422">Intel XE#7422</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@overcommit-fault-vram-lr-no-overcommit:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175996v4/shard-ptl-2/igt@xe_vm@overcommit-fault-vram-l=
r-no-overcommit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/9597">Intel XE#9597</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-bmg-9/igt@kms_bw@l=
inear-tiling-1-displays-target-2160x1440p.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-b=
mg-7/igt@kms_bw@linear-tiling-1-displays-target-2160x1440p.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-bmg-10/igt@kms_ccs=
@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE=
#8150</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-175996v4/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html=
">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-edp-1:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-8/igt@kms_ccs@=
crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-edp-1.html">DMESG-WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9412">Intel XE#9=
412</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
75996v4/shard-ptl-5/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-=
edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-bmg-4/igt@kms_flip=
@2x-flip-vs-suspend.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-9/igt@kms_flip@2=
x-flip-vs-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-lnl-3/igt@kms_flip=
@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-lnl-7/igt@km=
s_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-bmg-8/igt@xe_evict=
@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355">Intel XE=
#8355</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-175996v4/shard-bmg-8/igt@xe_evict@evict-beng-mixed-many-threads-small.html=
">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-lnl-8/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-lnl-1/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-lnl-7/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-lnl-7=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-l=
nl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/sha=
rd-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89=
/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b72864=
9f89/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b7=
28649f89/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef=
46b728649f89/shard-lnl-1/igt@xe_module_load@load.html">SKIP</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080=
e0ef46b728649f89/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18=
e080e0ef46b728649f89/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cd=
fb18e080e0ef46b728649f89/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f=
22cdfb18e080e0ef46b728649f89/shard-lnl-5/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb=
628f22cdfb18e080e0ef46b728649f89/shard-lnl-5/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c=
9ebb628f22cdfb18e080e0ef46b728649f89/shard-lnl-4/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-=
173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-lnl-5/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5=
964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-lnl-3/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-lnl-3/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-lnl-1/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-lnl-3/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-lnl-4/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-lnl-=
2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-=
lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/sh=
ard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f8=
9/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405">Intel XE#7405=
</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175=
996v4/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-lnl-3/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-175996v4/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-lnl=
-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-175996v4/shard-lnl-2/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175=
996v4/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-lnl-8/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-175996v4/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-lnl=
-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-175996v4/shard-lnl-7/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175=
996v4/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-lnl-4/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-175996v4/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-lnl=
-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-175996v4/shard-lnl-6/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175=
996v4/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-lnl-6/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-175996v4/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-lnl=
-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-175996v4/shard-lnl-7/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175=
996v4/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-lnl-1/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-175996v4/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-lnl=
-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-175996v4/shard-lnl-2/igt@xe_module_load@load.htm=
l">PASS</a>)</li>
<li>shard-ptl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-6/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-2/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-2/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-2=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-p=
tl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/sha=
rd-ptl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89=
/shard-ptl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b72864=
9f89/shard-ptl-3/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b7=
28649f89/shard-ptl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef=
46b728649f89/shard-ptl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080=
e0ef46b728649f89/shard-ptl-7/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18=
e080e0ef46b728649f89/shard-ptl-5/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cd=
fb18e080e0ef46b728649f89/shard-ptl-5/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f=
22cdfb18e080e0ef46b728649f89/shard-ptl-5/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb=
628f22cdfb18e080e0ef46b728649f89/shard-ptl-6/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-173c=
9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-8/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5964-=
173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-3/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5=
964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-4/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-4/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-1/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-6/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-4/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-=
1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-=
ptl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/sh=
ard-ptl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f8=
9/shard-ptl-8/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/9286">Intel XE#9286</a>) -&gt; (=
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-p=
tl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-5/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
75996v4/shard-ptl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-8/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-175996v4/shard-ptl-1/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-p=
tl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-4/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
75996v4/shard-ptl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-7/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-175996v4/shard-ptl-2/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-p=
tl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-3/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
75996v4/shard-ptl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-7/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-175996v4/shard-ptl-6/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-p=
tl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-6/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
75996v4/shard-ptl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-2/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-175996v4/shard-ptl-8/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-p=
tl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-2/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
75996v4/shard-ptl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-5/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-175996v4/shard-ptl-3/igt@xe_module_load@load.html">PASS</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-bmg-1/igt@xe_modul=
e_load@reload.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/9463">Intel XE#9463</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-8/igt@xe_module_load@r=
eload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-90:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-lnl-3/igt@xe_pmu@e=
ngine-activity-accuracy-90.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/9461">Intel XE#9461</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-lnl-7/igt@xe_p=
mu@engine-activity-accuracy-90.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-suspend:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-4/igt@xe_pmu@e=
ngine-activity-suspend.html">ABORT</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-2/igt@xe_pmu@=
engine-activity-suspend.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-8/igt@kms_ccs@=
crc-primary-suspend-4-tiled-lnl-ccs.html">ABORT</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9378">Intel XE#9378=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1759=
96v4/shard-ptl-5/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">ABOR=
T</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084"=
>Intel XE#7084</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/9364">Intel XE#9364</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/9378">Intel XE#9378</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-8/igt@kms_curs=
or_crc@cursor-suspend.html">ABORT</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/9375">Intel XE#9375</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-ptl-7/igt@kms_curs=
or_crc@cursor-suspend.html">ABORT</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-lnl-3/igt@kms_flip=
@flip-vs-expired-vblank.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-lnl-7/igt@kms_flip@=
flip-vs-expired-vblank.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-bmg-7/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shard-bmg-4/i=
gt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-bmg-7/igt@kms_tile=
d_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v4/shar=
d-bmg-4/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">In=
tel XE#7424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-bmg-1/igt@kms_tile=
d_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437">Intel X=
E#7437</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-175996v4/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamel=
ium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2426">Intel XE#2426</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89 -&gt; xe-pw-175=
996v4</li>
</ul>
<p>IGT_9150: 18811c476bfde62ffbb4c0af55cd6f57e36e0dca @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89: 173c9ebb628f22cdfb18e08=
0e0ef46b728649f89<br />
  xe-pw-175996v4: 175996v4</p>

</body>
</html>

--===============5761315084106817174==--
