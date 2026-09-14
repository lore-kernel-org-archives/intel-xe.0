Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D0EFC88E72
	for <intel-xe@archiver.kernel.org>; Mon, 14 Sep 2026 14:54:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B24710E1C6;
	Mon, 14 Sep 2026 14:54:06 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 437CD10E1C6;
 Mon, 14 Sep 2026 14:54:05 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4219917429473090260=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/i915/audio=3A_Fix_name?=
 =?utf-8?q?s_that_do_not_exist_in_kernel-doc_comments_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karl Mehltretter" <kmehltretter@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 14 Sep 2026 14:54:05 -0000
Message-ID: <178939764526.159192.1010183208886920462@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260911200053.78731-1-kmehltretter@gmail.com>
In-Reply-To: <20260911200053.78731-1-kmehltretter@gmail.com>
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

--===============4219917429473090260==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/audio: Fix names that do not exist in kernel-doc comments (rev2)
URL   : https://patchwork.freedesktop.org/series/173897/
State : success

== Summary ==

CI Bug Log - changes from xe-5740-a33b82feef10c34c61cbc7fbf1dbdff1ffff96c6_FULL -> xe-pw-173897v2_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

New tests
---------

  New tests have been introduced between xe-5740-a33b82feef10c34c61cbc7fbf1dbdff1ffff96c6_FULL and xe-pw-173897v2_FULL:

### New IGT tests (2) ###

  * igt@kms_feature_discovery@psr1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_feature_discovery@psr2:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.01, 0.02] s

  

Known issues
------------

  Here are the changes found in xe-pw-173897v2_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotunbind-rebind-with-load:
    - shard-bmg:          [PASS][1] -> [ABORT][2] ([Intel XE#8007]) +3 other tests abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5740-a33b82feef10c34c61cbc7fbf1dbdff1ffff96c6/shard-bmg-7/igt@core_hotunplug@hotunbind-rebind-with-load.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-bmg-8/igt@core_hotunplug@hotunbind-rebind-with-load.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-lnl:          NOTRUN -> [SKIP][3] ([Intel XE#3157])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-7/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-lnl:          NOTRUN -> [SKIP][4] ([Intel XE#3279])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-5/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][5] ([Intel XE#1407]) +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-7/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][6] ([Intel XE#1124]) +2 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][7] ([Intel XE#8365])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-7/igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][8] ([Intel XE#2887]) +4 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#3432])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d:
    - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#7358])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-7/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html

  * igt@kms_chamelium_frames@dp-crc-multiple:
    - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#373]) +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-7/igt@kms_chamelium_frames@dp-crc-multiple.html

  * igt@kms_content_protection@mei-interface:
    - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#1468] / [Intel XE#7396])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-7/igt@kms_content_protection@mei-interface.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#2321] / [Intel XE#7355])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-5/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#1424]) +2 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-7/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#4354] / [Intel XE#7386])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-5/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dsc@dsc-fractional-bpp-ultrajoiner:
    - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#8265])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-7/igt@kms_dsc@dsc-fractional-bpp-ultrajoiner.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#1421]) +2 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-7/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#7178] / [Intel XE#7351]) +2 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#6312]) +7 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#6312] / [Intel XE#651]) +2 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#656] / [Intel XE#7905]) +14 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#1469] / [Intel XE#7399])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y:
    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#7399])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-spr-indfb-move:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#7905]) +11 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#7061]) +4 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-indfb-scaledprimary:
    - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#7865]) +8 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#7061] / [Intel XE#7356]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-5/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][28] -> [SKIP][29] ([Intel XE#1503])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5740-a33b82feef10c34c61cbc7fbf1dbdff1ffff96c6/shard-bmg-6/igt@kms_hdr@invalid-hdr.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-bmg-4/igt@kms_hdr@invalid-hdr.html

  * igt@kms_mst@mst-suspend-read-crc:
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#8348])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-5/igt@kms_mst@mst-suspend-read-crc.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#4329] / [Intel XE#6912] / [Intel XE#7375])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-7/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#7283]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-7/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#2763] / [Intel XE#6886]) +3 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-5/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#8395] / [Intel XE#8396]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-7/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc3co-vpb-simulation@psr2-yuv420:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#8396]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-7/igt@kms_pm_dc@dc3co-vpb-simulation@psr2-yuv420.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#4608])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#4608] / [Intel XE#7304])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-b-edp-1.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#2893] / [Intel XE#7304])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-7/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#1128] / [Intel XE#7413])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-5/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-pr-primary-page-flip:
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#1406]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-7/igt@kms_psr@fbc-pr-primary-page-flip.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#1406] / [Intel XE#7345])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-5/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#1406] / [Intel XE#4609] / [Intel XE#7345])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-5/igt@kms_psr@fbc-psr2-sprite-plane-onoff@edp-1.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-7/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#1499])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-5/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@xe_compute@eu-busy-10s:
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#6592] / [Intel XE#6645] / [Intel XE#7391])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-7/igt@xe_compute@eu-busy-10s.html

  * igt@xe_evict@evict-beng-mixed-threads-large-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#6540] / [Intel XE#688]) +2 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-7/igt@xe_evict@evict-beng-mixed-threads-large-multi-vm.html

  * igt@xe_exec_balancer@many-cm-virtual-userptr-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#7482]) +7 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-5/igt@xe_exec_balancer@many-cm-virtual-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:
    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#1392]) +3 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-7/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-imm:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#8374]) +3 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-7/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-imm.html

  * igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#8364]) +10 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-7/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr-invalidate.html

  * igt@xe_exec_reset@cm-multi-queue-close-execqueues:
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#8369])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-7/igt@xe_exec_reset@cm-multi-queue-close-execqueues.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-single-vma:
    - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#6196])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-7/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-single-vma.html

  * igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:
    - shard-lnl:          [PASS][54] -> [FAIL][55] ([Intel XE#9096])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5740-a33b82feef10c34c61cbc7fbf1dbdff1ffff96c6/shard-lnl-2/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-2/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-hang-userptr-invalidate-race:
    - shard-lnl:          NOTRUN -> [FAIL][56] ([Intel XE#9096])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-7/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html
    - shard-bmg:          [PASS][57] -> [FAIL][58] ([Intel XE#9096])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5740-a33b82feef10c34c61cbc7fbf1dbdff1ffff96c6/shard-bmg-5/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-bmg-3/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-fd-basic:
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#8378]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-7/igt@xe_exec_threads@threads-multi-queue-mixed-fd-basic.html

  * igt@xe_page_reclaim@binds-full-pd:
    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#7793])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-7/igt@xe_page_reclaim@binds-full-pd.html

  * igt@xe_pat@pat-index-xelp:
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#7590] / [Intel XE#977])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-7/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pm@s3-exec-after:
    - shard-bmg:          [PASS][62] -> [INCOMPLETE][63] ([Intel XE#8175])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5740-a33b82feef10c34c61cbc7fbf1dbdff1ffff96c6/shard-bmg-2/igt@xe_pm@s3-exec-after.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-bmg-6/igt@xe_pm@s3-exec-after.html

  * igt@xe_sriov_auto_provisioning@exclusive-ranges:
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#4130] / [Intel XE#7366])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-7/igt@xe_sriov_auto_provisioning@exclusive-ranges.html

  
#### Possible fixes ####

  * igt@xe_pmu@gt-frequency:
    - shard-bmg:          [WARN][65] ([Intel XE#7992]) -> [PASS][66] +1 other test pass
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5740-a33b82feef10c34c61cbc7fbf1dbdff1ffff96c6/shard-bmg-3/igt@xe_pmu@gt-frequency.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-bmg-4/igt@xe_pmu@gt-frequency.html

  
#### Warnings ####

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][67] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][68] ([Intel XE#3544])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5740-a33b82feef10c34c61cbc7fbf1dbdff1ffff96c6/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#3157]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3157
  [Intel XE#3279]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#6196]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6196
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6592]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6592
  [Intel XE#6645]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6645
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7366
  [Intel XE#7375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7375
  [Intel XE#7386]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7386
  [Intel XE#7391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7391
  [Intel XE#7396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7396
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7413
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#7992]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8175]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8175
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8348
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8365
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395
  [Intel XE#8396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396
  [Intel XE#9096]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977


Build changes
-------------

  * Linux: xe-5740-a33b82feef10c34c61cbc7fbf1dbdff1ffff96c6 -> xe-pw-173897v2

  IGT_9093: 932327f15c92ecb52266ced8c0fbe72931a75880 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5740-a33b82feef10c34c61cbc7fbf1dbdff1ffff96c6: a33b82feef10c34c61cbc7fbf1dbdff1ffff96c6
  xe-pw-173897v2: 173897v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/index.html

--===============4219917429473090260==
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
<tr><td><b>Series:</b></td><td>drm/i915/audio: Fix names that do not exist in kernel-doc comments (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/173897/">https://patchwork.freedesktop.org/series/173897/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5740-a33b82feef10c34c61cbc7fbf1dbdff1ffff96c6_FULL -&gt; xe-pw-173897v2_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>New tests</h2>
<p>New tests have been introduced between xe-5740-a33b82feef10c34c61cbc7fbf1dbdff1ffff96c6_FULL and xe-pw-173897v2_FULL:</p>
<h3>New IGT tests (2)</h3>
<ul>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-173897v2_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunbind-rebind-with-load:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5740-a33b82feef10c34c61cbc7fbf1dbdff1ffff96c6/shard-bmg-7/igt@core_hotunplug@hotunbind-rebind-with-load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-bmg-8/igt@core_hotunplug@hotunbind-rebind-with-load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) +3 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-7/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3157">Intel XE#3157</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-5/igt@kms_atomic_transition@plane-all-modeset-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279">Intel XE#3279</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-7/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-7/igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8365">Intel XE#8365</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-7/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-multiple:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-7/igt@kms_chamelium_frames@dp-crc-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-7/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468">Intel XE#1468</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7396">Intel XE#7396</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-5/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-7/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-5/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7386">Intel XE#7386</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-ultrajoiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-7/igt@kms_dsc@dsc-fractional-bpp-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-7/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469">Intel XE#1469</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-indfb-scaledprimary:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-5/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5740-a33b82feef10c34c61cbc7fbf1dbdff1ffff96c6/shard-bmg-6/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-bmg-4/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_mst@mst-suspend-read-crc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-5/igt@kms_mst@mst-suspend-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8348">Intel XE#8348</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-7/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329">Intel XE#4329</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912">Intel XE#6912</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7375">Intel XE#7375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-7/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-5/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-7/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395">Intel XE#8395</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation@psr2-yuv420:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-7/igt@kms_pm_dc@dc3co-vpb-simulation@psr2-yuv420.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-7/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-5/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128">Intel XE#1128</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7413">Intel XE#7413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-page-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-7/igt@kms_psr@fbc-pr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-5/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345">Intel XE#7345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-onoff@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-5/igt@kms_psr@fbc-psr2-sprite-plane-onoff@edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609">Intel XE#4609</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345">Intel XE#7345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-7/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-5/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@eu-busy-10s:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-7/igt@xe_compute@eu-busy-10s.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6592">Intel XE#6592</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6645">Intel XE#6645</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7391">Intel XE#7391</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-7/igt@xe_evict@evict-beng-mixed-threads-large-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540">Intel XE#6540</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-cm-virtual-userptr-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-5/igt@xe_exec_balancer@many-cm-virtual-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-7/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-imm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-7/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-7/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-multi-queue-close-execqueues:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-7/igt@xe_exec_reset@cm-multi-queue-close-execqueues.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-single-vma:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-7/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-single-vma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6196">Intel XE#6196</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5740-a33b82feef10c34c61cbc7fbf1dbdff1ffff96c6/shard-lnl-2/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-2/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096">Intel XE#9096</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-7/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096">Intel XE#9096</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5740-a33b82feef10c34c61cbc7fbf1dbdff1ffff96c6/shard-bmg-5/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-bmg-3/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096">Intel XE#9096</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-fd-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-7/igt@xe_exec_threads@threads-multi-queue-mixed-fd-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@binds-full-pd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-7/igt@xe_page_reclaim@binds-full-pd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-7/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-exec-after:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5740-a33b82feef10c34c61cbc7fbf1dbdff1ffff96c6/shard-bmg-2/igt@xe_pm@s3-exec-after.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-bmg-6/igt@xe_pm@s3-exec-after.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8175">Intel XE#8175</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@exclusive-ranges:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-lnl-7/igt@xe_sriov_auto_provisioning@exclusive-ranges.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7366">Intel XE#7366</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_pmu@gt-frequency:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5740-a33b82feef10c34c61cbc7fbf1dbdff1ffff96c6/shard-bmg-3/igt@xe_pmu@gt-frequency.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992">Intel XE#7992</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-bmg-4/igt@xe_pmu@gt-frequency.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_hdr@brightness-with-hdr:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5740-a33b82feef10c34c61cbc7fbf1dbdff1ffff96c6/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5740-a33b82feef10c34c61cbc7fbf1dbdff1ffff96c6 -&gt; xe-pw-173897v2</li>
</ul>
<p>IGT_9093: 932327f15c92ecb52266ced8c0fbe72931a75880 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5740-a33b82feef10c34c61cbc7fbf1dbdff1ffff96c6: a33b82feef10c34c61cbc7fbf1dbdff1ffff96c6<br />
  xe-pw-173897v2: 173897v2</p>

</body>
</html>

--===============4219917429473090260==--
