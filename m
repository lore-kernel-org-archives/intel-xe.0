Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71263FD5301
	for <intel-xe@archiver.kernel.org>; Fri, 27 Feb 2026 06:58:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D8D210E13A;
	Fri, 27 Feb 2026 06:58:52 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5111010E13A;
 Fri, 27 Feb 2026 06:58:50 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0267075590325946259=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_Start_fixing_OA_whitelist_?=
 =?utf-8?q?mistakes_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 27 Feb 2026 06:58:50 -0000
Message-ID: <177217553031.294210.10166796504705138504@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260108002000.384449-6-matthew.d.roper@intel.com>
In-Reply-To: <20260108002000.384449-6-matthew.d.roper@intel.com>
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

--===============0267075590325946259==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Start fixing OA whitelist mistakes (rev2)
URL   : https://patchwork.freedesktop.org/series/159772/
State : failure

== Summary ==

CI Bug Log - changes from xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed_FULL -> xe-pw-159772v2_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-159772v2_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-159772v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-159772v2_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_oa@mmio-triggered-reports-read:
    - shard-lnl:          [PASS][1] -> [FAIL][2] +7 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-lnl-1/igt@xe_oa@mmio-triggered-reports-read.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159772v2/shard-lnl-5/igt@xe_oa@mmio-triggered-reports-read.html

  * igt@xe_oa@mmio-triggered-reports@oam-2:
    - shard-bmg:          [PASS][3] -> [FAIL][4] +9 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-4/igt@xe_oa@mmio-triggered-reports@oam-2.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159772v2/shard-bmg-4/igt@xe_oa@mmio-triggered-reports@oam-2.html

  
Known issues
------------

  Here are the changes found in xe-pw-159772v2_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-bmg:          [PASS][5] -> [FAIL][6] ([Intel XE#3718] / [Intel XE#6078])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-9/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159772v2/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2:
    - shard-bmg:          [PASS][7] -> [FAIL][8] ([Intel XE#6078])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-9/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159772v2/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2.html

  * igt@kms_content_protection@atomic-hdcp14@pipe-a-dp-1:
    - shard-bmg:          NOTRUN -> [FAIL][9] ([Intel XE#3304])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159772v2/shard-bmg-5/igt@kms_content_protection@atomic-hdcp14@pipe-a-dp-1.html

  * igt@kms_content_protection@srm@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][10] ([Intel XE#1178] / [Intel XE#3304])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159772v2/shard-bmg-9/igt@kms_content_protection@srm@pipe-a-dp-2.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [PASS][11] -> [FAIL][12] ([Intel XE#301]) +1 other test fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159772v2/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2311])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159772v2/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_psr@fbc-psr-primary-render:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2234] / [Intel XE#2850])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159772v2/shard-bmg-1/igt@kms_psr@fbc-psr-primary-render.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][15] -> [FAIL][16] ([Intel XE#4459]) +1 other test fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159772v2/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@kms_vrr@flip-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#1499])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159772v2/shard-bmg-1/igt@kms_vrr@flip-suspend.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [PASS][18] -> [INCOMPLETE][19] ([Intel XE#6321])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159772v2/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#6874]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159772v2/shard-bmg-1/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-userptr.html

  
#### Possible fixes ####

  * igt@kms_atomic_transition@modeset-transition:
    - shard-bmg:          [FAIL][21] -> [PASS][22] +2 other tests pass
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-2/igt@kms_atomic_transition@modeset-transition.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159772v2/shard-bmg-5/igt@kms_atomic_transition@modeset-transition.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [DMESG-WARN][23] ([Intel XE#5354]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-9/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159772v2/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-lnl:          [FAIL][25] -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-lnl-2/igt@kms_fbcon_fbt@psr-suspend.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159772v2/shard-lnl-5/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@xe_exec_system_allocator@many-malloc-race-nomemset:
    - shard-bmg:          [DMESG-FAIL][27] ([Intel XE#5213] / [Intel XE#5545] / [Intel XE#6652]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-2/igt@xe_exec_system_allocator@many-malloc-race-nomemset.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159772v2/shard-bmg-5/igt@xe_exec_system_allocator@many-malloc-race-nomemset.html

  * igt@xe_exec_system_allocator@threads-many-execqueues-malloc-race-nomemset:
    - shard-bmg:          [SKIP][29] ([Intel XE#6703]) -> [PASS][30] +20 other tests pass
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-execqueues-malloc-race-nomemset.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159772v2/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-execqueues-malloc-race-nomemset.html

  
#### Warnings ####

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-bmg:          [SKIP][31] ([Intel XE#6703]) -> [SKIP][32] ([Intel XE#1124])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159772v2/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [FAIL][33] ([Intel XE#1178] / [Intel XE#3304]) -> [SKIP][34] ([Intel XE#2341])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-3/igt@kms_content_protection@legacy.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159772v2/shard-bmg-6/igt@kms_content_protection@legacy.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
    - shard-bmg:          [SKIP][35] ([Intel XE#6703]) -> [SKIP][36] ([Intel XE#4422])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-2/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159772v2/shard-bmg-5/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc:
    - shard-bmg:          [SKIP][37] ([Intel XE#6703]) -> [SKIP][38] ([Intel XE#2311])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159772v2/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][39] ([Intel XE#6703]) -> [SKIP][40] ([Intel XE#2313])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159772v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier:
    - shard-bmg:          [SKIP][41] ([Intel XE#6703]) -> [SKIP][42] ([Intel XE#7283])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-2/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159772v2/shard-bmg-5/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][43] ([Intel XE#2426]) -> [SKIP][44] ([Intel XE#2509])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159772v2/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd-smem:
    - shard-bmg:          [SKIP][45] ([Intel XE#6703]) -> [SKIP][46] ([Intel XE#6874])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-2/igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd-smem.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159772v2/shard-bmg-5/igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd-smem.html

  * igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr-invalidate:
    - shard-bmg:          [SKIP][47] ([Intel XE#6703]) -> [SKIP][48] ([Intel XE#7138]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr-invalidate.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159772v2/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr-invalidate.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-bmg:          [SKIP][49] ([Intel XE#6703]) -> [SKIP][50] ([Intel XE#2284])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-2/igt@xe_pm@d3cold-basic-exec.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159772v2/shard-bmg-5/igt@xe_pm@d3cold-basic-exec.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#5213]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5213
  [Intel XE#5354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652
  [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283


Build changes
-------------

  * Linux: xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed -> xe-pw-159772v2

  IGT_8774: 8892452285d691f612ecb3b2a6fefc50983af15f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed: e42f7566b0d3eba44a6aeeae2c810025c66c44ed
  xe-pw-159772v2: 159772v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159772v2/index.html

--===============0267075590325946259==
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
<tr><td><b>Series:</b></td><td>Start fixing OA whitelist mistakes (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/159772/">https://patchwork.freedesktop.org/series/159772/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159772v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159772v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed_FULL -&gt; xe-pw-159772v2_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-159772v2_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-159772v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-159772v2_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_oa@mmio-triggered-reports-read:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-lnl-1/igt@xe_oa@mmio-triggered-reports-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159772v2/shard-lnl-5/igt@xe_oa@mmio-triggered-reports-read.html">FAIL</a> +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports@oam-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-4/igt@xe_oa@mmio-triggered-reports@oam-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159772v2/shard-bmg-4/igt@xe_oa@mmio-triggered-reports@oam-2.html">FAIL</a> +9 other tests fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-159772v2_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-9/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159772v2/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-9/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159772v2/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-hdcp14@pipe-a-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159772v2/shard-bmg-5/igt@kms_content_protection@atomic-hdcp14@pipe-a-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159772v2/shard-bmg-9/igt@kms_content_protection@srm@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159772v2/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159772v2/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159772v2/shard-bmg-1/igt@kms_psr@fbc-psr-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159772v2/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459">Intel XE#4459</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159772v2/shard-bmg-1/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159772v2/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159772v2/shard-bmg-1/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@modeset-transition:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-2/igt@kms_atomic_transition@modeset-transition.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159772v2/shard-bmg-5/igt@kms_atomic_transition@modeset-transition.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-9/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354">Intel XE#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159772v2/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-lnl-2/igt@kms_fbcon_fbt@psr-suspend.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159772v2/shard-lnl-5/igt@kms_fbcon_fbt@psr-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-malloc-race-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-2/igt@xe_exec_system_allocator@many-malloc-race-nomemset.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5213">Intel XE#5213</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652">Intel XE#6652</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159772v2/shard-bmg-5/igt@xe_exec_system_allocator@many-malloc-race-nomemset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-malloc-race-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-execqueues-malloc-race-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159772v2/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-execqueues-malloc-race-nomemset.html">PASS</a> +20 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159772v2/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-3/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159772v2/shard-bmg-6/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-2/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159772v2/shard-bmg-5/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159772v2/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159772v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-2/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159772v2/shard-bmg-5/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159772v2/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd-smem:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-2/igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159772v2/shard-bmg-5/igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159772v2/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-2/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159772v2/shard-bmg-5/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed -&gt; xe-pw-159772v2</li>
</ul>
<p>IGT_8774: 8892452285d691f612ecb3b2a6fefc50983af15f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed: e42f7566b0d3eba44a6aeeae2c810025c66c44ed<br />
  xe-pw-159772v2: 159772v2</p>

</body>
</html>

--===============0267075590325946259==--
