Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09D4FFAD41E
	for <intel-xe@archiver.kernel.org>; Thu, 23 Apr 2026 06:30:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF12C10E303;
	Thu, 23 Apr 2026 06:30:34 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F94F10E142;
 Thu, 23 Apr 2026 06:30:33 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7717237071834681501=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/xe=3A_Convert_stolen_m?=
 =?utf-8?q?emory_over_to_ttm=5Frange=5Fmanager_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sanjay Yadav" <sanjay.kumar.yadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 23 Apr 2026 06:30:33 -0000
Message-ID: <177692583324.1541.10635725043328091951@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260422125502.3088222-2-sanjay.kumar.yadav@intel.com>
In-Reply-To: <20260422125502.3088222-2-sanjay.kumar.yadav@intel.com>
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

--===============7717237071834681501==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Convert stolen memory over to ttm_range_manager (rev4)
URL   : https://patchwork.freedesktop.org/series/164694/
State : success

== Summary ==

CI Bug Log - changes from xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c_FULL -> xe-pw-164694v4_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-164694v4_FULL:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_bw@connected-linear-tiling-2-displays-target-3840x2160p}:
    - shard-bmg:          NOTRUN -> [SKIP][1] +2 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-target-3840x2160p.html

  
Known issues
------------

  Here are the changes found in xe-pw-164694v4_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-bmg:          NOTRUN -> [SKIP][2] ([Intel XE#2370])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-8/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#2327]) +2 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-1/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#1124]) +7 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2887]) +6 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-8/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#3432])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2724] / [Intel XE#7449])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-3/igt@kms_cdclk@mode-transition.html

  * igt@kms_chamelium_color@gamma:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2325] / [Intel XE#7358])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-10/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2252]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-10/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2390] / [Intel XE#6974]) +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-7/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2320]) +2 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-9/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2244])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-9/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_feature_discovery@psr2:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2374] / [Intel XE#6128])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-9/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [PASS][14] -> [FAIL][15] ([Intel XE#301] / [Intel XE#3149]) +1 other test fail
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#7178] / [Intel XE#7351])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2311]) +16 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#7061] / [Intel XE#7356]) +3 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#4141]) +6 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2313]) +16 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][21] -> [SKIP][22] ([Intel XE#1503])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c/shard-bmg-1/igt@kms_hdr@invalid-hdr.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-6/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#7283]) +3 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-3/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2763] / [Intel XE#6886]) +4 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [PASS][25] -> [FAIL][26] ([Intel XE#7340] / [Intel XE#7504])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c/shard-lnl-3/igt@kms_pm_dc@dc5-dpms.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-lnl-1/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [PASS][27] -> [FAIL][28] ([Intel XE#7340])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c/shard-lnl-5/igt@kms_pm_dc@dc6-psr.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-lnl-1/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#1489]) +4 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-8/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-psr2-sprite-render:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2234] / [Intel XE#2850]) +4 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-3/igt@kms_psr@fbc-psr2-sprite-render.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-lnl:          [PASS][31] -> [SKIP][32] ([Intel XE#4692] / [Intel XE#7508])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c/shard-lnl-4/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-lnl-5/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2330] / [Intel XE#5813])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-9/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#2413])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-2/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_sharpness_filter@filter-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#6503])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-3/igt@kms_sharpness_filter@filter-dpms.html

  * igt@kms_vrr@cmrr:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2168] / [Intel XE#7444])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-8/igt@kms_vrr@cmrr.html

  * igt@xe_eudebug_online@pagefault-write:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#7636]) +7 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-5/igt@xe_eudebug_online@pagefault-write.html

  * igt@xe_evict@evict-small-multi-queue-cm:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#7140])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-7/igt@xe_evict@evict-small-multi-queue-cm.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2322] / [Intel XE#7372]) +2 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html

  * igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#7136]) +7 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-7/igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_multi_queue@two-queues-priority:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#6874]) +17 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-9/igt@xe_exec_multi_queue@two-queues-priority.html

  * igt@xe_exec_threads@threads-multi-queue-fd-userptr-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#7138]) +3 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-fd-userptr-rebind.html

  * igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#6281] / [Intel XE#7426])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-8/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_device_probe_early:
    - shard-bmg:          [PASS][44] -> [ABORT][45] ([Intel XE#7578])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-xe_device_probe_early.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-10/igt@xe_fault_injection@inject-fault-probe-function-xe_device_probe_early.html

  * igt@xe_multigpu_svm@mgpu-latency-basic:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#6964]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-5/igt@xe_multigpu_svm@mgpu-latency-basic.html

  * igt@xe_oa@non-zero-reason-all:
    - shard-lnl:          [PASS][47] -> [FAIL][48] ([Intel XE#7334]) +1 other test fail
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c/shard-lnl-3/igt@xe_oa@non-zero-reason-all.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-lnl-2/igt@xe_oa@non-zero-reason-all.html

  * igt@xe_page_reclaim@pat-index-xd:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#7793])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-5/igt@xe_page_reclaim@pat-index-xd.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-rpm:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#4733] / [Intel XE#7417])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-9/igt@xe_pxp@pxp-stale-bo-bind-post-rpm.html

  * igt@xe_query@multigpu-query-pxp-status:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#944]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-6/igt@xe_query@multigpu-query-pxp-status.html

  * igt@xe_sriov_flr@flr-vfs-parallel:
    - shard-bmg:          [PASS][52] -> [FAIL][53] ([Intel XE#6569])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c/shard-bmg-9/igt@xe_sriov_flr@flr-vfs-parallel.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-2/igt@xe_sriov_flr@flr-vfs-parallel.html

  * igt@xe_survivability@runtime-survivability:
    - shard-bmg:          [PASS][54] -> [DMESG-WARN][55] ([Intel XE#6627] / [Intel XE#7419])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c/shard-bmg-7/igt@xe_survivability@runtime-survivability.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-3/igt@xe_survivability@runtime-survivability.html

  
#### Possible fixes ####

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-bmg:          [ABORT][56] ([Intel XE#5545] / [Intel XE#6652]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c/shard-bmg-2/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-6/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
    - shard-lnl:          [FAIL][58] ([Intel XE#2142]) -> [PASS][59] +1 other test pass
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c/shard-lnl-7/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-lnl-7/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html

  * igt@xe_ccs@suspend-resume:
    - shard-bmg:          [FAIL][60] -> [PASS][61] +5 other tests pass
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c/shard-bmg-2/igt@xe_ccs@suspend-resume.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-8/igt@xe_ccs@suspend-resume.html

  * igt@xe_configfs@gt-types-allowed:
    - shard-bmg:          [DMESG-WARN][62] ([Intel XE#7725]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c/shard-bmg-6/igt@xe_configfs@gt-types-allowed.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-1/igt@xe_configfs@gt-types-allowed.html

  * igt@xe_configfs@survivability-mode:
    - shard-bmg:          [ABORT][64] ([Intel XE#7578]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c/shard-bmg-1/igt@xe_configfs@survivability-mode.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-7/igt@xe_configfs@survivability-mode.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][66] ([Intel XE#6321]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c/shard-bmg-6/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-2/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_exec_system_allocator@eu-fault-2m-once-device-host:
    - shard-bmg:          [FAIL][68] ([Intel XE#7592]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c/shard-bmg-3/igt@xe_exec_system_allocator@eu-fault-2m-once-device-host.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-3/igt@xe_exec_system_allocator@eu-fault-2m-once-device-host.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-bmg:          [FAIL][70] ([Intel XE#6569]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c/shard-bmg-2/igt@xe_sriov_flr@flr-each-isolation.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-1/igt@xe_sriov_flr@flr-each-isolation.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][72] ([Intel XE#2312]) -> [SKIP][73] ([Intel XE#2313])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-render.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-render.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][74], [PASS][75], [SKIP][76], [DMESG-WARN][77], [PASS][78], [PASS][79], [PASS][80], [PASS][81], [PASS][82], [PASS][83], [PASS][84], [PASS][85], [PASS][86], [PASS][87], [PASS][88], [PASS][89], [PASS][90], [PASS][91], [PASS][92], [PASS][93], [PASS][94], [PASS][95], [PASS][96], [PASS][97], [PASS][98], [PASS][99]) ([Intel XE#2457] / [Intel XE#7405] / [Intel XE#7725]) -> ([PASS][100], [PASS][101], [PASS][102], [PASS][103], [PASS][104], [PASS][105], [PASS][106], [PASS][107], [PASS][108], [PASS][109], [PASS][110], [PASS][111], [PASS][112], [PASS][113], [PASS][114], [PASS][115], [PASS][116], [PASS][117], [PASS][118], [SKIP][119], [PASS][120], [PASS][121], [PASS][122], [PASS][123], [PASS][124], [PASS][125]) ([Intel XE#2457] / [Intel XE#7405])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c/shard-bmg-2/igt@xe_module_load@load.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c/shard-bmg-2/igt@xe_module_load@load.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c/shard-bmg-5/igt@xe_module_load@load.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c/shard-bmg-6/igt@xe_module_load@load.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c/shard-bmg-6/igt@xe_module_load@load.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c/shard-bmg-7/igt@xe_module_load@load.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c/shard-bmg-7/igt@xe_module_load@load.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c/shard-bmg-7/igt@xe_module_load@load.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c/shard-bmg-5/igt@xe_module_load@load.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c/shard-bmg-2/igt@xe_module_load@load.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c/shard-bmg-9/igt@xe_module_load@load.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c/shard-bmg-9/igt@xe_module_load@load.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c/shard-bmg-5/igt@xe_module_load@load.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c/shard-bmg-9/igt@xe_module_load@load.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c/shard-bmg-5/igt@xe_module_load@load.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c/shard-bmg-1/igt@xe_module_load@load.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c/shard-bmg-1/igt@xe_module_load@load.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c/shard-bmg-10/igt@xe_module_load@load.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c/shard-bmg-10/igt@xe_module_load@load.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c/shard-bmg-10/igt@xe_module_load@load.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c/shard-bmg-6/igt@xe_module_load@load.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c/shard-bmg-3/igt@xe_module_load@load.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c/shard-bmg-3/igt@xe_module_load@load.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c/shard-bmg-1/igt@xe_module_load@load.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c/shard-bmg-8/igt@xe_module_load@load.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c/shard-bmg-8/igt@xe_module_load@load.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-6/igt@xe_module_load@load.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-1/igt@xe_module_load@load.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-1/igt@xe_module_load@load.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-6/igt@xe_module_load@load.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-1/igt@xe_module_load@load.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-8/igt@xe_module_load@load.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-6/igt@xe_module_load@load.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-8/igt@xe_module_load@load.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-3/igt@xe_module_load@load.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-5/igt@xe_module_load@load.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-2/igt@xe_module_load@load.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-7/igt@xe_module_load@load.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-9/igt@xe_module_load@load.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-9/igt@xe_module_load@load.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-9/igt@xe_module_load@load.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-3/igt@xe_module_load@load.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-3/igt@xe_module_load@load.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-10/igt@xe_module_load@load.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-10/igt@xe_module_load@load.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-5/igt@xe_module_load@load.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-2/igt@xe_module_load@load.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-2/igt@xe_module_load@load.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-5/igt@xe_module_load@load.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-5/igt@xe_module_load@load.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-7/igt@xe_module_load@load.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-7/igt@xe_module_load@load.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4692]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4692
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#6128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6128
  [Intel XE#6281]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
  [Intel XE#6627]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6627
  [Intel XE#6652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#7140]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7334]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7334
  [Intel XE#7340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7419]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7419
  [Intel XE#7426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7426
  [Intel XE#7444]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7444
  [Intel XE#7449]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449
  [Intel XE#7504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7504
  [Intel XE#7508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7508
  [Intel XE#7578]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7578
  [Intel XE#7592]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7592
  [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
  [Intel XE#7725]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7725
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_8868 -> IGT_8869
  * Linux: xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c -> xe-pw-164694v4

  IGT_8868: 731d4d56fcb40355ce9d65cb088d4b4773dd8b85 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8869: 4963e78e038806cc75f885d7d5713bb0d12c01d1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c: 28247e192ca66016a4b374ff06acdf9dbb6cfe7c
  xe-pw-164694v4: 164694v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/index.html

--===============7717237071834681501==
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
<tr><td><b>Series:</b></td><td>drm/xe: Convert stolen memory over to ttm_ra=
nge_manager (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/164694/">https://patchwork.freedesktop.org/series/164694/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-164694v4/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-164694v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4925-28247e192ca66016a4b374ff06acdf9db=
b6cfe7c_FULL -&gt; xe-pw-164694v4_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1646=
94v4_FULL:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@kms_bw@connected-linear-tiling-2-displays-target-3840x2160p}:<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164694v4/shard-bmg-5/igt@kms_bw@connected-linear-tilin=
g-2-displays-target-3840x2160p.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-164694v4_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164694v4/shard-bmg-8/igt@kms_atomic_transition@plane-a=
ll-modeset-transition-internal-panels.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164694v4/shard-bmg-1/igt@kms_big_fb@x-tiled-32bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2327">Intel XE#2327</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164694v4/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-str=
ide-32bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164694v4/shard-bmg-8/igt@kms_ccs@bad-aux-stride-4-tile=
d-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2887">Intel XE#2887</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164694v4/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-y=
-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164694v4/shard-bmg-3/igt@kms_cdclk@mode-transition.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2724">Intel XE#2724</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7449">Intel XE#7449</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164694v4/shard-bmg-10/igt@kms_chamelium_color@gamma.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2325">Intel XE#2325</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm-disable:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164694v4/shard-bmg-10/igt@kms_chamelium_hpd@dp-hpd-sto=
rm-disable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164694v4/shard-bmg-7/igt@kms_content_protection@dp-mst=
-lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2390">Intel XE#2390</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164694v4/shard-bmg-9/igt@kms_cursor_crc@cursor-offscre=
en-128x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2320">Intel XE#2320</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164694v4/shard-bmg-9/igt@kms_dsc@dsc-with-output-forma=
ts-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164694v4/shard-bmg-9/igt@kms_feature_discovery@psr2.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2374">Intel XE#2374</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/6128">Intel XE#6128</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c/shard-lnl-6/igt@kms_flip=
@flip-vs-expired-vblank@c-edp1.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-lnl-5/igt@kms_flip@flip-=
vs-expired-vblank@c-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) +1 other =
test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164694v4/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE=
#7351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164694v4/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs=
-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +16 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164694v4/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs=
-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +3 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164694v4/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +6 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164694v4/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +16 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c/shard-bmg-1/igt@kms_hdr@=
invalid-hdr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-164694v4/shard-bmg-6/igt@kms_hdr@invalid-hdr.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Int=
el XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164694v4/shard-bmg-3/igt@kms_plane@pixel-format-4-tile=
d-mtl-rc-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +3 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164694v4/shard-bmg-3/igt@kms_plane_scaling@planes-upsc=
ale-20x20-downscale-factor-0-5@pipe-b.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886=
</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c/shard-lnl-3/igt@kms_pm_d=
c@dc5-dpms.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-164694v4/shard-lnl-1/igt@kms_pm_dc@dc5-dpms.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340">Intel=
 XE#7340</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/7504">Intel XE#7504</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c/shard-lnl-5/igt@kms_pm_d=
c@dc6-psr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-164694v4/shard-lnl-1/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340">Intel X=
E#7340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164694v4/shard-bmg-8/igt@kms_psr2_sf@fbc-psr2-cursor-p=
lane-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164694v4/shard-bmg-3/igt@kms_psr@fbc-psr2-sprite-rende=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2850">Intel XE#2850</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c/shard-lnl-4/igt@kms_psr_=
stress_test@invalidate-primary-flip-overlay.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-lnl-5/igt@k=
ms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4692">Intel XE#4692=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7508"=
>Intel XE#7508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164694v4/shard-bmg-9/igt@kms_rotation_crc@primary-yf-t=
iled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2330">Intel XE#2330</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164694v4/shard-bmg-2/igt@kms_scaling_modes@scaling-mod=
e-full.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164694v4/shard-bmg-3/igt@kms_sharpness_filter@filter-d=
pms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164694v4/shard-bmg-8/igt@kms_vrr@cmrr.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel =
XE#2168</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/7444">Intel XE#7444</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@pagefault-write:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164694v4/shard-bmg-5/igt@xe_eudebug_online@pagefault-w=
rite.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7636">Intel XE#7636</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue-cm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164694v4/shard-bmg-7/igt@xe_evict@evict-small-multi-qu=
eue-cm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/7140">Intel XE#7140</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164694v4/shard-bmg-5/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-null-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>=
) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-prefetch=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164694v4/shard-bmg-7/igt@xe_exec_fault_mode@many-multi=
-queue-userptr-invalidate-race-prefetch.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +7 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-priority:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164694v4/shard-bmg-9/igt@xe_exec_multi_queue@two-queue=
s-priority.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6874">Intel XE#6874</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-fd-userptr-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164694v4/shard-bmg-5/igt@xe_exec_threads@threads-multi=
-queue-fd-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) +3 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164694v4/shard-bmg-8/igt@xe_fault_injection@exec-queue=
-create-fail-xe_pxp_exec_queue_add.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/6281">Intel XE#6281</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7426">Intel XE#7426</a=
>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_device_probe_early=
:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c/shard-bmg-8/igt@xe_fault=
_injection@inject-fault-probe-function-xe_device_probe_early.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/=
shard-bmg-10/igt@xe_fault_injection@inject-fault-probe-function-xe_device_p=
robe_early.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7578">Intel XE#7578</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-latency-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164694v4/shard-bmg-5/igt@xe_multigpu_svm@mgpu-latency-=
basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/6964">Intel XE#6964</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-zero-reason-all:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c/shard-lnl-3/igt@xe_oa@no=
n-zero-reason-all.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-164694v4/shard-lnl-2/igt@xe_oa@non-zero-reason-all.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/7334">Intel XE#7334</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@pat-index-xd:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164694v4/shard-bmg-5/igt@xe_page_reclaim@pat-index-xd.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-rpm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164694v4/shard-bmg-9/igt@xe_pxp@pxp-stale-bo-bind-post=
-rpm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4733">Intel XE#4733</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7417">Intel XE#7417</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-pxp-status:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164694v4/shard-bmg-6/igt@xe_query@multigpu-query-pxp-s=
tatus.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vfs-parallel:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c/shard-bmg-9/igt@xe_sriov=
_flr@flr-vfs-parallel.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-2/igt@xe_sriov_flr@flr-vfs-pa=
rallel.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/6569">Intel XE#6569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_survivability@runtime-survivability:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c/shard-bmg-7/igt@xe_survi=
vability@runtime-survivability.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-3/igt@xe_survivabili=
ty@runtime-survivability.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/6627">Intel XE#6627</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7419">Intel XE#7419</a>)</=
li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c/shard-bmg-2/igt@kms_big_=
fb@linear-64bpp-rotate-180.html">ABORT</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/6652">Intel XE#6652</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard=
-bmg-6/igt@kms_big_fb@linear-64bpp-rotate-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c/shard-lnl-7/igt@kms_vrr@=
seamless-rr-switch-virtual@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2142">Intel XE#2142</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-l=
nl-7/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">PASS</a> +1 =
other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c/shard-bmg-2/igt@xe_ccs@s=
uspend-resume.html">FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-164694v4/shard-bmg-8/igt@xe_ccs@suspend-resume.html">PAS=
S</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_configfs@gt-types-allowed:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c/shard-bmg-6/igt@xe_confi=
gfs@gt-types-allowed.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7725">Intel XE#7725</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-1/igt@xe_c=
onfigfs@gt-types-allowed.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_configfs@survivability-mode:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c/shard-bmg-1/igt@xe_confi=
gfs@survivability-mode.html">ABORT</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7578">Intel XE#7578</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-7/igt@xe_conf=
igfs@survivability-mode.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c/shard-bmg-6/igt@xe_evict=
@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shar=
d-bmg-2/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@eu-fault-2m-once-device-host:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c/shard-bmg-3/igt@xe_exec_=
system_allocator@eu-fault-2m-once-device-host.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7592">Intel XE#7592</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/s=
hard-bmg-3/igt@xe_exec_system_allocator@eu-fault-2m-once-device-host.html">=
PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c/shard-bmg-2/igt@xe_sriov=
_flr@flr-each-isolation.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/6569">Intel XE#6569</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-1/igt@xe_srio=
v_flr@flr-each-isolation.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel X=
E#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-164694v4/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-=
indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c/shard-bmg-2/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c/shard-bmg-2/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c/shard-bmg-5/igt=
@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c/shard-bmg-6=
/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c/s=
hard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe=
7c/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-4925-28247e192ca66016a4b374ff06acdf9dbb=
6cfe7c/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-4925-28247e192ca66016a4b374ff06acdf=
9dbb6cfe7c/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-4925-28247e192ca66016a4b374ff06=
acdf9dbb6cfe7c/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4925-28247e192ca66016a4b37=
4ff06acdf9dbb6cfe7c/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4925-28247e192ca66016a=
4b374ff06acdf9dbb6cfe7c/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4925-28247e192ca66=
016a4b374ff06acdf9dbb6cfe7c/shard-bmg-9/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4925-28247e192=
ca66016a4b374ff06acdf9dbb6cfe7c/shard-bmg-5/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4925-28247=
e192ca66016a4b374ff06acdf9dbb6cfe7c/shard-bmg-9/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4925-2=
8247e192ca66016a4b374ff06acdf9dbb6cfe7c/shard-bmg-5/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-49=
25-28247e192ca66016a4b374ff06acdf9dbb6cfe7c/shard-bmg-1/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c/shard-bmg-1/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c/shard-bmg-10/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c/shard-bmg-10/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c/shard-bmg-10/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c/shard-bm=
g-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c/shar=
d-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c/=
shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cf=
e7c/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-4925-28247e192ca66016a4b374ff06acdf9db=
b6cfe7c/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-4925-28247e192ca66016a4b374ff06acd=
f9dbb6cfe7c/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405">In=
tel XE#7405</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/7725">Intel XE#7725</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-164694v4/shard-bmg-6/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4=
/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-1/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-164694v4/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-1/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-164694v4/shard-bmg-8/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4=
/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-8/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-164694v4/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-5/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-164694v4/shard-bmg-2/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4=
/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-9/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-164694v4/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-9/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-164694v4/shard-bmg-3/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4=
/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-10/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-164694v4/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-5/=
igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-164694v4/shard-bmg-2/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694=
v4/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-5/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-164694v4/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164694v4/shard-bmg-7/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-164694v4/shard-bmg-7/igt@xe_module_load@load.html">=
PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
457">Intel XE#2457</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/7405">Intel XE#7405</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8868 -&gt; IGT_8869</li>
<li>Linux: xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c -&gt; xe-pw-164=
694v4</li>
</ul>
<p>IGT_8868: 731d4d56fcb40355ce9d65cb088d4b4773dd8b85 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  IGT_8869: 4963e78e038806cc75f885d7d5713bb0d12c01d1 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-4925-28247e192ca66016a4b374ff06acdf9dbb6cfe7c: 28247e192ca66016a4b374f=
f06acdf9dbb6cfe7c<br />
  xe-pw-164694v4: 164694v4</p>

</body>
</html>

--===============7717237071834681501==--
