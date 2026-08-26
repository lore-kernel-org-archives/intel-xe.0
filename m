Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1AC3C61DBD
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 11:39:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACD4D10E467;
	Wed, 26 Aug 2026 11:39:01 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3597B10E467;
 Wed, 26 Aug 2026 11:39:00 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2580369071302210353=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_series_starting_with_=5Bv1?=
 =?utf-8?q?=2C1/1=5D_drm/xe/guc=3A_Fix_wake=5Fup_race_in_handle=5Fsched=5Fdo?=
 =?utf-8?q?ne?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jakub Legowski" <jakub.legowski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 26 Aug 2026 11:39:00 -0000
Message-ID: <178774434020.85742.16224891190619651192@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260826093325.3233742-1-jakub.legowski@intel.com>
In-Reply-To: <20260826093325.3233742-1-jakub.legowski@intel.com>
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

--===============2580369071302210353==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [v1,1/1] drm/xe/guc: Fix wake_up race in handle_sched_done
URL   : https://patchwork.freedesktop.org/series/172773/
State : failure

== Summary ==

CI Bug Log - changes from xe-5645-67a170d6284099e2f259ff0bf9b5bf5b575a3d2d_FULL -> xe-pw-172773v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-172773v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-172773v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-172773v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads:
    - shard-lnl:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5645-67a170d6284099e2f259ff0bf9b5bf5b575a3d2d/shard-lnl-6/igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172773v1/shard-lnl-4/igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads.html

  
Known issues
------------

  Here are the changes found in xe-pw-172773v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#2327])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172773v1/shard-bmg-4/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#1124])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172773v1/shard-bmg-4/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2887]) +2 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172773v1/shard-bmg-4/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#7358])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172773v1/shard-bmg-4/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2252])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172773v1/shard-bmg-4/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_sharpness_filter@filter-basic:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#6507])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172773v1/shard-bmg-4/igt@kms_chamelium_sharpness_filter@filter-basic.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2390] / [Intel XE#6974])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172773v1/shard-bmg-4/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2320])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172773v1/shard-bmg-4/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_dsc@dsc-with-bpc-ultrajoiner:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#8265])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172773v1/shard-bmg-4/igt@kms_dsc@dsc-with-bpc-ultrajoiner.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#4156] / [Intel XE#7425])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172773v1/shard-bmg-4/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#7178] / [Intel XE#7351]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172773v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2311]) +15 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172773v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#4141]) +3 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172773v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2313]) +12 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172773v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#7061] / [Intel XE#7356])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172773v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#7061])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172773v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-blt.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][19] -> [SKIP][20] ([Intel XE#1503])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5645-67a170d6284099e2f259ff0bf9b5bf5b575a3d2d/shard-bmg-2/igt@kms_hdr@invalid-hdr.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172773v1/shard-bmg-10/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#4090] / [Intel XE#7443])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172773v1/shard-bmg-6/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#5020] / [Intel XE#7348])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172773v1/shard-bmg-4/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#1489]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172773v1/shard-bmg-4/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr@fbc-psr2-primary-blt:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2234] / [Intel XE#2850])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172773v1/shard-bmg-4/igt@kms_psr@fbc-psr2-primary-blt.html

  * igt@kms_sharpness_filter@filter-strength:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#6503])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172773v1/shard-bmg-4/igt@kms_sharpness_filter@filter-strength.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          NOTRUN -> [FAIL][26] ([Intel XE#1729] / [Intel XE#7424])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172773v1/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html

  * igt@xe_cw_post_sync@walker-post-sync:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#8608])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172773v1/shard-bmg-4/igt@xe_cw_post_sync@walker-post-sync.html

  * igt@xe_evict@evict-cm-threads-small-multi-queue:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#8370])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172773v1/shard-bmg-4/igt@xe_evict@evict-cm-threads-small-multi-queue.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2322] / [Intel XE#7372]) +2 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172773v1/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#8374])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172773v1/shard-bmg-4/igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-priority-smem:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#8364]) +5 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172773v1/shard-bmg-4/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-priority-smem.html

  * igt@xe_exec_reset@multi-queue-long-spin-reuse-many-queue-switch:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#8369])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172773v1/shard-bmg-4/igt@xe_exec_reset@multi-queue-long-spin-reuse-many-queue-switch.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-basic:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#8378])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172773v1/shard-bmg-6/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-basic.html

  * igt@xe_multigpu_svm@mgpu-atomic-op-conflict:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#6964]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172773v1/shard-bmg-4/igt@xe_multigpu_svm@mgpu-atomic-op-conflict.html

  * igt@xe_pat@xa-app-transient-media-off:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#7590])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172773v1/shard-bmg-4/igt@xe_pat@xa-app-transient-media-off.html

  
#### Possible fixes ####

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [INCOMPLETE][36] ([Intel XE#7084] / [Intel XE#8150]) -> [PASS][37] +1 other test pass
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5645-67a170d6284099e2f259ff0bf9b5bf5b575a3d2d/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172773v1/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [FAIL][38] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][39] +1 other test pass
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5645-67a170d6284099e2f259ff0bf9b5bf5b575a3d2d/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172773v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:
    - shard-bmg:          [ABORT][40] ([Intel XE#8007]) -> [PASS][41]
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5645-67a170d6284099e2f259ff0bf9b5bf5b575a3d2d/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172773v1/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html

  
#### Warnings ####

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-lnl:          [SKIP][42] ([Intel XE#309] / [Intel XE#7343] / [Intel XE#7935]) -> [SKIP][43] ([Intel XE#309] / [Intel XE#7343])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5645-67a170d6284099e2f259ff0bf9b5bf5b575a3d2d/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172773v1/shard-lnl-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][44] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][45] ([Intel XE#3544])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5645-67a170d6284099e2f259ff0bf9b5bf5b575a3d2d/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172773v1/shard-bmg-9/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][46] ([Intel XE#2426] / [Intel XE#5848]) -> [SKIP][47] ([Intel XE#2509] / [Intel XE#7437])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5645-67a170d6284099e2f259ff0bf9b5bf5b575a3d2d/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172773v1/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#4090]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6507]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7443
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7935]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8608


Build changes
-------------

  * Linux: xe-5645-67a170d6284099e2f259ff0bf9b5bf5b575a3d2d -> xe-pw-172773v1

  IGT_9075: 9075
  xe-5645-67a170d6284099e2f259ff0bf9b5bf5b575a3d2d: 67a170d6284099e2f259ff0bf9b5bf5b575a3d2d
  xe-pw-172773v1: 172773v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172773v1/index.html

--===============2580369071302210353==
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
<tr><td><b>Series:</b></td><td>series starting with [v1,1/1] drm/xe/guc: Fix wake_up race in handle_sched_done</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/172773/">https://patchwork.freedesktop.org/series/172773/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172773v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172773v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5645-67a170d6284099e2f259ff0bf9b5bf5b575a3d2d_FULL -&gt; xe-pw-172773v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-172773v1_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-172773v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-172773v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads:<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5645-67a170d6284099e2f259ff0bf9b5bf5b575a3d2d/shard-lnl-6/igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172773v1/shard-lnl-4/igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-172773v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172773v1/shard-bmg-4/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172773v1/shard-bmg-4/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172773v1/shard-bmg-4/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172773v1/shard-bmg-4/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172773v1/shard-bmg-4/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_sharpness_filter@filter-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172773v1/shard-bmg-4/igt@kms_chamelium_sharpness_filter@filter-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507">Intel XE#6507</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172773v1/shard-bmg-4/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172773v1/shard-bmg-4/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-ultrajoiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172773v1/shard-bmg-4/igt@kms_dsc@dsc-with-bpc-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172773v1/shard-bmg-4/igt@kms_fbcon_fbt@fbc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156">Intel XE#4156</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425">Intel XE#7425</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172773v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172773v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172773v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172773v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172773v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172773v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5645-67a170d6284099e2f259ff0bf9b5bf5b575a3d2d/shard-bmg-2/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172773v1/shard-bmg-10/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172773v1/shard-bmg-6/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090">Intel XE#4090</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7443">Intel XE#7443</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172773v1/shard-bmg-4/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020">Intel XE#5020</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348">Intel XE#7348</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172773v1/shard-bmg-4/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172773v1/shard-bmg-4/igt@kms_psr@fbc-psr2-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-strength:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172773v1/shard-bmg-4/igt@kms_sharpness_filter@filter-strength.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172773v1/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_cw_post_sync@walker-post-sync:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172773v1/shard-bmg-4/igt@xe_cw_post_sync@walker-post-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8608">Intel XE#8608</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-small-multi-queue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172773v1/shard-bmg-4/igt@xe_evict@evict-cm-threads-small-multi-queue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370">Intel XE#8370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172773v1/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172773v1/shard-bmg-4/igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-priority-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172773v1/shard-bmg-4/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-priority-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-long-spin-reuse-many-queue-switch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172773v1/shard-bmg-4/igt@xe_exec_reset@multi-queue-long-spin-reuse-many-queue-switch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172773v1/shard-bmg-6/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-atomic-op-conflict:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172773v1/shard-bmg-4/igt@xe_multigpu_svm@mgpu-atomic-op-conflict.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@xa-app-transient-media-off:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172773v1/shard-bmg-4/igt@xe_pat@xa-app-transient-media-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5645-67a170d6284099e2f259ff0bf9b5bf5b575a3d2d/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172773v1/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5645-67a170d6284099e2f259ff0bf9b5bf5b575a3d2d/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172773v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5645-67a170d6284099e2f259ff0bf9b5bf5b575a3d2d/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172773v1/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5645-67a170d6284099e2f259ff0bf9b5bf5b575a3d2d/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935">Intel XE#7935</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172773v1/shard-lnl-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5645-67a170d6284099e2f259ff0bf9b5bf5b575a3d2d/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172773v1/shard-bmg-9/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5645-67a170d6284099e2f259ff0bf9b5bf5b575a3d2d/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172773v1/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437">Intel XE#7437</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5645-67a170d6284099e2f259ff0bf9b5bf5b575a3d2d -&gt; xe-pw-172773v1</li>
</ul>
<p>IGT_9075: 9075<br />
  xe-5645-67a170d6284099e2f259ff0bf9b5bf5b575a3d2d: 67a170d6284099e2f259ff0bf9b5bf5b575a3d2d<br />
  xe-pw-172773v1: 172773v1</p>

</body>
</html>

--===============2580369071302210353==--
