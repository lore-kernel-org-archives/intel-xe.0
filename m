Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DABACD5BB1
	for <intel-xe@archiver.kernel.org>; Mon, 25 May 2026 15:39:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B2BC10E3B3;
	Mon, 25 May 2026 15:39:44 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6EF710E3BA;
 Mon, 25 May 2026 15:39:42 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6710815756572031592=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/i915=3A_crtc_iteration?=
 =?utf-8?q?_cleanups_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 25 May 2026 15:39:42 -0000
Message-ID: <177972358293.4776.6482673299235750541@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <cover.1778659089.git.jani.nikula@intel.com>
In-Reply-To: <cover.1778659089.git.jani.nikula@intel.com>
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

--===============6710815756572031592==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915: crtc iteration cleanups (rev3)
URL   : https://patchwork.freedesktop.org/series/165524/
State : success

== Summary ==

CI Bug Log - changes from xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4_FULL -> xe-pw-165524v3_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-165524v3_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotunbind-rebind:
    - shard-bmg:          [PASS][1] -> [SKIP][2] ([Intel XE#6779])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-6/igt@core_hotunplug@hotunbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-2/igt@core_hotunplug@hotunbind-rebind.html

  * igt@intel_hwmon@hwmon-read:
    - shard-lnl:          NOTRUN -> [SKIP][3] ([Intel XE#1125] / [Intel XE#7312])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-lnl-1/igt@intel_hwmon@hwmon-read.html
    - shard-bmg:          [PASS][4] -> [SKIP][5] ([Intel XE#5177] / [Intel XE#6703])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-6/igt@intel_hwmon@hwmon-read.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-2/igt@intel_hwmon@hwmon-read.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][6] ([Intel XE#1124]) +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-lnl-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2652]) +8 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-1/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][8] ([Intel XE#2887]) +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-lnl-1/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2887]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2390] / [Intel XE#6974])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-1/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-bmg:          [PASS][11] -> [SKIP][12] ([Intel XE#6703]) +108 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-6/igt@kms_cursor_crc@cursor-suspend.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-2/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#2244])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-lnl-1/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-lnl:          [PASS][14] -> [FAIL][15] ([i915#4767])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-lnl-8/igt@kms_fbcon_fbt@fbc-suspend.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-lnl-7/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [PASS][16] -> [FAIL][17] ([Intel XE#301]) +1 other test fail
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#1397] / [Intel XE#1745] / [Intel XE#7385])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#1397] / [Intel XE#7385])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@drrshdr-rgb101010-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#6312]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-lnl-1/igt@kms_frontbuffer_tracking@drrshdr-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-stridechange:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#4141]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-stridechange.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#6312] / [Intel XE#651])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#7061])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-stridechange:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2311]) +3 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrshdr-stridechange.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-pri-indfb-multidraw:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#7905]) +2 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-lnl-1/igt@kms_frontbuffer_tracking@fbchdr-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2313]) +6 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3-xrgb16161616f:
    - shard-bmg:          [PASS][27] -> [SKIP][28] ([Intel XE#7915]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-4/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3-xrgb16161616f.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-8/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3-xrgb16161616f.html

  * igt@kms_plane_lowres@tiling-x:
    - shard-bmg:          [PASS][29] -> [DMESG-WARN][30] ([Intel XE#5681])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-9/igt@kms_plane_lowres@tiling-x.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-2/igt@kms_plane_lowres@tiling-x.html

  * igt@kms_plane_lowres@tiling-x@pipe-d-hdmi-a-3:
    - shard-bmg:          [PASS][31] -> [DMESG-WARN][32] ([Intel XE#1727])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-9/igt@kms_plane_lowres@tiling-x@pipe-d-hdmi-a-3.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-2/igt@kms_plane_lowres@tiling-x@pipe-d-hdmi-a-3.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#1489])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html

  * igt@kms_psr@pr-no-drrs:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#2234] / [Intel XE#2850])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-1/igt@kms_psr@pr-no-drrs.html

  * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
    - shard-lnl:          [PASS][35] -> [FAIL][36] ([Intel XE#2142]) +1 other test fail
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-lnl-4/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-lnl-1/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html

  * igt@xe_ccs@vm-bind-fault-mode-decompress:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#7644])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-lnl-1/igt@xe_ccs@vm-bind-fault-mode-decompress.html

  * igt@xe_create@create-big-vram:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#1062] / [Intel XE#7318] / [Intel XE#7457])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-lnl-1/igt@xe_create@create-big-vram.html

  * igt@xe_evict@evict-threads-large-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#6540] / [Intel XE#688])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-lnl-1/igt@xe_evict@evict-threads-large-multi-vm.html

  * igt@xe_exec_balancer@many-execqueues-parallel-userptr-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#7482])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-lnl-1/igt@xe_exec_balancer@many-execqueues-parallel-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2322] / [Intel XE#7372])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-rebind-imm:
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#7136]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-lnl-1/igt@xe_exec_fault_mode@many-execqueues-multi-queue-rebind-imm.html

  * igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#7136]) +2 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-1/igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-priority-smem:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#6874]) +3 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-1/igt@xe_exec_multi_queue@few-execs-preempt-mode-priority-smem.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#6874])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-lnl-1/igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr.html

  * igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads:
    - shard-bmg:          [PASS][46] -> [FAIL][47] ([Intel XE#7850])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-3/igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-9/igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads.html

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-huge-nomemset:
    - shard-lnl:          [PASS][48] -> [FAIL][49] ([Intel XE#8058])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-lnl-3/igt@xe_exec_system_allocator@threads-many-stride-mmap-huge-nomemset.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-lnl-8/igt@xe_exec_system_allocator@threads-many-stride-mmap-huge-nomemset.html

  * igt@xe_exec_system_allocator@twice-large-malloc-bo-unmap:
    - shard-bmg:          [PASS][50] -> [SKIP][51] ([Intel XE#6557] / [Intel XE#6703])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-6/igt@xe_exec_system_allocator@twice-large-malloc-bo-unmap.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-2/igt@xe_exec_system_allocator@twice-large-malloc-bo-unmap.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-basic:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#7138])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-1/igt@xe_exec_threads@threads-multi-queue-mixed-basic.html

  * igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#7138])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-lnl-1/igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr.html

  * igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit:
    - shard-bmg:          [PASS][54] -> [FAIL][55] ([Intel XE#7736]) +2 other tests fail
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-6/igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-2/igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit.html

  * igt@xe_multigpu_svm@mgpu-coherency-conflict:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#6964])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-1/igt@xe_multigpu_svm@mgpu-coherency-conflict.html

  * igt@xe_page_reclaim@binds-large-split:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#7793])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-1/igt@xe_page_reclaim@binds-large-split.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#2284] / [Intel XE#366] / [Intel XE#7370])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-lnl-1/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_vm@overcommit-nonfault-vram-lr-defer:
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#7892])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-lnl-1/igt@xe_vm@overcommit-nonfault-vram-lr-defer.html

  
#### Possible fixes ####

  * igt@fbdev@unaligned-write:
    - shard-bmg:          [FAIL][60] ([Intel XE#7950]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-2/igt@fbdev@unaligned-write.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-4/igt@fbdev@unaligned-write.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][62] ([Intel XE#1503]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-4/igt@kms_hdr@invalid-hdr.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-7/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010:
    - shard-bmg:          [SKIP][64] ([Intel XE#7922]) -> [PASS][65] +1 other test pass
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-4/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-7/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html

  * igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010:
    - shard-bmg:          [SKIP][66] ([Intel XE#7915]) -> [PASS][67] +1 other test pass
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-8/igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-9/igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010.html

  * igt@kms_pm_rpm@i2c:
    - shard-bmg:          [FAIL][68] ([Intel XE#8165]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-4/igt@kms_pm_rpm@i2c.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-8/igt@kms_pm_rpm@i2c.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][70] ([Intel XE#6321]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-10/igt@xe_evict@evict-mixed-many-threads-small.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-9/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_system_allocator@once-mmap-huge-nomemset:
    - shard-bmg:          [SKIP][72] ([Intel XE#6703]) -> [PASS][73] +49 other tests pass
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-2/igt@xe_exec_system_allocator@once-mmap-huge-nomemset.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-4/igt@xe_exec_system_allocator@once-mmap-huge-nomemset.html

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][74], [PASS][75], [PASS][76], [PASS][77], [PASS][78], [PASS][79], [PASS][80], [PASS][81], [PASS][82], [PASS][83], [PASS][84], [PASS][85], [PASS][86], [PASS][87], [PASS][88], [PASS][89], [PASS][90], [PASS][91], [PASS][92], [SKIP][93], [PASS][94], [PASS][95], [PASS][96], [PASS][97], [PASS][98], [PASS][99]) ([Intel XE#378] / [Intel XE#7405]) -> ([PASS][100], [PASS][101], [PASS][102], [PASS][103], [PASS][104], [PASS][105], [PASS][106], [PASS][107], [PASS][108], [PASS][109], [PASS][110], [PASS][111], [PASS][112], [PASS][113], [PASS][114], [PASS][115], [PASS][116], [PASS][117], [PASS][118], [PASS][119], [PASS][120], [PASS][121], [PASS][122])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-lnl-8/igt@xe_module_load@load.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-lnl-4/igt@xe_module_load@load.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-lnl-4/igt@xe_module_load@load.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-lnl-4/igt@xe_module_load@load.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-lnl-8/igt@xe_module_load@load.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-lnl-1/igt@xe_module_load@load.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-lnl-1/igt@xe_module_load@load.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-lnl-1/igt@xe_module_load@load.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-lnl-2/igt@xe_module_load@load.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-lnl-2/igt@xe_module_load@load.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-lnl-1/igt@xe_module_load@load.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-lnl-2/igt@xe_module_load@load.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-lnl-6/igt@xe_module_load@load.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-lnl-2/igt@xe_module_load@load.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-lnl-7/igt@xe_module_load@load.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-lnl-7/igt@xe_module_load@load.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-lnl-5/igt@xe_module_load@load.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-lnl-3/igt@xe_module_load@load.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-lnl-3/igt@xe_module_load@load.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-lnl-5/igt@xe_module_load@load.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-lnl-5/igt@xe_module_load@load.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-lnl-5/igt@xe_module_load@load.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-lnl-7/igt@xe_module_load@load.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-lnl-7/igt@xe_module_load@load.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-lnl-3/igt@xe_module_load@load.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-lnl-8/igt@xe_module_load@load.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-lnl-3/igt@xe_module_load@load.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-lnl-1/igt@xe_module_load@load.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-lnl-3/igt@xe_module_load@load.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-lnl-3/igt@xe_module_load@load.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-lnl-3/igt@xe_module_load@load.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-lnl-2/igt@xe_module_load@load.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-lnl-2/igt@xe_module_load@load.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-lnl-7/igt@xe_module_load@load.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-lnl-7/igt@xe_module_load@load.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-lnl-7/igt@xe_module_load@load.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-lnl-5/igt@xe_module_load@load.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-lnl-5/igt@xe_module_load@load.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-lnl-5/igt@xe_module_load@load.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-lnl-4/igt@xe_module_load@load.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-lnl-4/igt@xe_module_load@load.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-lnl-4/igt@xe_module_load@load.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-lnl-4/igt@xe_module_load@load.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-lnl-8/igt@xe_module_load@load.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-lnl-8/igt@xe_module_load@load.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-lnl-8/igt@xe_module_load@load.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-lnl-8/igt@xe_module_load@load.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-lnl-1/igt@xe_module_load@load.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-lnl-1/igt@xe_module_load@load.html

  * igt@xe_vm@large-userptr-misaligned-binds-16777216:
    - shard-bmg:          [DMESG-FAIL][123] ([Intel XE#5545]) -> [PASS][124]
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-2/igt@xe_vm@large-userptr-misaligned-binds-16777216.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-4/igt@xe_vm@large-userptr-misaligned-binds-16777216.html

  
#### Warnings ####

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
    - shard-bmg:          [SKIP][125] ([Intel XE#1124]) -> [SKIP][126] ([Intel XE#6703]) +2 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-6/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-2/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html

  * igt@kms_bw@linear-tiling-3-displays-target-2560x1440p:
    - shard-bmg:          [SKIP][127] ([Intel XE#367]) -> [SKIP][128] ([Intel XE#6703])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-6/igt@kms_bw@linear-tiling-3-displays-target-2560x1440p.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-2/igt@kms_bw@linear-tiling-3-displays-target-2560x1440p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs:
    - shard-bmg:          [SKIP][129] ([Intel XE#2887]) -> [SKIP][130] ([Intel XE#6703]) +2 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-6/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-2/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs.html

  * igt@kms_chamelium_audio@hdmi-audio:
    - shard-bmg:          [SKIP][131] ([Intel XE#6703]) -> [SKIP][132] ([Intel XE#2252])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-2/igt@kms_chamelium_audio@hdmi-audio.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-4/igt@kms_chamelium_audio@hdmi-audio.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-bmg:          [SKIP][133] ([Intel XE#2252]) -> [SKIP][134] ([Intel XE#6703]) +1 other test skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-6/igt@kms_chamelium_frames@dp-crc-single.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-2/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-bmg:          [SKIP][135] ([Intel XE#2244]) -> [SKIP][136] ([Intel XE#6703])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-6/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-2/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_frontbuffer_tracking@drrshdr-1p-rte:
    - shard-bmg:          [SKIP][137] ([Intel XE#2311]) -> [SKIP][138] ([Intel XE#6703]) +9 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-6/igt@kms_frontbuffer_tracking@drrshdr-1p-rte.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-2/igt@kms_frontbuffer_tracking@drrshdr-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][139] ([Intel XE#4141]) -> [SKIP][140] ([Intel XE#6703]) +1 other test skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][141] ([Intel XE#4141]) -> [DMESG-FAIL][142] ([Intel XE#5545] / [Intel XE#7774])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][143] ([Intel XE#6703]) -> [SKIP][144] ([Intel XE#2311]) +5 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-blt:
    - shard-bmg:          [SKIP][145] ([Intel XE#7061]) -> [SKIP][146] ([Intel XE#6703])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-blt.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][147] ([Intel XE#6703]) -> [SKIP][148] ([Intel XE#2313]) +2 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-mmap-wc:
    - shard-bmg:          [SKIP][149] ([Intel XE#7061] / [Intel XE#7356]) -> [SKIP][150] ([Intel XE#6703])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-mmap-wc.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-render:
    - shard-bmg:          [SKIP][151] ([Intel XE#6703]) -> [SKIP][152] ([Intel XE#7061] / [Intel XE#7356])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-render.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][153] ([Intel XE#2313]) -> [SKIP][154] ([Intel XE#6703]) +8 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-6/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-2/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][155] ([Intel XE#3544] / [Intel XE#7915] / [Intel XE#7916]) -> [SKIP][156] ([Intel XE#3544] / [Intel XE#7916])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f:
    - shard-bmg:          [SKIP][157] ([Intel XE#7915]) -> [SKIP][158] ([Intel XE#7916]) +1 other test skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-8/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-5/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-bmg:          [SKIP][159] ([Intel XE#2763] / [Intel XE#6886]) -> [SKIP][160] ([Intel XE#6703])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:
    - shard-bmg:          [SKIP][161] ([Intel XE#1489]) -> [SKIP][162] ([Intel XE#6703]) +1 other test skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-6/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-2/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:
    - shard-bmg:          [SKIP][163] ([Intel XE#6703]) -> [SKIP][164] ([Intel XE#1489]) +1 other test skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr@psr-sprite-render:
    - shard-bmg:          [SKIP][165] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][166] ([Intel XE#6703]) +1 other test skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-6/igt@kms_psr@psr-sprite-render.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-2/igt@kms_psr@psr-sprite-render.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][167] ([Intel XE#1729] / [Intel XE#7424]) -> [SKIP][168] ([Intel XE#2426] / [Intel XE#5848])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][169] ([Intel XE#2509] / [Intel XE#7437]) -> [SKIP][170] ([Intel XE#2426] / [Intel XE#5848])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_eudebug@basic-exec-queues:
    - shard-bmg:          [SKIP][171] ([Intel XE#7636]) -> [SKIP][172] ([Intel XE#6703]) +2 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-6/igt@xe_eudebug@basic-exec-queues.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-2/igt@xe_eudebug@basic-exec-queues.html

  * igt@xe_eudebug@connect-user:
    - shard-bmg:          [SKIP][173] ([Intel XE#6703]) -> [SKIP][174] ([Intel XE#7636]) +1 other test skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-2/igt@xe_eudebug@connect-user.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-4/igt@xe_eudebug@connect-user.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:
    - shard-bmg:          [SKIP][175] ([Intel XE#2322] / [Intel XE#7372]) -> [SKIP][176] ([Intel XE#6703])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-6/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html

  * igt@xe_exec_fault_mode@twice-multi-queue-imm:
    - shard-bmg:          [SKIP][177] ([Intel XE#7136]) -> [SKIP][178] ([Intel XE#6703]) +2 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-6/igt@xe_exec_fault_mode@twice-multi-queue-imm.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-2/igt@xe_exec_fault_mode@twice-multi-queue-imm.html

  * igt@xe_exec_multi_queue@max-queues-preempt-mode-close-fd-smem:
    - shard-bmg:          [SKIP][179] ([Intel XE#6703]) -> [SKIP][180] ([Intel XE#6874]) +1 other test skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-2/igt@xe_exec_multi_queue@max-queues-preempt-mode-close-fd-smem.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-4/igt@xe_exec_multi_queue@max-queues-preempt-mode-close-fd-smem.html

  * igt@xe_exec_multi_queue@one-queue-preempt-mode-close-fd-smem:
    - shard-bmg:          [SKIP][181] ([Intel XE#6874]) -> [SKIP][182] ([Intel XE#6703]) +4 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-6/igt@xe_exec_multi_queue@one-queue-preempt-mode-close-fd-smem.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-2/igt@xe_exec_multi_queue@one-queue-preempt-mode-close-fd-smem.html

  * igt@xe_exec_reset@multi-queue-cancel:
    - shard-bmg:          [SKIP][183] ([Intel XE#7866]) -> [SKIP][184] ([Intel XE#6703])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-6/igt@xe_exec_reset@multi-queue-cancel.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-2/igt@xe_exec_reset@multi-queue-cancel.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr-invalidate-race:
    - shard-bmg:          [SKIP][185] ([Intel XE#7138]) -> [SKIP][186] ([Intel XE#6703]) +2 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-6/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr-invalidate-race.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr-invalidate-race.html

  * igt@xe_page_reclaim@prl-max-entries:
    - shard-bmg:          [SKIP][187] ([Intel XE#7793]) -> [SKIP][188] ([Intel XE#6703])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-6/igt@xe_page_reclaim@prl-max-entries.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-2/igt@xe_page_reclaim@prl-max-entries.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-bmg:          [SKIP][189] ([Intel XE#2284] / [Intel XE#7370]) -> [SKIP][190] ([Intel XE#6703])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-6/igt@xe_pm@d3cold-mmap-system.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-2/igt@xe_pm@d3cold-mmap-system.html

  
  [Intel XE#1062]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#5177]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5177
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5681]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5681
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#6557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557
  [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
  [Intel XE#6779]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6779
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#7312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7312
  [Intel XE#7318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7318
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7385]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385
  [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7457
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
  [Intel XE#7644]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7644
  [Intel XE#7736]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7736
  [Intel XE#7774]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7850
  [Intel XE#7866]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7866
  [Intel XE#7892]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7892
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#7915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915
  [Intel XE#7916]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7916
  [Intel XE#7922]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7922
  [Intel XE#7950]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7950
  [Intel XE#8058]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8058
  [Intel XE#8165]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8165
  [i915#4767]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4767


Build changes
-------------

  * Linux: xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4 -> xe-pw-165524v3

  IGT_8936: 98b65acc4f6edf68cd52b30f27b83049c4c5c83b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4: cd7e65a9c3a38736427bbd62baf2aaa1240902a4
  xe-pw-165524v3: 165524v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/index.html

--===============6710815756572031592==
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
<tr><td><b>Series:</b></td><td>drm/i915: crtc iteration cleanups (rev3)</td=
></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/165524/">https://patchwork.freedesktop.org/series/165524/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-165524v3/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-165524v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5122-cd7e65a9c3a38736427bbd62baf2aaa12=
40902a4_FULL -&gt; xe-pw-165524v3_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-165524v3_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunbind-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-6/igt@core_hot=
unplug@hotunbind-rebind.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-2/igt@core_hotunplug@hotunb=
ind-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6779">Intel XE#6779</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165524v3/shard-lnl-1/igt@intel_hwmon@hwmon-read.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/11=
25">Intel XE#1125</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7312">Intel XE#7312</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-6/igt@intel_hw=
mon@hwmon-read.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-165524v3/shard-bmg-2/igt@intel_hwmon@hwmon-read.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/517=
7">Intel XE#5177</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165524v3/shard-lnl-1/igt@kms_big_fb@y-tiled-max-hw-str=
ide-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165524v3/shard-bmg-1/igt@kms_ccs@bad-rotation-90-4-til=
ed-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165524v3/shard-lnl-1/igt@kms_ccs@crc-primary-basic-4-t=
iled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165524v3/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-bas=
ic-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165524v3/shard-bmg-1/igt@kms_content_protection@dp-mst=
-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2390">Intel XE#2390</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-6/igt@kms_curs=
or_crc@cursor-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-2/igt@kms_cursor_crc@cursor-s=
uspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/6703">Intel XE#6703</a>) +108 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165524v3/shard-lnl-1/igt@kms_dsc@dsc-fractional-bpp-wi=
th-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-lnl-8/igt@kms_fbco=
n_fbt@fbc-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-165524v3/shard-lnl-7/igt@kms_fbcon_fbt@fbc-suspend.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/4767">i915#4767</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-lnl-5/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-lnl-2/ig=
t@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#30=
1</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165524v3/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bp=
p-4tile-to-16bpp-4tile-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385">In=
tel XE#7385</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165524v3/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bp=
p-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1=
397</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/73=
85">Intel XE#7385</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-rgb101010-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165524v3/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs=
hdr-rgb101010-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-stridechange:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165524v3/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-=
stridechange.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4141">Intel XE#4141</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165524v3/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcd=
rrs-rgb101010-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165524v3/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcd=
rrshdr-argb161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-stridechange:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165524v3/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcd=
rrshdr-stridechange.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165524v3/shard-lnl-1/igt@kms_frontbuffer_tracking@fbch=
dr-2p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +2 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-indfb-draw-render=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165524v3/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcp=
srhdr-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +6 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3-xrgb16161616f:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-4/igt@kms_hdr@=
static-toggle-suspend@pipe-a-hdmi-a-3-xrgb16161616f.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg=
-8/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3-xrgb16161616f.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915=
">Intel XE#7915</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-9/igt@kms_plan=
e_lowres@tiling-x.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-165524v3/shard-bmg-2/igt@kms_plane_lowres@tiling-x.h=
tml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/5681">Intel XE#5681</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-9/igt@kms_plan=
e_lowres@tiling-x@pipe-d-hdmi-a-3.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-2/igt@kms_plane_l=
owres@tiling-x@pipe-d-hdmi-a-3.html">DMESG-WARN</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165524v3/shard-bmg-1/igt@kms_psr2_sf@fbc-psr2-cursor-p=
lane-update-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-no-drrs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165524v3/shard-bmg-1/igt@kms_psr@pr-no-drrs.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">=
Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2850">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-lnl-4/igt@kms_vrr@=
seamless-rr-switch-virtual@pipe-a-edp-1.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-lnl-1/igt@kms_v=
rr@seamless-rr-switch-virtual@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2142">Intel XE#2142</a>) +1 =
other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@vm-bind-fault-mode-decompress:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165524v3/shard-lnl-1/igt@xe_ccs@vm-bind-fault-mode-dec=
ompress.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7644">Intel XE#7644</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@create-big-vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165524v3/shard-lnl-1/igt@xe_create@create-big-vram.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1062">Intel XE#1062</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7318">Intel XE#7318</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7457">Intel XE#7457</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165524v3/shard-lnl-1/igt@xe_evict@evict-threads-large-=
multi-vm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/6540">Intel XE#6540</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-parallel-userptr-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165524v3/shard-lnl-1/igt@xe_exec_balancer@many-execque=
ues-parallel-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165524v3/shard-bmg-1/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-null-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>=
)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-rebind-imm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165524v3/shard-lnl-1/igt@xe_exec_fault_mode@many-execq=
ueues-multi-queue-rebind-imm.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165524v3/shard-bmg-1/igt@xe_exec_fault_mode@many-multi=
-queue-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +2 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-priority-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165524v3/shard-bmg-1/igt@xe_exec_multi_queue@few-execs=
-preempt-mode-priority-smem.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +3 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165524v3/shard-lnl-1/igt@xe_exec_multi_queue@few-execs=
-preempt-mode-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-3/igt@xe_exec_=
reset@long-spin-comp-reuse-many-preempt-threads.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-9/i=
gt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7850">Intel =
XE#7850</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-huge-nomemset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-lnl-3/igt@xe_exec_=
system_allocator@threads-many-stride-mmap-huge-nomemset.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard=
-lnl-8/igt@xe_exec_system_allocator@threads-many-stride-mmap-huge-nomemset.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/8058">Intel XE#8058</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-malloc-bo-unmap:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-6/igt@xe_exec_=
system_allocator@twice-large-malloc-bo-unmap.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-2/ig=
t@xe_exec_system_allocator@twice-large-malloc-bo-unmap.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6=
557</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/67=
03">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165524v3/shard-bmg-1/igt@xe_exec_threads@threads-multi=
-queue-mixed-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7138">Intel XE#7138</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165524v3/shard-lnl-1/igt@xe_exec_threads@threads-multi=
-queue-shared-vm-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-6/igt@xe_live_=
ktest@xe_migrate@xe_migrate_sanity_kunit.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-2/igt@xe_l=
ive_ktest@xe_migrate@xe_migrate_sanity_kunit.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7736">Intel XE#7736</a>) +=
2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-coherency-conflict:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165524v3/shard-bmg-1/igt@xe_multigpu_svm@mgpu-coherenc=
y-conflict.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@binds-large-split:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165524v3/shard-bmg-1/igt@xe_page_reclaim@binds-large-s=
plit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165524v3/shard-lnl-1/igt@xe_pm@d3cold-mmap-system.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/366">Intel XE#366</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@overcommit-nonfault-vram-lr-defer:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165524v3/shard-lnl-1/igt@xe_vm@overcommit-nonfault-vra=
m-lr-defer.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7892">Intel XE#7892</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@unaligned-write:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-2/igt@fbdev@un=
aligned-write.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7950">Intel XE#7950</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-4/igt@fbdev@unaligned-w=
rite.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-4/igt@kms_hdr@=
invalid-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-7/igt@kms_hdr@invalid-hdr=
.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-4/igt@kms_hdr@=
invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7922">Intel XE#7922</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-b=
mg-7/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html">PASS</a> +1 =
other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-8/igt@kms_hdr@=
static-swap@pipe-a-hdmi-a-3-xrgb2101010.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-b=
mg-9/igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010.html">PASS</a> +1 =
other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-4/igt@kms_pm_r=
pm@i2c.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/8165">Intel XE#8165</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-8/igt@kms_pm_rpm@i2c.html">PAS=
S</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-10/igt@xe_evic=
t@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-bm=
g-9/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-huge-nomemset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-2/igt@xe_exec_=
system_allocator@once-mmap-huge-nomemset.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-=
bmg-4/igt@xe_exec_system_allocator@once-mmap-huge-nomemset.html">PASS</a> +=
49 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-lnl-8/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-lnl-4/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-lnl-4/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-lnl-4=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-l=
nl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/sha=
rd-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4=
/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa12409=
02a4/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1=
240902a4/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2=
aaa1240902a4/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62=
baf2aaa1240902a4/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427b=
bd62baf2aaa1240902a4/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736=
427bbd62baf2aaa1240902a4/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a3=
8736427bbd62baf2aaa1240902a4/shard-lnl-2/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9=
c3a38736427bbd62baf2aaa1240902a4/shard-lnl-7/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e=
65a9c3a38736427bbd62baf2aaa1240902a4/shard-lnl-7/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5122-=
cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-lnl-5/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5=
122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-lnl-3/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-lnl-3/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-lnl-5/igt@xe_mod=
ule_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-lnl-5/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-lnl-5/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-lnl-=
7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-=
lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/sh=
ard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a=
4/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405">Intel XE#7405=
</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165=
524v3/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-lnl-1/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-165524v3/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-lnl=
-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-165524v3/shard-lnl-3/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165=
524v3/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-lnl-2/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-165524v3/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-lnl=
-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-165524v3/shard-lnl-7/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165=
524v3/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-lnl-5/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-165524v3/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-lnl=
-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-165524v3/shard-lnl-4/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165=
524v3/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-lnl-4/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-165524v3/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-lnl=
-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-165524v3/shard-lnl-8/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165=
524v3/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-lnl-1/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-165524v3/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-misaligned-binds-16777216:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-2/igt@xe_vm@la=
rge-userptr-misaligned-binds-16777216.html">DMESG-FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/sha=
rd-bmg-4/igt@xe_vm@large-userptr-misaligned-binds-16777216.html">PASS</a></=
li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-6/igt@kms_big_=
fb@yf-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-2/igt@kms=
_big_fb@yf-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-6/igt@kms_bw@l=
inear-tiling-3-displays-target-2560x1440p.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-b=
mg-2/igt@kms_bw@linear-tiling-3-displays-target-2560x1440p.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel =
XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-6/igt@kms_ccs@=
crc-primary-basic-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-=
2/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703=
</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-2/igt@kms_cham=
elium_audio@hdmi-audio.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-4/igt@kms_cham=
elium_audio@hdmi-audio.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-single:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-6/igt@kms_cham=
elium_frames@dp-crc-single.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-2/igt@kms_=
chamelium_frames@dp-crc-single.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-6/igt@kms_dsc@=
dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-2/igt@kms=
_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-rte:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrshdr-1p-rte.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-2/ig=
t@kms_frontbuffer_tracking@drrshdr-1p-rte.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +9 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1655=
24v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1655=
24v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-dra=
w-blt.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/5545">Intel XE#5545</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7774">Intel XE#7774</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel=
 XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-165524v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-c=
ur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcdrrshdr-argb161616f-draw-blt.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v=
3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-blt.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#670=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165=
524v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgf=
lip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2313">Intel XE#2313</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcpsr-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">In=
tel XE#7356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-165524v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbcpsr-argb161616f-draw-render.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3=
/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-render.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/7061">Intel XE#7061</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel =
XE#2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-165524v3/shard-bmg-2/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur=
-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-8/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3544">Intel XE#3544</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/7916">Intel XE#7916</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3=
/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7916">Intel =
XE#7916</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-8/igt@kms_hdr@=
brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1655=
24v3/shard-bmg-5/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb161616=
16f.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/7916">Intel XE#7916</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-6/igt@kms_plan=
e_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel X=
E#2763</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/6886">Intel XE#6886</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-165524v3/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-f=
actor-0-25-downscale-factor-0-5.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-6/igt@kms_psr2=
_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1655=
24v3/shard-bmg-2/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed=
-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-2/igt@kms_psr2=
_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/s=
hard-bmg-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
89">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-6/igt@kms_psr@=
psr-sprite-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-2/ig=
t@kms_psr@psr-sprite-render.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-4/igt@kms_tile=
d_display@basic-test-pattern.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shar=
d-bmg-8/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">In=
tel XE#5848</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-6/igt@kms_tile=
d_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437">Intel X=
E#7437</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-165524v3/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamel=
ium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2426">Intel XE#2426</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-exec-queues:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-6/igt@xe_eudeb=
ug@basic-exec-queues.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-2/igt@xe_eudebug=
@basic-exec-queues.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@connect-user:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-2/igt@xe_eudeb=
ug@connect-user.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-4/igt@xe_eudebug@conn=
ect-user.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/7636">Intel XE#7636</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-6/igt@xe_exec_=
basic@multigpu-no-exec-basic-defer-mmap.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#73=
72</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-16=
5524v3/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-imm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-6/igt@xe_exec_=
fault_mode@twice-multi-queue-imm.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-2/ig=
t@xe_exec_fault_mode@twice-multi-queue-imm.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@max-queues-preempt-mode-close-fd-smem:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-2/igt@xe_exec_=
multi_queue@max-queues-preempt-mode-close-fd-smem.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1655=
24v3/shard-bmg-4/igt@xe_exec_multi_queue@max-queues-preempt-mode-close-fd-s=
mem.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/6874">Intel XE#6874</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-preempt-mode-close-fd-smem:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-6/igt@xe_exec_=
multi_queue@one-queue-preempt-mode-close-fd-smem.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v=
3/shard-bmg-2/igt@xe_exec_multi_queue@one-queue-preempt-mode-close-fd-smem.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/6703">Intel XE#6703</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-cancel:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-6/igt@xe_exec_=
reset@multi-queue-cancel.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7866">Intel XE#7866</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-2/igt@xe_exe=
c_reset@multi-queue-cancel.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr-invalidate-race=
:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-6/igt@xe_exec_=
threads@threads-multi-queue-mixed-fd-userptr-invalidate-race.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Inte=
l XE#7138</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-165524v3/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-mixed-fd-=
userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@prl-max-entries:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-6/igt@xe_page_=
reclaim@prl-max-entries.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-2/igt@xe_page=
_reclaim@prl-max-entries.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4/shard-bmg-6/igt@xe_pm@d3=
cold-mmap-system.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165524v3/shard-bmg-2/ig=
t@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4 -&gt; xe-pw-165=
524v3</li>
</ul>
<p>IGT_8936: 98b65acc4f6edf68cd52b30f27b83049c4c5c83b @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-5122-cd7e65a9c3a38736427bbd62baf2aaa1240902a4: cd7e65a9c3a38736427bbd6=
2baf2aaa1240902a4<br />
  xe-pw-165524v3: 165524v3</p>

</body>
</html>

--===============6710815756572031592==--
