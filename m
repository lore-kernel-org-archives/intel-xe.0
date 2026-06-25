Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BF8ECDB479
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jun 2026 10:55:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B85D10E1D7;
	Thu, 25 Jun 2026 10:55:11 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD1AD10E1D7;
 Thu, 25 Jun 2026 10:55:09 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7578906097206866773=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/xe/forcewake=3A_add_de?=
 =?utf-8?q?layed-release_optimization_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Zongyao Bai" <zongyao.bai@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 25 Jun 2026 10:55:09 -0000
Message-ID: <178238490975.116993.8989931064904427450@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260601213804.707256-1-zongyao.bai@intel.com>
In-Reply-To: <20260601213804.707256-1-zongyao.bai@intel.com>
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

--===============7578906097206866773==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/forcewake: add delayed-release optimization (rev3)
URL   : https://patchwork.freedesktop.org/series/167697/
State : failure

== Summary ==

CI Bug Log - changes from xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973_FULL -> xe-pw-167697v3_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-167697v3_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-167697v3_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-167697v3_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_addfb_basic@unused-handle:
    - shard-bmg:          NOTRUN -> [SKIP][1] +153 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@kms_addfb_basic@unused-handle.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-bmg:          NOTRUN -> [TIMEOUT][2] +3 other tests timeout
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-1/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [PASS][3] -> [TIMEOUT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-5/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [CRASH][5]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-race-nomemset:
    - shard-lnl:          NOTRUN -> [INCOMPLETE][6] +5 other tests incomplete
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-lnl-1/igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-race-nomemset.html

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-race-nomemset:
    - shard-bmg:          NOTRUN -> [FAIL][7] +2 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-1/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-race-nomemset.html

  * igt@xe_exec_system_allocator@process-many-new-nomemset:
    - shard-bmg:          [PASS][8] -> [SKIP][9] +96 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-3/igt@xe_exec_system_allocator@process-many-new-nomemset.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@xe_exec_system_allocator@process-many-new-nomemset.html

  * igt@xe_exec_system_allocator@process-many-stride-malloc-prefetch-race:
    - shard-bmg:          [PASS][10] -> [FAIL][11] +6 other tests fail
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-1/igt@xe_exec_system_allocator@process-many-stride-malloc-prefetch-race.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-3/igt@xe_exec_system_allocator@process-many-stride-malloc-prefetch-race.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_pcode_probe_early:
    - shard-bmg:          [PASS][12] -> [INCOMPLETE][13]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_pcode_probe_early.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-10/igt@xe_fault_injection@inject-fault-probe-function-xe_pcode_probe_early.html

  * igt@xe_pmu@engine-activity-accuracy-90:
    - shard-lnl:          [PASS][14] -> [FAIL][15] +2 other tests fail
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-lnl-3/igt@xe_pmu@engine-activity-accuracy-90.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-lnl-3/igt@xe_pmu@engine-activity-accuracy-90.html

  * igt@xe_vm@munmap-style-unbind-either-side-partial-large-page-hammer:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][16]
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-10/igt@xe_vm@munmap-style-unbind-either-side-partial-large-page-hammer.html

  
#### Warnings ####

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-bmg:          [INCOMPLETE][17] ([Intel XE#8174]) -> [SKIP][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-3/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p:
    - shard-bmg:          [SKIP][19] ([Intel XE#7679]) -> [SKIP][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-7/igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-10/igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d:
    - shard-bmg:          [SKIP][21] ([Intel XE#7358]) -> [SKIP][22]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-3/igt@kms_chamelium_color_pipeline@plane-lut1d.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@kms_chamelium_color_pipeline@plane-lut1d.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-bmg:          [SKIP][23] ([Intel XE#2252]) -> [SKIP][24] +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-7/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-10/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_content_protection@type1:
    - shard-bmg:          [SKIP][25] ([Intel XE#7642]) -> [SKIP][26]
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-7/igt@kms_content_protection@type1.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-10/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-bmg:          [SKIP][27] ([Intel XE#2321] / [Intel XE#7355]) -> [SKIP][28]
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-7/igt@kms_cursor_crc@cursor-random-512x512.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-10/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-32x32:
    - shard-bmg:          [SKIP][29] ([Intel XE#2320]) -> [SKIP][30]
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-32x32.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@kms_cursor_crc@cursor-sliding-32x32.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:
    - shard-bmg:          [INCOMPLETE][31] ([Intel XE#8155]) -> [SKIP][32]
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-7/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-10/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-bmg:          [SKIP][33] ([Intel XE#7178] / [Intel XE#7351]) -> [INCOMPLETE][34]
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][35] ([Intel XE#2313]) -> [CRASH][36]
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-spr-indfb-fullscreen.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-bmg:          [SKIP][37] ([Intel XE#2486]) -> [SKIP][38]
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-3/igt@kms_panel_fitting@atomic-fastset.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          [SKIP][39] ([Intel XE#5020] / [Intel XE#7348]) -> [SKIP][40]
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-7/igt@kms_plane_multiple@tiling-yf.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-10/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75:
    - shard-bmg:          [SKIP][41] ([Intel XE#2763] / [Intel XE#6886]) -> [SKIP][42]
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-3/igt@kms_plane_scaling@planes-downscale-factor-0-75.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@kms_plane_scaling@planes-downscale-factor-0-75.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
    - shard-lnl:          [TIMEOUT][43] ([Intel XE#8473]) -> [INCOMPLETE][44] +1 other test incomplete
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][45] ([Intel XE#1729] / [Intel XE#7424]) -> [SKIP][46]
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern.html

  * igt@xe_ccs@block-copy-compressed-inc-dimension@linear-compressed-compfmt0-system-vram01-1x1:
    - shard-bmg:          [INCOMPLETE][47] ([Intel XE#8437]) -> [INCOMPLETE][48] +3 other tests incomplete
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-2/igt@xe_ccs@block-copy-compressed-inc-dimension@linear-compressed-compfmt0-system-vram01-1x1.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-8/igt@xe_ccs@block-copy-compressed-inc-dimension@linear-compressed-compfmt0-system-vram01-1x1.html

  * igt@xe_eudebug@basic-vm-bind-extended-discovery:
    - shard-bmg:          [SKIP][49] ([Intel XE#7636]) -> [SKIP][50]
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-7/igt@xe_eudebug@basic-vm-bind-extended-discovery.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-10/igt@xe_eudebug@basic-vm-bind-extended-discovery.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race:
    - shard-bmg:          [SKIP][51] ([Intel XE#2322] / [Intel XE#7372]) -> [SKIP][52] +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-7/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-10/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - shard-bmg:          [SKIP][53] ([Intel XE#8440]) -> [SKIP][54] +236 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-5/igt@xe_exec_basic@multigpu-once-null-rebind.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-4/igt@xe_exec_basic@multigpu-once-null-rebind.html

  * igt@xe_exec_fault_mode@once-multi-queue-rebind-imm:
    - shard-bmg:          [SKIP][55] ([Intel XE#8374]) -> [SKIP][56]
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-3/igt@xe_exec_fault_mode@once-multi-queue-rebind-imm.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@xe_exec_fault_mode@once-multi-queue-rebind-imm.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate:
    - shard-bmg:          [SKIP][57] ([Intel XE#8364]) -> [SKIP][58] +8 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-3/igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate.html

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-huge-nomemset:
    - shard-bmg:          [INCOMPLETE][59] ([Intel XE#8159]) -> [FAIL][60]
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-4/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-huge-nomemset.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-4/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-huge-nomemset.html

  * igt@xe_exec_system_allocator@process-many-large-execqueues-new-prefetch:
    - shard-bmg:          [FAIL][61] -> [SKIP][62]
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-7/igt@xe_exec_system_allocator@process-many-large-execqueues-new-prefetch.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-10/igt@xe_exec_system_allocator@process-many-large-execqueues-new-prefetch.html

  * igt@xe_exec_system_allocator@threads-many-stride-free-nomemset:
    - shard-bmg:          [SKIP][63] ([Intel XE#8441]) -> [SKIP][64] +89 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-10/igt@xe_exec_system_allocator@threads-many-stride-free-nomemset.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@xe_exec_system_allocator@threads-many-stride-free-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-remap-dontunmap-eocheck:
    - shard-lnl:          [INCOMPLETE][65] ([Intel XE#8437]) -> [INCOMPLETE][66] +307 other tests incomplete
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-lnl-5/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-remap-dontunmap-eocheck.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-lnl-8/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-remap-dontunmap-eocheck.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_device_probe_early:
    - shard-bmg:          [CRASH][67] ([Intel XE#8448]) -> [INCOMPLETE][68]
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-xe_device_probe_early.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@xe_fault_injection@inject-fault-probe-function-xe_device_probe_early.html

  * igt@xe_pxp@display-black-pxp-fb:
    - shard-bmg:          [SKIP][69] ([Intel XE#4733] / [Intel XE#7417]) -> [SKIP][70]
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-7/igt@xe_pxp@display-black-pxp-fb.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-10/igt@xe_pxp@display-black-pxp-fb.html

  * igt@xe_query@multigpu-query-pxp-status:
    - shard-bmg:          [SKIP][71] ([Intel XE#944]) -> [SKIP][72]
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-3/igt@xe_query@multigpu-query-pxp-status.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@xe_query@multigpu-query-pxp-status.html

  
Known issues
------------

  Here are the changes found in xe-pw-167697v3_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@pan:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#2134])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@fbdev@pan.html

  * igt@fbdev@write:
    - shard-bmg:          [PASS][74] -> [SKIP][75] ([Intel XE#2134])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-7/igt@fbdev@write.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-10/igt@fbdev@write.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#2233])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-dp-2-4-rc-ccs-xrgb2101010:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][77] ([Intel XE#8437]) +4 other tests incomplete
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-dp-2-4-rc-ccs-xrgb2101010.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#2370])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#1407]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-lnl-1/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          NOTRUN -> [TIMEOUT][80] ([Intel XE#8446]) +3 other tests timeout
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-lnl:          NOTRUN -> [INCOMPLETE][81] ([Intel XE#5643])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#7059] / [Intel XE#7085])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-1/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#2327])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-4/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          [PASS][84] -> [TIMEOUT][85] ([Intel XE#8446]) +1 other test timeout
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#1124]) +7 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-7/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#607] / [Intel XE#7361])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-4/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#8441]) +52 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#1124]) +1 other test skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-lnl-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-target-3840x2160p:
    - shard-bmg:          [PASS][90] -> [TIMEOUT][91] ([Intel XE#8469] / [Intel XE#8476])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-target-3840x2160p.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-target-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#7679])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-7/igt@kms_bw@connected-linear-tiling-3-displays-target-3840x2160p.html

  * igt@kms_bw@linear-tiling-1-displays-target-2160x1440p:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][93] ([Intel XE#8479])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-4/igt@kms_bw@linear-tiling-1-displays-target-2160x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-target-2560x1440p:
    - shard-lnl:          NOTRUN -> [INCOMPLETE][94] ([Intel XE#8445])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-lnl-1/igt@kms_bw@linear-tiling-4-displays-target-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-target-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#367]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-1/igt@kms_bw@linear-tiling-4-displays-target-3840x2160p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs:
    - shard-lnl:          NOTRUN -> [ABORT][96] ([Intel XE#8007])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-lnl-2/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][97] ([Intel XE#8150] / [Intel XE#8437])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#2652]) +17 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#3432])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#2887]) +9 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [INCOMPLETE][101] ([Intel XE#8437])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-lnl-1/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#2325] / [Intel XE#7358])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-4/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d:
    - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#7358]) +1 other test skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-2/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#2252]) +5 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-10/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_content_protection@lic-type-1:
    - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#7642])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-lnl-1/igt@kms_content_protection@lic-type-1.html

  * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
    - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#1424])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-lnl-1/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#2320])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-4/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#2321] / [Intel XE#7355]) +2 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-4/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][109] ([Intel XE#1508])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-1/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-lnl:          NOTRUN -> [SKIP][110] ([Intel XE#4354] / [Intel XE#7386])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-lnl-1/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dsc@dsc-basic-bigjoiner:
    - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#8265]) +3 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-4/igt@kms_dsc@dsc-basic-bigjoiner.html

  * igt@kms_dsc@dsc-with-bpc-formats-ultrajoiner:
    - shard-lnl:          NOTRUN -> [SKIP][112] ([Intel XE#8265])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-lnl-1/igt@kms_dsc@dsc-with-bpc-formats-ultrajoiner.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-lnl:          NOTRUN -> [SKIP][113] ([Intel XE#1421])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-lnl-1/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset@ab-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][114] ([Intel XE#8155])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-8/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset@ab-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-bmg:          [PASS][115] -> [INCOMPLETE][116] ([Intel XE#8155] / [Intel XE#8479])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-2/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-10/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [PASS][117] -> [FAIL][118] ([Intel XE#301])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-bmg:          [PASS][119] -> [CRASH][120] ([Intel XE#8461])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-9/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-5/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][121] ([Intel XE#7178] / [Intel XE#7351]) +1 other test skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
    - shard-bmg:          NOTRUN -> [TIMEOUT][122] ([Intel XE#8467]) +1 other test timeout
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-10/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x:
    - shard-bmg:          NOTRUN -> [SKIP][123] ([Intel XE#7179]) +1 other test skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-1/igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][124] ([Intel XE#6312])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][125] ([Intel XE#7061] / [Intel XE#7356]) +4 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][126] ([Intel XE#7061])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-10/igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][127] ([Intel XE#656] / [Intel XE#7905]) +5 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][128] ([Intel XE#4141]) +8 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][129] ([Intel XE#2311]) +45 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [PASS][130] -> [TIMEOUT][131] ([Intel XE#8466]) +1 other test timeout
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-7/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-mmap-wc.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-10/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [PASS][132] -> [INCOMPLETE][133] ([Intel XE#8368])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-9/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][134] ([Intel XE#8368])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-7/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [TIMEOUT][135] ([Intel XE#8466])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][136] ([Intel XE#7399])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbchdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][137] ([Intel XE#7061] / [Intel XE#7356])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][138] ([Intel XE#2313]) +45 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-rte:
    - shard-lnl:          NOTRUN -> [SKIP][139] ([Intel XE#7865]) +3 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-rte.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [PASS][140] -> [SKIP][141] ([Intel XE#8441])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-3/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-mmap-wc.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][142] ([Intel XE#7905]) +2 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-lnl-1/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][143] ([Intel XE#4298] / [Intel XE#5873])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-1/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier:
    - shard-bmg:          NOTRUN -> [SKIP][144] ([Intel XE#7283]) +1 other test skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-2/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-a-plane-0:
    - shard-bmg:          NOTRUN -> [TIMEOUT][145] ([Intel XE#8465])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-8/igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-a-plane-0.html

  * igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping:
    - shard-bmg:          NOTRUN -> [CRASH][146] ([Intel XE#8460])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-4/igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][147] ([Intel XE#1035] / [Intel XE#8479])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-4/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][148] ([Intel XE#2393])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-5/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25:
    - shard-bmg:          [PASS][149] -> [INCOMPLETE][150] ([Intel XE#8437] / [Intel XE#8459]) +1 other test incomplete
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-3/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-4/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-bmg:          NOTRUN -> [SKIP][151] ([Intel XE#2505] / [Intel XE#7447])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-4/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][152] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-4/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][153] ([Intel XE#1489]) +5 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-1/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-bmg:          NOTRUN -> [SKIP][154] ([Intel XE#2234] / [Intel XE#2850]) +6 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-7/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-lnl:          NOTRUN -> [SKIP][155] ([Intel XE#8361])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-lnl-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-bmg:          NOTRUN -> [SKIP][156] ([Intel XE#3904] / [Intel XE#7342]) +1 other test skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-4/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-lnl:          NOTRUN -> [SKIP][157] ([Intel XE#1127] / [Intel XE#5813])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-lnl-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-bmg:          NOTRUN -> [SKIP][158] ([Intel XE#2413])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-4/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-bmg:          NOTRUN -> [SKIP][159] ([Intel XE#1435])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-4/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:
    - shard-bmg:          NOTRUN -> [SKIP][160] ([Intel XE#6503])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-7/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-bmg:          NOTRUN -> [SKIP][161] ([Intel XE#2450] / [Intel XE#5857])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-7/igt@kms_tv_load_detect@load-detect.html

  * igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compute:
    - shard-bmg:          [PASS][162] -> [ABORT][163] ([Intel XE#7893] / [Intel XE#8300]) +1 other test abort
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-9/igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compute.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-3/igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compute.html

  * igt@xe_eudebug_online@tdctl-parameters:
    - shard-bmg:          NOTRUN -> [SKIP][164] ([Intel XE#7636]) +11 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-4/igt@xe_eudebug_online@tdctl-parameters.html

  * igt@xe_exec_balancer@many-virtual-userptr-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][165] ([Intel XE#7482]) +2 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-lnl-1/igt@xe_exec_balancer@many-virtual-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][166] ([Intel XE#1392])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-lnl-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-bmg:          NOTRUN -> [SKIP][167] ([Intel XE#2322] / [Intel XE#7372]) +1 other test skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-4/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm:
    - shard-bmg:          NOTRUN -> [SKIP][168] ([Intel XE#8374]) +12 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-1/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-race-prefetch:
    - shard-bmg:          [PASS][169] -> [INCOMPLETE][170] ([Intel XE#8479]) +3 other tests incomplete
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-1/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-race-prefetch.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-3/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][171] ([Intel XE#8374])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-lnl-1/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate.html

  * igt@xe_exec_multi_queue@two-queues-basic-smem:
    - shard-bmg:          NOTRUN -> [SKIP][172] ([Intel XE#8364]) +16 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-1/igt@xe_exec_multi_queue@two-queues-basic-smem.html

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-dyn-priority-smem:
    - shard-lnl:          NOTRUN -> [SKIP][173] ([Intel XE#8364])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-lnl-1/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-dyn-priority-smem.html

  * igt@xe_exec_reset@cm-multi-queue-close-fd:
    - shard-lnl:          NOTRUN -> [SKIP][174] ([Intel XE#8369])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-lnl-1/igt@xe_exec_reset@cm-multi-queue-close-fd.html

  * igt@xe_exec_store@basic-all@engine-drm_xe_engine_class_render-instance-0-tile-0-region-system:
    - shard-bmg:          [PASS][175] -> [INCOMPLETE][176] ([Intel XE#8437]) +1 other test incomplete
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-4/igt@xe_exec_store@basic-all@engine-drm_xe_engine_class_render-instance-0-tile-0-region-system.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-10/igt@xe_exec_store@basic-all@engine-drm_xe_engine_class_render-instance-0-tile-0-region-system.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-multi-vma:
    - shard-bmg:          [PASS][177] -> [INCOMPLETE][178] ([Intel XE#8159])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-10/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-multi-vma.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-1/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-multi-vma.html

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-remap-ro-dontunmap:
    - shard-bmg:          [PASS][179] -> [INCOMPLETE][180] ([Intel XE#7928] / [Intel XE#8159] / [Intel XE#8479])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-7/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-remap-ro-dontunmap.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-10/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-remap-ro-dontunmap.html

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-madvise:
    - shard-lnl:          [PASS][181] -> [TIMEOUT][182] ([Intel XE#8447]) +1 other test timeout
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-lnl-3/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-madvise.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-lnl-1/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-madvise.html

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-madvise:
    - shard-bmg:          NOTRUN -> [TIMEOUT][183] ([Intel XE#8447])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-10/igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-madvise.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-fork-read-after:
    - shard-bmg:          [PASS][184] -> [INCOMPLETE][185] ([Intel XE#8159] / [Intel XE#8437]) +3 other tests incomplete
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-fork-read-after.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-fork-read-after.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-nomemset:
    - shard-bmg:          [PASS][186] -> [INCOMPLETE][187] ([Intel XE#8159] / [Intel XE#8479]) +35 other tests incomplete
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-nomemset.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-10/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-prefetch-madvise:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][188] ([Intel XE#8159] / [Intel XE#8479])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-10/igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-prefetch-madvise.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-madvise:
    - shard-lnl:          NOTRUN -> [TIMEOUT][189] ([Intel XE#8447])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-lnl-1/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-madvise.html

  * igt@xe_exec_threads@threads-multi-queue-cm-fd-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][190] ([Intel XE#8378]) +5 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-cm-fd-rebind.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][191] ([Intel XE#8366] / [Intel XE#8479])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr-invalidate-race.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_device_create:
    - shard-bmg:          NOTRUN -> [CRASH][192] ([Intel XE#8448]) +1 other test crash
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_device_create.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:
    - shard-bmg:          [PASS][193] -> [CRASH][194] ([Intel XE#8448]) +1 other test crash
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html

  * igt@xe_gpgpu_fill@offset-4x4:
    - shard-bmg:          NOTRUN -> [SKIP][195] ([Intel XE#7954])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-7/igt@xe_gpgpu_fill@offset-4x4.html

  * igt@xe_multigpu_svm@mgpu-atomic-op-basic:
    - shard-bmg:          NOTRUN -> [SKIP][196] ([Intel XE#6964]) +4 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-1/igt@xe_multigpu_svm@mgpu-atomic-op-basic.html

  * igt@xe_page_reclaim@basic-mixed:
    - shard-bmg:          NOTRUN -> [SKIP][197] ([Intel XE#7793]) +2 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-10/igt@xe_page_reclaim@basic-mixed.html

  * igt@xe_pat@pat-sw-hw-compare:
    - shard-bmg:          NOTRUN -> [FAIL][198] ([Intel XE#7695])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-1/igt@xe_pat@pat-sw-hw-compare.html

  * igt@xe_pat@xa-app-transient-media-on:
    - shard-bmg:          NOTRUN -> [SKIP][199] ([Intel XE#7590])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-4/igt@xe_pat@xa-app-transient-media-on.html

  * igt@xe_peer2peer@write:
    - shard-bmg:          NOTRUN -> [SKIP][200] ([Intel XE#2427] / [Intel XE#6953] / [Intel XE#7326] / [Intel XE#7353]) +1 other test skip
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-2/igt@xe_peer2peer@write.html

  * igt@xe_pm@s3-vm-bind-prefetch:
    - shard-lnl:          NOTRUN -> [SKIP][201] ([Intel XE#584] / [Intel XE#7369]) +1 other test skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-lnl-1/igt@xe_pm@s3-vm-bind-prefetch.html

  * igt@xe_prefetch_fault@prefetch-fault-svm:
    - shard-bmg:          NOTRUN -> [SKIP][202] ([Intel XE#7599])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-1/igt@xe_prefetch_fault@prefetch-fault-svm.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:
    - shard-bmg:          NOTRUN -> [SKIP][203] ([Intel XE#4733] / [Intel XE#7417]) +2 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-10/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html

  * igt@xe_query@multigpu-query-invalid-size:
    - shard-bmg:          NOTRUN -> [SKIP][204] ([Intel XE#944]) +2 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-10/igt@xe_query@multigpu-query-invalid-size.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-lnl:          NOTRUN -> [SKIP][205] ([Intel XE#944])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-lnl-1/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  * igt@xe_sriov_admin@exec-quantum-write-readback-vfs-disabled:
    - shard-bmg:          [PASS][206] -> [INCOMPLETE][207] ([Intel XE#8477] / [Intel XE#8479]) +1 other test incomplete
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-8/igt@xe_sriov_admin@exec-quantum-write-readback-vfs-disabled.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@xe_sriov_admin@exec-quantum-write-readback-vfs-disabled.html

  * igt@xe_sriov_scheduling@nonpreempt-engine-resets-normal-priority@numvfs-random-gt1-vcs0:
    - shard-bmg:          NOTRUN -> [TIMEOUT][208] ([Intel XE#8472]) +1 other test timeout
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-4/igt@xe_sriov_scheduling@nonpreempt-engine-resets-normal-priority@numvfs-random-gt1-vcs0.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:
    - shard-bmg:          [TIMEOUT][209] ([Intel XE#7935]) -> [PASS][210]
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-2/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-8/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [TIMEOUT][211] ([Intel XE#8451]) -> [PASS][212] +1 other test pass
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-9/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size:
    - shard-bmg:          [TIMEOUT][213] -> [PASS][214]
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-1/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [FAIL][215] ([Intel XE#301]) -> [PASS][216]
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@a-dp2:
    - shard-bmg:          [INCOMPLETE][217] ([Intel XE#8155]) -> [PASS][218] +1 other test pass
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-10/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@a-dp2.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-1/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@a-dp2.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [TIMEOUT][219] ([Intel XE#8466]) -> [PASS][220]
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-8/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-mmap-wc.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][221] ([Intel XE#1503]) -> [PASS][222]
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-5/igt@kms_hdr@invalid-hdr.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-2/igt@kms_hdr@invalid-hdr.html

  * igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate:
    - shard-bmg:          [INCOMPLETE][223] ([Intel XE#8437]) -> [PASS][224] +9 other tests pass
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-9/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-5/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-single-vma:
    - shard-bmg:          [CRASH][225] ([Intel XE#8450]) -> [PASS][226]
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-2/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-single-vma.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-8/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-single-vma.html

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-shared-remap-dontunmap:
    - shard-bmg:          [FAIL][227] -> [PASS][228] +10 other tests pass
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-2/igt@xe_exec_system_allocator@process-many-execqueues-mmap-shared-remap-dontunmap.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-8/igt@xe_exec_system_allocator@process-many-execqueues-mmap-shared-remap-dontunmap.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-madvise:
    - shard-bmg:          [TIMEOUT][229] ([Intel XE#8447]) -> [PASS][230]
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-10/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-madvise.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-madvise.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-prefetch:
    - shard-bmg:          [INCOMPLETE][231] ([Intel XE#8159]) -> [PASS][232] +17 other tests pass
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-10/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-prefetch.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-prefetch.html

  * igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate-race:
    - shard-lnl:          [TIMEOUT][233] ([Intel XE#8470]) -> [PASS][234]
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-lnl-3/igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate-race.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-lnl-3/igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate-race.html

  * igt@xe_pat@false-sharing:
    - shard-bmg:          [SKIP][235] ([Intel XE#8440]) -> [PASS][236] +50 other tests pass
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-7/igt@xe_pat@false-sharing.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-5/igt@xe_pat@false-sharing.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-lnl:          [ABORT][237] ([Intel XE#8007]) -> [PASS][238]
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-lnl-6/igt@xe_wedged@wedged-mode-toggle.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-lnl-2/igt@xe_wedged@wedged-mode-toggle.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-bmg:          [TIMEOUT][239] ([Intel XE#8446]) -> [SKIP][240] ([Intel XE#8441]) +1 other test skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-bmg:          [TIMEOUT][241] -> [TIMEOUT][242] ([Intel XE#8446])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-bmg:          [TIMEOUT][243] ([Intel XE#8446]) -> [INCOMPLETE][244] ([Intel XE#5643])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-bmg:          [SKIP][245] ([Intel XE#8440]) -> [SKIP][246] ([Intel XE#2327])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-1/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-bmg:          [SKIP][247] ([Intel XE#8440]) -> [INCOMPLETE][248] ([Intel XE#5643])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-bmg:          [INCOMPLETE][249] ([Intel XE#5643]) -> [TIMEOUT][250] ([Intel XE#8446])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-270:
    - shard-bmg:          [SKIP][251] ([Intel XE#1124]) -> [SKIP][252] ([Intel XE#8441]) +2 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-7/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-10/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-lnl:          [INCOMPLETE][253] ([Intel XE#5643]) -> [TIMEOUT][254] ([Intel XE#8446]) +2 other tests timeout
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-lnl-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-lnl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-lnl:          [SKIP][255] ([Intel XE#1124]) -> [TIMEOUT][256] ([Intel XE#8446])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-lnl-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-lnl-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-1-displays-target-2160x1440p:
    - shard-bmg:          [INCOMPLETE][257] ([Intel XE#8437]) -> [CRASH][258] ([Intel XE#8449])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-4/igt@kms_bw@connected-linear-tiling-1-displays-target-2160x1440p.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-2/igt@kms_bw@connected-linear-tiling-1-displays-target-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-target-2160x1440p:
    - shard-bmg:          [TIMEOUT][259] ([Intel XE#8476]) -> [INCOMPLETE][260] ([Intel XE#8479])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-target-2160x1440p.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-target-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p:
    - shard-bmg:          [INCOMPLETE][261] ([Intel XE#8437]) -> [INCOMPLETE][262] ([Intel XE#8479]) +6 other tests incomplete
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-7/igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p:
    - shard-lnl:          [INCOMPLETE][263] ([Intel XE#8437]) -> [INCOMPLETE][264] ([Intel XE#8445]) +15 other tests incomplete
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-lnl-2/igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-lnl-7/igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p:
    - shard-bmg:          [SKIP][265] ([Intel XE#7679]) -> [INCOMPLETE][266] ([Intel XE#8479])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-1/igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-3/igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p.html

  * igt@kms_bw@linear-tiling-1-displays-target-2560x1440p:
    - shard-bmg:          [INCOMPLETE][267] ([Intel XE#8437]) -> [SKIP][268] ([Intel XE#367]) +2 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-10/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-target-2560x1440p:
    - shard-bmg:          [SKIP][269] ([Intel XE#367]) -> [INCOMPLETE][270] ([Intel XE#8479])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-3/igt@kms_bw@linear-tiling-2-displays-target-2560x1440p.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-4/igt@kms_bw@linear-tiling-2-displays-target-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-target-3840x2160p:
    - shard-bmg:          [TIMEOUT][271] ([Intel XE#8469]) -> [INCOMPLETE][272] ([Intel XE#8479])
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-2/igt@kms_bw@linear-tiling-2-displays-target-3840x2160p.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-8/igt@kms_bw@linear-tiling-2-displays-target-3840x2160p.html

  * igt@kms_bw@linear-tiling-3-displays-target-2160x1440p:
    - shard-bmg:          [SKIP][273] ([Intel XE#8440]) -> [INCOMPLETE][274] ([Intel XE#8479]) +1 other test incomplete
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-1/igt@kms_bw@linear-tiling-3-displays-target-2160x1440p.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@kms_bw@linear-tiling-3-displays-target-2160x1440p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-bmg:          [SKIP][275] ([Intel XE#2887]) -> [SKIP][276] ([Intel XE#8441]) +4 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-7/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-10/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:
    - shard-bmg:          [SKIP][277] ([Intel XE#8440]) -> [SKIP][278] ([Intel XE#2887])
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-1/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-bmg:          [INCOMPLETE][279] ([Intel XE#8150]) -> [INCOMPLETE][280] ([Intel XE#8150] / [Intel XE#8479])
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
    - shard-bmg:          [SKIP][281] ([Intel XE#3432]) -> [INCOMPLETE][282] ([Intel XE#8150] / [Intel XE#8437])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs:
    - shard-bmg:          [SKIP][283] ([Intel XE#2887]) -> [TIMEOUT][284] ([Intel XE#8463])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-10/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-bmg:          [SKIP][285] ([Intel XE#8440]) -> [SKIP][286] ([Intel XE#2724] / [Intel XE#7449])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-1/igt@kms_cdclk@plane-scaling.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@kms_cdclk@plane-scaling.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [TIMEOUT][287] ([Intel XE#7935]) -> [TIMEOUT][288] ([Intel XE#8451])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-10/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [INCOMPLETE][289] ([Intel XE#8151]) -> [TIMEOUT][290] ([Intel XE#8451])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-8/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-lnl:          [SKIP][291] ([Intel XE#309] / [Intel XE#7343]) -> [SKIP][292] ([Intel XE#309] / [Intel XE#7343] / [Intel XE#7935])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-lnl-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size:
    - shard-bmg:          [TIMEOUT][293] ([Intel XE#8451]) -> [INCOMPLETE][294] ([Intel XE#8151])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-5/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-7/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner:
    - shard-lnl:          [INCOMPLETE][295] ([Intel XE#8437]) -> [INCOMPLETE][296] ([Intel XE#8456])
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-lnl-3/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-lnl-1/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          [SKIP][297] ([Intel XE#8440]) -> [SKIP][298] ([Intel XE#4156] / [Intel XE#7425])
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-7/igt@kms_fbcon_fbt@fbc-suspend.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-5/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-bmg:          [CRASH][299] ([Intel XE#8461]) -> [INCOMPLETE][300] ([Intel XE#8155])
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-2/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-8/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - shard-bmg:          [INCOMPLETE][301] ([Intel XE#8437]) -> [SKIP][302] ([Intel XE#8441])
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-bmg:          [INCOMPLETE][303] ([Intel XE#8437]) -> [SKIP][304] ([Intel XE#7178] / [Intel XE#7351])
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-shrfb-draw-blt:
    - shard-bmg:          [SKIP][305] ([Intel XE#8440]) -> [SKIP][306] ([Intel XE#2311]) +3 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-1/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-shrfb-draw-blt.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][307] ([Intel XE#2311]) -> [SKIP][308] ([Intel XE#8441]) +11 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-7/igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-spr-indfb-draw-blt.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-10/igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-blt:
    - shard-bmg:          [SKIP][309] ([Intel XE#8440]) -> [SKIP][310] ([Intel XE#7061]) +2 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-1/igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-blt.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][311] ([Intel XE#8440]) -> [SKIP][312] ([Intel XE#4141]) +2 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][313] ([Intel XE#4141]) -> [SKIP][314] ([Intel XE#8441])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render:
    - shard-bmg:          [SKIP][315] ([Intel XE#7061] / [Intel XE#7356]) -> [SKIP][316] ([Intel XE#8441]) +2 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [INCOMPLETE][317] ([Intel XE#8368]) -> [SKIP][318] ([Intel XE#2311])
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-draw-render.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-blt:
    - shard-bmg:          [SKIP][319] ([Intel XE#7061]) -> [SKIP][320] ([Intel XE#8441])
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-blt.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][321] ([Intel XE#2313]) -> [INCOMPLETE][322] ([Intel XE#8368])
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][323] ([Intel XE#2313]) -> [SKIP][324] ([Intel XE#8441]) +8 other tests skip
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-move.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-10/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-render:
    - shard-bmg:          [SKIP][325] ([Intel XE#8440]) -> [SKIP][326] ([Intel XE#7061] / [Intel XE#7356])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-render.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][327] ([Intel XE#8440]) -> [SKIP][328] ([Intel XE#2313]) +5 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-1/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-draw-render.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping:
    - shard-bmg:          [CRASH][329] ([Intel XE#8460]) -> [TIMEOUT][330] ([Intel XE#8465])
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-2/igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-8/igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-linear-modifier-source-clamping:
    - shard-bmg:          [INCOMPLETE][331] ([Intel XE#1035]) -> [INCOMPLETE][332] ([Intel XE#1035] / [Intel XE#8479]) +1 other test incomplete
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-7/igt@kms_plane@pixel-format-linear-modifier-source-clamping.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-5/igt@kms_plane@pixel-format-linear-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping:
    - shard-bmg:          [INCOMPLETE][333] ([Intel XE#1035]) -> [SKIP][334] ([Intel XE#7283]) +1 other test skip
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-1/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-3/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping:
    - shard-bmg:          [SKIP][335] ([Intel XE#7283]) -> [INCOMPLETE][336] ([Intel XE#1035] / [Intel XE#8479])
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-5/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-2/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a:
    - shard-bmg:          [SKIP][337] ([Intel XE#2763] / [Intel XE#6886]) -> [INCOMPLETE][338] ([Intel XE#8459]) +2 other tests incomplete
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-bmg:          [SKIP][339] ([Intel XE#2763] / [Intel XE#6886]) -> [CRASH][340] ([Intel XE#8458])
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-9/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
    - shard-bmg:          [SKIP][341] ([Intel XE#2763] / [Intel XE#6886]) -> [INCOMPLETE][342] ([Intel XE#8437] / [Intel XE#8459]) +1 other test incomplete
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html

  * igt@kms_pm_dc@dc5-pageflip-negative:
    - shard-bmg:          [SKIP][343] ([Intel XE#6927]) -> [SKIP][344] ([Intel XE#8441])
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-7/igt@kms_pm_dc@dc5-pageflip-negative.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-10/igt@kms_pm_dc@dc5-pageflip-negative.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-lnl:          [SKIP][345] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304]) -> [CRASH][346] ([Intel XE#8455])
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1:
    - shard-lnl:          [SKIP][347] ([Intel XE#4608]) -> [CRASH][348] ([Intel XE#8455])
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-bmg:          [SKIP][349] ([Intel XE#8440]) -> [SKIP][350] ([Intel XE#1489])
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-1/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@fbc-pr-suspend:
    - shard-bmg:          [SKIP][351] ([Intel XE#8440]) -> [SKIP][352] ([Intel XE#2234] / [Intel XE#2850])
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-7/igt@kms_psr@fbc-pr-suspend.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-5/igt@kms_psr@fbc-pr-suspend.html

  * igt@kms_psr@fbc-psr-dpms:
    - shard-bmg:          [SKIP][353] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][354] ([Intel XE#8441]) +1 other test skip
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-7/igt@kms_psr@fbc-psr-dpms.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-10/igt@kms_psr@fbc-psr-dpms.html

  * igt@xe_evict@evict-small-external-multi-queue-cm:
    - shard-bmg:          [SKIP][355] ([Intel XE#8440]) -> [SKIP][356] ([Intel XE#8370])
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-1/igt@xe_evict@evict-small-external-multi-queue-cm.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@xe_evict@evict-small-external-multi-queue-cm.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-bmg:          [INCOMPLETE][357] ([Intel XE#8439]) -> [INCOMPLETE][358] ([Intel XE#8439] / [Intel XE#8479]) +1 other test incomplete
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-10/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:
    - shard-bmg:          [SKIP][359] ([Intel XE#2322] / [Intel XE#7372]) -> [INCOMPLETE][360] ([Intel XE#8479])
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:
    - shard-bmg:          [SKIP][361] ([Intel XE#8440]) -> [INCOMPLETE][362] ([Intel XE#8439] / [Intel XE#8479])
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue:
    - shard-bmg:          [SKIP][363] ([Intel XE#8440]) -> [SKIP][364] ([Intel XE#2322] / [Intel XE#7372])
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-1/igt@xe_exec_basic@multigpu-once-bindexecqueue.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@xe_exec_basic@multigpu-once-bindexecqueue.html

  * igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd-smem:
    - shard-bmg:          [SKIP][365] ([Intel XE#8440]) -> [SKIP][366] ([Intel XE#8364]) +5 other tests skip
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-1/igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd-smem.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd-smem.html

  * igt@xe_exec_sip_eudebug@breakpoint-writesip-nodebug:
    - shard-bmg:          [SKIP][367] ([Intel XE#8440]) -> [SKIP][368] ([Intel XE#7636])
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-7/igt@xe_exec_sip_eudebug@breakpoint-writesip-nodebug.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-5/igt@xe_exec_sip_eudebug@breakpoint-writesip-nodebug.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-nomemset:
    - shard-bmg:          [INCOMPLETE][369] ([Intel XE#8159]) -> [INCOMPLETE][370] ([Intel XE#8159] / [Intel XE#8479]) +2 other tests incomplete
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-10/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-nomemset.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-busy-nomemset:
    - shard-bmg:          [SKIP][371] ([Intel XE#8440]) -> [INCOMPLETE][372] ([Intel XE#8159] / [Intel XE#8479]) +1 other test incomplete
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-busy-nomemset.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-busy-nomemset.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind:
    - shard-bmg:          [INCOMPLETE][373] ([Intel XE#8366]) -> [SKIP][374] ([Intel XE#8378]) +3 other tests skip
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind.html

  * igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr-invalidate-race:
    - shard-bmg:          [SKIP][375] ([Intel XE#8378]) -> [INCOMPLETE][376] ([Intel XE#8366] / [Intel XE#8479]) +1 other test incomplete
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-8/igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr-invalidate-race.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr-invalidate-race.html

  
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5643]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5643
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#5857]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5857
  [Intel XE#5873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5873
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6927
  [Intel XE#6953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7326]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7353]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361
  [Intel XE#7369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7369
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7386]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7386
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425
  [Intel XE#7447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7447
  [Intel XE#7449]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599
  [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7893
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#7928]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7928
  [Intel XE#7935]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935
  [Intel XE#7954]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7954
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
  [Intel XE#8151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8151
  [Intel XE#8155]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8155
  [Intel XE#8159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159
  [Intel XE#8174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8174
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8300]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8300
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#8361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8361
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8366
  [Intel XE#8368]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8368
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8437
  [Intel XE#8439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8439
  [Intel XE#8440]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440
  [Intel XE#8441]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8441
  [Intel XE#8445]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8445
  [Intel XE#8446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8446
  [Intel XE#8447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8447
  [Intel XE#8448]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8448
  [Intel XE#8449]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8449
  [Intel XE#8450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8450
  [Intel XE#8451]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8451
  [Intel XE#8455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8455
  [Intel XE#8456]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8456
  [Intel XE#8458]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8458
  [Intel XE#8459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8459
  [Intel XE#8460]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8460
  [Intel XE#8461]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8461
  [Intel XE#8463]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8463
  [Intel XE#8465]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8465
  [Intel XE#8466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8466
  [Intel XE#8467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8467
  [Intel XE#8469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8469
  [Intel XE#8470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8470
  [Intel XE#8472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8472
  [Intel XE#8473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8473
  [Intel XE#8476]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8476
  [Intel XE#8477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8477
  [Intel XE#8479]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973 -> xe-pw-167697v3

  IGT_8985: d5fe8732b8547454c38fdd220b55f6f0cc841a3b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973: adbc617250e16fb2db4a4c777b89440927cb8973
  xe-pw-167697v3: 167697v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/index.html

--===============7578906097206866773==
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
<tr><td><b>Series:</b></td><td>drm/xe/forcewake: add delayed-release optimization (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/167697/">https://patchwork.freedesktop.org/series/167697/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973_FULL -&gt; xe-pw-167697v3_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-167697v3_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-167697v3_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-167697v3_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@unused-handle:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@kms_addfb_basic@unused-handle.html">SKIP</a> +153 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-1/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html">TIMEOUT</a> +3 other tests timeout</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-5/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html">CRASH</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-race-nomemset:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-lnl-1/igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-race-nomemset.html">INCOMPLETE</a> +5 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-race-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-1/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-race-nomemset.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-new-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-3/igt@xe_exec_system_allocator@process-many-new-nomemset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@xe_exec_system_allocator@process-many-new-nomemset.html">SKIP</a> +96 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-malloc-prefetch-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-1/igt@xe_exec_system_allocator@process-many-stride-malloc-prefetch-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-3/igt@xe_exec_system_allocator@process-many-stride-malloc-prefetch-race.html">FAIL</a> +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_pcode_probe_early:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_pcode_probe_early.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-10/igt@xe_fault_injection@inject-fault-probe-function-xe_pcode_probe_early.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-90:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-lnl-3/igt@xe_pmu@engine-activity-accuracy-90.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-lnl-3/igt@xe_pmu@engine-activity-accuracy-90.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-either-side-partial-large-page-hammer:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-10/igt@xe_vm@munmap-style-unbind-either-side-partial-large-page-hammer.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-3/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8174">Intel XE#8174</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-7/igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-10/igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-3/igt@kms_chamelium_color_pipeline@plane-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@kms_chamelium_color_pipeline@plane-lut1d.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-7/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-10/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-7/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-10/igt@kms_content_protection@type1.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-7/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-10/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x32:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@kms_cursor_crc@cursor-sliding-32x32.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-7/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8155">Intel XE#8155</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-10/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-spr-indfb-fullscreen.html">CRASH</a></li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-3/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486">Intel XE#2486</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-7/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020">Intel XE#5020</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348">Intel XE#7348</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-10/igt@kms_plane_multiple@tiling-yf.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-3/igt@kms_plane_scaling@planes-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@kms_plane_scaling@planes-downscale-factor-0-75.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8473">Intel XE#8473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-copy-compressed-inc-dimension@linear-compressed-compfmt0-system-vram01-1x1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-2/igt@xe_ccs@block-copy-compressed-inc-dimension@linear-compressed-compfmt0-system-vram01-1x1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8437">Intel XE#8437</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-8/igt@xe_ccs@block-copy-compressed-inc-dimension@linear-compressed-compfmt0-system-vram01-1x1.html">INCOMPLETE</a> +3 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-extended-discovery:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-7/igt@xe_eudebug@basic-vm-bind-extended-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-10/igt@xe_eudebug@basic-vm-bind-extended-discovery.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-7/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-10/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-5/igt@xe_exec_basic@multigpu-once-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-4/igt@xe_exec_basic@multigpu-once-null-rebind.html">SKIP</a> +236 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-rebind-imm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-3/igt@xe_exec_fault_mode@once-multi-queue-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@xe_exec_fault_mode@once-multi-queue-rebind-imm.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-3/igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate.html">SKIP</a> +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-huge-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-4/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-huge-nomemset.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159">Intel XE#8159</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-4/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-huge-nomemset.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-new-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-7/igt@xe_exec_system_allocator@process-many-large-execqueues-new-prefetch.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-10/igt@xe_exec_system_allocator@process-many-large-execqueues-new-prefetch.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-free-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-10/igt@xe_exec_system_allocator@threads-many-stride-free-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8441">Intel XE#8441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@xe_exec_system_allocator@threads-many-stride-free-nomemset.html">SKIP</a> +89 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-remap-dontunmap-eocheck:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-lnl-5/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-remap-dontunmap-eocheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8437">Intel XE#8437</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-lnl-8/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-remap-dontunmap-eocheck.html">INCOMPLETE</a> +307 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_device_probe_early:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-xe_device_probe_early.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8448">Intel XE#8448</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@xe_fault_injection@inject-fault-probe-function-xe_device_probe_early.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-black-pxp-fb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-7/igt@xe_pxp@display-black-pxp-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-10/igt@xe_pxp@display-black-pxp-fb.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-pxp-status:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-3/igt@xe_query@multigpu-query-pxp-status.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@xe_query@multigpu-query-pxp-status.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-167697v3_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@pan:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@fbdev@pan.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-7/igt@fbdev@write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-10/igt@fbdev@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233">Intel XE#2233</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-dp-2-4-rc-ccs-xrgb2101010:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-dp-2-4-rc-ccs-xrgb2101010.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8437">Intel XE#8437</a>) +4 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-lnl-1/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8446">Intel XE#8446</a>) +3 other tests timeout</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5643">Intel XE#5643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-1/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059">Intel XE#7059</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-4/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8446">Intel XE#8446</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-7/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-4/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361">Intel XE#7361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8441">Intel XE#8441</a>) +52 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-lnl-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-target-3840x2160p.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-target-3840x2160p.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8469">Intel XE#8469</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8476">Intel XE#8476</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-7/igt@kms_bw@connected-linear-tiling-3-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-4/igt@kms_bw@linear-tiling-1-displays-target-2160x1440p.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-target-2560x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-lnl-1/igt@kms_bw@linear-tiling-4-displays-target-2560x1440p.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8445">Intel XE#8445</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-1/igt@kms_bw@linear-tiling-4-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-lnl-2/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8437">Intel XE#8437</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-lnl-1/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8437">Intel XE#8437</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-4/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-2/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-10/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-lnl-1/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-128x42:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-lnl-1/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x32:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-4/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-4/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-1/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-lnl-1/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7386">Intel XE#7386</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic-bigjoiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-4/igt@kms_dsc@dsc-basic-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats-ultrajoiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-lnl-1/igt@kms_dsc@dsc-with-bpc-formats-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-lnl-1/igt@kms_flip@2x-dpms-vs-vblank-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-8/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset@ab-dp2-hdmi-a3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8155">Intel XE#8155</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-2/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-10/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8155">Intel XE#8155</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-9/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-5/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8461">Intel XE#8461</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-10/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8467">Intel XE#8467</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-1/igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179">Intel XE#7179</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-10/igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +45 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-7/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-mmap-wc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-10/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-mmap-wc.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8466">Intel XE#8466</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-9/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8368">Intel XE#8368</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-7/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-draw-render.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8368">Intel XE#8368</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-draw-mmap-wc.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8466">Intel XE#8466</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbchdr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +45 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-rte:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-3/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-mmap-wc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8441">Intel XE#8441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-lnl-1/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-1/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298">Intel XE#4298</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5873">Intel XE#5873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-2/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-a-plane-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-8/igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-a-plane-0.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8465">Intel XE#8465</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-4/igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8460">Intel XE#8460</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-4/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-5/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-3/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-4/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8437">Intel XE#8437</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8459">Intel XE#8459</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-4/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505">Intel XE#2505</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7447">Intel XE#7447</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-4/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-1/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-7/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-lnl-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8361">Intel XE#8361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-4/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-lnl-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-4/igt@kms_scaling_modes@scaling-mode-full-aspect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-4/igt@kms_setmode@invalid-clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-7/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-7/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450">Intel XE#2450</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5857">Intel XE#5857</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compute:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-9/igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compute.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-3/igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compute.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7893">Intel XE#7893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8300">Intel XE#8300</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@tdctl-parameters:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-4/igt@xe_eudebug_online@tdctl-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-virtual-userptr-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-lnl-1/igt@xe_exec_balancer@many-virtual-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-lnl-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-4/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-1/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-1/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-race-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-3/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-race-prefetch.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) +3 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-lnl-1/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-basic-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-1/igt@xe_exec_multi_queue@two-queues-basic-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-dyn-priority-smem:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-lnl-1/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-dyn-priority-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-multi-queue-close-fd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-lnl-1/igt@xe_exec_reset@cm-multi-queue-close-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_store@basic-all@engine-drm_xe_engine_class_render-instance-0-tile-0-region-system:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-4/igt@xe_exec_store@basic-all@engine-drm_xe_engine_class_render-instance-0-tile-0-region-system.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-10/igt@xe_exec_store@basic-all@engine-drm_xe_engine_class_render-instance-0-tile-0-region-system.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8437">Intel XE#8437</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-multi-vma:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-10/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-multi-vma.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-1/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-multi-vma.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159">Intel XE#8159</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-remap-ro-dontunmap:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-7/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-remap-ro-dontunmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-10/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-remap-ro-dontunmap.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7928">Intel XE#7928</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159">Intel XE#8159</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-madvise:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-lnl-3/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-madvise.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-lnl-1/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-madvise.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8447">Intel XE#8447</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-madvise:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-10/igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-madvise.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8447">Intel XE#8447</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-fork-read-after:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-fork-read-after.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-fork-read-after.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159">Intel XE#8159</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8437">Intel XE#8437</a>) +3 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-nomemset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-10/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-nomemset.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159">Intel XE#8159</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) +35 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-prefetch-madvise:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-10/igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-prefetch-madvise.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159">Intel XE#8159</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-madvise:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-lnl-1/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-madvise.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8447">Intel XE#8447</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-fd-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-cm-fd-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr-invalidate-race.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8366">Intel XE#8366</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_device_create:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_device_create.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8448">Intel XE#8448</a>) +1 other test crash</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8448">Intel XE#8448</a>) +1 other test crash</li>
</ul>
</li>
<li>
<p>igt@xe_gpgpu_fill@offset-4x4:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-7/igt@xe_gpgpu_fill@offset-4x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7954">Intel XE#7954</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-atomic-op-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-1/igt@xe_multigpu_svm@mgpu-atomic-op-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@basic-mixed:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-10/igt@xe_page_reclaim@basic-mixed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-sw-hw-compare:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-1/igt@xe_pat@pat-sw-hw-compare.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695">Intel XE#7695</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@xa-app-transient-media-on:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-4/igt@xe_pat@xa-app-transient-media-on.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-2/igt@xe_peer2peer@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">Intel XE#2427</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953">Intel XE#6953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326">Intel XE#7326</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353">Intel XE#7353</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-prefetch:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-lnl-1/igt@xe_pm@s3-vm-bind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#584</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7369">Intel XE#7369</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_prefetch_fault@prefetch-fault-svm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-1/igt@xe_prefetch_fault@prefetch-fault-svm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599">Intel XE#7599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-10/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-10/igt@xe_query@multigpu-query-invalid-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-lnl-1/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_admin@exec-quantum-write-readback-vfs-disabled:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-8/igt@xe_sriov_admin@exec-quantum-write-readback-vfs-disabled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@xe_sriov_admin@exec-quantum-write-readback-vfs-disabled.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8477">Intel XE#8477</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@nonpreempt-engine-resets-normal-priority@numvfs-random-gt1-vcs0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-4/igt@xe_sriov_scheduling@nonpreempt-engine-resets-normal-priority@numvfs-random-gt1-vcs0.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8472">Intel XE#8472</a>) +1 other test timeout</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-2/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935">Intel XE#7935</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-8/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-9/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8451">Intel XE#8451</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-1/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-10/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@a-dp2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8155">Intel XE#8155</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-1/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@a-dp2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-8/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-mmap-wc.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8466">Intel XE#8466</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-mmap-wc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-5/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-2/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-9/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8437">Intel XE#8437</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-5/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-single-vma:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-2/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-single-vma.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8450">Intel XE#8450</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-8/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-single-vma.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-shared-remap-dontunmap:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-2/igt@xe_exec_system_allocator@process-many-execqueues-mmap-shared-remap-dontunmap.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-8/igt@xe_exec_system_allocator@process-many-execqueues-mmap-shared-remap-dontunmap.html">PASS</a> +10 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-madvise:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-10/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-madvise.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8447">Intel XE#8447</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-madvise.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-10/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-prefetch.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159">Intel XE#8159</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-prefetch.html">PASS</a> +17 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-lnl-3/igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate-race.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8470">Intel XE#8470</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-lnl-3/igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@false-sharing:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-7/igt@xe_pat@false-sharing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-5/igt@xe_pat@false-sharing.html">PASS</a> +50 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-lnl-6/igt@xe_wedged@wedged-mode-toggle.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-lnl-2/igt@xe_wedged@wedged-mode-toggle.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8446">Intel XE#8446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8441">Intel XE#8441</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8446">Intel XE#8446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8446">Intel XE#8446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5643">Intel XE#5643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-1/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5643">Intel XE#5643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5643">Intel XE#5643</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8446">Intel XE#8446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-7/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-10/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8441">Intel XE#8441</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-lnl-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5643">Intel XE#5643</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-lnl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8446">Intel XE#8446</a>) +2 other tests timeout</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-lnl-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-lnl-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8446">Intel XE#8446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-target-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-4/igt@kms_bw@connected-linear-tiling-1-displays-target-2160x1440p.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8437">Intel XE#8437</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-2/igt@kms_bw@connected-linear-tiling-1-displays-target-2160x1440p.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8449">Intel XE#8449</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-target-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-target-2160x1440p.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8476">Intel XE#8476</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-target-2160x1440p.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-7/igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8437">Intel XE#8437</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) +6 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-lnl-2/igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8437">Intel XE#8437</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-lnl-7/igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8445">Intel XE#8445</a>) +15 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-1/igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-3/igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8437">Intel XE#8437</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-10/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-3/igt@kms_bw@linear-tiling-2-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-4/igt@kms_bw@linear-tiling-2-displays-target-2560x1440p.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-2/igt@kms_bw@linear-tiling-2-displays-target-3840x2160p.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8469">Intel XE#8469</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-8/igt@kms_bw@linear-tiling-2-displays-target-3840x2160p.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-target-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-1/igt@kms_bw@linear-tiling-3-displays-target-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@kms_bw@linear-tiling-3-displays-target-2160x1440p.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-7/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-10/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8441">Intel XE#8441</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-1/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8437">Intel XE#8437</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-10/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8463">Intel XE#8463</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-1/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449">Intel XE#7449</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-10/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935">Intel XE#7935</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8451">Intel XE#8451</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8151">Intel XE#8151</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-8/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8451">Intel XE#8451</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-lnl-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935">Intel XE#7935</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-5/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8451">Intel XE#8451</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-7/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8151">Intel XE#8151</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-lnl-3/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8437">Intel XE#8437</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-lnl-1/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8456">Intel XE#8456</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-7/igt@kms_fbcon_fbt@fbc-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-5/igt@kms_fbcon_fbt@fbc-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156">Intel XE#4156</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425">Intel XE#7425</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-2/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8461">Intel XE#8461</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-8/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8155">Intel XE#8155</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8437">Intel XE#8437</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8441">Intel XE#8441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8437">Intel XE#8437</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-1/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-7/igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-10/igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8441">Intel XE#8441</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-1/igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8441">Intel XE#8441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8441">Intel XE#8441</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-draw-render.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8368">Intel XE#8368</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8441">Intel XE#8441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8368">Intel XE#8368</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-10/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8441">Intel XE#8441</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-1/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-2/igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8460">Intel XE#8460</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-8/igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8465">Intel XE#8465</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-7/igt@kms_plane@pixel-format-linear-modifier-source-clamping.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-5/igt@kms_plane@pixel-format-linear-modifier-source-clamping.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-1/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-3/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-5/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-2/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8459">Intel XE#8459</a>) +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-9/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8458">Intel XE#8458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8437">Intel XE#8437</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8459">Intel XE#8459</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-pageflip-negative:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-7/igt@kms_pm_dc@dc5-pageflip-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6927">Intel XE#6927</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-10/igt@kms_pm_dc@dc5-pageflip-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8441">Intel XE#8441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8455">Intel XE#8455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8455">Intel XE#8455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-1/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-7/igt@kms_psr@fbc-pr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-5/igt@kms_psr@fbc-pr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-7/igt@kms_psr@fbc-psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-10/igt@kms_psr@fbc-psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8441">Intel XE#8441</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-multi-queue-cm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-1/igt@xe_evict@evict-small-external-multi-queue-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@xe_evict@evict-small-external-multi-queue-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370">Intel XE#8370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-10/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8439">Intel XE#8439</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8439">Intel XE#8439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8439">Intel XE#8439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-1/igt@xe_exec_basic@multigpu-once-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@xe_exec_basic@multigpu-once-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd-smem:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-1/igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-writesip-nodebug:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-7/igt@xe_exec_sip_eudebug@breakpoint-writesip-nodebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-5/igt@xe_exec_sip_eudebug@breakpoint-writesip-nodebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-10/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-nomemset.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159">Intel XE#8159</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-nomemset.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159">Intel XE#8159</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-busy-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-busy-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-busy-nomemset.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159">Intel XE#8159</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8366">Intel XE#8366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-8/igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v3/shard-bmg-9/igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr-invalidate-race.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8366">Intel XE#8366</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) +1 other test incomplete</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973 -&gt; xe-pw-167697v3</li>
</ul>
<p>IGT_8985: d5fe8732b8547454c38fdd220b55f6f0cc841a3b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973: adbc617250e16fb2db4a4c777b89440927cb8973<br />
  xe-pw-167697v3: 167697v3</p>

</body>
</html>

--===============7578906097206866773==--
