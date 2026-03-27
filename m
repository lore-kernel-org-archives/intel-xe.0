Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E2C410F2862
	for <intel-xe@archiver.kernel.org>; Fri, 27 Mar 2026 18:27:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1629710E2D3;
	Fri, 27 Mar 2026 18:27:35 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FDF710E0D0;
 Fri, 27 Mar 2026 18:27:34 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3769955325226778902=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/i915/casf=3A_Integrate?=
 =?utf-8?q?_the_sharpness_filter_properly_into_the_scaler_code?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 27 Mar 2026 18:27:34 -0000
Message-ID: <177463605455.407613.15086475647812625610@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260326223139.19116-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20260326223139.19116-1-ville.syrjala@linux.intel.com>
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

--===============3769955325226778902==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/casf: Integrate the sharpness filter properly into the scaler code
URL   : https://patchwork.freedesktop.org/series/163952/
State : failure

== Summary ==

CI Bug Log - changes from xe-4799-e7f370d78d32ed29cc3f100fbc3d1fe1a844978f_FULL -> xe-pw-163952v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-163952v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-163952v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-163952v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_sharpness_filter@invalid-filter-with-scaling-mode@pipe-c-edp-1-invalid-filter-with-scaling-mode-cente:
    - shard-lnl:          [PASS][1] -> [FAIL][2] +3 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4799-e7f370d78d32ed29cc3f100fbc3d1fe1a844978f/shard-lnl-1/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode@pipe-c-edp-1-invalid-filter-with-scaling-mode-cente.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163952v1/shard-lnl-3/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode@pipe-c-edp-1-invalid-filter-with-scaling-mode-cente.html

  
Known issues
------------

  Here are the changes found in xe-pw-163952v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][3] ([Intel XE#1124]) +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163952v1/shard-lnl-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][4] ([Intel XE#2887]) +2 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163952v1/shard-lnl-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:
    - shard-lnl:          NOTRUN -> [SKIP][5] ([Intel XE#373]) +2 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163952v1/shard-lnl-2/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html

  * igt@kms_cursor_crc@cursor-sliding-32x32:
    - shard-lnl:          NOTRUN -> [SKIP][6] ([Intel XE#1424]) +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163952v1/shard-lnl-2/igt@kms_cursor_crc@cursor-sliding-32x32.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-lnl:          NOTRUN -> [SKIP][7] ([Intel XE#309] / [Intel XE#7343])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163952v1/shard-lnl-2/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-lnl:          NOTRUN -> [SKIP][8] ([Intel XE#4354] / [Intel XE#7386])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163952v1/shard-lnl-6/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#6312])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163952v1/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#7061] / [Intel XE#7356])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163952v1/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#6312] / [Intel XE#651]) +2 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163952v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#656]) +7 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163952v1/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier:
    - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#7283])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163952v1/shard-lnl-6/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#599])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163952v1/shard-lnl-2/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b:
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#2763] / [Intel XE#6886]) +3 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163952v1/shard-lnl-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#2893] / [Intel XE#7304])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163952v1/shard-lnl-6/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163952v1/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#4608])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163952v1/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#4608] / [Intel XE#7304])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163952v1/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-b-edp-1.html

  * igt@kms_psr@fbc-pr-primary-render:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#1406])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163952v1/shard-lnl-6/igt@kms_psr@fbc-pr-primary-render.html

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#6540] / [Intel XE#688]) +2 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163952v1/shard-lnl-6/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_exec_balancer@no-exec-parallel-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#7482]) +5 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163952v1/shard-lnl-2/igt@xe_exec_balancer@no-exec-parallel-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:
    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#1392])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163952v1/shard-lnl-6/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#7136])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163952v1/shard-lnl-6/igt@xe_exec_fault_mode@twice-multi-queue-userptr.html

  * igt@xe_exec_multi_queue@many-execs-preempt-mode-close-fd-smem:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#6874]) +6 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163952v1/shard-lnl-2/igt@xe_exec_multi_queue@many-execs-preempt-mode-close-fd-smem.html

  * igt@xe_exec_sip_eudebug@wait-writesip-nodebug:
    - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#7636]) +3 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163952v1/shard-lnl-6/igt@xe_exec_sip_eudebug@wait-writesip-nodebug.html

  * igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#7138]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163952v1/shard-lnl-6/igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr-invalidate.html

  * igt@xe_mmap@small-bar:
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#512] / [Intel XE#7323] / [Intel XE#7384])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163952v1/shard-lnl-2/igt@xe_mmap@small-bar.html

  * igt@xe_multigpu_svm@mgpu-atomic-op-prefetch:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#6964])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163952v1/shard-lnl-6/igt@xe_multigpu_svm@mgpu-atomic-op-prefetch.html

  * igt@xe_pm@s3-basic-exec:
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#584] / [Intel XE#7369])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163952v1/shard-lnl-6/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pmu@engine-activity-accuracy-90:
    - shard-lnl:          [PASS][31] -> [FAIL][32] ([Intel XE#7072]) +1 other test fail
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4799-e7f370d78d32ed29cc3f100fbc3d1fe1a844978f/shard-lnl-1/igt@xe_pmu@engine-activity-accuracy-90.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163952v1/shard-lnl-6/igt@xe_pmu@engine-activity-accuracy-90.html

  * igt@xe_prefetch_fault@prefetch-fault:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#7599])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163952v1/shard-lnl-2/igt@xe_prefetch_fault@prefetch-fault.html

  * igt@xe_query@multigpu-query-topology:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#944])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163952v1/shard-lnl-6/igt@xe_query@multigpu-query-topology.html

  * igt@xe_sriov_vram@vf-access-after-resize-up:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#6376] / [Intel XE#7330] / [Intel XE#7422])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163952v1/shard-lnl-6/igt@xe_sriov_vram@vf-access-after-resize-up.html

  
#### Possible fixes ####

  * igt@xe_exec_system_allocator@many-large-mmap-remap-dontunmap-eocheck:
    - shard-lnl:          [INCOMPLETE][36] -> [PASS][37]
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4799-e7f370d78d32ed29cc3f100fbc3d1fe1a844978f/shard-lnl-8/igt@xe_exec_system_allocator@many-large-mmap-remap-dontunmap-eocheck.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163952v1/shard-lnl-2/igt@xe_exec_system_allocator@many-large-mmap-remap-dontunmap-eocheck.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:
    - shard-lnl:          [FAIL][38] ([Intel XE#5625]) -> [PASS][39]
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4799-e7f370d78d32ed29cc3f100fbc3d1fe1a844978f/shard-lnl-7/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163952v1/shard-lnl-5/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7072]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7072
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7323
  [Intel XE#7330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7330
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7369
  [Intel XE#7384]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7384
  [Intel XE#7386]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7386
  [Intel XE#7422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7422
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599
  [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-4799-e7f370d78d32ed29cc3f100fbc3d1fe1a844978f -> xe-pw-163952v1

  IGT_8834: 8834
  xe-4799-e7f370d78d32ed29cc3f100fbc3d1fe1a844978f: e7f370d78d32ed29cc3f100fbc3d1fe1a844978f
  xe-pw-163952v1: 163952v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163952v1/index.html

--===============3769955325226778902==
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
<tr><td><b>Series:</b></td><td>drm/i915/casf: Integrate the sharpness filter properly into the scaler code</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/163952/">https://patchwork.freedesktop.org/series/163952/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163952v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163952v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4799-e7f370d78d32ed29cc3f100fbc3d1fe1a844978f_FULL -&gt; xe-pw-163952v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-163952v1_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-163952v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-163952v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_sharpness_filter@invalid-filter-with-scaling-mode@pipe-c-edp-1-invalid-filter-with-scaling-mode-cente:<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4799-e7f370d78d32ed29cc3f100fbc3d1fe1a844978f/shard-lnl-1/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode@pipe-c-edp-1-invalid-filter-with-scaling-mode-cente.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163952v1/shard-lnl-3/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode@pipe-c-edp-1-invalid-filter-with-scaling-mode-cente.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-163952v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163952v1/shard-lnl-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163952v1/shard-lnl-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163952v1/shard-lnl-2/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x32:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163952v1/shard-lnl-2/igt@kms_cursor_crc@cursor-sliding-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163952v1/shard-lnl-2/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163952v1/shard-lnl-6/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7386">Intel XE#7386</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163952v1/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163952v1/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163952v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163952v1/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163952v1/shard-lnl-6/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163952v1/shard-lnl-2/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163952v1/shard-lnl-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163952v1/shard-lnl-6/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163952v1/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163952v1/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163952v1/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163952v1/shard-lnl-6/igt@kms_psr@fbc-pr-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163952v1/shard-lnl-6/igt@xe_evict@evict-mixed-many-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540">Intel XE#6540</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-parallel-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163952v1/shard-lnl-2/igt@xe_exec_balancer@no-exec-parallel-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163952v1/shard-lnl-6/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163952v1/shard-lnl-6/igt@xe_exec_fault_mode@twice-multi-queue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-execs-preempt-mode-close-fd-smem:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163952v1/shard-lnl-2/igt@xe_exec_multi_queue@many-execs-preempt-mode-close-fd-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@wait-writesip-nodebug:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163952v1/shard-lnl-6/igt@xe_exec_sip_eudebug@wait-writesip-nodebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163952v1/shard-lnl-6/igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163952v1/shard-lnl-2/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7323">Intel XE#7323</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7384">Intel XE#7384</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-atomic-op-prefetch:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163952v1/shard-lnl-6/igt@xe_multigpu_svm@mgpu-atomic-op-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163952v1/shard-lnl-6/igt@xe_pm@s3-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#584</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7369">Intel XE#7369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-90:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4799-e7f370d78d32ed29cc3f100fbc3d1fe1a844978f/shard-lnl-1/igt@xe_pmu@engine-activity-accuracy-90.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163952v1/shard-lnl-6/igt@xe_pmu@engine-activity-accuracy-90.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7072">Intel XE#7072</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_prefetch_fault@prefetch-fault:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163952v1/shard-lnl-2/igt@xe_prefetch_fault@prefetch-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599">Intel XE#7599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163952v1/shard-lnl-6/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_vram@vf-access-after-resize-up:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163952v1/shard-lnl-6/igt@xe_sriov_vram@vf-access-after-resize-up.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376">Intel XE#6376</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7330">Intel XE#7330</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7422">Intel XE#7422</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-remap-dontunmap-eocheck:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4799-e7f370d78d32ed29cc3f100fbc3d1fe1a844978f/shard-lnl-8/igt@xe_exec_system_allocator@many-large-mmap-remap-dontunmap-eocheck.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163952v1/shard-lnl-2/igt@xe_exec_system_allocator@many-large-mmap-remap-dontunmap-eocheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4799-e7f370d78d32ed29cc3f100fbc3d1fe1a844978f/shard-lnl-7/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625">Intel XE#5625</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163952v1/shard-lnl-5/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4799-e7f370d78d32ed29cc3f100fbc3d1fe1a844978f -&gt; xe-pw-163952v1</li>
</ul>
<p>IGT_8834: 8834<br />
  xe-4799-e7f370d78d32ed29cc3f100fbc3d1fe1a844978f: e7f370d78d32ed29cc3f100fbc3d1fe1a844978f<br />
  xe-pw-163952v1: 163952v1</p>

</body>
</html>

--===============3769955325226778902==--
