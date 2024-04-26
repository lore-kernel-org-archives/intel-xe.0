Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D43AC4345F
	for <intel-xe@archiver.kernel.org>; Fri, 26 Apr 2024 19:50:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79C6111A9E1;
	Fri, 26 Apr 2024 19:50:57 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 353BC1123E6;
 Fri, 26 Apr 2024 19:50:56 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8777072192265399799=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe=3A_Fix_early_probe_order?=
 =?utf-8?q?_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 26 Apr 2024 19:50:56 -0000
Message-ID: <171416105620.1687463.11905895610889622766@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240425182410.2705061-1-lucas.demarchi@intel.com>
In-Reply-To: <20240425182410.2705061-1-lucas.demarchi@intel.com>
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

--===============8777072192265399799==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Fix early probe order (rev2)
URL   : https://patchwork.freedesktop.org/series/132920/
State : failure

== Summary ==

CI Bug Log - changes from xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778_full -> xe-pw-132920v2_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-132920v2_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-132920v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-132920v2_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-7:
    - shard-dg2-set2:     NOTRUN -> [FAIL][1] +10 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-7.html

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-system-61x61:
    - shard-dg2-set2:     [PASS][2] -> [FAIL][3] +204 other tests fail
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-466/igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-system-61x61.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-433/igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-system-61x61.html

  * igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit:
    - shard-adlp:         [PASS][4] -> [FAIL][5] +1 other test fail
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-adlp-8/igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-adlp-8/igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit.html

  
#### Warnings ####

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][6] ([Intel XE#650]) -> [FAIL][7] +13 other tests fail
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][8] ([Intel XE#1195] / [Intel XE#904] / [Intel XE#909]) -> [FAIL][9] +1 other test fail
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - {shard-lnl}:        [SKIP][10] ([Intel XE#1134]) -> [SKIP][11] +21 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-lnl-7/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-lnl-5/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@xe_exec_compute_mode@many-execqueues-rebind:
    - {shard-lnl}:        [SKIP][12] ([Intel XE#1645]) -> [SKIP][13] +14 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-lnl-7/igt@xe_exec_compute_mode@many-execqueues-rebind.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-lnl-5/igt@xe_exec_compute_mode@many-execqueues-rebind.html

  
New tests
---------

  New tests have been introduced between xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778_full and xe-pw-132920v2_full:

### New IGT tests (12) ###

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-b-hdmi-a-6:
    - Statuses : 1 fail(s)
    - Exec time: [12.80] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.26] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.26] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-b-hdmi-a-6:
    - Statuses : 1 dmesg-fail(s)
    - Exec time: [13.80] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-c-hdmi-a-6:
    - Statuses : 1 dmesg-warn(s)
    - Exec time: [1.43] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-d-hdmi-a-6:
    - Statuses : 1 dmesg-warn(s)
    - Exec time: [1.38] s

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-b-hdmi-a-6:
    - Statuses : 1 dmesg-fail(s)
    - Exec time: [13.54] s

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-c-hdmi-a-6:
    - Statuses : 1 dmesg-warn(s)
    - Exec time: [1.40] s

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-d-hdmi-a-6:
    - Statuses : 1 dmesg-warn(s)
    - Exec time: [1.42] s

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-hdmi-a-6:
    - Statuses : 1 dmesg-fail(s)
    - Exec time: [13.20] s

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-c-hdmi-a-6:
    - Statuses : 1 dmesg-warn(s)
    - Exec time: [0.53] s

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-d-hdmi-a-6:
    - Statuses : 1 dmesg-warn(s)
    - Exec time: [0.81] s

  

Known issues
------------

  Here are the changes found in xe-pw-132920v2_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1:
    - shard-adlp:         [PASS][14] -> [FAIL][15] ([Intel XE#827])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
    - shard-adlp:         NOTRUN -> [SKIP][16] ([Intel XE#1124] / [Intel XE#1201]) +4 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-adlp-8/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     [PASS][17] -> [FAIL][18] ([Intel XE#1231])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-436/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-463/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][19] ([Intel XE#1195] / [Intel XE#1602]) +4 other tests incomplete
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-433/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - shard-adlp:         NOTRUN -> [FAIL][20] ([Intel XE#616]) +1 other test fail
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-adlp-4/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#1124] / [Intel XE#1201]) +3 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         NOTRUN -> [FAIL][22] ([Intel XE#1231])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][23] ([Intel XE#1201] / [Intel XE#367])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-adlp-4/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#1201] / [Intel XE#787]) +70 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-435/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc:
    - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +5 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-adlp-4/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#1201] / [Intel XE#787]) +8 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-adlp-4/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-7:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +21 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-7.html

  * igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#1201] / [Intel XE#314]) +2 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-adlp-4/igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-1.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][29] ([Intel XE#1201] / [Intel XE#314] / [Intel XE#455])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-adlp-4/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html

  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#1201] / [Intel XE#373]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-435/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][31] ([Intel XE#1201] / [Intel XE#373]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-adlp-4/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][32] ([Intel XE#616]) +4 other tests fail
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-433/igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-6.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-dg2-set2:     [PASS][33] -> [DMESG-WARN][34] ([Intel XE#1214] / [Intel XE#1602] / [Intel XE#282] / [Intel XE#910])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-433/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-464/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-dg2-set2:     [PASS][35] -> [DMESG-WARN][36] ([Intel XE#1214] / [Intel XE#282])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-466/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-434/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#1201] / [Intel XE#323])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-adlp-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#1201] / [Intel XE#323])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-435/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#1201] / [i915#2575]) +4 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-435/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
    - shard-dg2-set2:     [PASS][40] -> [DMESG-WARN][41] ([Intel XE#1214] / [Intel XE#1602] / [Intel XE#282]) +4 other tests dmesg-warn
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-435/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-434/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:
    - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#1201] / [Intel XE#309]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-adlp-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html

  * igt@kms_feature_discovery@display-3x:
    - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#1201] / [Intel XE#703])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-adlp-4/igt@kms_feature_discovery@display-3x.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible@ac-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][44] ([Intel XE#1214] / [Intel XE#1602] / [Intel XE#358]) +5 other tests dmesg-warn
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-435/igt@kms_flip@2x-flip-vs-panning-interruptible@ac-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-panning@bd-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][45] ([Intel XE#1214] / [Intel XE#1602]) +221 other tests dmesg-warn
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-435/igt@kms_flip@2x-flip-vs-panning@bd-hdmi-a6-dp4.html

  * igt@kms_flip@busy-flip:
    - shard-dg2-set2:     [PASS][46] -> [SKIP][47] ([Intel XE#1201] / [i915#2575]) +25 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-433/igt@kms_flip@busy-flip.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-464/igt@kms_flip@busy-flip.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-dg2-set2:     [PASS][48] -> [DMESG-FAIL][49] ([Intel XE#1602]) +442 other tests dmesg-fail
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - shard-dg2-set2:     [PASS][50] -> [FAIL][51] ([Intel XE#422] / [Intel XE#616]) +5 other tests fail
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [FAIL][52] ([Intel XE#422] / [Intel XE#616]) +1 other test fail
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#1201] / [Intel XE#455]) +2 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-4-4-mc-ccs-to-4-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> [DMESG-FAIL][54] ([Intel XE#1602] / [Intel XE#358]) +1 other test dmesg-fail
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-435/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-4-4-mc-ccs-to-4-rc-ccs-cc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [PASS][55] -> [FAIL][56] ([Intel XE#616]) +43 other tests fail
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#1201] / [Intel XE#651]) +3 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#1201] / [Intel XE#651]) +6 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#1201] / [Intel XE#653]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#1201] / [Intel XE#653]) +7 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-adlp:         NOTRUN -> [SKIP][61] ([Intel XE#1158] / [Intel XE#1201])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-adlp-4/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][62] ([Intel XE#1201] / [Intel XE#656]) +9 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [PASS][63] -> [SKIP][64] ([Intel XE#1201] / [Intel XE#455])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-464/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-FAIL][65] ([Intel XE#1602]) +61 other tests dmesg-fail
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-466/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6.html

  * igt@kms_invalid_mode@uint-max-clock@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [PASS][66] -> [DMESG-WARN][67] ([Intel XE#1214])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-463/igt@kms_invalid_mode@uint-max-clock@pipe-d-hdmi-a-6.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-436/igt@kms_invalid_mode@uint-max-clock@pipe-d-hdmi-a-6.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-adlp:         NOTRUN -> [SKIP][68] ([Intel XE#1201] / [Intel XE#356])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-adlp-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][69] ([Intel XE#1191] / [Intel XE#1214]) +1 other test dmesg-warn
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-adlp-4/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html

  * igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1:
    - shard-adlp:         [PASS][70] -> [FAIL][71] ([Intel XE#616])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-adlp-8/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-adlp-8/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html

  * igt@kms_plane_multiple@tiling-x:
    - shard-adlp:         NOTRUN -> [FAIL][72] ([Intel XE#616] / [Intel XE#654]) +4 other tests fail
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-adlp-4/igt@kms_plane_multiple@tiling-x.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [PASS][73] -> [DMESG-WARN][74] ([Intel XE#1214] / [Intel XE#1602] / [Intel XE#358]) +69 other tests dmesg-warn
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-b-hdmi-a-6.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-b-hdmi-a-6.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-dg2-set2:     [PASS][75] -> [SKIP][76] ([Intel XE#1201] / [Intel XE#1211])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-464/igt@kms_pm_rpm@dpms-lpsp.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-435/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#1201] / [Intel XE#929]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-433/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-adlp:         NOTRUN -> [SKIP][78] ([Intel XE#1122] / [Intel XE#1201])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-adlp-4/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@psr2-sprite-plane-onoff:
    - shard-adlp:         NOTRUN -> [SKIP][79] ([Intel XE#1201] / [Intel XE#929]) +2 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-adlp-4/igt@kms_psr@psr2-sprite-plane-onoff.html

  * igt@kms_rmfb@close-fd@pipe-b-hdmi-a-7:
    - shard-dg2-set2:     NOTRUN -> [FAIL][80] ([Intel XE#294])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-464/igt@kms_rmfb@close-fd@pipe-b-hdmi-a-7.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][81] ([Intel XE#1201] / [Intel XE#327])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-adlp:         NOTRUN -> [SKIP][82] ([Intel XE#1201] / [Intel XE#327])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-adlp-4/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - shard-adlp:         NOTRUN -> [SKIP][83] ([Intel XE#1201] / [Intel XE#455]) +6 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-adlp-4/igt@kms_scaling_modes@scaling-mode-none.html

  * igt@kms_sysfs_edid_timing:
    - shard-dg2-set2:     [PASS][84] -> [FAIL][85] ([Intel XE#1174])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-433/igt@kms_sysfs_edid_timing.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-464/igt@kms_sysfs_edid_timing.html

  * igt@kms_vblank@crtc-id@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [PASS][86] -> [DMESG-WARN][87] ([Intel XE#1214] / [Intel XE#1602]) +1350 other tests dmesg-warn
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-433/igt@kms_vblank@crtc-id@pipe-d-hdmi-a-6.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-433/igt@kms_vblank@crtc-id@pipe-d-hdmi-a-6.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-adlp:         NOTRUN -> [SKIP][88] ([Intel XE#1201] / [Intel XE#756])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-adlp-4/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@xe_ccs@block-copy-compressed-inc-dimension:
    - shard-adlp:         NOTRUN -> [SKIP][89] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#488])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-adlp-8/igt@xe_ccs@block-copy-compressed-inc-dimension.html

  * igt@xe_evict@evict-beng-large-multi-vm:
    - shard-dg2-set2:     [PASS][90] -> [INCOMPLETE][91] ([Intel XE#1033] / [Intel XE#1195] / [Intel XE#1473] / [Intel XE#1602] / [Intel XE#392])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-436/igt@xe_evict@evict-beng-large-multi-vm.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-463/igt@xe_evict@evict-beng-large-multi-vm.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     [PASS][92] -> [INCOMPLETE][93] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#1602] / [Intel XE#402])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-464/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][94] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#1602] / [Intel XE#392])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-435/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-adlp:         NOTRUN -> [SKIP][95] ([Intel XE#1201] / [Intel XE#261]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-adlp-4/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_evict@evict-cm-threads-small-multi-vm:
    - shard-dg2-set2:     [PASS][96] -> [DMESG-FAIL][97] ([Intel XE#1069] / [Intel XE#1602] / [Intel XE#358]) +8 other tests dmesg-fail
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-435/igt@xe_evict@evict-cm-threads-small-multi-vm.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-466/igt@xe_evict@evict-cm-threads-small-multi-vm.html

  * igt@xe_evict@evict-mixed-threads-small:
    - shard-dg2-set2:     [PASS][98] -> [INCOMPLETE][99] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#1602]) +3 other tests incomplete
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-466/igt@xe_evict@evict-mixed-threads-small.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-434/igt@xe_evict@evict-mixed-threads-small.html

  * igt@xe_evict@evict-threads-large:
    - shard-dg2-set2:     [PASS][100] -> [INCOMPLETE][101] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#1602] / [Intel XE#392]) +1 other test incomplete
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-464/igt@xe_evict@evict-threads-large.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-435/igt@xe_evict@evict-threads-large.html

  * igt@xe_evict_ccs@evict-overcommit-simple:
    - shard-dg2-set2:     NOTRUN -> [SKIP][102] ([Intel XE#1201]) +17 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-435/igt@xe_evict_ccs@evict-overcommit-simple.html

  * igt@xe_exec_balancer@many-execqueues-cm-parallel-rebind:
    - shard-dg2-set2:     NOTRUN -> [DMESG-FAIL][103] ([Intel XE#1069] / [Intel XE#1602] / [Intel XE#358])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-435/igt@xe_exec_balancer@many-execqueues-cm-parallel-rebind.html

  * igt@xe_exec_balancer@many-execqueues-parallel-userptr:
    - shard-adlp:         NOTRUN -> [INCOMPLETE][104] ([Intel XE#1088] / [Intel XE#1195] / [Intel XE#1330])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-adlp-8/igt@xe_exec_balancer@many-execqueues-parallel-userptr.html

  * igt@xe_exec_balancer@many-execqueues-virtual-rebind:
    - shard-dg2-set2:     [PASS][105] -> [DMESG-FAIL][106] ([Intel XE#1602] / [Intel XE#358]) +106 other tests dmesg-fail
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-463/igt@xe_exec_balancer@many-execqueues-virtual-rebind.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-434/igt@xe_exec_balancer@many-execqueues-virtual-rebind.html

  * igt@xe_exec_basic@many-null-rebind:
    - shard-dg2-set2:     [PASS][107] -> [INCOMPLETE][108] ([Intel XE#1195] / [Intel XE#1602]) +56 other tests incomplete
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-433/igt@xe_exec_basic@many-null-rebind.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-433/igt@xe_exec_basic@many-null-rebind.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:
    - shard-adlp:         NOTRUN -> [SKIP][109] ([Intel XE#1201] / [Intel XE#1392]) +2 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-adlp-4/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][110] ([Intel XE#1201] / [Intel XE#288]) +3 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-adlp-4/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-prefetch.html

  * igt@xe_exec_fault_mode@many-userptr-rebind-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][111] ([Intel XE#1201] / [Intel XE#288]) +4 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-433/igt@xe_exec_fault_mode@many-userptr-rebind-prefetch.html

  * igt@xe_exec_fault_mode@once-userptr-imm:
    - shard-adlp:         NOTRUN -> [SKIP][112] ([Intel XE#1201]) +1 other test skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-adlp-4/igt@xe_exec_fault_mode@once-userptr-imm.html

  * igt@xe_exec_threads@threads-bal-mixed-rebind:
    - shard-dg2-set2:     [PASS][113] -> [INCOMPLETE][114] ([Intel XE#1169] / [Intel XE#1195] / [Intel XE#1356] / [Intel XE#1602]) +3 other tests incomplete
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-463/igt@xe_exec_threads@threads-bal-mixed-rebind.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-434/igt@xe_exec_threads@threads-bal-mixed-rebind.html

  * igt@xe_exec_threads@threads-bal-mixed-userptr-rebind:
    - shard-dg2-set2:     [PASS][115] -> [INCOMPLETE][116] ([Intel XE#1169] / [Intel XE#1195] / [Intel XE#1356]) +2 other tests incomplete
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-433/igt@xe_exec_threads@threads-bal-mixed-userptr-rebind.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-433/igt@xe_exec_threads@threads-bal-mixed-userptr-rebind.html

  * igt@xe_exec_threads@threads-bal-userptr-rebind:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][117] ([Intel XE#1169] / [Intel XE#1195] / [Intel XE#1356] / [Intel XE#1602])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-435/igt@xe_exec_threads@threads-bal-userptr-rebind.html

  * igt@xe_exec_threads@threads-hang-shared-vm-userptr-invalidate:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][118] ([Intel XE#1214] / [Intel XE#358]) +1 other test dmesg-warn
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-435/igt@xe_exec_threads@threads-hang-shared-vm-userptr-invalidate.html

  * igt@xe_exec_threads@threads-mixed-shared-vm-rebind:
    - shard-dg2-set2:     [PASS][119] -> [DMESG-FAIL][120] ([Intel XE#1069] / [Intel XE#1602]) +9 other tests dmesg-fail
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-434/igt@xe_exec_threads@threads-mixed-shared-vm-rebind.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-436/igt@xe_exec_threads@threads-mixed-shared-vm-rebind.html

  * igt@xe_live_ktest@xe_migrate:
    - shard-dg2-set2:     [PASS][121] -> [SKIP][122] ([Intel XE#1192] / [Intel XE#1201])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-435/igt@xe_live_ktest@xe_migrate.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-466/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_module_load@unload:
    - shard-dg2-set2:     [PASS][123] -> [DMESG-WARN][124] ([Intel XE#1162] / [Intel XE#1214])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-436/igt@xe_module_load@unload.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-463/igt@xe_module_load@unload.html

  * igt@xe_pm@d3cold-basic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][125] ([Intel XE#1201] / [Intel XE#366]) +1 other test skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-433/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-dg2-set2:     NOTRUN -> [FAIL][126] ([Intel XE#1043] / [Intel XE#845])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-435/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-adlp:         [PASS][127] -> [FAIL][128] ([Intel XE#958])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-adlp-4/igt@xe_pm_residency@toggle-gt-c6.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-adlp-8/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][129] ([Intel XE#1201] / [Intel XE#944])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-435/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  * igt@xe_vm@large-split-binds-536870912:
    - shard-dg2-set2:     [PASS][130] -> [SKIP][131] ([Intel XE#1201]) +66 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-433/igt@xe_vm@large-split-binds-536870912.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-464/igt@xe_vm@large-split-binds-536870912.html

  * igt@xe_vm@munmap-style-unbind-userptr-either-side-full:
    - shard-dg2-set2:     [PASS][132] -> [DMESG-WARN][133] ([Intel XE#1214] / [Intel XE#358]) +7 other tests dmesg-warn
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-434/igt@xe_vm@munmap-style-unbind-userptr-either-side-full.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-436/igt@xe_vm@munmap-style-unbind-userptr-either-side-full.html

  * igt@xe_vm@munmap-style-unbind-userptr-inval-many-either-side-partial:
    - shard-dg2-set2:     [PASS][134] -> [DMESG-FAIL][135] ([Intel XE#358]) +7 other tests dmesg-fail
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-435/igt@xe_vm@munmap-style-unbind-userptr-inval-many-either-side-partial.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-466/igt@xe_vm@munmap-style-unbind-userptr-inval-many-either-side-partial.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x:
    - shard-adlp:         [DMESG-WARN][136] ([Intel XE#1214] / [Intel XE#324] / [Intel XE#358]) -> [PASS][137] +1 other test pass
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-dg2-set2:     [DMESG-WARN][138] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][139] +1 other test pass
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-434/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-463/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-dg2-set2:     [INCOMPLETE][140] ([Intel XE#1195]) -> [PASS][141] +1 other test pass
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-434/igt@kms_flip@2x-modeset-vs-vblank-race.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-433/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1:
    - {shard-lnl}:        [FAIL][142] ([Intel XE#480]) -> [PASS][143] +3 other tests pass
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-lnl-2/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@b-edp1:
    - {shard-lnl}:        [FAIL][144] ([Intel XE#886]) -> [PASS][145] +1 other test pass
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-lnl-6/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-edp1.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-lnl-6/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-edp1.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:
    - {shard-lnl}:        [DMESG-WARN][146] ([Intel XE#1622]) -> [PASS][147]
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-lnl-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_plane_lowres@tiling-y@pipe-c-hdmi-a-1:
    - shard-adlp:         [FAIL][148] ([Intel XE#616]) -> [PASS][149]
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-adlp-8/igt@kms_plane_lowres@tiling-y@pipe-c-hdmi-a-1.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-adlp-8/igt@kms_plane_lowres@tiling-y@pipe-c-hdmi-a-1.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-adlp:         [SKIP][150] ([Intel XE#1201] / [Intel XE#1211]) -> [PASS][151] +1 other test pass
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-adlp-8/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-adlp-4/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@i2c:
    - {shard-lnl}:        [SKIP][152] ([Intel XE#1211]) -> [PASS][153]
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-lnl-2/igt@kms_pm_rpm@i2c.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-lnl-8/igt@kms_pm_rpm@i2c.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area@psr2-pipe-a-edp-1:
    - {shard-lnl}:        [DMESG-WARN][154] ([Intel XE#1330]) -> [PASS][155] +4 other tests pass
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-lnl-5/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area@psr2-pipe-a-edp-1.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-lnl-8/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area@psr2-pipe-a-edp-1.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4:
    - shard-dg2-set2:     [FAIL][156] ([Intel XE#899]) -> [PASS][157]
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html

  * igt@xe_exec_reset@gt-reset-stress:
    - {shard-lnl}:        [DMESG-WARN][158] ([Intel XE#1638]) -> [PASS][159]
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-lnl-2/igt@xe_exec_reset@gt-reset-stress.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-lnl-8/igt@xe_exec_reset@gt-reset-stress.html

  * igt@xe_gt_freq@freq_reset_multiple:
    - {shard-lnl}:        [INCOMPLETE][160] -> [PASS][161]
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-lnl-4/igt@xe_gt_freq@freq_reset_multiple.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-lnl-4/igt@xe_gt_freq@freq_reset_multiple.html

  * igt@xe_live_ktest@xe_migrate:
    - {shard-lnl}:        [SKIP][162] ([Intel XE#1192]) -> [PASS][163]
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-lnl-2/igt@xe_live_ktest@xe_migrate.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-lnl-8/igt@xe_live_ktest@xe_migrate.html

  
#### Warnings ####

  * igt@kms_async_flips@async-flip-with-page-flip-events:
    - shard-adlp:         [DMESG-WARN][164] ([Intel XE#1033] / [Intel XE#1214] / [Intel XE#324] / [Intel XE#358]) -> [DMESG-WARN][165] ([Intel XE#1033] / [Intel XE#1214] / [Intel XE#358])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y:
    - shard-adlp:         [DMESG-WARN][166] ([Intel XE#1033] / [Intel XE#1214] / [Intel XE#324]) -> [DMESG-WARN][167] ([Intel XE#1033] / [Intel XE#1214])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][168] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][169] ([Intel XE#1201]) +1 other test skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-433/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-464/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [FAIL][170] ([Intel XE#1231]) -> [DMESG-FAIL][171] ([Intel XE#324])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [DMESG-FAIL][172] ([Intel XE#324]) -> [FAIL][173] ([Intel XE#1231])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][174] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][175] ([Intel XE#1201]) +3 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-433/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-464/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][176] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][177] ([Intel XE#1201] / [i915#2575])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-433/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-433/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][178] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][179] ([Intel XE#1201]) +1 other test skip
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][180] ([Intel XE#616]) -> [DMESG-FAIL][181] ([Intel XE#1602] / [Intel XE#358]) +8 other tests dmesg-fail
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_chamelium_edid@hdmi-mode-timings:
    - shard-dg2-set2:     [SKIP][182] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][183] ([Intel XE#1201] / [i915#2575]) +3 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-433/igt@kms_chamelium_edid@hdmi-mode-timings.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-433/igt@kms_chamelium_edid@hdmi-mode-timings.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     [FAIL][184] ([Intel XE#1204]) -> [DMESG-FAIL][185] ([Intel XE#1602])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-435/igt@kms_content_protection@lic-type-0.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-466/igt@kms_content_protection@lic-type-0.html

  * igt@kms_cursor_crc@cursor-onscreen-256x256@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-WARN][186] ([Intel XE#1214] / [Intel XE#282]) -> [DMESG-FAIL][187] ([Intel XE#282]) +1 other test dmesg-fail
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-464/igt@kms_cursor_crc@cursor-onscreen-256x256@pipe-a-hdmi-a-6.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-256x256@pipe-a-hdmi-a-6.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-dg2-set2:     [SKIP][188] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][189] ([Intel XE#1201] / [i915#2575]) +3 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-433/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-464/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-256x256@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-WARN][190] ([Intel XE#1214] / [Intel XE#282]) -> [DMESG-WARN][191] ([Intel XE#1214] / [Intel XE#1602] / [Intel XE#282] / [Intel XE#358]) +1 other test dmesg-warn
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-433/igt@kms_cursor_crc@cursor-sliding-256x256@pipe-a-hdmi-a-6.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-433/igt@kms_cursor_crc@cursor-sliding-256x256@pipe-a-hdmi-a-6.html

  * igt@kms_cursor_edge_walk@256x256-right-edge@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-WARN][192] ([Intel XE#1214] / [Intel XE#282]) -> [DMESG-FAIL][193] ([Intel XE#1602]) +2 other tests dmesg-fail
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-433/igt@kms_cursor_edge_walk@256x256-right-edge@pipe-d-hdmi-a-6.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-433/igt@kms_cursor_edge_walk@256x256-right-edge@pipe-d-hdmi-a-6.html

  * igt@kms_cursor_edge_walk@256x256-top-bottom:
    - shard-dg2-set2:     [DMESG-WARN][194] ([Intel XE#1214] / [Intel XE#282]) -> [SKIP][195] ([Intel XE#1201] / [i915#2575]) +2 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-433/igt@kms_cursor_edge_walk@256x256-top-bottom.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-433/igt@kms_cursor_edge_walk@256x256-top-bottom.html

  * igt@kms_cursor_edge_walk@256x256-top-edge:
    - shard-dg2-set2:     [DMESG-WARN][196] ([Intel XE#1214] / [Intel XE#282]) -> [DMESG-FAIL][197] ([Intel XE#1602] / [Intel XE#282]) +5 other tests dmesg-fail
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-463/igt@kms_cursor_edge_walk@256x256-top-edge.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-464/igt@kms_cursor_edge_walk@256x256-top-edge.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2-set2:     [SKIP][198] ([Intel XE#1201] / [Intel XE#323]) -> [SKIP][199] ([Intel XE#1201] / [i915#2575]) +1 other test skip
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-433/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-433/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:
    - shard-dg2-set2:     [DMESG-WARN][200] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910]) -> [DMESG-WARN][201] ([Intel XE#1214] / [Intel XE#1602] / [Intel XE#282] / [Intel XE#358] / [Intel XE#910])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-466/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-436/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@forked-bo@all-pipes:
    - shard-dg2-set2:     [DMESG-WARN][202] ([Intel XE#1214] / [Intel XE#282]) -> [DMESG-WARN][203] ([Intel XE#1214] / [Intel XE#1602] / [Intel XE#282]) +20 other tests dmesg-warn
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-433/igt@kms_cursor_legacy@forked-bo@all-pipes.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-464/igt@kms_cursor_legacy@forked-bo@all-pipes.html

  * igt@kms_cursor_legacy@forked-move@pipe-b:
    - shard-dg2-set2:     [DMESG-WARN][204] ([Intel XE#1214] / [Intel XE#282]) -> [DMESG-WARN][205] ([Intel XE#1214] / [Intel XE#1602]) +4 other tests dmesg-warn
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-463/igt@kms_cursor_legacy@forked-move@pipe-b.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-436/igt@kms_cursor_legacy@forked-move@pipe-b.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-dg2-set2:     [SKIP][206] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][207] ([Intel XE#1201])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-466/igt@kms_dsc@dsc-fractional-bpp.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-435/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-adlp:         [DMESG-WARN][208] ([Intel XE#1191] / [Intel XE#1214]) -> [INCOMPLETE][209] ([Intel XE#1195] / [Intel XE#927])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-adlp-2/igt@kms_fbcon_fbt@fbc-suspend.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-adlp-1/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2-set2:     [SKIP][210] ([Intel XE#1201] / [Intel XE#703]) -> [SKIP][211] ([Intel XE#1201] / [i915#2575])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-433/igt@kms_feature_discovery@display-3x.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-433/igt@kms_feature_discovery@display-3x.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2-set2:     [INCOMPLETE][212] ([Intel XE#1195]) -> [INCOMPLETE][213] ([Intel XE#1195] / [Intel XE#1602])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-434/igt@kms_flip@flip-vs-suspend.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-463/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a6:
    - shard-dg2-set2:     [DMESG-WARN][214] ([Intel XE#1162] / [Intel XE#1214]) -> [DMESG-WARN][215] ([Intel XE#1162] / [Intel XE#1214] / [Intel XE#1602]) +4 other tests dmesg-warn
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-434/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-463/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html

  * igt@kms_flip@flip-vs-suspend@c-hdmi-a6:
    - shard-dg2-set2:     [INCOMPLETE][216] ([Intel XE#1195]) -> [DMESG-WARN][217] ([Intel XE#1214] / [Intel XE#1602])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-434/igt@kms_flip@flip-vs-suspend@c-hdmi-a6.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-463/igt@kms_flip@flip-vs-suspend@c-hdmi-a6.html

  * igt@kms_flip_tiling@flip-change-tiling:
    - shard-dg2-set2:     [FAIL][218] ([Intel XE#650]) -> [DMESG-FAIL][219] ([Intel XE#1602] / [Intel XE#358])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-464/igt@kms_flip_tiling@flip-change-tiling.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-435/igt@kms_flip_tiling@flip-change-tiling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-4-mc-ccs-to-4:
    - shard-dg2-set2:     [FAIL][220] ([Intel XE#650]) -> [DMESG-FAIL][221] ([Intel XE#1602]) +63 other tests dmesg-fail
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-464/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-4-mc-ccs-to-4.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-435/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-4-mc-ccs-to-4.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2-set2:     [SKIP][222] ([Intel XE#1201] / [i915#5274]) -> [SKIP][223] ([Intel XE#1201] / [i915#2575])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-433/igt@kms_force_connector_basic@prune-stale-modes.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-464/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear:
    - shard-dg2-set2:     [SKIP][224] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][225] ([Intel XE#1201]) +14 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][226] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][227] ([Intel XE#1201]) +9 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][228] ([Intel XE#1201]) -> [SKIP][229] ([Intel XE#1201] / [Intel XE#1226]) +13 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-dg2-set2:     [SKIP][230] ([Intel XE#1158] / [Intel XE#1201]) -> [SKIP][231] ([Intel XE#1201])
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-433/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-433/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-dg2-set2:     [DMESG-WARN][232] ([Intel XE#1162] / [Intel XE#1214]) -> [SKIP][233] ([Intel XE#1201] / [i915#2575]) +1 other test skip
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-433/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-464/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-adlp:         [INCOMPLETE][234] ([Intel XE#1035] / [Intel XE#1195] / [Intel XE#927]) -> [DMESG-WARN][235] ([Intel XE#1191] / [Intel XE#1214])
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-adlp-1/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-adlp-4/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:
    - shard-adlp:         [INCOMPLETE][236] ([Intel XE#1195] / [Intel XE#927]) -> [DMESG-WARN][237] ([Intel XE#1191] / [Intel XE#1214])
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-adlp-1/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-adlp-4/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
    - shard-dg2-set2:     [DMESG-FAIL][238] ([Intel XE#1162]) -> [DMESG-FAIL][239] ([Intel XE#1162] / [Intel XE#1602]) +3 other tests dmesg-fail
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-433/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-433/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
    - shard-dg2-set2:     [FAIL][240] ([Intel XE#616]) -> [DMESG-FAIL][241] ([Intel XE#1602]) +7 other tests dmesg-fail
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-466/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-434/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][242] ([Intel XE#361]) -> [DMESG-FAIL][243] ([Intel XE#1602]) +1 other test dmesg-fail
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format:
    - shard-dg2-set2:     [INCOMPLETE][244] ([Intel XE#1195] / [Intel XE#904] / [Intel XE#909]) -> [DMESG-FAIL][245] ([Intel XE#1602]) +1 other test dmesg-fail
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format:
    - shard-dg2-set2:     [TIMEOUT][246] ([Intel XE#380] / [Intel XE#904] / [Intel XE#909]) -> [DMESG-FAIL][247] ([Intel XE#1602])
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-463/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-434/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:
    - shard-dg2-set2:     [TIMEOUT][248] ([Intel XE#295] / [Intel XE#380] / [Intel XE#909]) -> [DMESG-FAIL][249] ([Intel XE#1602])
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-434/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-433/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [TIMEOUT][250] ([Intel XE#904] / [Intel XE#909]) -> [DMESG-FAIL][251] ([Intel XE#1602]) +1 other test dmesg-fail
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-434/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a-hdmi-a-6.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-433/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a-hdmi-a-6.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-adlp:         [FAIL][252] ([Intel XE#1148] / [Intel XE#1204]) -> [SKIP][253] ([Intel XE#1201] / [Intel XE#734])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-adlp-4/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_rpm@drm-resources-equal:
    - shard-dg2-set2:     [SKIP][254] ([Intel XE#1201] / [Intel XE#1211]) -> [DMESG-WARN][255] ([Intel XE#1214] / [Intel XE#1602])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-434/igt@kms_pm_rpm@drm-resources-equal.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-463/igt@kms_pm_rpm@drm-resources-equal.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-dg2-set2:     [SKIP][256] ([Intel XE#1122] / [Intel XE#1201]) -> [SKIP][257] ([Intel XE#1201])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-433/igt@kms_psr2_su@page_flip-xrgb8888.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-433/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][258] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][259] ([Intel XE#1201]) +6 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-433/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-464/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-dg2-set2:     [SKIP][260] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][261] ([Intel XE#1201] / [i915#2575])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-433/igt@kms_rotation_crc@bad-pixel-format.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-464/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][262] ([Intel XE#1127] / [Intel XE#1201]) -> [SKIP][263] ([Intel XE#1201] / [i915#2575])
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-433/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-464/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [FAIL][264] -> [DMESG-FAIL][265] ([Intel XE#1602])
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][266] ([Intel XE#1201] / [Intel XE#362]) -> [SKIP][267] ([Intel XE#1201])
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-dg2-set2:     [FAIL][268] ([Intel XE#771] / [Intel XE#899]) -> [DMESG-WARN][269] ([Intel XE#1214] / [Intel XE#1602])
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][270] ([Intel XE#899]) -> [DMESG-WARN][271] ([Intel XE#1214] / [Intel XE#1602])
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-adlp:         [DMESG-WARN][272] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [DMESG-WARN][273] ([Intel XE#1191] / [Intel XE#1214]) +1 other test dmesg-warn
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-adlp-8/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-adlp-4/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][274] ([Intel XE#1214] / [Intel XE#1608]) -> [DMESG-WARN][275] ([Intel XE#1191] / [Intel XE#1214])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-adlp-8/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-adlp-4/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-dg2-set2:     [SKIP][276] ([Intel XE#1201] / [Intel XE#756]) -> [SKIP][277] ([Intel XE#1201] / [i915#2575])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-433/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-433/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@xe_compute_preempt@compute-preempt:
    - shard-dg2-set2:     [SKIP][278] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) -> [SKIP][279] ([Intel XE#1201])
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-433/igt@xe_compute_preempt@compute-preempt.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-433/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_copy_basic@mem-copy-linear-0x3fff:
    - shard-dg2-set2:     [SKIP][280] ([Intel XE#1123] / [Intel XE#1201]) -> [SKIP][281] ([Intel XE#1201])
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-464/igt@xe_copy_basic@mem-copy-linear-0x3fff.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - shard-dg2-set2:     [DMESG-FAIL][282] ([Intel XE#821]) -> [DMESG-FAIL][283] ([Intel XE#1602] / [Intel XE#358] / [Intel XE#821])
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-433/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-464/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-dg2-set2:     [TIMEOUT][284] ([Intel XE#1041] / [Intel XE#1473] / [Intel XE#392]) -> [INCOMPLETE][285] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#1602] / [Intel XE#392])
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-464/igt@xe_evict@evict-beng-mixed-many-threads-large.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-435/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-dg2-set2:     [INCOMPLETE][286] ([Intel XE#1195] / [Intel XE#1473]) -> [SKIP][287] ([Intel XE#1201])
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-433/igt@xe_evict@evict-beng-threads-large.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-433/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_evict@evict-large-multi-vm-cm:
    - shard-dg2-set2:     [DMESG-FAIL][288] ([Intel XE#821]) -> [DMESG-FAIL][289] ([Intel XE#1602])
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-434/igt@xe_evict@evict-large-multi-vm-cm.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-463/igt@xe_evict@evict-large-multi-vm-cm.html

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-dg2-set2:     [INCOMPLETE][290] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392]) -> [INCOMPLETE][291] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#1602] / [Intel XE#392])
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-large.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-463/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-rebind:
    - shard-dg2-set2:     [SKIP][292] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][293] ([Intel XE#1201]) +6 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-433/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-464/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     [FAIL][294] ([Intel XE#1173]) -> [DMESG-FAIL][295] ([Intel XE#1602]) +1 other test dmesg-fail
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-436/igt@xe_peer2peer@read.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-463/igt@xe_peer2peer@read.html

  * igt@xe_peer2peer@write:
    - shard-dg2-set2:     [FAIL][296] ([Intel XE#1173]) -> [SKIP][297] ([Intel XE#1061] / [Intel XE#1201])
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-466/igt@xe_peer2peer@write.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-435/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3-mmap-system:
    - shard-dg2-set2:     [FAIL][298] ([Intel XE#1221]) -> [DMESG-FAIL][299] ([Intel XE#1602])
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-463/igt@xe_pm@d3-mmap-system.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-436/igt@xe_pm@d3-mmap-system.html

  * igt@xe_pm@s3-basic-exec:
    - shard-dg2-set2:     [DMESG-WARN][300] ([Intel XE#1162] / [Intel XE#1214]) -> [DMESG-FAIL][301] ([Intel XE#1602])
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-434/igt@xe_pm@s3-basic-exec.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-463/igt@xe_pm@s3-basic-exec.html
    - shard-adlp:         [DMESG-WARN][302] ([Intel XE#1191] / [Intel XE#1214]) -> [INCOMPLETE][303] ([Intel XE#1044] / [Intel XE#1195] / [Intel XE#1358])
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-adlp-4/igt@xe_pm@s3-basic-exec.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-adlp-1/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-dg2-set2:     [DMESG-WARN][304] ([Intel XE#1162] / [Intel XE#1214]) -> [DMESG-FAIL][305] ([Intel XE#1162] / [Intel XE#1602] / [Intel XE#358])
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-434/igt@xe_pm@s3-multiple-execs.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-463/igt@xe_pm@s3-multiple-execs.html

  * igt@xe_pm@s4-basic-exec:
    - shard-dg2-set2:     [FAIL][306] ([Intel XE#1043] / [Intel XE#845]) -> [DMESG-FAIL][307] ([Intel XE#1602]) +2 other tests dmesg-fail
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-463/igt@xe_pm@s4-basic-exec.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-434/igt@xe_pm@s4-basic-exec.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1041]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041
  [Intel XE#1043]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1043
  [Intel XE#1044]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
  [Intel XE#1088]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1088
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1134
  [Intel XE#1148]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1148
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
  [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1174
  [Intel XE#1191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1211]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211
  [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
  [Intel XE#1221]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1221
  [Intel XE#1226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
  [Intel XE#1356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1446
  [Intel XE#1465]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1465
  [Intel XE#1471]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1471
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1483]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1483
  [Intel XE#1504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504
  [Intel XE#1577]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1577
  [Intel XE#1595]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1595
  [Intel XE#1602]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602
  [Intel XE#1603]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1603
  [Intel XE#1608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608
  [Intel XE#1622]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1622
  [Intel XE#1638]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638
  [Intel XE#1645]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1645
  [Intel XE#1667]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1667
  [Intel XE#1717]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1717
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/294
  [Intel XE#295]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/295
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/380
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/422
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/650
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#654]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/654
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#734]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/821
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#845]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/845
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/904
  [Intel XE#909]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/909
  [Intel XE#910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/910
  [Intel XE#927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/927
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274


Build changes
-------------

  * Linux: xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778 -> xe-pw-132920v2

  IGT_7825: 28b2a1b0be86e33a2fc04a022e04f07bd25b66d9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778: 9eafb9067479e7e797781d93e6a1a6309ac9d778
  xe-pw-132920v2: 132920v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/index.html

--===============8777072192265399799==
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
<tr><td><b>Series:</b></td><td>drm/xe: Fix early probe order (rev2)</td></t=
r>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/132920/">https://patchwork.freedesktop.org/series/132920/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-132920v2/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-132920v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1191-9eafb9067479e7e797781d93e6a1a6309=
ac9d778_full -&gt; xe-pw-132920v2_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-132920v2_full absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-132920v2_full, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1329=
20v2_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-7:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132920v2/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4=
-tiled-dg2-mc-ccs@pipe-a-hdmi-a-7.html">FAIL</a> +10 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-system-61x61:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-466/igt@xe_exe=
rcise_blt@fast-copy-inc-dimension@tile64-vram01-system-61x61.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/=
shard-dg2-433/igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-sys=
tem-61x61.html">FAIL</a> +204 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-adlp-8/igt@xe_live=
_ktest@xe_migrate@xe_migrate_sanity_kunit.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-adlp-8/igt@xe=
_live_ktest@xe_migrate@xe_migrate_sanity_kunit.html">FAIL</a> +1 other test=
 fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-433/igt@kms_cc=
s@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/650">Inte=
l XE#650</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-132920v2/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2=
-mc-ccs@pipe-a-hdmi-a-6.html">FAIL</a> +13 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-=
a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-436/igt@kms_pl=
ane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.ht=
ml">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1195">Intel XE#1195</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-463/igt@k=
ms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a=
-6.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>{shard-lnl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-lnl-7/igt@kms_dirt=
yfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1134">Intel XE#1134</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-lnl-5/igt@kms_dirty=
fb@psr-dirtyfb-ioctl.html">SKIP</a> +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-execqueues-rebind:</p>
<ul>
<li>{shard-lnl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-lnl-7/igt@xe_exec_=
compute_mode@many-execqueues-rebind.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1645">Intel XE#1645</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-lnl-5=
/igt@xe_exec_compute_mode@many-execqueues-rebind.html">SKIP</a> +14 other t=
ests skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-1191-9eafb9067479e7e797781d93e=
6a1a6309ac9d778_full and xe-pw-132920v2_full:</p>
<h3>New IGT tests (12)</h3>
<ul>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-=
b-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [12.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-=
c-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-=
d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe=
-b-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s)</li>
<li>Exec time: [13.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe=
-c-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s)</li>
<li>Exec time: [1.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe=
-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-=
b-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s)</li>
<li>Exec time: [13.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-=
c-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s)</li>
<li>Exec time: [1.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-=
d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s)</li>
<li>Exec time: [1.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@=
pipe-b-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s)</li>
<li>Exec time: [13.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@=
pipe-c-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s)</li>
<li>Exec time: [0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@=
pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s)</li>
<li>Exec time: [0.81] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-132920v2_full that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-adlp-1/igt@kms_asy=
nc_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-adlp=
-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/827">I=
ntel XE#827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132920v2/shard-adlp-8/igt@kms_big_fb@4-tiled-8bpp-rota=
te-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1124">Intel XE#1124</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-436/igt@kms_bi=
g_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/=
shard-dg2-463/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-a=
sync-flip.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132920v2/shard-dg2-433/igt@kms_big_fb@x-tiled-max-hw-s=
tride-64bpp-rotate-180-async-flip.html">INCOMPLETE</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602">Intel XE#16=
02</a>) +4 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132920v2/shard-adlp-4/igt@kms_big_fb@y-tiled-8bpp-rota=
te-180.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132920v2/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-s=
tride-32bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132920v2/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-st=
ride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132920v2/shard-adlp-4/igt@kms_bw@linear-tiling-3-displ=
ays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132920v2/shard-dg2-435/igt@kms_ccs@bad-pixel-format-4-=
tiled-mtl-rc-ccs-cc@pipe-a-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7=
0 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132920v2/shard-adlp-4/igt@kms_ccs@bad-pixel-format-y-t=
iled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +=
5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132920v2/shard-adlp-4/igt@kms_ccs@bad-pixel-format-y-t=
iled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</=
a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-7=
:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132920v2/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-b=
asic-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-7.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#4=
55</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787=
">Intel XE#787</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132920v2/shard-adlp-4/igt@kms_cdclk@mode-transition@pi=
pe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) +2 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132920v2/shard-adlp-4/igt@kms_cdclk@mode-transition@pi=
pe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/314">Intel XE#314</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132920v2/shard-dg2-435/igt@kms_chamelium_edid@hdmi-edi=
d-stress-resolution-4k.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132920v2/shard-adlp-4/igt@kms_chamelium_hpd@common-hpd=
-after-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132920v2/shard-dg2-433/igt@kms_cursor_crc@cursor-onscr=
een-256x85@pipe-a-hdmi-a-6.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +4 other tests fail</=
li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-433/igt@kms_cu=
rsor_legacy@2x-long-cursor-vs-flip-legacy.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-464/igt@k=
ms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">DMESG-WARN</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#121=
4</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602=
">Intel XE#1602</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/282">Intel XE#282</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/910">Intel XE#910</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-466/igt@kms_cu=
rsor_legacy@2x-long-flip-vs-cursor-atomic.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-434/igt@k=
ms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html">DMESG-WARN</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#121=
4</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/282"=
>Intel XE#282</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132920v2/shard-adlp-4/igt@kms_cursor_legacy@basic-busy=
-flip-before-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132920v2/shard-dg2-435/igt@kms_cursor_legacy@basic-bus=
y-flip-before-cursor-varying-size.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132920v2/shard-dg2-435/igt@kms_cursor_legacy@basic-fli=
p-before-cursor-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +4 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-435/igt@kms_cu=
rsor_legacy@cursor-vs-flip-atomic-transitions.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-434/=
igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">DMESG-WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Int=
el XE#1214</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1602">Intel XE#1602</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/282">Intel XE#282</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132920v2/shard-adlp-4/igt@kms_cursor_legacy@cursora-vs=
-flipb-atomic-transitions.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132920v2/shard-adlp-4/igt@kms_feature_discovery@displa=
y-3x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/703">Intel XE#703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible@ac-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132920v2/shard-dg2-435/igt@kms_flip@2x-flip-vs-panning=
-interruptible@ac-hdmi-a6-dp4.html">DMESG-WARN</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602">Intel XE#1602=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">=
Intel XE#358</a>) +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning@bd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132920v2/shard-dg2-435/igt@kms_flip@2x-flip-vs-panning=
@bd-hdmi-a6-dp4.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1602">Intel XE#1602</a>) +221 other=
 tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@busy-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-433/igt@kms_fl=
ip@busy-flip.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-132920v2/shard-dg2-464/igt@kms_flip@busy-flip.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">I=
ntel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/2575">i915#2575</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-466/igt@kms_fl=
ip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/sha=
rd-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscal=
ing.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1602">Intel XE#1602</a>) +442 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-434/igt@kms_fl=
ip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard=
-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/422">Intel XE#422</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/616">Intel XE#616</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling@pipe-a=
-valid-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132920v2/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64b=
pp-xtile-to-32bpp-xtile-upscaling@pipe-a-valid-mode.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/422">Intel XE#422</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">In=
tel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling=
:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132920v2/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64=
bpp-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#4=
55</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-4-4-mc-ccs-to-4-rc-ccs-=
cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132920v2/shard-dg2-435/igt@kms_flip_tiling@flip-change=
-tiling@pipe-a-dp-4-4-mc-ccs-to-4-rc-ccs-cc.html">DMESG-FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602">Intel XE#1602=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">=
Intel XE#358</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-434/igt@kms_fr=
ontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/sha=
rd-dg2-433/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap=
-wc.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/616">Intel XE#616</a>) +43 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-render:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132920v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc=
drrs-1p-offscren-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651<=
/a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132920v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fb=
cdrrs-rgb565-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +6 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132920v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc=
psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653<=
/a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132920v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fb=
cpsr-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</=
a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132920v2/shard-adlp-4/igt@kms_frontbuffer_tracking@pla=
ne-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1158">Intel XE#1158</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132920v2/shard-adlp-4/igt@kms_frontbuffer_tracking@psr=
-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)=
 +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-463/igt@kms_hd=
r@invalid-hdr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-132920v2/shard-dg2-464/igt@kms_hdr@invalid-hdr.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"=
>Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132920v2/shard-dg2-466/igt@kms_hdr@static-toggle-suspe=
nd@pipe-a-hdmi-a-6.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1602">Intel XE#1602</a>) +61 other tests dmesg=
-fail</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@uint-max-clock@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-463/igt@kms_in=
valid_mode@uint-max-clock@pipe-d-hdmi-a-6.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-436/igt@k=
ms_invalid_mode@uint-max-clock@pipe-d-hdmi-a-6.html">DMESG-WARN</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#121=
4</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132920v2/shard-adlp-4/igt@kms_multipipe_modeset@basic-=
max-pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132920v2/shard-adlp-4/igt@kms_plane@plane-panning-bott=
om-right-suspend@pipe-b.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +1=
 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-adlp-8/igt@kms_pla=
ne_lowres@tiling-y@pipe-d-hdmi-a-1.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-adlp-8/igt@kms_plane=
_lowres@tiling-y@pipe-d-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-x:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132920v2/shard-adlp-4/igt@kms_plane_multiple@tiling-x.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/616">Intel XE#616</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/654">Intel XE#654</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-b-h=
dmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-466/igt@kms_pl=
ane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-b-hdmi-a-6.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
132920v2/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-75-wi=
th-rotation@pipe-b-hdmi-a-6.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602">Intel XE#1602</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Inte=
l XE#358</a>) +69 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-464/igt@kms_pm=
_rpm@dpms-lpsp.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-132920v2/shard-dg2-435/igt@kms_pm_rpm@dpms-lpsp.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/120=
1">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1211">Intel XE#1211</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132920v2/shard-dg2-433/igt@kms_psr2_sf@cursor-plane-mo=
ve-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 o=
ther test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132920v2/shard-adlp-4/igt@kms_psr2_su@page_flip-xrgb88=
88.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1122">Intel XE#1122</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132920v2/shard-adlp-4/igt@kms_psr@psr2-sprite-plane-on=
off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rmfb@close-fd@pipe-b-hdmi-a-7:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132920v2/shard-dg2-464/igt@kms_rmfb@close-fd@pipe-b-hd=
mi-a-7.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/294">Intel XE#294</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132920v2/shard-dg2-435/igt@kms_rotation_crc@primary-y-=
tiled-reflect-x-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132920v2/shard-adlp-4/igt@kms_rotation_crc@sprite-rota=
tion-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132920v2/shard-adlp-4/igt@kms_scaling_modes@scaling-mo=
de-none.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-433/igt@kms_sy=
sfs_edid_timing.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132920v2/shard-dg2-464/igt@kms_sysfs_edid_timing.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
174">Intel XE#1174</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@crtc-id@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-433/igt@kms_vb=
lank@crtc-id@pipe-d-hdmi-a-6.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-433/igt@kms_vblank@crt=
c-id@pipe-d-hdmi-a-6.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1602">Intel XE#1602</a>) +1350=
 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132920v2/shard-adlp-4/igt@kms_writeback@writeback-fb-i=
d-xrgb2101010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-copy-compressed-inc-dimension:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132920v2/shard-adlp-8/igt@xe_ccs@block-copy-compressed=
-inc-dimension.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/488">Intel XE#488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-436/igt@xe_evi=
ct@evict-beng-large-multi-vm.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-463/igt@xe_evict@evict=
-beng-large-multi-vm.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1=
473</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/16=
02">Intel XE#1602</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-463/igt@xe_evi=
ct@evict-beng-mixed-many-threads-small.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-464/igt@xe_e=
vict@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Inte=
l XE#1473</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1602">Intel XE#1602</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/402">Intel XE#402</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132920v2/shard-dg2-435/igt@xe_evict@evict-beng-mixed-t=
hreads-large.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1602">Intel XE#1602</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel=
 XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132920v2/shard-adlp-4/igt@xe_evict@evict-beng-threads-=
large.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/261">Intel XE#261</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-small-multi-vm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-435/igt@xe_evi=
ct@evict-cm-threads-small-multi-vm.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-466/igt@xe_evict=
@evict-cm-threads-small-multi-vm.html">DMESG-FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602">Intel XE#160=
2</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/358"=
>Intel XE#358</a>) +8 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-466/igt@xe_evi=
ct@evict-mixed-threads-small.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-434/igt@xe_evict@evict=
-mixed-threads-small.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602">Intel XE#1=
602</a>) +3 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-464/igt@xe_evi=
ct@evict-threads-large.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-435/igt@xe_evict@evict-threa=
ds-large.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1195">Intel XE#1195</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1602">Intel XE#1602</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#=
392</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-simple:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132920v2/shard-dg2-435/igt@xe_evict_ccs@evict-overcomm=
it-simple.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1201">Intel XE#1201</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-cm-parallel-rebind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132920v2/shard-dg2-435/igt@xe_exec_balancer@many-execq=
ueues-cm-parallel-rebind.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1602">Intel XE#1602</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel X=
E#358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-parallel-userptr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132920v2/shard-adlp-8/igt@xe_exec_balancer@many-execqu=
eues-parallel-userptr.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1088">Intel XE#1088</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330">Intel XE#=
1330</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-virtual-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-463/igt@xe_exe=
c_balancer@many-execqueues-virtual-rebind.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-434/igt@x=
e_exec_balancer@many-execqueues-virtual-rebind.html">DMESG-FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602">Intel XE#160=
2</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/358"=
>Intel XE#358</a>) +106 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-433/igt@xe_exe=
c_basic@many-null-rebind.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-433/igt@xe_exec_basic@many=
-null-rebind.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1602">Intel XE#1602</a>) +56 other tes=
ts incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:</=
p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132920v2/shard-adlp-4/igt@xe_exec_basic@multigpu-once-=
bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392=
</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-prefetch:</=
p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132920v2/shard-adlp-4/igt@xe_exec_fault_mode@many-exec=
queues-bindexecqueue-userptr-prefetch.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</=
a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132920v2/shard-dg2-433/igt@xe_exec_fault_mode@many-use=
rptr-rebind-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +4 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-imm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132920v2/shard-adlp-4/igt@xe_exec_fault_mode@once-user=
ptr-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-463/igt@xe_exe=
c_threads@threads-bal-mixed-rebind.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-434/igt@xe_exec_=
threads@threads-bal-mixed-rebind.html">INCOMPLETE</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#119=
5</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356=
">Intel XE#1356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1602">Intel XE#1602</a>) +3 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-433/igt@xe_exe=
c_threads@threads-bal-mixed-userptr-rebind.html">PASS</a> -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-433/igt@=
xe_exec_threads@threads-bal-mixed-userptr-rebind.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1=
169</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/11=
95">Intel XE#1195</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1356">Intel XE#1356</a>) +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132920v2/shard-dg2-435/igt@xe_exec_threads@threads-bal=
-userptr-rebind.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1169">Intel XE#1169</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602"=
>Intel XE#1602</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-shared-vm-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132920v2/shard-dg2-435/igt@xe_exec_threads@threads-han=
g-shared-vm-userptr-invalidate.html">DMESG-WARN</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</=
a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-shared-vm-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-434/igt@xe_exe=
c_threads@threads-mixed-shared-vm-rebind.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-436/igt@xe=
_exec_threads@threads-mixed-shared-vm-rebind.html">DMESG-FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602"=
>Intel XE#1602</a>) +9 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-435/igt@xe_liv=
e_ktest@xe_migrate.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-132920v2/shard-dg2-466/igt@xe_live_ktest@xe_migrate=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1192">Intel XE#1192</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@unload:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-436/igt@xe_mod=
ule_load@unload.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132920v2/shard-dg2-463/igt@xe_module_load@unload.html"=
>DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1162">Intel XE#1162</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132920v2/shard-dg2-433/igt@xe_pm@d3cold-basic.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201=
">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132920v2/shard-dg2-435/igt@xe_pm@s4-multiple-execs.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1043">Intel XE#1043</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/845">Intel XE#845</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-adlp-4/igt@xe_pm_r=
esidency@toggle-gt-c6.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-132920v2/shard-adlp-8/igt@xe_pm_residency@toggle=
-gt-c6.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/958">Intel XE#958</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132920v2/shard-dg2-435/igt@xe_query@multigpu-query-uc-=
fw-version-guc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-binds-536870912:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-433/igt@xe_vm@=
large-split-binds-536870912.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-464/igt@xe_vm@large-spl=
it-binds-536870912.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +66 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-userptr-either-side-full:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-434/igt@xe_vm@=
munmap-style-unbind-userptr-either-side-full.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-436/=
igt@xe_vm@munmap-style-unbind-userptr-either-side-full.html">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Inte=
l XE#1214</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/358">Intel XE#358</a>) +7 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-userptr-inval-many-either-side-partial:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-435/igt@xe_vm@=
munmap-style-unbind-userptr-inval-many-either-side-partial.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/sh=
ard-dg2-466/igt@xe_vm@munmap-style-unbind-userptr-inval-many-either-side-pa=
rtial.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/358">Intel XE#358</a>) +7 other tests dmesg-fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-adlp-2/igt@kms_asy=
nc_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214"=
>Intel XE#1214</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/324">Intel XE#324</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/358">Intel XE#358</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-adlp-8/igt@kms_async_flips=
@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html">PASS</a> +1 other=
 test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-434/igt@kms_cu=
rsor_legacy@2x-long-cursor-vs-flip-atomic.html">DMESG-WARN</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Inte=
l XE#282</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-132920v2/shard-dg2-463/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-ato=
mic.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-434/igt@kms_fl=
ip@2x-modeset-vs-vblank-race.html">INCOMPLETE</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-43=
3/igt@kms_flip@2x-modeset-vs-vblank-race.html">PASS</a> +1 other test pass<=
/li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1:</p>
<ul>
<li>{shard-lnl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-lnl-8/igt@kms_flip=
@flip-vs-absolute-wf_vblank-interruptible@c-edp1.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/=
shard-lnl-2/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1.ht=
ml">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@b-edp1:</p>
<ul>
<li>{shard-lnl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-lnl-6/igt@kms_flip=
@plain-flip-fb-recreate-interruptible@b-edp1.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shar=
d-lnl-6/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-edp1.html">PASS=
</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>{shard-lnl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-lnl-7/igt@kms_fron=
tbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html">DMESG-WARN</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1622">Intel X=
E#1622</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-132920v2/shard-lnl-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-ind=
fb-draw-blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-adlp-8/igt@kms_pla=
ne_lowres@tiling-y@pipe-c-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-adlp-8/i=
gt@kms_plane_lowres@tiling-y@pipe-c-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-adlp-8/igt@kms_pm_=
rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-ad=
lp-4/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a> +1 other test pass<=
/li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>{shard-lnl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-lnl-2/igt@kms_pm_r=
pm@i2c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1211">Intel XE#1211</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-132920v2/shard-lnl-8/igt@kms_pm_rpm@i2c.html">PAS=
S</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area@psr2-pipe-a-edp-1:</p>
<ul>
<li>{shard-lnl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-lnl-5/igt@kms_psr2=
_sf@overlay-plane-update-sf-dmg-area@psr2-pipe-a-edp-1.html">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330">Inte=
l XE#1330</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-132920v2/shard-lnl-8/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area@=
psr2-pipe-a-edp-1.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-436/igt@kms_un=
iversal_plane@cursor-fb-leak@pipe-b-dp-4.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg=
2-463/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-reset-stress:</p>
<ul>
<li>{shard-lnl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-lnl-2/igt@xe_exec_=
reset@gt-reset-stress.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1638">Intel XE#1638</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-lnl-8/igt@xe_=
exec_reset@gt-reset-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_reset_multiple:</p>
<ul>
<li>{shard-lnl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-lnl-4/igt@xe_gt_fr=
eq@freq_reset_multiple.html">INCOMPLETE</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-lnl-4/igt@xe_gt_freq@freq_=
reset_multiple.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>{shard-lnl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-lnl-2/igt@xe_live_=
ktest@xe_migrate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-lnl-8/igt@xe_live_ktest@=
xe_migrate.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-adlp-2/igt@kms_asy=
nc_flips@async-flip-with-page-flip-events.html">DMESG-WARN</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Int=
el XE#1214</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/324">Intel XE#324</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/358">Intel XE#358</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-adlp-8/igt@kms_async_flips@asy=
nc-flip-with-page-flip-events.html">DMESG-WARN</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">=
Intel XE#358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-adlp-2/igt@kms_asy=
nc_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033"=
>Intel XE#1033</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1214">Intel XE#1214</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-adlp-8/igt@kms_async_fli=
ps@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html">DMESG-WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel=
 XE#1033</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-433/igt@kms_bi=
g_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard=
-dg2-464/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a=
>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-adlp-4/igt@kms_big=
_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel X=
E#1231</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-132920v2/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0=
-hflip-async-flip.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-adlp-2/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE=
#324</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
132920v2/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-a=
sync-flip.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-433/igt@kms_bi=
g_fb@yf-tiled-64bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shar=
d-dg2-464/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a=
>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-433/igt@kms_bw=
@linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920=
v2/shard-dg2-433/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">I=
ntel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-433/igt@kms_cc=
s@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">I=
ntel XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-132920v2/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-=
ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-=
6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-436/igt@kms_cc=
s@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">In=
tel XE#616</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-132920v2/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg=
2-rc-ccs-cc@pipe-c-hdmi-a-6.html">DMESG-FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1602">Intel XE#1602</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>) =
+8 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-mode-timings:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-433/igt@kms_ch=
amelium_edid@hdmi-mode-timings.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shar=
d-dg2-433/igt@kms_chamelium_edid@hdmi-mode-timings.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2=
575">i915#2575</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-435/igt@kms_co=
ntent_protection@lic-type-0.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-466/igt@k=
ms_content_protection@lic-type-0.html">DMESG-FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1602">Intel XE#1602</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x256@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-464/igt@kms_cu=
rsor_crc@cursor-onscreen-256x256@pipe-a-hdmi-a-6.html">DMESG-WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1=
214</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
2">Intel XE#282</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-132920v2/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-256x25=
6@pipe-a-hdmi-a-6.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +1 other test dmesg-fail=
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x32:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-433/igt@kms_cu=
rsor_crc@cursor-rapid-movement-32x32.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920=
v2/shard-dg2-464/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">I=
ntel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/2575">i915#2575</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x256@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-433/igt@kms_cu=
rsor_crc@cursor-sliding-256x256@pipe-a-hdmi-a-6.html">DMESG-WARN</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#12=
14</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/282=
">Intel XE#282</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-132920v2/shard-dg2-433/igt@kms_cursor_crc@cursor-sliding-256x256@=
pipe-a-hdmi-a-6.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1602">Intel XE#1602</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">In=
tel XE#358</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-right-edge@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-433/igt@kms_cu=
rsor_edge_walk@256x256-right-edge@pipe-d-hdmi-a-6.html">DMESG-WARN</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#=
1214</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
82">Intel XE#282</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-132920v2/shard-dg2-433/igt@kms_cursor_edge_walk@256x256-right-e=
dge@pipe-d-hdmi-a-6.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1602">Intel XE#1602</a>) +2 other tests dmesg=
-fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-top-bottom:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-433/igt@kms_cu=
rsor_edge_walk@256x256-top-bottom.html">DMESG-WARN</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1329=
20v2/shard-dg2-433/igt@kms_cursor_edge_walk@256x256-top-bottom.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">In=
tel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-top-edge:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-463/igt@kms_cu=
rsor_edge_walk@256x256-top-edge.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920=
v2/shard-dg2-464/igt@kms_cursor_edge_walk@256x256-top-edge.html">DMESG-FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602">=
Intel XE#1602</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/282">Intel XE#282</a>) +5 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-433/igt@kms_cu=
rsor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Int=
el XE#323</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-132920v2/shard-dg2-433/igt@kms_cursor_legacy@basic-busy-flip-before-cu=
rsor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-466/igt@kms_cu=
rsor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html">DMESG-WARN=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">=
Intel XE#1214</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/282">Intel XE#282</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/910">Intel XE#910</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-436/igt@kms_cursor_lega=
cy@cursor-vs-flip-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#=
1214</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
602">Intel XE#1602</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/282">Intel XE#282</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/358">Intel XE#358</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/910">Intel XE#910</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-bo@all-pipes:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-433/igt@kms_cu=
rsor_legacy@forked-bo@all-pipes.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920=
v2/shard-dg2-464/igt@kms_cursor_legacy@forked-bo@all-pipes.html">DMESG-WARN=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">=
Intel XE#1214</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1602">Intel XE#1602</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/282">Intel XE#282</a>) +20 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-move@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-463/igt@kms_cu=
rsor_legacy@forked-move@pipe-b.html">DMESG-WARN</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920=
v2/shard-dg2-436/igt@kms_cursor_legacy@forked-move@pipe-b.html">DMESG-WARN<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">I=
ntel XE#1214</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1602">Intel XE#1602</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-466/igt@kms_ds=
c@dsc-fractional-bpp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-435/=
igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-adlp-2/igt@kms_fbc=
on_fbt@fbc-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-ad=
lp-1/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#92=
7</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-433/igt@kms_fe=
ature_discovery@display-3x.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg=
2-433/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915=
#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-434/igt@kms_fl=
ip@flip-vs-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-463/igt@kms_=
flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1602">Intel XE#1602</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-434/igt@kms_fl=
ip@flip-vs-suspend@a-hdmi-a6.html">DMESG-WARN</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v=
2/shard-dg2-463/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Inte=
l XE#1162</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1214">Intel XE#1214</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1602">Intel XE#1602</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-434/igt@kms_fl=
ip@flip-vs-suspend@c-hdmi-a6.html">INCOMPLETE</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-46=
3/igt@kms_flip@flip-vs-suspend@c-hdmi-a6.html">DMESG-WARN</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602">Inte=
l XE#1602</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-464/igt@kms_fl=
ip_tiling@flip-change-tiling.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/650">Intel XE#650</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-435/igt@km=
s_flip_tiling@flip-change-tiling.html">DMESG-FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1602">Intel XE#1602</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-4-mc-ccs-to-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-464/igt@kms_fl=
ip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-4-mc-ccs-to-4.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/650">Intel X=
E#650</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-132920v2/shard-dg2-435/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-=
a-6-4-mc-ccs-to-4.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1602">Intel XE#1602</a>) +63 other tests dmesg-=
fail</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-433/igt@kms_fo=
rce_connector_basic@prune-stale-modes.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1329=
20v2/shard-dg2-464/igt@kms_force_connector_basic@prune-stale-modes.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201=
">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-433/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-tiling-linear.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#65=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132=
920v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1201">Intel XE#1201</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE=
#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
653">Intel XE#653</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-132920v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-1p-=
primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +9 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Inte=
l XE#1201</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-132920v2/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn=
-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>) +13 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-433/igt@kms_fr=
ontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1158">Intel XE#1158</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/=
shard-dg2-433/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE=
#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-433/igt@kms_pi=
pe_crc_basic@suspend-read-crc.html">DMESG-WARN</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1329=
20v2/shard-dg2-464/igt@kms_pipe_crc_basic@suspend-read-crc.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel =
XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-adlp-1/igt@kms_pla=
ne@plane-panning-bottom-right-suspend.html">INCOMPLETE</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel X=
E#1195</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/927">Intel XE#927</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-132920v2/shard-adlp-4/igt@kms_plane@plane-panning-bottom-righ=
t-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-adlp-1/igt@kms_pla=
ne@plane-panning-bottom-right-suspend@pipe-a.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">=
Intel XE#927</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-132920v2/shard-adlp-4/igt@kms_plane@plane-panning-bottom-right-susp=
end@pipe-a.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-433/igt@kms_pl=
ane@plane-panning-bottom-right-suspend@pipe-b.html">DMESG-FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1329=
20v2/shard-dg2-433/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.=
html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1162">Intel XE#1162</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1602">Intel XE#1602</a>) +3 other tests dmesg-fail<=
/li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-466/igt@kms_pl=
ane_cursor@primary@pipe-a-hdmi-a-6-size-256.html">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard=
-dg2-434/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html">DMESG-=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/16=
02">Intel XE#1602</a>) +7 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-464/igt@kms_pl=
ane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/sh=
ard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">=
DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1602">Intel XE#1602</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-463/igt@kms_pl=
ane_scaling@plane-downscale-factor-0-75-with-pixel-format.html">INCOMPLETE<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">I=
ntel XE#1195</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/904">Intel XE#904</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/909">Intel XE#909</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-436/igt@kms_plane_scalin=
g@plane-downscale-factor-0-75-with-pixel-format.html">DMESG-FAIL</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602">Intel XE#16=
02</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-463/igt@kms_pl=
ane_scaling@plane-scaler-unity-scaling-with-pixel-format.html">TIMEOUT</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/380">Intel =
XE#380</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/904">Intel XE#904</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/909">Intel XE#909</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-434/igt@kms_plane_scaling@plan=
e-scaler-unity-scaling-with-pixel-format.html">DMESG-FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1602">Intel XE#1602</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-434/igt@kms_pl=
ane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html">TIMEOUT=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/295">I=
ntel XE#295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/380">Intel XE#380</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/909">Intel XE#909</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-433/igt@kms_plane_scaling=
@plane-scaler-with-clipping-clamping-pixel-formats.html">DMESG-FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602">Intel XE=
#1602</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@=
pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-434/igt@kms_pl=
ane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a-hdmi-a=
-6.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/904">Intel XE#904</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/909">Intel XE#909</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-433/igt@kms_plane_sca=
ling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a-hdmi-a-6.html=
">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1602">Intel XE#1602</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-adlp-8/igt@kms_pm_=
dc@dc9-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1148">Intel XE#1148</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-adlp-4/igt@kms_=
pm_dc@dc9-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/734">Intel XE#734</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@drm-resources-equal:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-434/igt@kms_pm=
_rpm@drm-resources-equal.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg=
2-463/igt@kms_pm_rpm@drm-resources-equal.html">DMESG-WARN</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602">Inte=
l XE#1602</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-433/igt@kms_ps=
r2_su@page_flip-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg=
2-433/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-433/igt@kms_ps=
r@fbc-psr2-sprite-plane-onoff.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard=
-dg2-464/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a=
>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-433/igt@kms_ro=
tation_crc@bad-pixel-format.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-d=
g2-464/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i9=
15#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-433/igt@kms_ro=
tation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#=
1201</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
132920v2/shard-dg2-464/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-433/igt@kms_ti=
led_display@basic-test-pattern.html">FAIL</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-464/igt@kms_tiled_di=
splay@basic-test-pattern.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1602">Intel XE#1602</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-463/igt@kms_ti=
led_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel =
XE#362</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-132920v2/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-cham=
elium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-436/igt@kms_un=
iversal_plane@cursor-fb-leak.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg=
2-463/igt@kms_universal_plane@cursor-fb-leak.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602"=
>Intel XE#1602</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-436/igt@kms_un=
iversal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shar=
d-dg2-463/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html">DMES=
G-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1214">Intel XE#1214</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1602">Intel XE#1602</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-adlp-8/igt@kms_vbl=
ank@ts-continuation-dpms-suspend.html">DMESG-WARN</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#121=
4</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608=
">Intel XE#1608</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-132920v2/shard-adlp-4/igt@kms_vblank@ts-continuation-dpms-suspen=
d.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1191">Intel XE#1191</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +1 other test dmesg-warn=
</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-adlp-8/igt@kms_vbl=
ank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1.html">DMESG-WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1=
214</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/16=
08">Intel XE#1608</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-132920v2/shard-adlp-4/igt@kms_vblank@ts-continuation-dpms-susp=
end@pipe-d-hdmi-a-1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-433/igt@kms_wr=
iteback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920=
v2/shard-dg2-433/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">In=
tel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-433/igt@xe_com=
pute_preempt@compute-preempt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#=
455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
32920v2/shard-dg2-433/igt@xe_compute_preempt@compute-preempt.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Inte=
l XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-433/igt@xe_cop=
y_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/sh=
ard-dg2-464/igt@xe_copy_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#120=
1</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-433/igt@xe_evi=
ct@evict-beng-large-multi-vm-cm.html">DMESG-FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/821">Intel XE#821</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-4=
64/igt@xe_evict@evict-beng-large-multi-vm-cm.html">DMESG-FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602">Intel XE#1602=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">=
Intel XE#358</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/821">Intel XE#821</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-464/igt@xe_evi=
ct@evict-beng-mixed-many-threads-large.html">TIMEOUT</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1041">Intel XE#1041</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#=
1473</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
92">Intel XE#392</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-132920v2/shard-dg2-435/igt@xe_evict@evict-beng-mixed-many-threa=
ds-large.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1195">Intel XE#1195</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1602">Intel XE#1602</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#=
392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-433/igt@xe_evi=
ct@evict-beng-threads-large.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2=
/shard-dg2-433/igt@xe_evict@evict-beng-threads-large.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#120=
1</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-434/igt@xe_evi=
ct@evict-large-multi-vm-cm.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/821">Intel XE#821</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-463/=
igt@xe_evict@evict-large-multi-vm-cm.html">DMESG-FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1602">Intel XE#1602</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-434/igt@xe_evi=
ct@evict-mixed-many-threads-large.html">INCOMPLETE</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#14=
73</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/392=
">Intel XE#392</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-132920v2/shard-dg2-463/igt@xe_evict@evict-mixed-many-threads-larg=
e.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1195">Intel XE#1195</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1602">Intel XE#1602</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</=
a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-433/igt@xe_exe=
c_fault_mode@twice-bindexecqueue-rebind.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1329=
20v2/shard-dg2-464/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/12=
01">Intel XE#1201</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-436/igt@xe_pee=
r2peer@read.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1173">Intel XE#1173</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-463/igt@xe_peer2peer@read=
.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1602">Intel XE#1602</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-466/igt@xe_pee=
r2peer@write.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1173">Intel XE#1173</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-435/igt@xe_peer2peer@wri=
te.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1061">Intel XE#1061</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3-mmap-system:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-463/igt@xe_pm@=
d3-mmap-system.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1221">Intel XE#1221</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-436/igt@xe_pm@d3-mmap-=
system.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1602">Intel XE#1602</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-434/igt@xe_pm@=
s3-basic-exec.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-463=
/igt@xe_pm@s3-basic-exec.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1602">Intel XE#1602</a>)</li>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-adlp-4/igt@xe_pm@s=
3-basic-exec.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-adlp-1/i=
gt@xe_pm@s3-basic-exec.html">INCOMPLETE</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1044">Intel XE#1044</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE=
#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-434/igt@xe_pm@=
s3-multiple-execs.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2=
-463/igt@xe_pm@s3-multiple-execs.html">DMESG-FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602">Intel XE#160=
2</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/358"=
>Intel XE#358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778/shard-dg2-463/igt@xe_pm@=
s4-basic-exec.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1043">Intel XE#1043</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/845">Intel XE#845</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132920v2/shard-dg2-434/igt@xe_=
pm@s4-basic-exec.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1602">Intel XE#1602</a>) +2 other tests dmesg-fa=
il</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778 -&gt; xe-pw-132=
920v2</li>
</ul>
<p>IGT_7825: 28b2a1b0be86e33a2fc04a022e04f07bd25b66d9 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-1191-9eafb9067479e7e797781d93e6a1a6309ac9d778: 9eafb9067479e7e797781d9=
3e6a1a6309ac9d778<br />
  xe-pw-132920v2: 132920v2</p>

</body>
</html>

--===============8777072192265399799==--
