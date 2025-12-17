Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 943D5D68BC2
	for <intel-xe@archiver.kernel.org>; Wed, 17 Dec 2025 22:37:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D58310E075;
	Wed, 17 Dec 2025 22:37:43 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A226B10E075;
 Wed, 17 Dec 2025 22:37:41 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5631405705515481296=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe/xe=5Fsvm=3A_Only_co?=
 =?utf-8?q?unt_unique_pagefaults?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 17 Dec 2025 22:37:41 -0000
Message-ID: <176601106165.97606.7740408268096017499@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251216170200.8714-2-jonathan.cavitt@intel.com>
In-Reply-To: <20251216170200.8714-2-jonathan.cavitt@intel.com>
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

--===============5631405705515481296==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/xe_svm: Only count unique pagefaults
URL   : https://patchwork.freedesktop.org/series/159113/
State : failure

== Summary ==

CI Bug Log - changes from xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41_FULL -> xe-pw-159113v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-159113v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-159113v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-159113v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_pm_residency@idle-residency@gt0:
    - shard-bmg:          NOTRUN -> [FAIL][1] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-2/igt@xe_pm_residency@idle-residency@gt0.html

  
#### Warnings ####

  * igt@xe_pm_residency@idle-residency:
    - shard-bmg:          [SKIP][2] ([Intel XE#6703]) -> [FAIL][3]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@xe_pm_residency@idle-residency.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-2/igt@xe_pm_residency@idle-residency.html

  
Known issues
------------

  Here are the changes found in xe-pw-159113v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#6779])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@core_hotunplug@unbind-rebind.html

  * igt@core_hotunplug@unplug-rescan:
    - shard-bmg:          [PASS][5] -> [SKIP][6] ([Intel XE#6779])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@core_hotunplug@unplug-rescan.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@core_hotunplug@unplug-rescan.html

  * igt@fbdev@eof:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2134])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@fbdev@eof.html

  * igt@intel_hwmon@hwmon-read:
    - shard-bmg:          [PASS][8] -> [SKIP][9] ([Intel XE#5177] / [Intel XE#6703])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@intel_hwmon@hwmon-read.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@intel_hwmon@hwmon-read.html

  * igt@kms_addfb_basic@unused-handle:
    - shard-bmg:          [PASS][10] -> [SKIP][11] ([Intel XE#6703]) +507 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_addfb_basic@unused-handle.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_addfb_basic@unused-handle.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2370])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2327]) +2 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-7/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#610])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-4/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#1124]) +7 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_bw@linear-tiling-4-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#367]) +3 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-7/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2887]) +7 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-4/igt@kms_ccs@bad-rotation-90-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#3432])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2325])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-7/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2252]) +5 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-7/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][22] ([Intel XE#1178]) +2 other tests fail
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-1/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-onscreen-64x21:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2320]) +2 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-64x21.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2321])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-4/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
    - shard-bmg:          [PASS][25] -> [SKIP][26] ([Intel XE#2291]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-2/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_fb_coherency@memset-crc@mmap-offset-wc:
    - shard-bmg:          NOTRUN -> [CRASH][27] ([Intel XE#6706])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-3/igt@kms_fb_coherency@memset-crc@mmap-offset-wc.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#4422])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-7/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#4156]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-7/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#776])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-7/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2372])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-8/igt@kms_feature_discovery@chamelium.html

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2316]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-4/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
    - shard-bmg:          [PASS][33] -> [SKIP][34] ([Intel XE#2316]) +2 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [PASS][35] -> [FAIL][36] ([Intel XE#301]) +1 other test fail
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2293] / [Intel XE#2380]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2293]) +2 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#4141]) +8 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2312]) +4 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2311]) +17 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#6703]) +291 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#6557] / [Intel XE#6703]) +2 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#2313]) +18 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html

  * igt@kms_hdr@bpc-switch@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [ABORT][45] ([Intel XE#6740]) +1 other test abort
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-7/igt@kms_hdr@bpc-switch@pipe-a-dp-2.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#346] / [Intel XE#6590])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-7/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2501])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-8/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2393])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-8/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_pm_rpm@i2c:
    - shard-bmg:          [PASS][49] -> [SKIP][50] ([Intel XE#6693]) +2 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_pm_rpm@i2c.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_pm_rpm@i2c.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-7/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#1406] / [Intel XE#1489]) +5 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-8/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr@psr-basic:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#1406] / [Intel XE#6703]) +4 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_psr@psr-basic.html

  * igt@kms_psr@psr-cursor-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +6 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-8/igt@kms_psr@psr-cursor-plane-onoff.html

  * igt@kms_psr@psr2-primary-render:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#1406] / [Intel XE#2234])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-4/igt@kms_psr@psr2-primary-render.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#3414] / [Intel XE#3904])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2413])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-8/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          [PASS][58] -> [SKIP][59] ([Intel XE#1435]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-8/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_sharpness_filter@filter-scaler-downscale:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#6503])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-4/igt@kms_sharpness_filter@filter-scaler-downscale.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#2450])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-7/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@flip-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#1499]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-8/igt@kms_vrr@flip-suspend.html

  * igt@xe_eudebug@basic-exec-queues:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#4837]) +3 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-8/igt@xe_eudebug@basic-exec-queues.html

  * igt@xe_eudebug_online@stopped-thread:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#4837] / [Intel XE#6665]) +2 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-8/igt@xe_eudebug_online@stopped-thread.html

  * igt@xe_eudebug_sriov@deny-sriov:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#5793])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-4/igt@xe_eudebug_sriov@deny-sriov.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#2322]) +8 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-8/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#6874]) +19 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-8/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem.html

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-new-race:
    - shard-bmg:          [PASS][68] -> [SKIP][69] ([Intel XE#6557] / [Intel XE#6703]) +6 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-7/igt@xe_exec_system_allocator@threads-many-stride-mmap-new-race.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-stride-mmap-new-race.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free-race-nomemset:
    - shard-bmg:          [PASS][70] -> [INCOMPLETE][71] ([Intel XE#6480])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-4/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free-race-nomemset.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-3/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free-race-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#4943]) +9 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-4/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge-nomemset.html

  * igt@xe_live_ktest@xe_bo:
    - shard-bmg:          [PASS][73] -> [SKIP][74] ([Intel XE#2229]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@xe_live_ktest@xe_bo.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@xe_live_ktest@xe_bo.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#2248])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-4/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#2284])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-8/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_decode0:
    - shard-lnl:          [PASS][77] -> [FAIL][78] ([Intel XE#6251]) +1 other test fail
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-lnl-2/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_decode0.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-lnl-1/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_decode0.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#944]) +3 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-7/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  
#### Possible fixes ####

  * igt@fbdev@unaligned-write:
    - shard-bmg:          [SKIP][80] ([Intel XE#2134]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@fbdev@unaligned-write.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-3/igt@fbdev@unaligned-write.html

  * igt@intel_hwmon@hwmon-write:
    - shard-bmg:          [SKIP][82] ([Intel XE#5177] / [Intel XE#6703]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@intel_hwmon@hwmon-write.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-2/igt@intel_hwmon@hwmon-write.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-lnl:          [FAIL][84] ([Intel XE#3718]) -> [PASS][85] +1 other test pass
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-lnl-8/igt@kms_async_flips@alternate-sync-async-flip.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-lnl-2/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_color@ctm-0-75:
    - shard-bmg:          [DMESG-FAIL][86] ([Intel XE#5545]) -> [PASS][87] +1 other test pass
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_color@ctm-0-75.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-2/igt@kms_color@ctm-0-75.html

  * igt@kms_color@ctm-0-75@pipe-d-hdmi-a-3:
    - shard-bmg:          [CRASH][88] -> [PASS][89] +2 other tests pass
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_color@ctm-0-75@pipe-d-hdmi-a-3.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-2/igt@kms_color@ctm-0-75@pipe-d-hdmi-a-3.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][90] ([Intel XE#2291]) -> [PASS][91] +4 other tests pass
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-flip-vs-wf_vblank:
    - shard-bmg:          [SKIP][92] ([Intel XE#6557] / [Intel XE#6703]) -> [PASS][93] +5 other tests pass
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_flip@2x-flip-vs-wf_vblank.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-wf_vblank.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [SKIP][94] ([Intel XE#2316]) -> [PASS][95] +3 other tests pass
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [FAIL][96] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][97] +1 other test pass
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [SKIP][98] ([Intel XE#2482]) -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-4/igt@kms_flip@plain-flip-fb-recreate-interruptible.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-1/igt@kms_flip@plain-flip-fb-recreate-interruptible.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-bmg:          [ABORT][100] ([Intel XE#6740]) -> [PASS][101] +1 other test pass
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-8/igt@kms_hdr@bpc-switch-suspend.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-4/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-bmg:          [SKIP][102] ([Intel XE#4596]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-4.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-bmg:          [SKIP][104] ([Intel XE#6693]) -> [PASS][105] +1 other test pass
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-3/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@testdisplay:
    - shard-bmg:          [ABORT][106] -> [PASS][107]
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@testdisplay.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-2/igt@testdisplay.html

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-free-nomemset:
    - shard-bmg:          [SKIP][108] ([Intel XE#6703]) -> [PASS][109] +280 other tests pass
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@xe_exec_system_allocator@many-large-execqueues-mmap-free-nomemset.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-3/igt@xe_exec_system_allocator@many-large-execqueues-mmap-free-nomemset.html

  * igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_copy0:
    - shard-lnl:          [FAIL][110] ([Intel XE#6251]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-lnl-2/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_copy0.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-lnl-1/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_copy0.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-bmg:          [SKIP][112] ([Intel XE#2233]) -> [SKIP][113] ([Intel XE#6703])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-bmg:          [SKIP][114] ([Intel XE#2327]) -> [SKIP][115] ([Intel XE#6703]) +2 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-7/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-bmg:          [SKIP][116] ([Intel XE#6703]) -> [SKIP][117] ([Intel XE#2327]) +1 other test skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_big_fb@linear-64bpp-rotate-270.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-3/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          [SKIP][118] ([Intel XE#1124]) -> [SKIP][119] ([Intel XE#6703]) +10 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-bmg:          [SKIP][120] ([Intel XE#6703]) -> [SKIP][121] ([Intel XE#1124]) +5 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-bmg:          [SKIP][122] ([Intel XE#6703]) -> [SKIP][123] ([Intel XE#2314] / [Intel XE#2894]) +1 other test skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-2/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-bmg:          [SKIP][124] ([Intel XE#2314] / [Intel XE#2894]) -> [SKIP][125] ([Intel XE#6703]) +1 other test skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-bmg:          [SKIP][126] ([Intel XE#367]) -> [SKIP][127] ([Intel XE#6703]) +1 other test skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-bmg:          [SKIP][128] ([Intel XE#3432]) -> [SKIP][129] ([Intel XE#6703]) +1 other test skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][130] ([Intel XE#2652] / [Intel XE#787]) -> [SKIP][131] ([Intel XE#6703])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
    - shard-bmg:          [SKIP][132] ([Intel XE#6703]) -> [SKIP][133] ([Intel XE#3432])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          [SKIP][134] ([Intel XE#6703]) -> [SKIP][135] ([Intel XE#2887]) +6 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-bmg:          [SKIP][136] ([Intel XE#2887]) -> [SKIP][137] ([Intel XE#6703]) +11 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-bmg:          [SKIP][138] ([Intel XE#2325]) -> [SKIP][139] ([Intel XE#6703]) +3 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_chamelium_color@ctm-0-25.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-bmg:          [SKIP][140] ([Intel XE#6703]) -> [SKIP][141] ([Intel XE#2252]) +3 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_chamelium_frames@hdmi-aspect-ratio.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-3/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_chamelium_hpd@dp-hpd-storm:
    - shard-bmg:          [SKIP][142] ([Intel XE#2252]) -> [SKIP][143] ([Intel XE#6703]) +6 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_chamelium_hpd@dp-hpd-storm.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_chamelium_hpd@dp-hpd-storm.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-bmg:          [SKIP][144] ([Intel XE#6703]) -> [SKIP][145] ([Intel XE#2390])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_content_protection@dp-mst-lic-type-1.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-3/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-suspend-resume:
    - shard-bmg:          [SKIP][146] ([Intel XE#6743]) -> [SKIP][147] ([Intel XE#6703])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_content_protection@dp-mst-suspend-resume.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_content_protection@dp-mst-suspend-resume.html

  * igt@kms_content_protection@lic-type-0:
    - shard-bmg:          [SKIP][148] ([Intel XE#2341]) -> [FAIL][149] ([Intel XE#1178])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_content_protection@lic-type-0.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-1/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@mei-interface:
    - shard-bmg:          [SKIP][150] ([Intel XE#2341]) -> [SKIP][151] ([Intel XE#6703])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-7/igt@kms_content_protection@mei-interface.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@srm@pipe-a-dp-2:
    - shard-bmg:          [TIMEOUT][152] -> [FAIL][153] ([Intel XE#1178]) +1 other test fail
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-4/igt@kms_content_protection@srm@pipe-a-dp-2.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-1/igt@kms_content_protection@srm@pipe-a-dp-2.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          [FAIL][154] ([Intel XE#6707]) -> [SKIP][155] ([Intel XE#6703])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_content_protection@uevent.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-256x85:
    - shard-bmg:          [SKIP][156] ([Intel XE#2320]) -> [SKIP][157] ([Intel XE#6703]) +5 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-256x85.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-256x85.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-bmg:          [SKIP][158] ([Intel XE#2321]) -> [SKIP][159] ([Intel XE#6703]) +1 other test skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-bmg:          [SKIP][160] ([Intel XE#6703]) -> [SKIP][161] ([Intel XE#2320]) +1 other test skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-2/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][162] ([Intel XE#1508]) -> [SKIP][163] ([Intel XE#6703])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dp_aux_dev:
    - shard-bmg:          [SKIP][164] ([Intel XE#6703]) -> [SKIP][165] ([Intel XE#3009])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_dp_aux_dev.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-2/igt@kms_dp_aux_dev.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-bmg:          [SKIP][166] ([Intel XE#4354]) -> [SKIP][167] ([Intel XE#6703]) +1 other test skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_dp_link_training@uhbr-mst.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-bmg:          [SKIP][168] ([Intel XE#2244]) -> [SKIP][169] ([Intel XE#6703])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-7/igt@kms_dsc@dsc-with-bpc-formats.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fb_coherency@memset-crc:
    - shard-bmg:          [SKIP][170] ([Intel XE#6703]) -> [CRASH][171] ([Intel XE#6706])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_fb_coherency@memset-crc.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-3/igt@kms_fb_coherency@memset-crc.html

  * igt@kms_fbcon_fbt@psr:
    - shard-bmg:          [SKIP][172] ([Intel XE#776]) -> [SKIP][173] ([Intel XE#6703])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-7/igt@kms_fbcon_fbt@psr.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-bmg:          [SKIP][174] ([Intel XE#2375]) -> [SKIP][175] ([Intel XE#6703])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_feature_discovery@dp-mst.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-nonexisting-fb-interruptible:
    - shard-bmg:          [SKIP][176] ([Intel XE#2316]) -> [SKIP][177] ([Intel XE#6703])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_flip@2x-nonexisting-fb-interruptible.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_flip@2x-nonexisting-fb-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-bmg:          [SKIP][178] ([Intel XE#6703]) -> [SKIP][179] ([Intel XE#2293] / [Intel XE#2380])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:
    - shard-bmg:          [SKIP][180] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][181] ([Intel XE#6703]) +6 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][182] ([Intel XE#6557] / [Intel XE#6703]) -> [SKIP][183] ([Intel XE#2311])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][184] ([Intel XE#6703]) -> [SKIP][185] ([Intel XE#2311]) +10 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
    - shard-bmg:          [SKIP][186] ([Intel XE#2311]) -> [SKIP][187] ([Intel XE#6703]) +24 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][188] ([Intel XE#6703]) -> [SKIP][189] ([Intel XE#4141]) +4 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][190] ([Intel XE#2312]) -> [SKIP][191] ([Intel XE#4141]) +2 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][192] ([Intel XE#4141]) -> [SKIP][193] ([Intel XE#2312])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-linear:
    - shard-bmg:          [SKIP][194] ([Intel XE#4141]) -> [SKIP][195] ([Intel XE#6703]) +9 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-bmg:          [SKIP][196] ([Intel XE#6703]) -> [SKIP][197] ([Intel XE#2352])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][198] ([Intel XE#2312]) -> [SKIP][199] ([Intel XE#2311]) +10 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][200] ([Intel XE#2311]) -> [SKIP][201] ([Intel XE#2312]) +5 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][202] ([Intel XE#2312]) -> [SKIP][203] ([Intel XE#2313]) +10 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
    - shard-bmg:          [SKIP][204] ([Intel XE#6703]) -> [SKIP][205] ([Intel XE#2313]) +11 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][206] ([Intel XE#2313]) -> [SKIP][207] ([Intel XE#6703]) +20 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][208] ([Intel XE#2313]) -> [SKIP][209] ([Intel XE#6557] / [Intel XE#6703])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][210] ([Intel XE#2313]) -> [SKIP][211] ([Intel XE#2312]) +7 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][212] ([Intel XE#2312]) -> [SKIP][213] ([Intel XE#6703]) +6 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-move.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][214] ([Intel XE#6703]) -> [SKIP][215] ([Intel XE#2312]) +6 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-bmg:          [SKIP][216] ([Intel XE#6703]) -> [SKIP][217] ([Intel XE#2934] / [Intel XE#6590])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_joiner@basic-force-ultra-joiner.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-3/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          [SKIP][218] ([Intel XE#2934] / [Intel XE#6590]) -> [SKIP][219] ([Intel XE#6703])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-bmg:          [SKIP][220] ([Intel XE#2927] / [Intel XE#6590]) -> [SKIP][221] ([Intel XE#6703])
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-bmg:          [SKIP][222] ([Intel XE#4090] / [Intel XE#6590]) -> [SKIP][223] ([Intel XE#6703])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
    - shard-bmg:          [SKIP][224] ([Intel XE#5624]) -> [SKIP][225] ([Intel XE#6703])
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          [SKIP][226] ([Intel XE#6703]) -> [SKIP][227] ([Intel XE#5021])
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-yf.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:
    - shard-bmg:          [SKIP][228] ([Intel XE#6886]) -> [SKIP][229] ([Intel XE#6703])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          [SKIP][230] ([Intel XE#6703]) -> [SKIP][231] ([Intel XE#2938])
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_pm_backlight@brightness-with-dpms.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-2/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-bmg:          [SKIP][232] ([Intel XE#2392]) -> [SKIP][233] ([Intel XE#6703])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_pm_dc@dc5-psr.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-bmg:          [SKIP][234] ([Intel XE#3309]) -> [SKIP][235] ([Intel XE#6703])
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_pm_dc@dc5-retention-flops.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          [SKIP][236] ([Intel XE#1439] / [Intel XE#836]) -> [SKIP][237] ([Intel XE#6693])
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-bmg:          [SKIP][238] ([Intel XE#1406] / [Intel XE#1489]) -> [SKIP][239] ([Intel XE#1406] / [Intel XE#6703]) +4 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-7/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
    - shard-bmg:          [SKIP][240] ([Intel XE#1406] / [Intel XE#6703]) -> [SKIP][241] ([Intel XE#1406] / [Intel XE#1489]) +4 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-2/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-bmg:          [SKIP][242] ([Intel XE#1406] / [Intel XE#2387]) -> [SKIP][243] ([Intel XE#1406] / [Intel XE#6703]) +1 other test skip
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@psr-suspend:
    - shard-bmg:          [SKIP][244] ([Intel XE#1406] / [Intel XE#6703]) -> [SKIP][245] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +5 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_psr@psr-suspend.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-3/igt@kms_psr@psr-suspend.html

  * igt@kms_psr@psr2-no-drrs:
    - shard-bmg:          [SKIP][246] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) -> [SKIP][247] ([Intel XE#1406] / [Intel XE#6703]) +12 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_psr@psr2-no-drrs.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_psr@psr2-no-drrs.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          [SKIP][248] ([Intel XE#1406] / [Intel XE#6703]) -> [SKIP][249] ([Intel XE#1406] / [Intel XE#2414])
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-bmg:          [SKIP][250] ([Intel XE#1406] / [Intel XE#2414]) -> [SKIP][251] ([Intel XE#1406] / [Intel XE#6703])
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-bmg:          [SKIP][252] ([Intel XE#3414] / [Intel XE#3904]) -> [SKIP][253] ([Intel XE#6703]) +1 other test skip
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_rotation_crc@bad-pixel-format.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-bmg:          [SKIP][254] ([Intel XE#6703]) -> [SKIP][255] ([Intel XE#2330])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-bmg:          [SKIP][256] ([Intel XE#6703]) -> [SKIP][257] ([Intel XE#3414] / [Intel XE#3904]) +3 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-3/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-bmg:          [SKIP][258] ([Intel XE#1435]) -> [SKIP][259] ([Intel XE#6703])
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-7/igt@kms_setmode@invalid-clone-exclusive-crtc.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_sharpness_filter@filter-formats:
    - shard-bmg:          [SKIP][260] ([Intel XE#6703]) -> [SKIP][261] ([Intel XE#6503]) +1 other test skip
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_sharpness_filter@filter-formats.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-3/igt@kms_sharpness_filter@filter-formats.html

  * igt@kms_sharpness_filter@invalid-filter-with-plane:
    - shard-bmg:          [SKIP][262] ([Intel XE#6503]) -> [SKIP][263] ([Intel XE#6703]) +2 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-7/igt@kms_sharpness_filter@invalid-filter-with-plane.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_sharpness_filter@invalid-filter-with-plane.html

  * igt@kms_vrr@flip-dpms:
    - shard-bmg:          [SKIP][264] ([Intel XE#1499]) -> [SKIP][265] ([Intel XE#6703])
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_vrr@flip-dpms.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_vrr@flip-dpms.html

  * igt@xe_eudebug@basic-vm-access-faultable:
    - shard-bmg:          [SKIP][266] ([Intel XE#4837]) -> [SKIP][267] ([Intel XE#6703]) +5 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@xe_eudebug@basic-vm-access-faultable.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@xe_eudebug@basic-vm-access-faultable.html

  * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
    - shard-bmg:          [SKIP][268] ([Intel XE#6703]) -> [SKIP][269] ([Intel XE#4837]) +2 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-2/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html

  * igt@xe_eudebug_online@interrupt-reconnect:
    - shard-bmg:          [SKIP][270] ([Intel XE#6703]) -> [SKIP][271] ([Intel XE#4837] / [Intel XE#6665]) +3 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@xe_eudebug_online@interrupt-reconnect.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-3/igt@xe_eudebug_online@interrupt-reconnect.html

  * igt@xe_eudebug_online@pagefault-read-stress:
    - shard-bmg:          [SKIP][272] ([Intel XE#6665] / [Intel XE#6681]) -> [SKIP][273] ([Intel XE#6703])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-7/igt@xe_eudebug_online@pagefault-read-stress.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@xe_eudebug_online@pagefault-read-stress.html

  * igt@xe_eudebug_online@set-breakpoint-sigint-debugger:
    - shard-bmg:          [SKIP][274] ([Intel XE#4837] / [Intel XE#6665]) -> [SKIP][275] ([Intel XE#6703]) +3 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-bmg:          [SKIP][276] ([Intel XE#2322]) -> [SKIP][277] ([Intel XE#6703]) +8 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-no-exec-rebind:
    - shard-bmg:          [SKIP][278] ([Intel XE#6703]) -> [SKIP][279] ([Intel XE#2322]) +3 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-rebind.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-3/igt@xe_exec_basic@multigpu-no-exec-rebind.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-dyn-priority-smem:
    - shard-bmg:          [SKIP][280] ([Intel XE#6703]) -> [SKIP][281] ([Intel XE#6874]) +13 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@xe_exec_multi_queue@few-execs-preempt-mode-dyn-priority-smem.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-3/igt@xe_exec_multi_queue@few-execs-preempt-mode-dyn-priority-smem.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate:
    - shard-bmg:          [SKIP][282] ([Intel XE#6874]) -> [SKIP][283] ([Intel XE#6703]) +27 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate.html

  * igt@xe_exec_system_allocator@many-64k-mmap-free-huge-nomemset:
    - shard-bmg:          [SKIP][284] ([Intel XE#5007]) -> [SKIP][285] ([Intel XE#6703])
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-7/igt@xe_exec_system_allocator@many-64k-mmap-free-huge-nomemset.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@xe_exec_system_allocator@many-64k-mmap-free-huge-nomemset.html

  * igt@xe_exec_system_allocator@many-64k-mmap-new-huge:
    - shard-bmg:          [SKIP][286] ([Intel XE#6703]) -> [SKIP][287] ([Intel XE#5007])
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@xe_exec_system_allocator@many-64k-mmap-new-huge.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-2/igt@xe_exec_system_allocator@many-64k-mmap-new-huge.html

  * igt@xe_exec_system_allocator@many-execqueues-mmap-free-huge:
    - shard-bmg:          [SKIP][288] ([Intel XE#4943]) -> [SKIP][289] ([Intel XE#6703]) +17 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@xe_exec_system_allocator@many-execqueues-mmap-free-huge.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@xe_exec_system_allocator@many-execqueues-mmap-free-huge.html

  * igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset:
    - shard-bmg:          [SKIP][290] ([Intel XE#6703]) -> [SKIP][291] ([Intel XE#4943]) +10 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-3/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-race:
    - shard-bmg:          [SKIP][292] ([Intel XE#6703]) -> [ABORT][293] ([Intel XE#5545])
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-race.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-race.html

  * igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:
    - shard-bmg:          [SKIP][294] ([Intel XE#6281]) -> [SKIP][295] ([Intel XE#6703])
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-7/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-bmg:          [ABORT][296] ([Intel XE#5466]) -> [SKIP][297] ([Intel XE#6703])
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-bmg:          [SKIP][298] ([Intel XE#2236]) -> [SKIP][299] ([Intel XE#6703])
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@xe_pat@pat-index-xelpg.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@d3cold-basic:
    - shard-bmg:          [SKIP][300] ([Intel XE#6703]) -> [SKIP][301] ([Intel XE#2284])
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@xe_pm@d3cold-basic.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-2/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@d3cold-i2c:
    - shard-bmg:          [SKIP][302] ([Intel XE#5694]) -> [SKIP][303] ([Intel XE#6703])
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@xe_pm@d3cold-i2c.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@xe_pm@d3cold-i2c.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:
    - shard-bmg:          [SKIP][304] ([Intel XE#4733]) -> [SKIP][305] ([Intel XE#6703]) +2 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html

  * igt@xe_pxp@pxp-termination-key-update-post-suspend:
    - shard-bmg:          [SKIP][306] ([Intel XE#6703]) -> [SKIP][307] ([Intel XE#4733])
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@xe_pxp@pxp-termination-key-update-post-suspend.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-2/igt@xe_pxp@pxp-termination-key-update-post-suspend.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-bmg:          [SKIP][308] ([Intel XE#6703]) -> [SKIP][309] ([Intel XE#944])
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@xe_query@multigpu-query-cs-cycles.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-3/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-bmg:          [SKIP][310] ([Intel XE#944]) -> [SKIP][311] ([Intel XE#6703]) +2 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@xe_query@multigpu-query-mem-usage.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@xe_query@multigpu-query-mem-usage.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
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
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372
  [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
  [Intel XE#2482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482
  [Intel XE#2501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4090]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5177]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5177
  [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5624]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5624
  [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
  [Intel XE#5793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5793
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#6251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251
  [Intel XE#6281]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281
  [Intel XE#6480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6480
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557
  [Intel XE#6590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6590
  [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
  [Intel XE#6681]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6681
  [Intel XE#6693]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693
  [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
  [Intel XE#6706]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6706
  [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
  [Intel XE#6740]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740
  [Intel XE#6743]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6743
  [Intel XE#6779]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6779
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41 -> xe-pw-159113v1

  IGT_8668: 906681747a312ef11ef9af8ab1fa6eff28b4cbd0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41: 72428bdb20b6c86beaeddb9d69bf698d0697aa41
  xe-pw-159113v1: 159113v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/index.html

--===============5631405705515481296==
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
<tr><td><b>Series:</b></td><td>drm/xe/xe_svm: Only count unique pagefaults</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/159113/">https://patchwork.freedesktop.org/series/159113/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41_FULL -&gt; xe-pw-159113v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-159113v1_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-159113v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-159113v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_pm_residency@idle-residency@gt0:<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-2/igt@xe_pm_residency@idle-residency@gt0.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_pm_residency@idle-residency:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@xe_pm_residency@idle-residency.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-2/igt@xe_pm_residency@idle-residency.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-159113v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@core_hotunplug@unbind-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6779">Intel XE#6779</a>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@unplug-rescan:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@core_hotunplug@unplug-rescan.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@core_hotunplug@unplug-rescan.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6779">Intel XE#6779</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@intel_hwmon@hwmon-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5177">Intel XE#5177</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@unused-handle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_addfb_basic@unused-handle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_addfb_basic@unused-handle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +507 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-7/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-4/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-7/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-4/igt@kms_ccs@bad-rotation-90-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-7/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-7/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-1/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-64x21:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-4/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-2/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fb_coherency@memset-crc@mmap-offset-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-3/igt@kms_fb_coherency@memset-crc@mmap-offset-wc.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6706">Intel XE#6706</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-7/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-7/igt@kms_fbcon_fbt@fbc-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156">Intel XE#4156</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-7/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-8/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372">Intel XE#2372</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-4/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +291 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-7/igt@kms_hdr@bpc-switch@pipe-a-dp-2.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740">Intel XE#6740</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-7/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6590">Intel XE#6590</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-8/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501">Intel XE#2501</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-8/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_pm_rpm@i2c.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_pm_rpm@i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693">Intel XE#6693</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-7/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-8/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_psr@psr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-8/igt@kms_psr@psr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-4/igt@kms_psr@psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-8/igt@kms_scaling_modes@scaling-mode-full-aspect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-8/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-scaler-downscale:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-4/igt@kms_sharpness_filter@filter-scaler-downscale.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-7/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450">Intel XE#2450</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-8/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-exec-queues:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-8/igt@xe_eudebug@basic-exec-queues.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@stopped-thread:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-8/igt@xe_eudebug_online@stopped-thread.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-sriov:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-4/igt@xe_eudebug_sriov@deny-sriov.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5793">Intel XE#5793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-8/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-8/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-new-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-7/igt@xe_exec_system_allocator@threads-many-stride-mmap-new-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-stride-mmap-new-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free-race-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-4/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free-race-nomemset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-3/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free-race-nomemset.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6480">Intel XE#6480</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-4/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-4/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248">Intel XE#2248</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-8/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_decode0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-lnl-2/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_decode0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-lnl-1/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_decode0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251">Intel XE#6251</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-7/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +3 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@unaligned-write:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@fbdev@unaligned-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-3/igt@fbdev@unaligned-write.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@intel_hwmon@hwmon-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5177">Intel XE#5177</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-2/igt@intel_hwmon@hwmon-write.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-lnl-8/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-lnl-2/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_color@ctm-0-75.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-2/igt@kms_color@ctm-0-75.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_color@ctm-0-75@pipe-d-hdmi-a-3.html">CRASH</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-2/igt@kms_color@ctm-0-75@pipe-d-hdmi-a-3.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_flip@2x-flip-vs-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-wf_vblank.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-4/igt@kms_flip@plain-flip-fb-recreate-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482">Intel XE#2482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-1/igt@kms_flip@plain-flip-fb-recreate-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-8/igt@kms_hdr@bpc-switch-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740">Intel XE#6740</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-4/igt@kms_hdr@bpc-switch-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693">Intel XE#6693</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-3/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@testdisplay.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-2/igt@testdisplay.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-free-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@xe_exec_system_allocator@many-large-execqueues-mmap-free-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-3/igt@xe_exec_system_allocator@many-large-execqueues-mmap-free-nomemset.html">PASS</a> +280 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_copy0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-lnl-2/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_copy0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251">Intel XE#6251</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-lnl-1/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_copy0.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233">Intel XE#2233</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-7/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-3/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-2/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-3/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_chamelium_hpd@dp-hpd-storm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_chamelium_hpd@dp-hpd-storm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-3/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-suspend-resume:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_content_protection@dp-mst-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6743">Intel XE#6743</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_content_protection@dp-mst-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-1/igt@kms_content_protection@lic-type-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-7/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-4/igt@kms_content_protection@srm@pipe-a-dp-2.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-1/igt@kms_content_protection@srm@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707">Intel XE#6707</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-256x85:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-2/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_dp_aux_dev.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-2/igt@kms_dp_aux_dev.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Intel XE#3009</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-7/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fb_coherency@memset-crc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_fb_coherency@memset-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-3/igt@kms_fb_coherency@memset-crc.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6706">Intel XE#6706</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-7/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375">Intel XE#2375</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_flip@2x-nonexisting-fb-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_flip@2x-nonexisting-fb-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-linear:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-3/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934">Intel XE#2934</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6590">Intel XE#6590</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934">Intel XE#2934</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6590">Intel XE#6590</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6590">Intel XE#6590</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090">Intel XE#4090</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6590">Intel XE#6590</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5624">Intel XE#5624</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-2/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392">Intel XE#2392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309">Intel XE#3309</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693">Intel XE#6693</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-7/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-2/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_psr@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-3/igt@kms_psr@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-no-drrs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_psr@psr2-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_psr@psr2-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-3/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-7/igt@kms_setmode@invalid-clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_setmode@invalid-clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-formats:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_sharpness_filter@filter-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-3/igt@kms_sharpness_filter@filter-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-plane:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-7/igt@kms_sharpness_filter@invalid-filter-with-plane.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_sharpness_filter@invalid-filter-with-plane.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-faultable:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@xe_eudebug@basic-vm-access-faultable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@xe_eudebug@basic-vm-access-faultable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-metadata-discovery:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-2/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-reconnect:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@xe_eudebug_online@interrupt-reconnect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-3/igt@xe_eudebug_online@interrupt-reconnect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@pagefault-read-stress:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-7/igt@xe_eudebug_online@pagefault-read-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6681">Intel XE#6681</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@xe_eudebug_online@pagefault-read-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint-sigint-debugger:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-3/igt@xe_exec_basic@multigpu-no-exec-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-dyn-priority-smem:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@xe_exec_multi_queue@few-execs-preempt-mode-dyn-priority-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-3/igt@xe_exec_multi_queue@few-execs-preempt-mode-dyn-priority-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-free-huge-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-7/igt@xe_exec_system_allocator@many-64k-mmap-free-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007">Intel XE#5007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@xe_exec_system_allocator@many-64k-mmap-free-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-new-huge:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@xe_exec_system_allocator@many-64k-mmap-new-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-2/igt@xe_exec_system_allocator@many-64k-mmap-new-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007">Intel XE#5007</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-free-huge:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@xe_exec_system_allocator@many-execqueues-mmap-free-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@xe_exec_system_allocator@many-execqueues-mmap-free-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-3/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-race.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-7/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281">Intel XE#6281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466">Intel XE#5466</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-2/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-i2c:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@xe_pm@d3cold-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694">Intel XE#5694</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@xe_pm@d3cold-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@xe_pxp@pxp-termination-key-update-post-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-2/igt@xe_pxp@pxp-termination-key-update-post-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-3/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159113v1/shard-bmg-5/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41 -&gt; xe-pw-159113v1</li>
</ul>
<p>IGT_8668: 906681747a312ef11ef9af8ab1fa6eff28b4cbd0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41: 72428bdb20b6c86beaeddb9d69bf698d0697aa41<br />
  xe-pw-159113v1: 159113v1</p>

</body>
</html>

--===============5631405705515481296==--
