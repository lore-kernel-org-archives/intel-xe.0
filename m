Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1649D65C63
	for <intel-xe@archiver.kernel.org>; Wed, 17 Dec 2025 21:57:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E01810E925;
	Wed, 17 Dec 2025 21:57:18 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 530C310E924;
 Wed, 17 Dec 2025 21:57:16 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5779047237110975637=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_AuxCCS_handling_and_render?=
 =?utf-8?q?_compression_modifiers?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 17 Dec 2025 21:57:16 -0000
Message-ID: <176600863632.98733.6806602253358812927@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251216153805.96056-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20251216153805.96056-1-tvrtko.ursulin@igalia.com>
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

--===============5779047237110975637==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: AuxCCS handling and render compression modifiers
URL   : https://patchwork.freedesktop.org/series/159112/
State : failure

== Summary ==

CI Bug Log - changes from xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41_FULL -> xe-pw-159112v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-159112v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-159112v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-159112v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@core_setmaster@master-drop-set-root:
    - shard-bmg:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@core_setmaster@master-drop-set-root.html

  * igt@core_setmaster@master-drop-set-shared-fd:
    - shard-bmg:          [PASS][2] -> [SKIP][3]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-7/igt@core_setmaster@master-drop-set-shared-fd.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@core_setmaster@master-drop-set-shared-fd.html

  
Known issues
------------

  Here are the changes found in xe-pw-159112v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotunplug-rescan:
    - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#6779]) +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@core_hotunplug@hotunplug-rescan.html

  * igt@core_hotunplug@unplug-rescan:
    - shard-bmg:          [PASS][5] -> [SKIP][6] ([Intel XE#6779])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@core_hotunplug@unplug-rescan.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@core_hotunplug@unplug-rescan.html

  * igt@fbdev@eof:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2134])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@fbdev@eof.html

  * igt@intel_hwmon@hwmon-read:
    - shard-bmg:          [PASS][8] -> [SKIP][9] ([Intel XE#5177] / [Intel XE#6703])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@intel_hwmon@hwmon-read.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@intel_hwmon@hwmon-read.html

  * igt@kms_addfb_basic@unused-handle:
    - shard-bmg:          [PASS][10] -> [SKIP][11] ([Intel XE#6703]) +506 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_addfb_basic@unused-handle.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@kms_addfb_basic@unused-handle.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2370])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2327]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-7/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#1124]) +7 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_bw@linear-tiling-4-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#367]) +2 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-7/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2652] / [Intel XE#787]) +8 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-3/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#3432])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2887]) +6 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-3/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2325]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-7/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2252]) +3 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-7/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][21] ([Intel XE#1178]) +1 other test fail
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-7/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-onscreen-64x21:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2320]) +3 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-64x21.html

  * igt@kms_cursor_crc@cursor-sliding-256x256:
    - shard-bmg:          [PASS][23] -> [FAIL][24] ([Intel XE#6747]) +1 other test fail
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-256x256.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-256x256.html

  * igt@kms_fb_coherency@memset-crc@mmap-offset-wc:
    - shard-bmg:          NOTRUN -> [CRASH][25] ([Intel XE#6706])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-2/igt@kms_fb_coherency@memset-crc@mmap-offset-wc.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#4422])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-7/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#4156])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-7/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-lnl:          [PASS][28] -> [FAIL][29] ([Intel XE#6831])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-lnl-7/igt@kms_fbcon_fbt@psr-suspend.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-lnl-3/igt@kms_fbcon_fbt@psr-suspend.html
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#776])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-7/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2372])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-3/igt@kms_feature_discovery@chamelium.html

  * igt@kms_flip@flip-vs-panning-interruptible@b-hdmi-a3:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][32] ([Intel XE#5545])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-2/igt@kms_flip@flip-vs-panning-interruptible@b-hdmi-a3.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2293] / [Intel XE#2380]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#2293]) +6 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#4141]) +8 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2311]) +16 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#6703]) +495 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2313]) +19 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html

  * igt@kms_hdr@bpc-switch@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [ABORT][39] ([Intel XE#6740]) +3 other tests abort
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-7/igt@kms_hdr@bpc-switch@pipe-a-dp-2.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#346] / [Intel XE#6590])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-7/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2501])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-3/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2393])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-3/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#6886]) +3 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#6693])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@i2c:
    - shard-bmg:          [PASS][45] -> [SKIP][46] ([Intel XE#6693]) +2 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_pm_rpm@i2c.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@kms_pm_rpm@i2c.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-7/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#1406] / [Intel XE#6703]) +9 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#1406] / [Intel XE#1489]) +7 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-3/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr@psr-cursor-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +5 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-3/igt@kms_psr@psr-cursor-plane-onoff.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2413])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-3/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#2450])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-7/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@flip-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#1499])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-3/igt@kms_vrr@flip-suspend.html

  * igt@kms_vrr@lobf:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#2168])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-3/igt@kms_vrr@lobf.html

  * igt@xe_create@invalid-pad:
    - shard-bmg:          [PASS][55] -> [SKIP][56] ([Intel XE#6557] / [Intel XE#6703]) +5 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@xe_create@invalid-pad.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@xe_create@invalid-pad.html

  * igt@xe_eudebug@basic-exec-queues:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#4837]) +3 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-3/igt@xe_eudebug@basic-exec-queues.html

  * igt@xe_eudebug_online@stopped-thread:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#4837] / [Intel XE#6665]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-3/igt@xe_eudebug_online@stopped-thread.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2322]) +4 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-3/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#6874]) +14 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-3/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem.html

  * igt@xe_exec_system_allocator@once-mmap-race-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#6557] / [Intel XE#6703]) +5 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@xe_exec_system_allocator@once-mmap-race-nomemset.html

  * igt@xe_exec_system_allocator@threads-many-large-mmap-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#4943]) +9 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-3/igt@xe_exec_system_allocator@threads-many-large-mmap-huge-nomemset.html

  * igt@xe_live_ktest@xe_bo:
    - shard-bmg:          [PASS][63] -> [SKIP][64] ([Intel XE#2229]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@xe_live_ktest@xe_bo.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@xe_live_ktest@xe_bo.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#2284])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-3/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#579])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-3/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pmu@engine-activity-accuracy-50:
    - shard-lnl:          [PASS][67] -> [FAIL][68] ([Intel XE#6251]) +4 other tests fail
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-lnl-7/igt@xe_pmu@engine-activity-accuracy-50.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-lnl-3/igt@xe_pmu@engine-activity-accuracy-50.html

  * igt@xe_pxp@pxp-termination-key-update-post-termination-irq:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#4733])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-3/igt@xe_pxp@pxp-termination-key-update-post-termination-irq.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#944]) +2 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-7/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotreplug:
    - shard-bmg:          [SKIP][71] ([Intel XE#6779]) -> [PASS][72] +1 other test pass
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@core_hotunplug@hotreplug.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-3/igt@core_hotunplug@hotreplug.html

  * igt@core_setmaster@master-drop-set-user:
    - shard-bmg:          [FAIL][73] ([Intel XE#4674]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@core_setmaster@master-drop-set-user.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-7/igt@core_setmaster@master-drop-set-user.html

  * igt@fbdev@unaligned-write:
    - shard-bmg:          [SKIP][75] ([Intel XE#2134]) -> [PASS][76] +1 other test pass
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@fbdev@unaligned-write.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-2/igt@fbdev@unaligned-write.html

  * igt@intel_hwmon@hwmon-write:
    - shard-bmg:          [SKIP][77] ([Intel XE#5177] / [Intel XE#6703]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@intel_hwmon@hwmon-write.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-2/igt@intel_hwmon@hwmon-write.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-lnl:          [FAIL][79] ([Intel XE#3718]) -> [PASS][80] +1 other test pass
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-lnl-8/igt@kms_async_flips@alternate-sync-async-flip.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-lnl-1/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_color@ctm-0-75:
    - shard-bmg:          [DMESG-FAIL][81] ([Intel XE#5545]) -> [PASS][82] +1 other test pass
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_color@ctm-0-75.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-2/igt@kms_color@ctm-0-75.html

  * igt@kms_color@ctm-0-75@pipe-d-hdmi-a-3:
    - shard-bmg:          [CRASH][83] -> [PASS][84] +2 other tests pass
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_color@ctm-0-75@pipe-d-hdmi-a-3.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-2/igt@kms_color@ctm-0-75@pipe-d-hdmi-a-3.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][85] ([Intel XE#2291]) -> [PASS][86] +2 other tests pass
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_feature_discovery@display-1x:
    - shard-bmg:          [SKIP][87] ([Intel XE#6557] / [Intel XE#6703]) -> [PASS][88] +8 other tests pass
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_feature_discovery@display-1x.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-7/igt@kms_feature_discovery@display-1x.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-bmg:          [SKIP][89] ([Intel XE#2316]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-4/igt@kms_flip@2x-blocking-wf_vblank.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-4/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [FAIL][91] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][92] +1 other test pass
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip@wf_vblank-ts-check:
    - shard-bmg:          [SKIP][93] ([Intel XE#6703]) -> [PASS][94] +690 other tests pass
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_flip@wf_vblank-ts-check.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-3/igt@kms_flip@wf_vblank-ts-check.html

  * igt@kms_pm_rpm@universal-planes-dpms:
    - shard-bmg:          [SKIP][95] ([Intel XE#6693]) -> [PASS][96] +4 other tests pass
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_pm_rpm@universal-planes-dpms.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-7/igt@kms_pm_rpm@universal-planes-dpms.html

  * igt@xe_module_load@many-reload:
    - shard-bmg:          [FAIL][97] -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@xe_module_load@many-reload.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-7/igt@xe_module_load@many-reload.html

  * igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0:
    - shard-lnl:          [FAIL][99] ([Intel XE#6251]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-lnl-2/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-lnl-5/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-bmg:          [SKIP][101] ([Intel XE#2233]) -> [SKIP][102] ([Intel XE#6703])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-bmg:          [SKIP][103] ([Intel XE#6703]) -> [SKIP][104] ([Intel XE#2327]) +4 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-7/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-bmg:          [SKIP][105] ([Intel XE#2327]) -> [SKIP][106] ([Intel XE#6703])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-bmg:          [SKIP][107] ([Intel XE#6703]) -> [SKIP][108] ([Intel XE#1124]) +10 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-7/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-bmg:          [SKIP][109] ([Intel XE#6703]) -> [SKIP][110] ([Intel XE#607])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-7/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-bmg:          [SKIP][111] ([Intel XE#6703]) -> [SKIP][112] ([Intel XE#610])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-4/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          [SKIP][113] ([Intel XE#1124]) -> [SKIP][114] ([Intel XE#6703]) +10 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-bmg:          [SKIP][115] ([Intel XE#6703]) -> [SKIP][116] ([Intel XE#2314] / [Intel XE#2894]) +2 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-7/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-bmg:          [SKIP][117] ([Intel XE#2314] / [Intel XE#2894]) -> [SKIP][118] ([Intel XE#6703])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
    - shard-bmg:          [SKIP][119] ([Intel XE#6703]) -> [SKIP][120] ([Intel XE#367]) +1 other test skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-3/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-bmg:          [SKIP][121] ([Intel XE#367]) -> [SKIP][122] ([Intel XE#6703]) +2 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs:
    - shard-bmg:          [SKIP][123] ([Intel XE#6557] / [Intel XE#6703]) -> [SKIP][124] ([Intel XE#2887])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-4/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-bmg:          [SKIP][125] ([Intel XE#3432]) -> [SKIP][126] ([Intel XE#6703])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][127] ([Intel XE#2652] / [Intel XE#787]) -> [SKIP][128] ([Intel XE#6703])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-bmg:          [SKIP][129] ([Intel XE#6703]) -> [SKIP][130] ([Intel XE#3432]) +4 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          [SKIP][131] ([Intel XE#6703]) -> [SKIP][132] ([Intel XE#2887]) +13 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-bmg:          [SKIP][133] ([Intel XE#2887]) -> [SKIP][134] ([Intel XE#6703]) +12 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-bmg:          [SKIP][135] ([Intel XE#2325]) -> [SKIP][136] ([Intel XE#6703]) +3 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_chamelium_color@ctm-0-25.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-bmg:          [SKIP][137] ([Intel XE#6703]) -> [SKIP][138] ([Intel XE#2325])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_chamelium_color@ctm-negative.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-4/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-bmg:          [SKIP][139] ([Intel XE#6703]) -> [SKIP][140] ([Intel XE#2252]) +12 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_chamelium_frames@hdmi-aspect-ratio.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-2/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_chamelium_hpd@dp-hpd-storm:
    - shard-bmg:          [SKIP][141] ([Intel XE#2252]) -> [SKIP][142] ([Intel XE#6703]) +8 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_chamelium_hpd@dp-hpd-storm.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@kms_chamelium_hpd@dp-hpd-storm.html

  * igt@kms_content_protection@content-type-change:
    - shard-bmg:          [SKIP][143] ([Intel XE#6703]) -> [SKIP][144] ([Intel XE#2341]) +1 other test skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_content_protection@content-type-change.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-4/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-bmg:          [SKIP][145] ([Intel XE#6703]) -> [SKIP][146] ([Intel XE#2390]) +1 other test skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_content_protection@dp-mst-lic-type-1.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-2/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-suspend-resume:
    - shard-bmg:          [SKIP][147] ([Intel XE#6743]) -> [SKIP][148] ([Intel XE#6703])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_content_protection@dp-mst-suspend-resume.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@kms_content_protection@dp-mst-suspend-resume.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          [FAIL][149] ([Intel XE#6707]) -> [SKIP][150] ([Intel XE#6703])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_content_protection@uevent.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-bmg:          [SKIP][151] ([Intel XE#6703]) -> [SKIP][152] ([Intel XE#2320]) +4 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-128x42.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-4/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-bmg:          [SKIP][153] ([Intel XE#2320]) -> [SKIP][154] ([Intel XE#6703]) +6 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-7/igt@kms_cursor_crc@cursor-random-32x32.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-bmg:          [SKIP][155] ([Intel XE#6703]) -> [SKIP][156] ([Intel XE#2321])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_cursor_crc@cursor-random-512x170.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-7/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-256x85:
    - shard-bmg:          [SKIP][157] ([Intel XE#6557] / [Intel XE#6703]) -> [SKIP][158] ([Intel XE#2320])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-3/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-bmg:          [SKIP][159] ([Intel XE#2321]) -> [SKIP][160] ([Intel XE#6703])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][161] ([Intel XE#1508]) -> [SKIP][162] ([Intel XE#6703])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dp_aux_dev:
    - shard-bmg:          [SKIP][163] ([Intel XE#6703]) -> [SKIP][164] ([Intel XE#3009])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_dp_aux_dev.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-2/igt@kms_dp_aux_dev.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-bmg:          [SKIP][165] ([Intel XE#4354]) -> [SKIP][166] ([Intel XE#6703]) +1 other test skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_dp_link_training@uhbr-mst.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-bmg:          [SKIP][167] ([Intel XE#6703]) -> [SKIP][168] ([Intel XE#2244]) +1 other test skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_dsc@dsc-with-bpc.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-4/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_fb_coherency@memset-crc:
    - shard-bmg:          [SKIP][169] ([Intel XE#6703]) -> [CRASH][170] ([Intel XE#6706])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_fb_coherency@memset-crc.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-2/igt@kms_fb_coherency@memset-crc.html

  * igt@kms_feature_discovery@display-4x:
    - shard-bmg:          [SKIP][171] ([Intel XE#1138]) -> [SKIP][172] ([Intel XE#6703])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-7/igt@kms_feature_discovery@display-4x.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-bmg:          [SKIP][173] ([Intel XE#2375]) -> [SKIP][174] ([Intel XE#6703])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_feature_discovery@dp-mst.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-flip-vs-wf_vblank:
    - shard-bmg:          [SKIP][175] ([Intel XE#6557] / [Intel XE#6703]) -> [SKIP][176] ([Intel XE#2316])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_flip@2x-flip-vs-wf_vblank.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-wf_vblank.html

  * igt@kms_flip@2x-nonexisting-fb-interruptible:
    - shard-bmg:          [SKIP][177] ([Intel XE#2316]) -> [SKIP][178] ([Intel XE#6703])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_flip@2x-nonexisting-fb-interruptible.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@kms_flip@2x-nonexisting-fb-interruptible.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-bmg:          [SKIP][179] ([Intel XE#6703]) -> [SKIP][180] ([Intel XE#2316])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_flip@2x-wf_vblank-ts-check.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-2/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@flip-vs-panning-interruptible:
    - shard-bmg:          [SKIP][181] ([Intel XE#6703]) -> [DMESG-FAIL][182] ([Intel XE#5545])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_flip@flip-vs-panning-interruptible.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-2/igt@kms_flip@flip-vs-panning-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
    - shard-bmg:          [SKIP][183] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][184] ([Intel XE#6703]) +5 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
    - shard-bmg:          [SKIP][185] ([Intel XE#6703]) -> [SKIP][186] ([Intel XE#2293] / [Intel XE#2380]) +4 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][187] ([Intel XE#6703]) -> [SKIP][188] ([Intel XE#2311]) +28 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][189] ([Intel XE#6557] / [Intel XE#6703]) -> [SKIP][190] ([Intel XE#2311]) +1 other test skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
    - shard-bmg:          [SKIP][191] ([Intel XE#2311]) -> [SKIP][192] ([Intel XE#6703]) +23 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt:
    - shard-bmg:          [SKIP][193] ([Intel XE#6703]) -> [SKIP][194] ([Intel XE#4141]) +13 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][195] ([Intel XE#2312]) -> [SKIP][196] ([Intel XE#4141])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][197] ([Intel XE#4141]) -> [SKIP][198] ([Intel XE#6703]) +8 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][199] ([Intel XE#2312]) -> [SKIP][200] ([Intel XE#2311]) +3 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-msflip-blt.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][201] ([Intel XE#6703]) -> [SKIP][202] ([Intel XE#2312]) +13 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-blt.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-bmg:          [SKIP][203] ([Intel XE#6703]) -> [SKIP][204] ([Intel XE#2352]) +1 other test skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][205] ([Intel XE#2312]) -> [SKIP][206] ([Intel XE#2313]) +3 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-bmg:          [SKIP][207] ([Intel XE#2352]) -> [SKIP][208] ([Intel XE#6703])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][209] ([Intel XE#2313]) -> [SKIP][210] ([Intel XE#6557] / [Intel XE#6703])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][211] ([Intel XE#2313]) -> [SKIP][212] ([Intel XE#6703]) +21 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][213] ([Intel XE#2312]) -> [SKIP][214] ([Intel XE#6703]) +6 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-move.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][215] ([Intel XE#6703]) -> [SKIP][216] ([Intel XE#2313]) +27 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-bmg:          [SKIP][217] ([Intel XE#6703]) -> [SKIP][218] ([Intel XE#2934] / [Intel XE#6590])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_joiner@basic-force-ultra-joiner.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-2/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          [SKIP][219] ([Intel XE#2934] / [Intel XE#6590]) -> [SKIP][220] ([Intel XE#6703])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-bmg:          [SKIP][221] ([Intel XE#2927] / [Intel XE#6590]) -> [SKIP][222] ([Intel XE#6703])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-bmg:          [SKIP][223] ([Intel XE#4090] / [Intel XE#6590]) -> [SKIP][224] ([Intel XE#6703])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
    - shard-bmg:          [SKIP][225] ([Intel XE#5624]) -> [SKIP][226] ([Intel XE#6703])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][227] ([Intel XE#6703]) -> [SKIP][228] ([Intel XE#5021])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-y.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          [SKIP][229] ([Intel XE#6703]) -> [SKIP][230] ([Intel XE#4596])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-yf.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-bmg:          [SKIP][231] ([Intel XE#5020]) -> [SKIP][232] ([Intel XE#6703])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-7/igt@kms_plane_multiple@tiling-y.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          [SKIP][233] ([Intel XE#6703]) -> [SKIP][234] ([Intel XE#5020])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_plane_multiple@tiling-yf.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-7/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:
    - shard-bmg:          [SKIP][235] ([Intel XE#6886]) -> [SKIP][236] ([Intel XE#6703]) +1 other test skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
    - shard-bmg:          [SKIP][237] ([Intel XE#6703]) -> [SKIP][238] ([Intel XE#6886])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          [SKIP][239] ([Intel XE#6703]) -> [SKIP][240] ([Intel XE#2938])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_pm_backlight@brightness-with-dpms.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-2/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-bmg:          [SKIP][241] ([Intel XE#2392]) -> [SKIP][242] ([Intel XE#6703])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_pm_dc@dc5-psr.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-bmg:          [SKIP][243] ([Intel XE#3309]) -> [SKIP][244] ([Intel XE#6703])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_pm_dc@dc5-retention-flops.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-bmg:          [SKIP][245] ([Intel XE#6703]) -> [SKIP][246] ([Intel XE#2499])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_pm_lpsp@kms-lpsp.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-3/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          [SKIP][247] ([Intel XE#1439] / [Intel XE#836]) -> [SKIP][248] ([Intel XE#6693])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-bmg:          [SKIP][249] ([Intel XE#1406] / [Intel XE#1489]) -> [SKIP][250] ([Intel XE#1406] / [Intel XE#6703]) +5 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-bmg:          [SKIP][251] ([Intel XE#1406] / [Intel XE#6703]) -> [SKIP][252] ([Intel XE#1406] / [Intel XE#1489]) +9 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-4/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-bmg:          [SKIP][253] ([Intel XE#1406] / [Intel XE#2387]) -> [SKIP][254] ([Intel XE#1406] / [Intel XE#6703]) +1 other test skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@psr-suspend:
    - shard-bmg:          [SKIP][255] ([Intel XE#1406] / [Intel XE#6703]) -> [SKIP][256] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +14 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_psr@psr-suspend.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-2/igt@kms_psr@psr-suspend.html

  * igt@kms_psr@psr2-no-drrs:
    - shard-bmg:          [SKIP][257] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) -> [SKIP][258] ([Intel XE#1406] / [Intel XE#6703]) +11 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_psr@psr2-no-drrs.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@kms_psr@psr2-no-drrs.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          [SKIP][259] ([Intel XE#1406] / [Intel XE#6703]) -> [SKIP][260] ([Intel XE#1406] / [Intel XE#2414])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-bmg:          [SKIP][261] ([Intel XE#1406] / [Intel XE#2414]) -> [SKIP][262] ([Intel XE#1406] / [Intel XE#6703])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-bmg:          [SKIP][263] ([Intel XE#3414] / [Intel XE#3904]) -> [SKIP][264] ([Intel XE#6703]) +1 other test skip
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_rotation_crc@bad-pixel-format.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-bmg:          [SKIP][265] ([Intel XE#6703]) -> [SKIP][266] ([Intel XE#2330]) +1 other test skip
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-bmg:          [SKIP][267] ([Intel XE#6703]) -> [SKIP][268] ([Intel XE#3414] / [Intel XE#3904]) +4 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_rotation_crc@sprite-rotation-90.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-4/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_sharpness_filter@filter-formats:
    - shard-bmg:          [SKIP][269] ([Intel XE#6703]) -> [SKIP][270] ([Intel XE#6503]) +4 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_sharpness_filter@filter-formats.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-2/igt@kms_sharpness_filter@filter-formats.html

  * igt@kms_sharpness_filter@filter-tap:
    - shard-bmg:          [SKIP][271] ([Intel XE#6503]) -> [SKIP][272] ([Intel XE#6703]) +1 other test skip
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_sharpness_filter@filter-tap.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@kms_sharpness_filter@filter-tap.html

  * igt@kms_vrr@cmrr:
    - shard-bmg:          [SKIP][273] ([Intel XE#6703]) -> [SKIP][274] ([Intel XE#2168])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_vrr@cmrr.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-7/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@flip-dpms:
    - shard-bmg:          [SKIP][275] ([Intel XE#1499]) -> [SKIP][276] ([Intel XE#6703])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_vrr@flip-dpms.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@negative-basic:
    - shard-bmg:          [SKIP][277] ([Intel XE#6703]) -> [SKIP][278] ([Intel XE#1499]) +1 other test skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_vrr@negative-basic.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-2/igt@kms_vrr@negative-basic.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-bmg:          [SKIP][279] ([Intel XE#6703]) -> [SKIP][280] ([Intel XE#6599])
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@xe_compute@ccs-mode-compute-kernel.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-4/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_eudebug@basic-vm-bind-extended:
    - shard-bmg:          [SKIP][281] ([Intel XE#4837]) -> [SKIP][282] ([Intel XE#6703]) +5 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-7/igt@xe_eudebug@basic-vm-bind-extended.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@xe_eudebug@basic-vm-bind-extended.html

  * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
    - shard-bmg:          [SKIP][283] ([Intel XE#6703]) -> [SKIP][284] ([Intel XE#4837]) +9 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-2/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html

  * igt@xe_eudebug_online@breakpoint-many-sessions-single-tile:
    - shard-bmg:          [SKIP][285] ([Intel XE#6703]) -> [SKIP][286] ([Intel XE#4837] / [Intel XE#6665]) +7 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@xe_eudebug_online@breakpoint-many-sessions-single-tile.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-3/igt@xe_eudebug_online@breakpoint-many-sessions-single-tile.html

  * igt@xe_eudebug_online@set-breakpoint-sigint-debugger:
    - shard-bmg:          [SKIP][287] ([Intel XE#4837] / [Intel XE#6665]) -> [SKIP][288] ([Intel XE#6703]) +4 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-bmg:          [SKIP][289] ([Intel XE#2322]) -> [SKIP][290] ([Intel XE#6703]) +9 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:
    - shard-bmg:          [SKIP][291] ([Intel XE#6703]) -> [SKIP][292] ([Intel XE#2322]) +7 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-dyn-priority-smem:
    - shard-bmg:          [SKIP][293] ([Intel XE#6703]) -> [SKIP][294] ([Intel XE#6874]) +34 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@xe_exec_multi_queue@few-execs-preempt-mode-dyn-priority-smem.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-2/igt@xe_exec_multi_queue@few-execs-preempt-mode-dyn-priority-smem.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate:
    - shard-bmg:          [SKIP][295] ([Intel XE#6874]) -> [SKIP][296] ([Intel XE#6703]) +26 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate.html

  * igt@xe_exec_system_allocator@many-64k-mmap-new-huge:
    - shard-bmg:          [SKIP][297] ([Intel XE#6703]) -> [SKIP][298] ([Intel XE#5007]) +1 other test skip
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@xe_exec_system_allocator@many-64k-mmap-new-huge.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-2/igt@xe_exec_system_allocator@many-64k-mmap-new-huge.html

  * igt@xe_exec_system_allocator@many-execqueues-mmap-free-huge:
    - shard-bmg:          [SKIP][299] ([Intel XE#4943]) -> [SKIP][300] ([Intel XE#6703]) +21 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@xe_exec_system_allocator@many-execqueues-mmap-free-huge.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@xe_exec_system_allocator@many-execqueues-mmap-free-huge.html

  * igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset:
    - shard-bmg:          [SKIP][301] ([Intel XE#6703]) -> [SKIP][302] ([Intel XE#4943]) +22 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-2/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-bmg:          [ABORT][303] ([Intel XE#5466]) -> [SKIP][304] ([Intel XE#6703])
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  * igt@xe_media_fill@media-fill:
    - shard-bmg:          [SKIP][305] ([Intel XE#6703]) -> [SKIP][306] ([Intel XE#2459] / [Intel XE#2596])
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@xe_media_fill@media-fill.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-3/igt@xe_media_fill@media-fill.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][307], [PASS][308], [PASS][309], [PASS][310], [PASS][311], [PASS][312], [PASS][313], [PASS][314], [PASS][315], [PASS][316], [ABORT][317], [ABORT][318], [ABORT][319], [ABORT][320], [PASS][321], [PASS][322], [PASS][323], [PASS][324], [PASS][325], [PASS][326], [PASS][327], [PASS][328], [PASS][329], [PASS][330]) ([Intel XE#6887]) -> ([PASS][331], [PASS][332], [PASS][333], [PASS][334], [PASS][335], [PASS][336], [PASS][337], [PASS][338], [PASS][339], [PASS][340], [PASS][341], [PASS][342], [PASS][343], [PASS][344], [PASS][345], [PASS][346], [PASS][347], [PASS][348], [PASS][349], [PASS][350], [ABORT][351], [ABORT][352], [ABORT][353], [SKIP][354], [PASS][355]) ([Intel XE#2457] / [Intel XE#6887])
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@xe_module_load@load.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@xe_module_load@load.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-8/igt@xe_module_load@load.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-8/igt@xe_module_load@load.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@xe_module_load@load.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-7/igt@xe_module_load@load.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-4/igt@xe_module_load@load.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@xe_module_load@load.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@xe_module_load@load.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@xe_module_load@load.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-6/igt@xe_module_load@load.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-6/igt@xe_module_load@load.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-6/igt@xe_module_load@load.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-6/igt@xe_module_load@load.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@xe_module_load@load.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-1/igt@xe_module_load@load.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-1/igt@xe_module_load@load.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-1/igt@xe_module_load@load.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@xe_module_load@load.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@xe_module_load@load.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@xe_module_load@load.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-4/igt@xe_module_load@load.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-7/igt@xe_module_load@load.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@xe_module_load@load.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@xe_module_load@load.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-7/igt@xe_module_load@load.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-7/igt@xe_module_load@load.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-7/igt@xe_module_load@load.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-1/igt@xe_module_load@load.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-1/igt@xe_module_load@load.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-8/igt@xe_module_load@load.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-8/igt@xe_module_load@load.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-2/igt@xe_module_load@load.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-2/igt@xe_module_load@load.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@xe_module_load@load.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-2/igt@xe_module_load@load.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@xe_module_load@load.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@xe_module_load@load.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-4/igt@xe_module_load@load.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-4/igt@xe_module_load@load.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-3/igt@xe_module_load@load.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-3/igt@xe_module_load@load.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@xe_module_load@load.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@xe_module_load@load.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-6/igt@xe_module_load@load.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-6/igt@xe_module_load@load.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-6/igt@xe_module_load@load.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-3/igt@xe_module_load@load.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-3/igt@xe_module_load@load.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-bmg:          [SKIP][356] ([Intel XE#2236]) -> [SKIP][357] ([Intel XE#6703])
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@xe_pat@pat-index-xelpg.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@d3cold-basic:
    - shard-bmg:          [SKIP][358] ([Intel XE#6703]) -> [SKIP][359] ([Intel XE#2284])
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@xe_pm@d3cold-basic.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-2/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@d3cold-i2c:
    - shard-bmg:          [SKIP][360] ([Intel XE#5694]) -> [SKIP][361] ([Intel XE#6703])
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@xe_pm@d3cold-i2c.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@xe_pm@d3cold-i2c.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-bmg:          [SKIP][362] ([Intel XE#2284]) -> [SKIP][363] ([Intel XE#6703]) +1 other test skip
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-7/igt@xe_pm@d3cold-multiple-execs.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:
    - shard-bmg:          [SKIP][364] ([Intel XE#4733]) -> [SKIP][365] ([Intel XE#6703]) +3 other tests skip
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-rpm:
    - shard-bmg:          [SKIP][366] ([Intel XE#6703]) -> [SKIP][367] ([Intel XE#4733]) +2 other tests skip
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@xe_pxp@pxp-stale-bo-exec-post-rpm.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-3/igt@xe_pxp@pxp-stale-bo-exec-post-rpm.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-bmg:          [SKIP][368] ([Intel XE#6703]) -> [SKIP][369] ([Intel XE#944]) +1 other test skip
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@xe_query@multigpu-query-cs-cycles.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-2/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-bmg:          [SKIP][370] ([Intel XE#944]) -> [SKIP][371] ([Intel XE#6703]) +1 other test skip
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@xe_query@multigpu-query-mem-usage.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@xe_query@multigpu-query-mem-usage.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
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
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459
  [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
  [Intel XE#2501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501
  [Intel XE#2596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596
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
  [Intel XE#4674]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4674
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5177]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5177
  [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5624]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5624
  [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#6251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557
  [Intel XE#6590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6590
  [Intel XE#6599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599
  [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
  [Intel XE#6693]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693
  [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
  [Intel XE#6706]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6706
  [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
  [Intel XE#6740]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740
  [Intel XE#6743]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6743
  [Intel XE#6747]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6747
  [Intel XE#6779]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6779
  [Intel XE#6831]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6831
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6887
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41 -> xe-pw-159112v1

  IGT_8668: 906681747a312ef11ef9af8ab1fa6eff28b4cbd0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41: 72428bdb20b6c86beaeddb9d69bf698d0697aa41
  xe-pw-159112v1: 159112v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/index.html

--===============5779047237110975637==
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
<tr><td><b>Series:</b></td><td>AuxCCS handling and render compression modif=
iers</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/159112/">https://patchwork.freedesktop.org/series/159112/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-159112v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-159112v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4254-72428bdb20b6c86beaeddb9d69bf698d0=
697aa41_FULL -&gt; xe-pw-159112v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-159112v1_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-159112v1_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1591=
12v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_setmaster@master-drop-set-root:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@core_setmaster@master-drop-se=
t-root.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-shared-fd:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-7/igt@core_set=
master@master-drop-set-shared-fd.html">PASS</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@core_setmast=
er@master-drop-set-shared-fd.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-159112v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunplug-rescan:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@core_hotunplug@hotunplug-resc=
an.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/6779">Intel XE#6779</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@unplug-rescan:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@core_hot=
unplug@unplug-rescan.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@core_hotunplug@unplug-re=
scan.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/6779">Intel XE#6779</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@fbdev@eof.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#=
2134</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@intel_hw=
mon@hwmon-read.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@intel_hwmon@hwmon-read.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/517=
7">Intel XE#5177</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@unused-handle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_addf=
b_basic@unused-handle.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@kms_addfb_basic@unused-=
handle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/6703">Intel XE#6703</a>) +506 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159112v1/shard-bmg-3/igt@kms_atomic_transition@plane-a=
ll-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159112v1/shard-bmg-7/igt@kms_big_fb@linear-8bpp-rotate=
-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159112v1/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-str=
ide-32bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159112v1/shard-bmg-7/igt@kms_bw@linear-tiling-4-displa=
ys-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159112v1/shard-bmg-3/igt@kms_ccs@bad-rotation-90-4-til=
ed-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159112v1/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4=
-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159112v1/shard-bmg-3/igt@kms_ccs@missing-ccs-buffer-yf=
-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2887">Intel XE#2887</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159112v1/shard-bmg-7/igt@kms_chamelium_color@ctm-0-50.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2325">Intel XE#2325</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159112v1/shard-bmg-7/igt@kms_chamelium_hpd@hdmi-hpd-af=
ter-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2252">Intel XE#2252</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159112v1/shard-bmg-7/igt@kms_content_protection@atomic=
-dpms@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-64x21:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159112v1/shard-bmg-7/igt@kms_cursor_crc@cursor-onscree=
n-64x21.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2320">Intel XE#2320</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x256:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_curs=
or_crc@cursor-sliding-256x256.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-2/igt@kms_cursor_crc@=
cursor-sliding-256x256.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6747">Intel XE#6747</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_fb_coherency@memset-crc@mmap-offset-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159112v1/shard-bmg-2/igt@kms_fb_coherency@memset-crc@m=
map-offset-wc.html">CRASH</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/6706">Intel XE#6706</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159112v1/shard-bmg-7/igt@kms_fbc_dirty_rect@fbc-dirty-=
rectangle-dirtyfb-tests.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159112v1/shard-bmg-7/igt@kms_fbcon_fbt@fbc-suspend.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4156">Intel XE#4156</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-lnl-7/igt@kms_fbco=
n_fbt@psr-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-159112v1/shard-lnl-3/igt@kms_fbcon_fbt@psr-suspend.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/6831">Intel XE#6831</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159112v1/shard-bmg-7/igt@kms_fbcon_fbt@psr-suspend.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159112v1/shard-bmg-3/igt@kms_feature_discovery@chameli=
um.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2372">Intel XE#2372</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-interruptible@b-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159112v1/shard-bmg-2/igt@kms_flip@flip-vs-panning-inte=
rruptible@b-hdmi-a3.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159112v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bp=
p-yftile-to-16bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a=
>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159112v1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#229=
3</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159112v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +8 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159112v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +16 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +495 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159112v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcp=
sr-rgb565-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159112v1/shard-bmg-7/igt@kms_hdr@bpc-switch@pipe-a-dp-=
2.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/6740">Intel XE#6740</a>) +3 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159112v1/shard-bmg-7/igt@kms_joiner@invalid-modeset-bi=
g-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/346">Intel XE#346</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/6590">Intel XE#6590</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159112v1/shard-bmg-3/igt@kms_multipipe_modeset@basic-m=
ax-pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2501">Intel XE#2501</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159112v1/shard-bmg-3/igt@kms_plane_lowres@tiling-yf.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@p=
ipe-b:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159112v1/shard-bmg-4/igt@kms_plane_scaling@planes-upsc=
ale-factor-0-25-downscale-factor-0-75@pipe-b.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +=
3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@kms_pm_rpm@dpms-lpsp.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693=
">Intel XE#6693</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_pm_r=
pm@i2c.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-159112v1/shard-bmg-5/igt@kms_pm_rpm@i2c.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693">Intel XE#6693=
</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159112v1/shard-bmg-7/igt@kms_pm_rpm@modeset-lpsp-stres=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plan=
e-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>=
) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159112v1/shard-bmg-3/igt@kms_psr2_sf@psr2-plane-move-s=
f-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +7 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159112v1/shard-bmg-3/igt@kms_psr@psr-cursor-plane-onof=
f.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +5 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159112v1/shard-bmg-3/igt@kms_scaling_modes@scaling-mod=
e-full-aspect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159112v1/shard-bmg-7/igt@kms_tv_load_detect@load-detec=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2450">Intel XE#2450</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159112v1/shard-bmg-3/igt@kms_vrr@flip-suspend.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499=
">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159112v1/shard-bmg-3/igt@kms_vrr@lobf.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel =
XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@invalid-pad:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@xe_creat=
e@invalid-pad.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@xe_create@invalid-pad.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557"=
>Intel XE#6557</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/6703">Intel XE#6703</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-exec-queues:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159112v1/shard-bmg-3/igt@xe_eudebug@basic-exec-queues.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4837">Intel XE#4837</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@stopped-thread:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159112v1/shard-bmg-3/igt@xe_eudebug_online@stopped-thr=
ead.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4837">Intel XE#4837</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/6665">Intel XE#6665</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159112v1/shard-bmg-3/igt@xe_exec_basic@multigpu-no-exe=
c-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +4 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159112v1/shard-bmg-3/igt@xe_exec_multi_queue@one-queue=
-preempt-mode-fault-dyn-priority-smem.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +14 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-race-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@xe_exec_system_allocator@once=
-mmap-race-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +5 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159112v1/shard-bmg-3/igt@xe_exec_system_allocator@thre=
ads-many-large-mmap-huge-nomemset.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +9 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@xe_live_=
ktest@xe_bo.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@xe_live_ktest@xe_bo.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Int=
el XE#2229</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159112v1/shard-bmg-3/igt@xe_pm@d3cold-basic-exec.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159112v1/shard-bmg-3/igt@xe_pm@vram-d3cold-threshold.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-50:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-lnl-7/igt@xe_pmu@e=
ngine-activity-accuracy-50.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-lnl-3/igt@xe_pmu@engine-acti=
vity-accuracy-50.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/6251">Intel XE#6251</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-termination-irq:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159112v1/shard-bmg-3/igt@xe_pxp@pxp-termination-key-up=
date-post-termination-irq.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159112v1/shard-bmg-7/igt@xe_query@multigpu-query-inval=
id-cs-cycles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@core_hot=
unplug@hotreplug.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/6779">Intel XE#6779</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-3/igt@core_hotunplug=
@hotreplug.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@core_set=
master@master-drop-set-user.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4674">Intel XE#4674</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-7/igt@cor=
e_setmaster@master-drop-set-user.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@unaligned-write:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@fbdev@un=
aligned-write.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-2/igt@fbdev@unaligned-w=
rite.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@intel_hw=
mon@hwmon-write.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/5177">Intel XE#5177</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-2/igt@i=
ntel_hwmon@hwmon-write.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-lnl-8/igt@kms_asyn=
c_flips@alternate-sync-async-flip.html">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-lnl-1/i=
gt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> +1 other test p=
ass</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_colo=
r@ctm-0-75.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/5545">Intel XE#5545</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-2/igt@kms_color@ctm-=
0-75.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_colo=
r@ctm-0-75@pipe-d-hdmi-a-3.html">CRASH</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-2/igt@kms_color@ctm-0-7=
5@pipe-d-hdmi-a-3.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-4/igt@kms_curs=
or_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel =
XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-159112v1/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-trans=
itions-varying-size.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-1x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_feat=
ure_discovery@display-1x.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bm=
g-7/igt@kms_feature_discovery@display-1x.html">PASS</a> +8 other tests pass=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-4/igt@kms_flip=
@2x-blocking-wf_vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-4/igt@kms_flip=
@2x-blocking-wf_vblank.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-lnl-2/igt@kms_flip=
@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shar=
d-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a> +1 other =
test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_flip=
@wf_vblank-ts-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-3/igt@kms_flip@wf=
_vblank-ts-check.html">PASS</a> +690 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_pm_r=
pm@universal-planes-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/6693">Intel XE#6693</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-7/igt@kms_pm=
_rpm@universal-planes-dpms.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@xe_modul=
e_load@many-reload.html">FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-159112v1/shard-bmg-7/igt@xe_module_load@many-reload=
.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_comput=
e0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-lnl-2/igt@xe_pmu@e=
ngine-activity-accuracy-90@engine-drm_xe_engine_class_compute0.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251">In=
tel XE#6251</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-159112v1/shard-lnl-5/igt@xe_pmu@engine-activity-accuracy-90@engine-d=
rm_xe_engine_class_compute0.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_addf=
b_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2233">Intel XE#2233</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-=
5/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_big_=
fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-7/igt@kms_=
big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +4 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_big_=
fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@kms_b=
ig_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_big_=
fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-7/igt@kms_=
big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +10 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_big_=
fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg=
-7/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_big_=
fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-4/ig=
t@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-7/igt@kms_big_=
fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/=
shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
6703">Intel XE#6703</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_bw@c=
onnected-linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/sh=
ard-bmg-7/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314=
">Intel XE#2314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2894">Intel XE#2894</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_bw@c=
onnected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-159112v1/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-3840x=
2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_bw@l=
inear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-3/=
igt@kms_bw@linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_bw@l=
inear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/ig=
t@kms_bw@linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +=
2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_ccs@=
bad-aux-stride-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1=
/shard-bmg-4/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel =
XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_ccs@=
crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bm=
g-5/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6=
703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_ccs@=
crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112=
v1/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">In=
tel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_ccs@=
crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-3/ig=
t@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +4 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_ccs@=
crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/s=
hard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
87">Intel XE#2887</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_ccs@=
random-ccs-data-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/=
igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)=
 +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_cham=
elium_color@ctm-0-25.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@kms_chamel=
ium_color@ctm-0-25.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_cham=
elium_color@ctm-negative.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-4/igt@kms_ch=
amelium_color@ctm-negative.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_cham=
elium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-2/ig=
t@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +12 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_cham=
elium_hpd@dp-hpd-storm.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@kms_cham=
elium_hpd@dp-hpd-storm.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_cont=
ent_protection@content-type-change.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-4/=
igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_cont=
ent_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-2/ig=
t@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-suspend-resume:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_cont=
ent_protection@dp-mst-suspend-resume.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/6743">Intel XE#6743</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-=
5/igt@kms_content_protection@dp-mst-suspend-resume.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_cont=
ent_protection@uevent.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/6707">Intel XE#6707</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@kms_conte=
nt_protection@uevent.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_curs=
or_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-4/ig=
t@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +4 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-7/igt@kms_curs=
or_crc@cursor-random-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@kms_=
cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +6 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_curs=
or_crc@cursor-random-512x170.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-7/igt@km=
s_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-256x85:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_curs=
or_crc@cursor-rapid-movement-256x85.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1591=
12v1/shard-bmg-3/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">=
Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_curs=
or_crc@cursor-sliding-512x170.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@k=
ms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_dirt=
yfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@kms_dirt=
yfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_dp_a=
ux_dev.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-2/igt@kms_dp_aux_dev.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009"=
>Intel XE#3009</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_dp_l=
ink_training@uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@kms_dp_li=
nk_training@uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_dsc@=
dsc-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-4/igt@kms_dsc@dsc-with-b=
pc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2244">Intel XE#2244</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fb_coherency@memset-crc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_fb_c=
oherency@memset-crc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-2/igt@kms_fb_cohe=
rency@memset-crc.html">CRASH</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/6706">Intel XE#6706</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-7/igt@kms_feat=
ure_discovery@display-4x.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@kms_fe=
ature_discovery@display-4x.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_feat=
ure_discovery@dp-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2375">Intel XE#2375</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@kms_featur=
e_discovery@dp-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_flip=
@2x-flip-vs-wf_vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-2=
/igt@kms_flip@2x-flip-vs-wf_vblank.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_flip=
@2x-nonexisting-fb-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/ig=
t@kms_flip@2x-nonexisting-fb-interruptible.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_flip=
@2x-wf_vblank-ts-check.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-2/igt@kms_flip=
@2x-wf_vblank-ts-check.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_flip=
@flip-vs-panning-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-2/ig=
t@kms_flip@flip-vs-panning-interruptible.html">DMESG-FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_flip=
_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE=
#2293</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2380">Intel XE#2380</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-159112v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytil=
eccs-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +5 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_flip=
_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#=
6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
159112v1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytil=
e-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +4 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#=
6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
159112v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indf=
b-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2311">Intel XE#2311</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE=
#6557</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
6703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-159112v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-1p-pr=
imscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@drrs-rgb565-draw-render.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-=
bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel =
XE#6703</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#670=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159=
112v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-d=
raw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4141">Intel XE#4141</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
159112v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1591=
12v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/6703">Intel XE#6703</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#23=
12</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
9112v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-m=
sflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2311">Intel XE#2311</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#=
6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
159112v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-i=
ndfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-4/i=
gt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#231=
2</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159=
112v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgf=
lip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2313">Intel XE#2313</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/ig=
t@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#=
2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
159112v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/6557">Intel XE#6557</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2=
313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
59112v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/6703">Intel XE#6703</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1=
/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-move.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/6703">Intel XE#6703</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1591=
12v1/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2313">Intel XE#2313</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_join=
er@basic-force-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-2/igt@kms=
_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2934">Intel XE#2934</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/6590">Intel XE#6590</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_join=
er@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2934">Intel XE#2934</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6590">Intel XE#6590=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1591=
12v1/shard-bmg-5/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703=
">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_join=
er@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/6590">Intel XE#6590</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/s=
hard-bmg-5/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6=
703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_join=
er@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4090">Intel XE#4090</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6590">Intel XE#=
6590</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
159112v1/shard-bmg-5/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_pipe=
_stress@stress-xrgb8888-yftiled.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/5624">Intel XE#5624</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/ig=
t@kms_pipe_stress@stress-xrgb8888-yftiled.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_plan=
e_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-4/igt@kms_plan=
e_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_plan=
e_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-2/igt@kms_pla=
ne_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-7/igt@kms_plan=
e_multiple@tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/5020">Intel XE#5020</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@kms_plane_m=
ultiple@tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_plan=
e_multiple@tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-7/igt@kms_plane_=
multiple@tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/5020">Intel XE#5020</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_plan=
e_scaling@planes-upscale-20x20-downscale-factor-0-75.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#688=
6</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159=
112v1/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-fact=
or-0-75.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_plan=
e_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel =
XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-159112v1/shard-bmg-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-do=
wnscale-factor-0-75.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/6886">Intel XE#6886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_pm_b=
acklight@brightness-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-2/igt@k=
ms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_pm_d=
c@dc5-psr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2392">Intel XE#2392</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@kms_pm_dc@dc5-psr.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_pm_d=
c@dc5-retention-flops.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3309">Intel XE#3309</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@kms_pm_dc=
@dc5-retention-flops.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_pm_l=
psp@kms-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-3/igt@kms_pm_lpsp@kms-lp=
sp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2499">Intel XE#2499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_pm_r=
pm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5=
/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/6693">Intel XE#6693</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_psr2=
_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Int=
el XE#1489</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-159112v1/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-=
sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +5 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_psr2=
_sf@psr2-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">In=
tel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-159112v1/shard-bmg-4/igt@kms_psr2_sf@psr2-overlay-plane-move-continu=
ous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +9 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_psr2=
_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bm=
g-5/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6=
703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_psr@=
psr-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-2/igt@kms_p=
sr@psr-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +14=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-no-drrs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_psr@=
psr2-no-drrs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-=
bmg-5/igt@kms_psr@psr2-no-drrs.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +=
11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_psr_=
stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel X=
E#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-159112v1/shard-bmg-2/igt@kms_psr_stress_test@flip-primary-invalidate-over=
lay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2414">Intel XE#2414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_psr_=
stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414">Intel X=
E#2414</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-159112v1/shard-bmg-5/igt@kms_psr_stress_test@invalidate-primary-flip-over=
lay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_rota=
tion_crc@bad-pixel-format.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-b=
mg-5/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_rota=
tion_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bm=
g-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2=
330</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_rota=
tion_crc@sprite-rotation-90.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-4/igt@kms=
_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)=
 +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-formats:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_shar=
pness_filter@filter-formats.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-2/igt@kms=
_sharpness_filter@filter-formats.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) +4 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-tap:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@kms_shar=
pness_filter@filter-tap.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@kms_sha=
rpness_filter@filter-tap.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_vrr@=
cmrr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-159112v1/shard-bmg-7/igt@kms_vrr@cmrr.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Int=
el XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@kms_vrr@=
flip-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@kms_vrr@flip-dpms.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@kms_vrr@=
negative-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-2/igt@kms_vrr@negative=
-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1499">Intel XE#1499</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@xe_compu=
te@ccs-mode-compute-kernel.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-4/igt@xe_c=
ompute@ccs-mode-compute-kernel.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/6599">Intel XE#6599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-extended:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-7/igt@xe_eudeb=
ug@basic-vm-bind-extended.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@xe_eu=
debug@basic-vm-bind-extended.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +5 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-metadata-discovery:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@xe_eudeb=
ug@basic-vm-bind-metadata-discovery.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-2=
/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a=
>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@breakpoint-many-sessions-single-tile:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@xe_eudeb=
ug_online@breakpoint-many-sessions-single-tile.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/=
shard-bmg-3/igt@xe_eudebug_online@breakpoint-many-sessions-single-tile.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4837">Intel XE#4837</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/6665">Intel XE#6665</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint-sigint-debugger:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@xe_eudeb=
ug_online@set-breakpoint-sigint-debugger.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6=
665</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
59112v1/shard-bmg-5/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/6703">Intel XE#6703</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@xe_exec_=
basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Inte=
l XE#2322</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-159112v1/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-v=
m-bindexecqueue-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +9 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@xe_exec_=
basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel X=
E#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-159112v1/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-u=
serptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-dyn-priority-smem:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@xe_exec_=
multi_queue@few-execs-preempt-mode-dyn-priority-smem.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#670=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159=
112v1/shard-bmg-2/igt@xe_exec_multi_queue@few-execs-preempt-mode-dyn-priori=
ty-smem.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6874">Intel XE#6874</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@xe_exec_=
multi_queue@few-execs-preempt-mode-userptr-invalidate.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#68=
74</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
9112v1/shard-bmg-5/igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-i=
nvalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/6703">Intel XE#6703</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-new-huge:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@xe_exec_=
system_allocator@many-64k-mmap-new-huge.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-b=
mg-2/igt@xe_exec_system_allocator@many-64k-mmap-new-huge.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007">Intel XE=
#5007</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-free-huge:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@xe_exec_=
system_allocator@many-execqueues-mmap-free-huge.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1=
/shard-bmg-5/igt@xe_exec_system_allocator@many-execqueues-mmap-free-huge.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/6703">Intel XE#6703</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@xe_exec_=
system_allocator@many-execqueues-mmap-huge-nomemset.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1591=
12v1/shard-bmg-2/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nom=
emset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4943">Intel XE#4943</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@xe_fault=
_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/5466">Intel XE#5466</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/=
shard-bmg-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6=
703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@xe_media=
_fill@media-fill.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-3/igt@xe_media_fill@=
media-fill.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2459">Intel XE#2459</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2596">Intel XE#2596</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-8/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-8=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-b=
mg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/sha=
rd-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41=
/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697=
aa41/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d=
0697aa41/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf=
698d0697aa41/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d=
69bf698d0697aa41/shard-bmg-6/igt@xe_module_load@load.html">ABORT</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beae=
ddb9d69bf698d0697aa41/shard-bmg-6/igt@xe_module_load@load.html">ABORT</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c8=
6beaeddb9d69bf698d0697aa41/shard-bmg-6/igt@xe_module_load@load.html">ABORT<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-72428bdb2=
0b6c86beaeddb9d69bf698d0697aa41/shard-bmg-6/igt@xe_module_load@load.html">A=
BORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-7242=
8bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4254-=
72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-1/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4=
254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-1/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-1/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-=
4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-=
bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/sh=
ard-bmg-3/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/6887">Intel XE#6887</a>) -&gt; (<a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-7/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15911=
2v1/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-7/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-159112v1/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-1=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-8/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15911=
2v1/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-2/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-159112v1/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-2/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15911=
2v1/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-159112v1/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-4=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-3/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15911=
2v1/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-159112v1/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-6=
/igt@xe_module_load@load.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-6/igt@xe_module_load@load.html=
">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159=
112v1/shard-bmg-6/igt@xe_module_load@load.html">ABORT</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-3/igt@xe_modu=
le_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-159112v1/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel =
XE#2457</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/6887">Intel XE#6887</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@xe_pat@p=
at-index-xelpg.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2236">Intel XE#2236</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@xe_pat@pat-index=
-xelpg.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-2/igt@xe_pm@d3=
cold-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-2/igt@xe_pm@d3cold-basic.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-i2c:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@xe_pm@d3=
cold-i2c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/5694">Intel XE#5694</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@xe_pm@d3cold-i2c.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6=
703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-7/igt@xe_pm@d3=
cold-multiple-execs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@xe_pm@d3col=
d-multiple-execs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@xe_pxp@p=
xp-stale-bo-bind-post-termination-irq.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg=
-5/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#670=
3</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-rpm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@xe_pxp@p=
xp-stale-bo-exec-post-rpm.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-3/igt@xe_px=
p@pxp-stale-bo-exec-post-rpm.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) +2 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-5/igt@xe_query=
@multigpu-query-cs-cycles.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-2/igt@xe_qu=
ery@multigpu-query-cs-cycles.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41/shard-bmg-3/igt@xe_query=
@multigpu-query-mem-usage.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159112v1/shard-bmg-5/igt@xe_quer=
y@multigpu-query-mem-usage.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip<=
/li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41 -&gt; xe-pw-159=
112v1</li>
</ul>
<p>IGT_8668: 906681747a312ef11ef9af8ab1fa6eff28b4cbd0 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-4254-72428bdb20b6c86beaeddb9d69bf698d0697aa41: 72428bdb20b6c86beaeddb9=
d69bf698d0697aa41<br />
  xe-pw-159112v1: 159112v1</p>

</body>
</html>

--===============5779047237110975637==--
