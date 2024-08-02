Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2642C3DA4A
	for <intel-xe@archiver.kernel.org>; Fri,  2 Aug 2024 00:07:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B93210E124;
	Fri,  2 Aug 2024 00:07:25 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1EEA10E124;
 Fri,  2 Aug 2024 00:07:23 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2707991732430920484=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_Release_GuC_v70=2E29=2E2_for_LN?=
 =?utf-8?q?L=2C_BMG?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Julia Filipchuk" <julia.filipchuk@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 02 Aug 2024 00:07:23 -0000
Message-ID: <172255724384.489790.13061225579734657009@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240801204010.3042850-1-julia.filipchuk@intel.com>
In-Reply-To: <20240801204010.3042850-1-julia.filipchuk@intel.com>
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

--===============2707991732430920484==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Release GuC v70.29.2 for LNL, BMG
URL   : https://patchwork.freedesktop.org/series/136815/
State : failure

== Summary ==

CI Bug Log - changes from xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5_full -> xe-pw-136815v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-136815v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-136815v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-136815v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_vrr@flip-basic:
    - shard-lnl:          [PASS][1] -> [FAIL][2] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-4/igt@kms_vrr@flip-basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-lnl-3/igt@kms_vrr@flip-basic.html

  * igt@xe_pm_residency@idle-residency-on-exec:
    - shard-lnl:          [PASS][3] -> [TIMEOUT][4] +1 other test timeout
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-1/igt@xe_pm_residency@idle-residency-on-exec.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-lnl-4/igt@xe_pm_residency@idle-residency-on-exec.html

  
#### Warnings ####

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][5] ([Intel XE#1201]) -> [SKIP][6] +29 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@core_hotunplug@hotrebind-lateclose:
    - {shard-bmg}:        NOTRUN -> [INCOMPLETE][7]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-bmg-1/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - {shard-bmg}:        [SKIP][8] -> [FAIL][9]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-6/igt@kms_cdclk@mode-transition-all-outputs.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-bmg-4/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@mode-transition@pipe-d-dp-2:
    - {shard-bmg}:        NOTRUN -> [SKIP][10] +3 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-bmg-3/igt@kms_cdclk@mode-transition@pipe-d-dp-2.html

  * igt@kms_content_protection@srm:
    - {shard-bmg}:        [FAIL][11] -> [SKIP][12] +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-6/igt@kms_content_protection@srm.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-bmg-4/igt@kms_content_protection@srm.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - {shard-bmg}:        [PASS][13] -> [DMESG-WARN][14] +4 other tests dmesg-warn
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - {shard-bmg}:        [SKIP][15] ([Intel XE#2291]) -> [DMESG-WARN][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@xe_exec_threads@threads-hang-rebind:
    - {shard-bmg}:        [PASS][17] -> [INCOMPLETE][18] +2 other tests incomplete
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-3/igt@xe_exec_threads@threads-hang-rebind.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-bmg-2/igt@xe_exec_threads@threads-hang-rebind.html

  
Known issues
------------

  Here are the changes found in xe-pw-136815v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-dg2-set2:     NOTRUN -> [ABORT][19] ([Intel XE#2421])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-436/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@core_hotunplug@hotreplug-lateclose:
    - shard-adlp:         [PASS][20] -> [INCOMPLETE][21] ([Intel XE#1195] / [Intel XE#1365])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-9/igt@core_hotunplug@hotreplug-lateclose.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-adlp-2/igt@core_hotunplug@hotreplug-lateclose.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:
    - shard-lnl:          [PASS][22] -> [FAIL][23] ([Intel XE#1426]) +1 other test fail
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-lnl-8/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:
    - shard-adlp:         [PASS][24] -> [FAIL][25] ([Intel XE#1426]) +3 other tests fail
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-8/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-adlp-1/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][26] ([Intel XE#1195]) +1 other test incomplete
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-466/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-dp-4.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#1124] / [Intel XE#1201]) +4 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-adlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#1201] / [Intel XE#316]) +3 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-adlp-4/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         NOTRUN -> [FAIL][29] ([Intel XE#1204])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         NOTRUN -> [FAIL][30] ([Intel XE#1231])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#1124] / [Intel XE#1201]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-436/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#1201] / [Intel XE#2191])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-adlp-4/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#1201] / [Intel XE#367])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-adlp-8/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#1201] / [Intel XE#787]) +14 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-adlp-4/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#1201] / [Intel XE#787]) +13 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +9 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-adlp-4/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][38] ([Intel XE#1201] / [Intel XE#1252]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-adlp-8/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#1201] / [Intel XE#314])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-adlp-4/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#1201] / [Intel XE#373]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-436/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-adlp:         NOTRUN -> [SKIP][41] ([Intel XE#1201] / [Intel XE#373]) +4 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-adlp-4/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#1201] / [Intel XE#308]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-adlp-8/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#1201] / [Intel XE#455]) +11 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-adlp-4/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#1201] / [Intel XE#455])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-436/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1:
    - shard-lnl:          [PASS][45] -> [FAIL][46] ([Intel XE#2028]) +3 other tests fail
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-5/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-lnl-1/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#1201] / [Intel XE#309]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-adlp-8/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#1201] / [Intel XE#310]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-adlp-8/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [PASS][49] -> [FAIL][50] ([Intel XE#301]) +1 other test fail
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][51] ([Intel XE#1551]) +1 other test dmesg-warn
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-436/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y:
    - shard-adlp:         [PASS][52] -> [FAIL][53] ([Intel XE#1874]) +2 other tests fail
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][54] ([Intel XE#1201] / [Intel XE#651]) +3 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][55] ([Intel XE#1201] / [Intel XE#656]) +17 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#1201] / [Intel XE#651]) +7 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#1151] / [Intel XE#1201])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#1201] / [Intel XE#653]) +9 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-suspend:
    - shard-lnl:          [PASS][59] -> [INCOMPLETE][60] ([Intel XE#2050])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][61] ([Intel XE#1201] / [Intel XE#653]) +2 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_plane@plane-position-hole:
    - shard-lnl:          [PASS][62] -> [DMESG-FAIL][63] ([Intel XE#324]) +1 other test dmesg-fail
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-8/igt@kms_plane@plane-position-hole.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-lnl-2/igt@kms_plane@plane-position-hole.html

  * igt@kms_plane@plane-position-hole@pipe-b-plane-1:
    - shard-lnl:          [PASS][64] -> [DMESG-WARN][65] ([Intel XE#324]) +1 other test dmesg-warn
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-8/igt@kms_plane@plane-position-hole@pipe-b-plane-1.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-lnl-2/igt@kms_plane@plane-position-hole@pipe-b-plane-1.html

  * igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area:
    - shard-adlp:         NOTRUN -> [SKIP][66] ([Intel XE#1201]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-adlp-8/igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-adlp:         NOTRUN -> [SKIP][67] ([Intel XE#1122] / [Intel XE#1201])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-adlp-8/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][68] ([Intel XE#1201] / [Intel XE#929]) +4 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-436/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
    - shard-adlp:         NOTRUN -> [SKIP][69] ([Intel XE#1201] / [Intel XE#929]) +3 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-adlp-4/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-adlp:         NOTRUN -> [SKIP][70] ([Intel XE#1127] / [Intel XE#1201])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-adlp-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_vblank@accuracy-idle:
    - shard-lnl:          [PASS][71] -> [FAIL][72] ([Intel XE#1523]) +1 other test fail
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-6/igt@kms_vblank@accuracy-idle.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-lnl-3/igt@kms_vblank@accuracy-idle.html

  * igt@xe_ccs@block-multicopy-compressed:
    - shard-adlp:         NOTRUN -> [SKIP][73] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#488])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-adlp-4/igt@xe_ccs@block-multicopy-compressed.html

  * igt@xe_evict@evict-beng-cm-threads-large:
    - shard-dg2-set2:     [PASS][74] -> [TIMEOUT][75] ([Intel XE#1473] / [Intel XE#392])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@xe_evict@evict-beng-cm-threads-large.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-466/igt@xe_evict@evict-beng-cm-threads-large.html

  * igt@xe_evict@evict-beng-large:
    - shard-adlp:         NOTRUN -> [SKIP][76] ([Intel XE#1201] / [Intel XE#261])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-adlp-8/igt@xe_evict@evict-beng-large.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     [PASS][77] -> [TIMEOUT][78] ([Intel XE#1473] / [Intel XE#402])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-435/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-435/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-dg2-set2:     [PASS][79] -> [TIMEOUT][80] ([Intel XE#1473]) +1 other test timeout
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-small.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict@evict-small-external-cm:
    - shard-adlp:         NOTRUN -> [SKIP][81] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688]) +1 other test skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-adlp-4/igt@xe_evict@evict-small-external-cm.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:
    - shard-adlp:         NOTRUN -> [SKIP][82] ([Intel XE#1201] / [Intel XE#1392]) +2 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-adlp-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm:
    - shard-adlp:         NOTRUN -> [SKIP][83] ([Intel XE#1201] / [Intel XE#288]) +9 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-adlp-8/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html

  * igt@xe_exec_fault_mode@once-rebind:
    - shard-dg2-set2:     NOTRUN -> [SKIP][84] ([Intel XE#1201] / [Intel XE#288]) +5 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-466/igt@xe_exec_fault_mode@once-rebind.html

  * igt@xe_exec_reset@cat-error:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][85] ([Intel XE#358])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-adlp-8/igt@xe_exec_reset@cat-error.html

  * igt@xe_exec_threads@threads-mixed-shared-vm-userptr:
    - shard-adlp:         [PASS][86] -> [INCOMPLETE][87] ([Intel XE#1169] / [Intel XE#1195])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-4/igt@xe_exec_threads@threads-mixed-shared-vm-userptr.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-adlp-6/igt@xe_exec_threads@threads-mixed-shared-vm-userptr.html

  * igt@xe_mmap@small-bar:
    - shard-dg2-set2:     NOTRUN -> [SKIP][88] ([Intel XE#1201] / [Intel XE#512])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-436/igt@xe_mmap@small-bar.html

  * igt@xe_oa@mmio-triggered-reports:
    - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#1201] / [Intel XE#2419])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-436/igt@xe_oa@mmio-triggered-reports.html

  * igt@xe_oa@non-sampling-read-error:
    - shard-adlp:         NOTRUN -> [SKIP][90] ([Intel XE#1201] / [Intel XE#2419]) +2 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-adlp-4/igt@xe_oa@non-sampling-read-error.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-adlp:         NOTRUN -> [SKIP][91] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-adlp-4/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@d3cold-mocs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][92] ([Intel XE#1201] / [Intel XE#2284])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-436/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-adlp:         [PASS][93] -> [ABORT][94] ([Intel XE#1358] / [Intel XE#1794])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-2/igt@xe_pm@s4-multiple-execs.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          [PASS][95] -> [FAIL][96] ([Intel XE#958])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-4/igt@xe_pm_residency@toggle-gt-c6.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-lnl-2/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_query@multigpu-query-engines:
    - shard-adlp:         NOTRUN -> [SKIP][97] ([Intel XE#1201] / [Intel XE#944])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-adlp-4/igt@xe_query@multigpu-query-engines.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x:
    - shard-adlp:         [DMESG-WARN][98] ([Intel XE#2338]) -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-b-hdmi-a-3:
    - {shard-bmg}:        [FAIL][100] ([Intel XE#2436]) -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-b-hdmi-a-3.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-b-hdmi-a-3.html

  * igt@kms_color@ctm-0-75:
    - {shard-bmg}:        [INCOMPLETE][102] -> [PASS][103] +3 other tests pass
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-7/igt@kms_color@ctm-0-75.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-bmg-1/igt@kms_color@ctm-0-75.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - {shard-bmg}:        [SKIP][104] ([Intel XE#2291]) -> [PASS][105] +3 other tests pass
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-bmg-3/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - {shard-bmg}:        [SKIP][106] ([Intel XE#2316]) -> [PASS][107] +2 other tests pass
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-4/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a6-dp4:
    - shard-dg2-set2:     [INCOMPLETE][108] ([Intel XE#1195]) -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a6-dp4.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-466/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a6-dp4.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:
    - shard-adlp:         [FAIL][110] ([Intel XE#1874]) -> [PASS][111] +1 other test pass
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-WARN][112] ([Intel XE#2019]) -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-436/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6.html

  * igt@kms_plane@plane-position-covered:
    - shard-lnl:          [DMESG-FAIL][114] ([Intel XE#324]) -> [PASS][115] +1 other test pass
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-5/igt@kms_plane@plane-position-covered.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-lnl-1/igt@kms_plane@plane-position-covered.html

  * igt@kms_plane@plane-position-covered@pipe-b-plane-1:
    - shard-lnl:          [DMESG-WARN][116] ([Intel XE#324]) -> [PASS][117] +1 other test pass
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-5/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-lnl-1/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - {shard-bmg}:        [SKIP][118] -> [PASS][119]
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-4/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-bmg-3/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][120] ([Intel XE#361]) -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-lnl:          [INCOMPLETE][122] -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-1/igt@kms_pm_backlight@fade-with-suspend.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-lnl-5/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [FAIL][124] ([Intel XE#1430]) -> [PASS][125] +1 other test pass
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-4/igt@kms_pm_dc@dc6-psr.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-lnl:          [FAIL][126] ([Intel XE#2028]) -> [PASS][127] +8 other tests pass
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-1/igt@kms_pm_rpm@system-suspend-modeset.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-lnl-6/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-dg2-set2:     [FAIL][128] ([Intel XE#771] / [Intel XE#899]) -> [PASS][129]
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][130] ([Intel XE#899]) -> [PASS][131]
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html

  * igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-system:
    - shard-lnl:          [FAIL][132] -> [PASS][133]
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-1/igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-system.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-lnl-6/igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-system.html

  * igt@xe_evict@evict-cm-threads-large:
    - shard-dg2-set2:     [INCOMPLETE][134] ([Intel XE#1473] / [Intel XE#392]) -> [PASS][135]
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@xe_evict@evict-cm-threads-large.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-463/igt@xe_evict@evict-cm-threads-large.html

  * igt@xe_evict@evict-threads-large:
    - shard-dg2-set2:     [TIMEOUT][136] ([Intel XE#1473] / [Intel XE#392]) -> [PASS][137]
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-435/igt@xe_evict@evict-threads-large.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-435/igt@xe_evict@evict-threads-large.html

  * igt@xe_exec_compute_mode@many-execqueues-userptr-invalidate:
    - {shard-bmg}:        [DMESG-WARN][138] -> [PASS][139] +6 other tests pass
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-4/igt@xe_exec_compute_mode@many-execqueues-userptr-invalidate.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-bmg-3/igt@xe_exec_compute_mode@many-execqueues-userptr-invalidate.html

  * igt@xe_pm@s2idle-multiple-execs:
    - shard-lnl:          [FAIL][140] ([Intel XE#1924] / [Intel XE#2028]) -> [PASS][141]
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-1/igt@xe_pm@s2idle-multiple-execs.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-lnl-6/igt@xe_pm@s2idle-multiple-execs.html

  * igt@xe_pm@s4-exec-after:
    - shard-adlp:         [ABORT][142] ([Intel XE#1358]) -> [PASS][143]
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-9/igt@xe_pm@s4-exec-after.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-adlp-4/igt@xe_pm@s4-exec-after.html

  
#### Warnings ####

  * igt@core_hotunplug@hotunplug-rescan:
    - shard-dg2-set2:     [SKIP][144] ([Intel XE#1201] / [Intel XE#1885]) -> [SKIP][145] ([Intel XE#1885])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@core_hotunplug@hotunplug-rescan.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-432/igt@core_hotunplug@hotunplug-rescan.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][146] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][147] ([Intel XE#316])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@kms_big_fb@linear-16bpp-rotate-90.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][148] ([Intel XE#316]) -> [SKIP][149] ([Intel XE#1201] / [Intel XE#316]) +3 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-463/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][150] ([Intel XE#610]) -> [SKIP][151] ([Intel XE#1201] / [Intel XE#610])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-463/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg2-set2:     [SKIP][152] ([Intel XE#1124]) -> [SKIP][153] ([Intel XE#1124] / [Intel XE#1201]) +7 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [FAIL][154] ([Intel XE#1231]) -> [DMESG-FAIL][155] ([Intel XE#324]) +4 other tests dmesg-fail
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][156] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][157] ([Intel XE#1124]) +4 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html

  * igt@kms_big_joiner@basic:
    - shard-dg2-set2:     [SKIP][158] ([Intel XE#346]) -> [SKIP][159] ([Intel XE#1201] / [Intel XE#346])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_big_joiner@basic.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-463/igt@kms_big_joiner@basic.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][160] ([Intel XE#2191]) -> [SKIP][161] ([Intel XE#1201] / [Intel XE#2191]) +1 other test skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-463/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][162] ([Intel XE#1201] / [Intel XE#2191]) -> [SKIP][163] ([Intel XE#2191])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][164] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][165] ([Intel XE#367]) +1 other test skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][166] ([Intel XE#367]) -> [SKIP][167] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-463/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][168] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][169] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +17 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-463/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs:
    - shard-dg2-set2:     [SKIP][170] ([Intel XE#1201] / [Intel XE#1252]) -> [SKIP][171] ([Intel XE#1252])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][172] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][173] ([Intel XE#787]) +20 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2-set2:     [SKIP][174] ([Intel XE#787]) -> [SKIP][175] ([Intel XE#1201] / [Intel XE#787]) +62 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-463/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][176] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][177] ([Intel XE#455] / [Intel XE#787]) +5 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-dp-4.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-dp-4.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-dg2-set2:     [SKIP][178] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][179] ([Intel XE#306]) +1 other test skip
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_chamelium_color@ctm-0-50.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-432/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-dg2-set2:     [SKIP][180] ([Intel XE#306]) -> [SKIP][181] ([Intel XE#1201] / [Intel XE#306])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_chamelium_color@ctm-max.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-463/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_edid@vga-edid-read:
    - shard-dg2-set2:     [SKIP][182] ([Intel XE#373]) -> [SKIP][183] ([Intel XE#1201] / [Intel XE#373]) +5 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_chamelium_edid@vga-edid-read.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-433/igt@kms_chamelium_edid@vga-edid-read.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2-set2:     [SKIP][184] ([Intel XE#1201] / [i915#2575]) -> [SKIP][185] ([i915#2575]) +18 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     [SKIP][186] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][187] ([Intel XE#373]) +3 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-set2:     [SKIP][188] ([Intel XE#307]) -> [SKIP][189] ([Intel XE#1201] / [Intel XE#307])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_content_protection@dp-mst-type-0.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-433/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-dg2-set2:     [SKIP][190] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][191] ([Intel XE#308])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-512x170.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-dg2-set2:     [SKIP][192] ([Intel XE#308]) -> [SKIP][193] ([Intel XE#1201] / [Intel XE#308])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_cursor_crc@cursor-random-512x170.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-433/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2-set2:     [SKIP][194] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) -> [SKIP][195] ([Intel XE#2423] / [i915#2575]) +10 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-dg2-set2:     [SKIP][196] ([Intel XE#1201] / [Intel XE#307]) -> [SKIP][197] ([Intel XE#307])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@kms_display_modes@mst-extended-mode-negative.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-432/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][198] ([i915#3804]) -> [SKIP][199] ([Intel XE#1201] / [i915#3804])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-463/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     [SKIP][200] ([Intel XE#701]) -> [SKIP][201] ([Intel XE#1201] / [Intel XE#701])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_feature_discovery@chamelium.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-463/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2-set2:     [SKIP][202] ([Intel XE#1135] / [Intel XE#1201]) -> [SKIP][203] ([Intel XE#1135])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@kms_feature_discovery@psr1.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-432/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [INCOMPLETE][204] ([Intel XE#1195] / [Intel XE#2019]) -> [DMESG-WARN][205] ([Intel XE#2019])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-466/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2-set2:     [SKIP][206] ([i915#5274]) -> [SKIP][207] ([Intel XE#1201] / [i915#5274])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_force_connector_basic@prune-stale-modes.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-463/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][208] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][209] ([Intel XE#651]) +15 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-slowdraw:
    - shard-dg2-set2:     [SKIP][210] ([Intel XE#651]) -> [SKIP][211] ([Intel XE#1201] / [Intel XE#651]) +21 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-slowdraw.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-slowdraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][212] ([Intel XE#1201] / [Intel XE#2351]) -> [SKIP][213] ([Intel XE#2351]) +6 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:
    - shard-dg2-set2:     [SKIP][214] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][215] ([Intel XE#653]) +14 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][216] ([Intel XE#653]) -> [SKIP][217] ([Intel XE#1201] / [Intel XE#653]) +17 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-dg2-set2:     [SKIP][218] ([Intel XE#1201] / [Intel XE#417]) -> [SKIP][219] ([Intel XE#417])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_hdmi_inject@inject-audio.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-432/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2-set2:     [SKIP][220] ([Intel XE#356]) -> [SKIP][221] ([Intel XE#1201] / [Intel XE#356])
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-433/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-dg2-set2:     [SKIP][222] ([Intel XE#455]) -> [SKIP][223] ([Intel XE#1201] / [Intel XE#455]) +15 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_plane_lowres@tiling-y.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-433/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2-set2:     [SKIP][224] ([Intel XE#2318] / [Intel XE#455]) -> [SKIP][225] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) +1 other test skip
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][226] ([Intel XE#2318]) -> [SKIP][227] ([Intel XE#1201] / [Intel XE#2318]) +2 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][228] ([Intel XE#1201] / [Intel XE#2318]) -> [SKIP][229] ([Intel XE#2318]) +2 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][230] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) -> [SKIP][231] ([Intel XE#2318] / [Intel XE#455]) +1 other test skip
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html

  * igt@kms_pm_backlight@fade:
    - shard-dg2-set2:     [SKIP][232] ([Intel XE#1201] / [Intel XE#870]) -> [SKIP][233] ([Intel XE#870])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@kms_pm_backlight@fade.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-432/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     [SKIP][234] ([Intel XE#1201] / [Intel XE#908]) -> [SKIP][235] ([Intel XE#908])
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_pm_dc@dc6-dpms.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-432/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-dg2-set2:     [SKIP][236] ([Intel XE#908]) -> [SKIP][237] ([Intel XE#1201] / [Intel XE#908])
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_pm_dc@deep-pkgc.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-433/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
    - shard-dg2-set2:     [SKIP][238] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][239] ([Intel XE#1489]) +3 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-432/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][240] ([Intel XE#1489]) -> [SKIP][241] ([Intel XE#1201] / [Intel XE#1489]) +1 other test skip
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-463/igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     [SKIP][242] ([Intel XE#1122]) -> [SKIP][243] ([Intel XE#1122] / [Intel XE#1201])
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_psr2_su@page_flip-nv12.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-463/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     [SKIP][244] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][245] ([Intel XE#929]) +6 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@kms_psr@fbc-psr2-primary-render.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-432/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@pr-sprite-blt:
    - shard-dg2-set2:     [SKIP][246] ([Intel XE#929]) -> [SKIP][247] ([Intel XE#1201] / [Intel XE#929]) +10 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_psr@pr-sprite-blt.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-433/igt@kms_psr@pr-sprite-blt.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     [SKIP][248] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][249] ([Intel XE#327])
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-dg2-set2:     [SKIP][250] ([Intel XE#327]) -> [SKIP][251] ([Intel XE#1201] / [Intel XE#327]) +1 other test skip
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-463/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2-set2:     [SKIP][252] ([Intel XE#330]) -> [SKIP][253] ([Intel XE#1201] / [Intel XE#330])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_tv_load_detect@load-detect.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-463/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@flip-dpms:
    - shard-dg2-set2:     [SKIP][254] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][255] ([Intel XE#455]) +4 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@kms_vrr@flip-dpms.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-432/igt@kms_vrr@flip-dpms.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg2-set2:     [SKIP][256] ([Intel XE#1091]) -> [SKIP][257] ([Intel XE#1091] / [Intel XE#1201])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-463/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:
    - shard-dg2-set2:     [SKIP][258] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][259] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-463/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - shard-dg2-set2:     [SKIP][260] ([Intel XE#1126]) -> [SKIP][261] ([Intel XE#1126] / [Intel XE#1201])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0x3fff.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0x3fff.html

  * igt@xe_exec_basic@no-exec-basic-defer-bind:
    - shard-dg2-set2:     [SKIP][262] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][263] ([Intel XE#1130]) +47 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@xe_exec_basic@no-exec-basic-defer-bind.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-432/igt@xe_exec_basic@no-exec-basic-defer-bind.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm:
    - shard-dg2-set2:     [SKIP][264] ([Intel XE#288]) -> [SKIP][265] ([Intel XE#1201] / [Intel XE#288]) +16 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-463/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm.html

  * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
    - shard-dg2-set2:     [SKIP][266] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][267] ([Intel XE#288]) +12 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-432/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-dg2-set2:     [SKIP][268] ([Intel XE#2360]) -> [SKIP][269] ([Intel XE#1201] / [Intel XE#2360])
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-463/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_exec_threads@threads-mixed-shared-vm-userptr:
    - shard-dg2-set2:     [INCOMPLETE][270] ([Intel XE#1169] / [Intel XE#1356]) -> [INCOMPLETE][271] ([Intel XE#1169] / [Intel XE#1195] / [Intel XE#1356])
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@xe_exec_threads@threads-mixed-shared-vm-userptr.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-463/igt@xe_exec_threads@threads-mixed-shared-vm-userptr.html

  * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
    - shard-dg2-set2:     [SKIP][272] ([Intel XE#2419]) -> [SKIP][273] ([Intel XE#1201] / [Intel XE#2419]) +3 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-463/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html

  * igt@xe_oa@polling-small-buf:
    - shard-dg2-set2:     [SKIP][274] ([Intel XE#1201] / [Intel XE#2419]) -> [SKIP][275] ([Intel XE#2419]) +5 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@xe_oa@polling-small-buf.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-432/igt@xe_oa@polling-small-buf.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-dg2-set2:     [SKIP][276] ([Intel XE#979]) -> [SKIP][277] ([Intel XE#1201] / [Intel XE#979])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@xe_pat@pat-index-xehpc.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-463/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][278] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][279] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366])
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@xe_pm@d3cold-basic-exec.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-463/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-dg2-set2:     [SKIP][280] ([Intel XE#944]) -> [SKIP][281] ([Intel XE#1201] / [Intel XE#944]) +1 other test skip
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@xe_query@multigpu-query-invalid-cs-cycles.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-463/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_query@multigpu-query-topology:
    - shard-dg2-set2:     [SKIP][282] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][283] ([Intel XE#944]) +1 other test skip
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@xe_query@multigpu-query-topology.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-432/igt@xe_query@multigpu-query-topology.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151
  [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1365
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1523]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1523
  [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#1924]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1924
  [Intel XE#2019]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019
  [Intel XE#2028]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028
  [Intel XE#2050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2251
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2338]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2338
  [Intel XE#2343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2343
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2419]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419
  [Intel XE#2421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2421
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2436]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/417
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274


Build changes
-------------

  * Linux: xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5 -> xe-pw-136815v1

  IGT_7951: 7951
  xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5: d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5
  xe-pw-136815v1: 136815v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/index.html

--===============2707991732430920484==
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
<tr><td><b>Series:</b></td><td>Release GuC v70.29.2 for LNL, BMG</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136815/">https://patchwork.freedesktop.org/series/136815/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5_full -&gt; xe-pw-136815v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-136815v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-136815v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-136815v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-4/igt@kms_vrr@flip-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-lnl-3/igt@kms_vrr@flip-basic.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@idle-residency-on-exec:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-1/igt@xe_pm_residency@idle-residency-on-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-lnl-4/igt@xe_pm_residency@idle-residency-on-exec.html">TIMEOUT</a> +1 other test timeout</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> +29 other tests skip</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-bmg-1/igt@core_hotunplug@hotrebind-lateclose.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-6/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-bmg-4/igt@kms_cdclk@mode-transition-all-outputs.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-dp-2:</p>
<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-bmg-3/igt@kms_cdclk@mode-transition@pipe-d-dp-2.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-6/igt@kms_content_protection@srm.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-bmg-4/igt@kms_content_protection@srm.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN</a> +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-rebind:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-3/igt@xe_exec_threads@threads-hang-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-bmg-2/igt@xe_exec_threads@threads-hang-rebind.html">INCOMPLETE</a> +2 other tests incomplete</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-136815v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-436/igt@core_hotunplug@hotrebind-lateclose.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2421">Intel XE#2421</a>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotreplug-lateclose:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-9/igt@core_hotunplug@hotreplug-lateclose.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-adlp-2/igt@core_hotunplug@hotreplug-lateclose.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1365">Intel XE#1365</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-lnl-8/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-8/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-adlp-1/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-466/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-adlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-adlp-4/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-436/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-adlp-4/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-adlp-8/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-adlp-4/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-adlp-4/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-adlp-8/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-adlp-4/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-436/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-adlp-4/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-adlp-8/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-adlp-4/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-436/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-5/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-lnl-1/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-adlp-8/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-adlp-8/igt@kms_flip@2x-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-436/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151">Intel XE#1151</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050">Intel XE#2050</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-8/igt@kms_plane@plane-position-hole.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-lnl-2/igt@kms_plane@plane-position-hole.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-b-plane-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-8/igt@kms_plane@plane-position-hole@pipe-b-plane-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-lnl-2/igt@kms_plane@plane-position-hole@pipe-b-plane-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-adlp-8/igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-adlp-8/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-436/igt@kms_psr@fbc-psr2-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-adlp-4/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-adlp-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@accuracy-idle:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-6/igt@kms_vblank@accuracy-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-lnl-3/igt@kms_vblank@accuracy-idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1523">Intel XE#1523</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-adlp-4/igt@xe_ccs@block-multicopy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/488">Intel XE#488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@xe_evict@evict-beng-cm-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-466/igt@xe_evict@evict-beng-cm-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-adlp-8/igt@xe_evict@evict-beng-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-435/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-435/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-adlp-4/igt@xe_evict@evict-small-external-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-adlp-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-adlp-8/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-rebind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-466/igt@xe_exec_fault_mode@once-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cat-error:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-adlp-8/igt@xe_exec_reset@cat-error.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-shared-vm-userptr:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-4/igt@xe_exec_threads@threads-mixed-shared-vm-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-adlp-6/igt@xe_exec_threads@threads-mixed-shared-vm-userptr.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-436/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-436/igt@xe_oa@mmio-triggered-reports.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-sampling-read-error:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-adlp-4/igt@xe_oa@non-sampling-read-error.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-adlp-4/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-436/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-2/igt@xe_pm@s4-multiple-execs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-4/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-lnl-2/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-adlp-4/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2338">Intel XE#2338</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-b-hdmi-a-3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-b-hdmi-a-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436">Intel XE#2436</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-b-hdmi-a-3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-7/igt@kms_color@ctm-0-75.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-bmg-1/igt@kms_color@ctm-0-75.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-bmg-3/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-4/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a6-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-466/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a6-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-436/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-5/igt@kms_plane@plane-position-covered.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-lnl-1/igt@kms_plane@plane-position-covered.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered@pipe-b-plane-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-5/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-lnl-1/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-4/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-bmg-3/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-1/igt@kms_pm_backlight@fade-with-suspend.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-lnl-5/igt@kms_pm_backlight@fade-with-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-4/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-1/igt@kms_pm_rpm@system-suspend-modeset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-lnl-6/igt@kms_pm_rpm@system-suspend-modeset.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-system:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-1/igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-system.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-lnl-6/igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-system.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@xe_evict@evict-cm-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-463/igt@xe_evict@evict-cm-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-435/igt@xe_evict@evict-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-435/igt@xe_evict@evict-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-execqueues-userptr-invalidate:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-4/igt@xe_exec_compute_mode@many-execqueues-userptr-invalidate.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-bmg-3/igt@xe_exec_compute_mode@many-execqueues-userptr-invalidate.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-multiple-execs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-1/igt@xe_pm@s2idle-multiple-execs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1924">Intel XE#1924</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-lnl-6/igt@xe_pm@s2idle-multiple-execs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-9/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-adlp-4/igt@xe_pm@s4-exec-after.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunplug-rescan:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@core_hotunplug@hotunplug-rescan.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-432/igt@core_hotunplug@hotunplug-rescan.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-463/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-463/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +4 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-463/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-463/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-463/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-463/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-463/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-432/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-463/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@vga-edid-read:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_chamelium_edid@vga-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-433/igt@kms_chamelium_edid@vga-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-433/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-433/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-432/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-463/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-463/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-432/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-466/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-463/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/417">Intel XE#417</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-432/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/417">Intel XE#417</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-433/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-433/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-432/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-432/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-433/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-432/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-463/igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-463/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-432/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_psr@pr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-433/igt@kms_psr@pr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-463/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-463/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-432/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-463/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-463/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-basic-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@xe_exec_basic@no-exec-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-432/igt@xe_exec_basic@no-exec-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +47 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-463/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-invalid-userptr-fault:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-432/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-463/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-shared-vm-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@xe_exec_threads@threads-mixed-shared-vm-userptr.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-463/igt@xe_exec_threads@threads-mixed-shared-vm-userptr.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-sample-oa:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-463/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling-small-buf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@xe_oa@polling-small-buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-432/igt@xe_oa@polling-small-buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-463/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-463/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-463/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136815v1/shard-dg2-432/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5 -&gt; xe-pw-136815v1</li>
</ul>
<p>IGT_7951: 7951<br />
  xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5: d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5<br />
  xe-pw-136815v1: 136815v1</p>

</body>
</html>

--===============2707991732430920484==--
