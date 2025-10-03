Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CD15CAC5B0
	for <intel-xe@archiver.kernel.org>; Fri,  3 Oct 2025 02:16:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 946AD10E05D;
	Fri,  3 Oct 2025 02:16:25 +0000 (UTC)
Received: from 6aec98b87f92 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7F7F10E00E;
 Fri,  3 Oct 2025 02:16:23 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7021425282183219826=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Fix_a_couple_of_wedge_corn?=
 =?utf-8?q?er-case_memory_leaks?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Stuart Summers" <stuart.summers@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 03 Oct 2025 02:16:23 -0000
Message-ID: <175945778367.1839.7301799826651526313@6aec98b87f92>
X-Patchwork-Hint: ignore
References: <20251002230444.313505-1-stuart.summers@intel.com>
In-Reply-To: <20251002230444.313505-1-stuart.summers@intel.com>
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

--===============7021425282183219826==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fix a couple of wedge corner-case memory leaks
URL   : https://patchwork.freedesktop.org/series/155352/
State : failure

== Summary ==

CI Bug Log - changes from xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434_FULL -> xe-pw-155352v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-155352v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-155352v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-155352v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@device_reset@unbind-reset-rebind:
    - shard-adlp:         [PASS][1] -> [ABORT][2] +2 other tests abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-6/igt@device_reset@unbind-reset-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-adlp-9/igt@device_reset@unbind-reset-rebind.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-dg2-set2:     [PASS][3] -> [ABORT][4] +10 other tests abort
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-dg2-463/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-dg2-435/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1:
    - shard-adlp:         [PASS][5] -> [INCOMPLETE][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-2/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-adlp-6/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-dg2-set2:     [PASS][7] -> [DMESG-WARN][8] +47 other tests dmesg-warn
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-lnl:          [PASS][9] -> [SKIP][10] +2 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-lnl-5/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-lnl-7/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-dg2-set2:     [PASS][11] -> [SKIP][12] +2 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-dg2-436/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-dg2-435/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@legacy-planes-dpms:
    - shard-adlp:         [PASS][13] -> [SKIP][14] +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-4/igt@kms_pm_rpm@legacy-planes-dpms.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-adlp-3/igt@kms_pm_rpm@legacy-planes-dpms.html

  * igt@kms_vblank@wait-forked-hang@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][15] +2 other tests dmesg-warn
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-dg2-434/igt@kms_vblank@wait-forked-hang@pipe-a-hdmi-a-6.html

  * igt@xe_exec_balancer@many-cm-virtual-userptr:
    - shard-dg2-set2:     [PASS][16] -> [TIMEOUT][17] +3 other tests timeout
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-dg2-434/igt@xe_exec_balancer@many-cm-virtual-userptr.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-dg2-435/igt@xe_exec_balancer@many-cm-virtual-userptr.html

  * igt@xe_exec_balancer@many-execqueues-parallel-userptr-invalidate:
    - shard-dg2-set2:     [PASS][18] -> [DMESG-FAIL][19] +51 other tests dmesg-fail
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-dg2-434/igt@xe_exec_balancer@many-execqueues-parallel-userptr-invalidate.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-dg2-463/igt@xe_exec_balancer@many-execqueues-parallel-userptr-invalidate.html

  * igt@xe_exec_balancer@twice-cm-virtual-rebind:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][20] +1 other test dmesg-fail
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-bmg-4/igt@xe_exec_balancer@twice-cm-virtual-rebind.html

  * igt@xe_exec_basic@once-null-defer-bind:
    - shard-bmg:          [PASS][21] -> [DMESG-WARN][22] +9 other tests dmesg-warn
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-bmg-4/igt@xe_exec_basic@once-null-defer-bind.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-bmg-6/igt@xe_exec_basic@once-null-defer-bind.html

  * igt@xe_exec_basic@twice-bindexecqueue:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][23] +2 other tests dmesg-warn
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-bmg-4/igt@xe_exec_basic@twice-bindexecqueue.html

  * igt@xe_exec_compute_mode@many-userptr:
    - shard-adlp:         [PASS][24] -> [DMESG-FAIL][25] +40 other tests dmesg-fail
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-2/igt@xe_exec_compute_mode@many-userptr.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-adlp-6/igt@xe_exec_compute_mode@many-userptr.html

  * igt@xe_exec_compute_mode@many-userptr-unmap:
    - shard-adlp:         [PASS][26] -> [TIMEOUT][27]
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-2/igt@xe_exec_compute_mode@many-userptr-unmap.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-adlp-3/igt@xe_exec_compute_mode@many-userptr-unmap.html

  * igt@xe_exec_compute_mode@once-bindexecqueue-userptr:
    - shard-dg2-set2:     [PASS][28] -> [FAIL][29]
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-dg2-434/igt@xe_exec_compute_mode@once-bindexecqueue-userptr.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-dg2-435/igt@xe_exec_compute_mode@once-bindexecqueue-userptr.html

  * igt@xe_exec_fault_mode@many-basic-prefetch:
    - shard-bmg:          NOTRUN -> [TIMEOUT][30]
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-bmg-4/igt@xe_exec_fault_mode@many-basic-prefetch.html

  * igt@xe_exec_store@long-shader-bb-check@gt0-drm_xe_engine_class_compute0-bb-system-target-system:
    - shard-dg2-set2:     [PASS][31] -> [INCOMPLETE][32]
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-dg2-434/igt@xe_exec_store@long-shader-bb-check@gt0-drm_xe_engine_class_compute0-bb-system-target-system.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-dg2-434/igt@xe_exec_store@long-shader-bb-check@gt0-drm_xe_engine_class_compute0-bb-system-target-system.html

  * igt@xe_exec_system_allocator@many-large-malloc-busy-nomemset:
    - shard-bmg:          [PASS][33] -> [FAIL][34]
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-bmg-1/igt@xe_exec_system_allocator@many-large-malloc-busy-nomemset.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-bmg-3/igt@xe_exec_system_allocator@many-large-malloc-busy-nomemset.html

  * igt@xe_exec_system_allocator@many-malloc-fork-read-after:
    - shard-lnl:          [PASS][35] -> [DMESG-FAIL][36] +82 other tests dmesg-fail
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-lnl-8/igt@xe_exec_system_allocator@many-malloc-fork-read-after.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-lnl-1/igt@xe_exec_system_allocator@many-malloc-fork-read-after.html

  * igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-mlock-nomemset:
    - shard-bmg:          NOTRUN -> [ABORT][37]
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-bmg-4/igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-mlock-nomemset.html

  * igt@xe_exec_system_allocator@process-many-mmap-shared-remap:
    - shard-bmg:          [PASS][38] -> [ABORT][39] +17 other tests abort
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-bmg-5/igt@xe_exec_system_allocator@process-many-mmap-shared-remap.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-bmg-6/igt@xe_exec_system_allocator@process-many-mmap-shared-remap.html

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-free-nomemset:
    - shard-lnl:          [PASS][40] -> [ABORT][41] +19 other tests abort
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-lnl-2/igt@xe_exec_system_allocator@threads-many-large-execqueues-free-nomemset.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-lnl-3/igt@xe_exec_system_allocator@threads-many-large-execqueues-free-nomemset.html

  * igt@xe_exec_system_allocator@twice-mmap-new-race-nomemset:
    - shard-bmg:          [PASS][42] -> [DMESG-FAIL][43] +65 other tests dmesg-fail
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-bmg-4/igt@xe_exec_system_allocator@twice-mmap-new-race-nomemset.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-bmg-7/igt@xe_exec_system_allocator@twice-mmap-new-race-nomemset.html

  * igt@xe_exec_threads@threads-bal-userptr-invalidate:
    - shard-lnl:          [PASS][44] -> [DMESG-WARN][45] +14 other tests dmesg-warn
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-lnl-5/igt@xe_exec_threads@threads-bal-userptr-invalidate.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-lnl-7/igt@xe_exec_threads@threads-bal-userptr-invalidate.html

  * igt@xe_pmu@engine-activity-single-load@engine-drm_xe_engine_class_video_enhance0:
    - shard-adlp:         [PASS][46] -> [FAIL][47] +3 other tests fail
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-1/igt@xe_pmu@engine-activity-single-load@engine-drm_xe_engine_class_video_enhance0.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-adlp-2/igt@xe_pmu@engine-activity-single-load@engine-drm_xe_engine_class_video_enhance0.html

  * igt@xe_vm@large-split-misaligned-binds-1073741824:
    - shard-adlp:         [PASS][48] -> [DMESG-WARN][49] +41 other tests dmesg-warn
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-8/igt@xe_vm@large-split-misaligned-binds-1073741824.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-adlp-2/igt@xe_vm@large-split-misaligned-binds-1073741824.html

  
#### Warnings ####

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-bmg:          [SKIP][50] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836]) -> [SKIP][51]
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-bmg-2/igt@kms_pm_rpm@modeset-lpsp.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-bmg-4/igt@kms_pm_rpm@modeset-lpsp.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_pipe_stress@stress-xrgb8888-xtiled}:
    - shard-adlp:         [PASS][52] -> [DMESG-WARN][53]
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-8/igt@kms_pipe_stress@stress-xrgb8888-xtiled.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-adlp-1/igt@kms_pipe_stress@stress-xrgb8888-xtiled.html
    - shard-dg2-set2:     [PASS][54] -> [DMESG-WARN][55]
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-dg2-464/igt@kms_pipe_stress@stress-xrgb8888-xtiled.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-dg2-466/igt@kms_pipe_stress@stress-xrgb8888-xtiled.html

  * {igt@xe_configfs@ctx-restore-post-bb-invalid}:
    - shard-lnl:          [PASS][56] -> [ABORT][57] +4 other tests abort
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-lnl-7/igt@xe_configfs@ctx-restore-post-bb-invalid.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-lnl-1/igt@xe_configfs@ctx-restore-post-bb-invalid.html
    - shard-adlp:         [PASS][58] -> [ABORT][59]
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-3/igt@xe_configfs@ctx-restore-post-bb-invalid.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-adlp-9/igt@xe_configfs@ctx-restore-post-bb-invalid.html

  * {igt@xe_exec_system_allocator@many-64k-mmap-remap-ro-dontunmap}:
    - shard-bmg:          [PASS][60] -> [DMESG-FAIL][61] +10 other tests dmesg-fail
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-bmg-6/igt@xe_exec_system_allocator@many-64k-mmap-remap-ro-dontunmap.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-bmg-7/igt@xe_exec_system_allocator@many-64k-mmap-remap-ro-dontunmap.html

  * {igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-free-madvise}:
    - shard-bmg:          [PASS][62] -> [ABORT][63] +3 other tests abort
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-free-madvise.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-bmg-6/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-free-madvise.html

  * {igt@xe_exec_system_allocator@twice-large-free-madvise}:
    - shard-lnl:          [PASS][64] -> [DMESG-FAIL][65] +14 other tests dmesg-fail
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-lnl-4/igt@xe_exec_system_allocator@twice-large-free-madvise.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-lnl-5/igt@xe_exec_system_allocator@twice-large-free-madvise.html

  * {igt@xe_fault_injection@inject-fault-probe-function-guc_wait_ucode}:
    - shard-dg2-set2:     [PASS][66] -> [ABORT][67] +1 other test abort
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-dg2-433/igt@xe_fault_injection@inject-fault-probe-function-guc_wait_ucode.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-dg2-434/igt@xe_fault_injection@inject-fault-probe-function-guc_wait_ucode.html

  
Known issues
------------

  Here are the changes found in xe-pw-155352v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotreplug:
    - shard-dg2-set2:     [PASS][68] -> [ABORT][69] ([Intel XE#5466])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-dg2-464/igt@core_hotunplug@hotreplug.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-dg2-466/igt@core_hotunplug@hotreplug.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:
    - shard-adlp:         [PASS][70] -> [FAIL][71] ([Intel XE#3908]) +3 other tests fail
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-3/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-adlp-4/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][72] ([Intel XE#367])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-dg2-464/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-c-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#787]) +97 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-dg2-432/igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#455] / [Intel XE#787]) +13 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-2.html

  * igt@kms_ccs@random-ccs-data-y-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#2887])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-bmg-4/igt@kms_ccs@random-ccs-data-y-tiled-ccs.html

  * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#4417]) +3 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-dg2-434/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html

  * igt@kms_content_protection@atomic@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][77] ([Intel XE#1178])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-bmg-1/igt@kms_content_protection@atomic@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-adlp:         [PASS][78] -> [INCOMPLETE][79] ([Intel XE#5545])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-2/igt@kms_cursor_crc@cursor-suspend.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-adlp-6/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
    - shard-adlp:         [PASS][80] -> [DMESG-FAIL][81] ([Intel XE#5545])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-2/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-adlp-6/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-dg2-set2:     [PASS][82] -> [INCOMPLETE][83] ([Intel XE#3226])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-dg2-435/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-dg2-433/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-bmg:          [PASS][84] -> [SKIP][85] ([Intel XE#2316])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-bmg-4/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - shard-adlp:         [PASS][86] -> [DMESG-WARN][87] ([Intel XE#4543]) +2 other tests dmesg-warn
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-3/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-adlp-2/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:
    - shard-adlp:         [PASS][88] -> [ABORT][89] ([Intel XE#3970]) +1 other test abort
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][90] ([Intel XE#651])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][91] ([Intel XE#653])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#2313])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     NOTRUN -> [FAIL][93] ([Intel XE#616]) +3 other tests fail
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-dg2-434/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_plane_lowres@tiling-x:
    - shard-dg2-set2:     [PASS][94] -> [DMESG-WARN][95] ([Intel XE#5681])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-dg2-432/igt@kms_plane_lowres@tiling-x.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-dg2-434/igt@kms_plane_lowres@tiling-x.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - shard-adlp:         [PASS][96] -> [ABORT][97] ([Intel XE#5545])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-8/igt@kms_pm_rpm@basic-pci-d3-state.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-adlp-1/igt@kms_pm_rpm@basic-pci-d3-state.html

  * igt@kms_vblank@query-forked-hang@pipe-a-hdmi-a-1:
    - shard-adlp:         [PASS][98] -> [DMESG-WARN][99] ([Intel XE#2953] / [Intel XE#4173]) +1 other test dmesg-warn
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-9/igt@kms_vblank@query-forked-hang@pipe-a-hdmi-a-1.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-adlp-4/igt@kms_vblank@query-forked-hang@pipe-a-hdmi-a-1.html

  * igt@xe_eudebug_online@reset-with-attention:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#4837])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-bmg-4/igt@xe_eudebug_online@reset-with-attention.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
    - shard-dg2-set2:     [PASS][101] -> [SKIP][102] ([Intel XE#1392]) +4 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-dg2-436/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html

  * igt@xe_exec_compute_mode@many-execqueues-preempt-fence-early:
    - shard-adlp:         [PASS][103] -> [FAIL][104] ([Intel XE#5625])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-9/igt@xe_exec_compute_mode@many-execqueues-preempt-fence-early.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-adlp-6/igt@xe_exec_compute_mode@many-execqueues-preempt-fence-early.html

  * igt@xe_exec_compute_mode@many-userptr-invalidate-race:
    - shard-adlp:         [PASS][105] -> [ABORT][106] ([Intel XE#5790])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-6/igt@xe_exec_compute_mode@many-userptr-invalidate-race.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-adlp-1/igt@xe_exec_compute_mode@many-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-invalid-userptr-fault:
    - shard-dg2-set2:     NOTRUN -> [SKIP][107] ([Intel XE#288])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-dg2-464/igt@xe_exec_fault_mode@many-invalid-userptr-fault.html

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-file-mlock-nomemset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][108] ([Intel XE#4915]) +9 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-dg2-464/igt@xe_exec_system_allocator@many-large-execqueues-mmap-file-mlock-nomemset.html

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-new:
    - shard-bmg:          [PASS][109] -> [ABORT][110] ([Intel XE#3970])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-bmg-7/igt@xe_exec_system_allocator@threads-many-large-execqueues-new.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-large-execqueues-new.html

  * igt@xe_exec_threads@threads-bal-mixed-fd-rebind:
    - shard-bmg:          [PASS][111] -> [DMESG-FAIL][112] ([Intel XE#3876]) +3 other tests dmesg-fail
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-bmg-7/igt@xe_exec_threads@threads-bal-mixed-fd-rebind.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-bmg-3/igt@xe_exec_threads@threads-bal-mixed-fd-rebind.html

  * igt@xe_exec_threads@threads-bal-userptr-invalidate:
    - shard-dg2-set2:     [PASS][113] -> [DMESG-FAIL][114] ([Intel XE#3876])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-dg2-463/igt@xe_exec_threads@threads-bal-userptr-invalidate.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-dg2-464/igt@xe_exec_threads@threads-bal-userptr-invalidate.html

  * igt@xe_exec_threads@threads-mixed-fd-userptr-invalidate:
    - shard-adlp:         [PASS][115] -> [DMESG-FAIL][116] ([Intel XE#3876]) +9 other tests dmesg-fail
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-8/igt@xe_exec_threads@threads-mixed-fd-userptr-invalidate.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-adlp-1/igt@xe_exec_threads@threads-mixed-fd-userptr-invalidate.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init:
    - shard-adlp:         [PASS][117] -> [ABORT][118] ([Intel XE#5530]) +5 other tests abort
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-2/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-adlp-8/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html

  * igt@xe_pm@s2idle-vm-bind-unbind-all:
    - shard-adlp:         [PASS][119] -> [DMESG-WARN][120] ([Intel XE#4504])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-2/igt@xe_pm@s2idle-vm-bind-unbind-all.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-adlp-8/igt@xe_pm@s2idle-vm-bind-unbind-all.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-rpm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][121] ([Intel XE#4733])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-dg2-464/igt@xe_pxp@pxp-stale-bo-bind-post-rpm.html

  
#### Possible fixes ####

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][122] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345]) -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][124] ([Intel XE#6014]) -> [PASS][125]
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-WARN][126] ([Intel XE#1727] / [Intel XE#3113]) -> [PASS][127]
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          [SKIP][128] ([Intel XE#2316]) -> [PASS][129]
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][130] ([Intel XE#4543]) -> [PASS][131] +1 other test pass
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-adlp-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [DMESG-WARN][132] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][133] +1 other test pass
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-3/igt@kms_flip@flip-vs-suspend-interruptible.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - shard-dg2-set2:     [SKIP][134] ([Intel XE#1392]) -> [PASS][135] +2 other tests pass
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-dg2-432/igt@xe_exec_basic@multigpu-once-null-rebind.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-dg2-434/igt@xe_exec_basic@multigpu-once-null-rebind.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-adlp:         [DMESG-WARN][136] ([Intel XE#3876]) -> [PASS][137]
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-8/igt@xe_exec_reset@parallel-gt-reset.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-adlp-6/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][138], [PASS][139], [PASS][140], [PASS][141], [PASS][142], [PASS][143], [PASS][144], [PASS][145], [PASS][146], [PASS][147], [SKIP][148], [PASS][149], [PASS][150], [PASS][151], [PASS][152], [PASS][153], [PASS][154], [PASS][155], [PASS][156], [PASS][157], [PASS][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163]) ([Intel XE#378]) -> ([PASS][164], [PASS][165], [PASS][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170], [PASS][171], [PASS][172], [PASS][173], [PASS][174], [PASS][175], [PASS][176], [PASS][177], [PASS][178], [PASS][179], [PASS][180], [PASS][181], [PASS][182], [PASS][183], [PASS][184], [PASS][185], [PASS][186], [PASS][187], [PASS][188])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-lnl-1/igt@xe_module_load@load.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-lnl-7/igt@xe_module_load@load.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-lnl-7/igt@xe_module_load@load.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-lnl-3/igt@xe_module_load@load.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-lnl-4/igt@xe_module_load@load.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-lnl-4/igt@xe_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-lnl-4/igt@xe_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-lnl-1/igt@xe_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-lnl-1/igt@xe_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-lnl-8/igt@xe_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-lnl-8/igt@xe_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-lnl-4/igt@xe_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-lnl-7/igt@xe_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-lnl-5/igt@xe_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-lnl-5/igt@xe_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-lnl-2/igt@xe_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-lnl-2/igt@xe_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-lnl-3/igt@xe_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-lnl-2/igt@xe_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-lnl-3/igt@xe_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-lnl-8/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-lnl-7/igt@xe_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-lnl-5/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-lnl-5/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-lnl-8/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-lnl-8/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-lnl-5/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-lnl-5/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-lnl-7/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-lnl-7/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-lnl-2/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-lnl-8/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-lnl-8/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-lnl-7/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-lnl-7/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-lnl-4/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-lnl-3/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-lnl-4/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-lnl-4/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-lnl-3/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-lnl-3/igt@xe_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-lnl-4/igt@xe_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-lnl-2/igt@xe_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-lnl-8/igt@xe_module_load@load.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-lnl-1/igt@xe_module_load@load.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-lnl-3/igt@xe_module_load@load.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-lnl-1/igt@xe_module_load@load.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-lnl-1/igt@xe_module_load@load.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-lnl-2/igt@xe_module_load@load.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-lnl-1/igt@xe_module_load@load.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-lnl-5/igt@xe_module_load@load.html
    - shard-bmg:          ([PASS][189], [PASS][190], [PASS][191], [PASS][192], [PASS][193], [PASS][194], [PASS][195], [PASS][196], [PASS][197], [PASS][198], [PASS][199], [PASS][200], [PASS][201], [PASS][202], [PASS][203], [PASS][204], [PASS][205], [PASS][206], [PASS][207], [PASS][208], [PASS][209], [PASS][210], [PASS][211], [SKIP][212], [PASS][213]) ([Intel XE#2457]) -> ([PASS][214], [PASS][215], [PASS][216], [PASS][217], [PASS][218], [PASS][219], [PASS][220], [PASS][221], [PASS][222], [PASS][223], [PASS][224], [PASS][225], [PASS][226], [PASS][227], [PASS][228], [PASS][229], [PASS][230], [PASS][231], [PASS][232], [PASS][233], [PASS][234], [PASS][235], [PASS][236], [PASS][237])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-bmg-3/igt@xe_module_load@load.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-bmg-3/igt@xe_module_load@load.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-bmg-2/igt@xe_module_load@load.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-bmg-7/igt@xe_module_load@load.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-bmg-7/igt@xe_module_load@load.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-bmg-7/igt@xe_module_load@load.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-bmg-1/igt@xe_module_load@load.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-bmg-1/igt@xe_module_load@load.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-bmg-8/igt@xe_module_load@load.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-bmg-8/igt@xe_module_load@load.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-bmg-4/igt@xe_module_load@load.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-bmg-4/igt@xe_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-bmg-5/igt@xe_module_load@load.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-bmg-5/igt@xe_module_load@load.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-bmg-6/igt@xe_module_load@load.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-bmg-1/igt@xe_module_load@load.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-bmg-7/igt@xe_module_load@load.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-bmg-2/igt@xe_module_load@load.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-bmg-3/igt@xe_module_load@load.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-bmg-2/igt@xe_module_load@load.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-bmg-5/igt@xe_module_load@load.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-bmg-6/igt@xe_module_load@load.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-bmg-6/igt@xe_module_load@load.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-bmg-6/igt@xe_module_load@load.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-bmg-5/igt@xe_module_load@load.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-bmg-7/igt@xe_module_load@load.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-bmg-3/igt@xe_module_load@load.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-bmg-1/igt@xe_module_load@load.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-bmg-5/igt@xe_module_load@load.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-bmg-5/igt@xe_module_load@load.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-bmg-7/igt@xe_module_load@load.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-bmg-4/igt@xe_module_load@load.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-bmg-4/igt@xe_module_load@load.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-bmg-8/igt@xe_module_load@load.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-bmg-8/igt@xe_module_load@load.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-bmg-8/igt@xe_module_load@load.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-bmg-6/igt@xe_module_load@load.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-bmg-6/igt@xe_module_load@load.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-bmg-3/igt@xe_module_load@load.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-bmg-2/igt@xe_module_load@load.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-bmg-5/igt@xe_module_load@load.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-bmg-2/igt@xe_module_load@load.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-bmg-2/igt@xe_module_load@load.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-bmg-4/igt@xe_module_load@load.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-bmg-2/igt@xe_module_load@load.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-bmg-3/igt@xe_module_load@load.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-bmg-1/igt@xe_module_load@load.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-bmg-6/igt@xe_module_load@load.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-bmg-1/igt@xe_module_load@load.html
    - shard-adlp:         ([PASS][238], [PASS][239], [PASS][240], [PASS][241], [PASS][242], [PASS][243], [PASS][244], [PASS][245], [PASS][246], [PASS][247], [PASS][248], [PASS][249], [PASS][250], [PASS][251], [PASS][252], [PASS][253], [PASS][254], [PASS][255], [PASS][256], [SKIP][257], [PASS][258], [PASS][259], [PASS][260], [PASS][261], [PASS][262], [PASS][263]) ([Intel XE#378] / [Intel XE#5612]) -> ([PASS][264], [PASS][265], [PASS][266], [PASS][267], [PASS][268], [PASS][269], [PASS][270], [PASS][271], [PASS][272], [PASS][273], [PASS][274], [PASS][275], [PASS][276], [PASS][277], [PASS][278], [PASS][279], [PASS][280], [PASS][281], [PASS][282], [PASS][283], [PASS][284], [PASS][285], [PASS][286], [PASS][287], [PASS][288])
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-3/igt@xe_module_load@load.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-2/igt@xe_module_load@load.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-2/igt@xe_module_load@load.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-2/igt@xe_module_load@load.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-4/igt@xe_module_load@load.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-4/igt@xe_module_load@load.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-2/igt@xe_module_load@load.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-9/igt@xe_module_load@load.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-9/igt@xe_module_load@load.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-3/igt@xe_module_load@load.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-3/igt@xe_module_load@load.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-6/igt@xe_module_load@load.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-1/igt@xe_module_load@load.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-8/igt@xe_module_load@load.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-8/igt@xe_module_load@load.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-3/igt@xe_module_load@load.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-6/igt@xe_module_load@load.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-6/igt@xe_module_load@load.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-1/igt@xe_module_load@load.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-8/igt@xe_module_load@load.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-9/igt@xe_module_load@load.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-4/igt@xe_module_load@load.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-1/igt@xe_module_load@load.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-1/igt@xe_module_load@load.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-8/igt@xe_module_load@load.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-9/igt@xe_module_load@load.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-adlp-9/igt@xe_module_load@load.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-adlp-4/igt@xe_module_load@load.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-adlp-8/igt@xe_module_load@load.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-adlp-8/igt@xe_module_load@load.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-adlp-4/igt@xe_module_load@load.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-adlp-1/igt@xe_module_load@load.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-adlp-6/igt@xe_module_load@load.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-adlp-9/igt@xe_module_load@load.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-adlp-6/igt@xe_module_load@load.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-adlp-6/igt@xe_module_load@load.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-adlp-9/igt@xe_module_load@load.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-adlp-9/igt@xe_module_load@load.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-adlp-6/igt@xe_module_load@load.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-adlp-8/igt@xe_module_load@load.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-adlp-2/igt@xe_module_load@load.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-adlp-8/igt@xe_module_load@load.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-adlp-2/igt@xe_module_load@load.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-adlp-2/igt@xe_module_load@load.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-adlp-3/igt@xe_module_load@load.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-adlp-3/igt@xe_module_load@load.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-adlp-1/igt@xe_module_load@load.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-adlp-2/igt@xe_module_load@load.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-adlp-1/igt@xe_module_load@load.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-adlp-3/igt@xe_module_load@load.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-adlp-4/igt@xe_module_load@load.html

  
#### Warnings ####

  * igt@kms_big_fb@x-tiled-8bpp-rotate-0:
    - shard-adlp:         [DMESG-FAIL][289] ([Intel XE#4543]) -> [DMESG-WARN][290] ([Intel XE#4543])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-2/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-adlp-3/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [SKIP][291] ([Intel XE#2341]) -> [FAIL][292] ([Intel XE#1178])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-bmg-6/igt@kms_content_protection@atomic.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-bmg-1/igt@kms_content_protection@atomic.html

  * igt@kms_flip@flip-vs-rmfb:
    - shard-adlp:         [DMESG-WARN][293] ([Intel XE#4543] / [Intel XE#5208]) -> [DMESG-WARN][294] ([Intel XE#5208])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-8/igt@kms_flip@flip-vs-rmfb.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-adlp-6/igt@kms_flip@flip-vs-rmfb.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][295] ([Intel XE#2311]) -> [SKIP][296] ([Intel XE#2312])
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][297] ([Intel XE#2312]) -> [SKIP][298] ([Intel XE#2311]) +1 other test skip
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-adlp:         [SKIP][299] ([Intel XE#2284] / [Intel XE#366]) -> [ABORT][300] ([Intel XE#5545])
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-4/igt@xe_pm@d3cold-basic-exec.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-adlp-1/igt@xe_pm@d3cold-basic-exec.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
  [Intel XE#4504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4504
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
  [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
  [Intel XE#5530]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5612]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5612
  [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
  [Intel XE#5681]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5681
  [Intel XE#5790]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5790
  [Intel XE#6014]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6014
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#6192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6192
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836


Build changes
-------------

  * Linux: xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434 -> xe-pw-155352v1

  IGT_8572: 8572
  xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434: 0aa5ad66ed77cd8c3bb9fb01997f68f31200f434
  xe-pw-155352v1: 155352v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/index.html

--===============7021425282183219826==
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
<tr><td><b>Series:</b></td><td>Fix a couple of wedge corner-case memory lea=
ks</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/155352/">https://patchwork.freedesktop.org/series/155352/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-155352v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-155352v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31=
200f434_FULL -&gt; xe-pw-155352v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-155352v1_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-155352v1_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1553=
52v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-6/igt@device_=
reset@unbind-reset-rebind.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-adlp-9/igt@device_reset@unbin=
d-reset-rebind.html">ABORT</a> +2 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-dg2-463/igt@kms_at=
omic_transition@modeset-transition-nonblocking-fencing.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-=
dg2-435/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.ht=
ml">ABORT</a> +10 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-2/igt@kms_cur=
sor_crc@cursor-suspend@pipe-d-hdmi-a-1.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-adlp-6/igt@kms_c=
ursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-dg2-434/igt@kms_fl=
ip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/sha=
rd-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscal=
ing.html">DMESG-WARN</a> +47 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-lnl-5/igt@kms_pm_r=
pm@dpms-mode-unset-lpsp.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-155352v1/shard-lnl-7/igt@kms_pm_rpm@dpms-mode-=
unset-lpsp.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-dg2-436/igt@kms_pm=
_rpm@dpms-mode-unset-non-lpsp.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-dg2-435/igt@kms_pm_rpm@dp=
ms-mode-unset-non-lpsp.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes-dpms:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-4/igt@kms_pm_=
rpm@legacy-planes-dpms.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-155352v1/shard-adlp-3/igt@kms_pm_rpm@legacy-pla=
nes-dpms.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-hang@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155352v1/shard-dg2-434/igt@kms_vblank@wait-forked-hang=
@pipe-a-hdmi-a-6.html">DMESG-WARN</a> +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-cm-virtual-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-dg2-434/igt@xe_exe=
c_balancer@many-cm-virtual-userptr.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-dg2-435/igt@xe_exec_=
balancer@many-cm-virtual-userptr.html">TIMEOUT</a> +3 other tests timeout</=
li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-parallel-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-dg2-434/igt@xe_exe=
c_balancer@many-execqueues-parallel-userptr-invalidate.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-=
dg2-463/igt@xe_exec_balancer@many-execqueues-parallel-userptr-invalidate.ht=
ml">DMESG-FAIL</a> +51 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-cm-virtual-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155352v1/shard-bmg-4/igt@xe_exec_balancer@twice-cm-vir=
tual-rebind.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-null-defer-bind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-bmg-4/igt@xe_exec_=
basic@once-null-defer-bind.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-bmg-6/igt@xe_exec_basic@once=
-null-defer-bind.html">DMESG-WARN</a> +9 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155352v1/shard-bmg-4/igt@xe_exec_basic@twice-bindexecq=
ueue.html">DMESG-WARN</a> +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-userptr:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-2/igt@xe_exec=
_compute_mode@many-userptr.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-adlp-6/igt@xe_exec_compute_m=
ode@many-userptr.html">DMESG-FAIL</a> +40 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-userptr-unmap:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-2/igt@xe_exec=
_compute_mode@many-userptr-unmap.html">PASS</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-adlp-3/igt@xe_exec_com=
pute_mode@many-userptr-unmap.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@once-bindexecqueue-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-dg2-434/igt@xe_exe=
c_compute_mode@once-bindexecqueue-userptr.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-dg2-435/igt@x=
e_exec_compute_mode@once-bindexecqueue-userptr.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-basic-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155352v1/shard-bmg-4/igt@xe_exec_fault_mode@many-basic=
-prefetch.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_store@long-shader-bb-check@gt0-drm_xe_engine_class_compute0-=
bb-system-target-system:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-dg2-434/igt@xe_exe=
c_store@long-shader-bb-check@gt0-drm_xe_engine_class_compute0-bb-system-tar=
get-system.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-155352v1/shard-dg2-434/igt@xe_exec_store@long-shader-bb-che=
ck@gt0-drm_xe_engine_class_compute0-bb-system-target-system.html">INCOMPLET=
E</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-malloc-busy-nomemset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-bmg-1/igt@xe_exec_=
system_allocator@many-large-malloc-busy-nomemset.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-bmg-3/=
igt@xe_exec_system_allocator@many-large-malloc-busy-nomemset.html">FAIL</a>=
</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-malloc-fork-read-after:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-lnl-8/igt@xe_exec_=
system_allocator@many-malloc-fork-read-after.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-lnl-1/ig=
t@xe_exec_system_allocator@many-malloc-fork-read-after.html">DMESG-FAIL</a>=
 +82 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-mlock-=
nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155352v1/shard-bmg-4/igt@xe_exec_system_allocator@proc=
ess-many-large-execqueues-malloc-mlock-nomemset.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-shared-remap:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-bmg-5/igt@xe_exec_=
system_allocator@process-many-mmap-shared-remap.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-bmg-6/i=
gt@xe_exec_system_allocator@process-many-mmap-shared-remap.html">ABORT</a> =
+17 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-free-nomemset=
:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-lnl-2/igt@xe_exec_=
system_allocator@threads-many-large-execqueues-free-nomemset.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/=
shard-lnl-3/igt@xe_exec_system_allocator@threads-many-large-execqueues-free=
-nomemset.html">ABORT</a> +19 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-new-race-nomemset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-bmg-4/igt@xe_exec_=
system_allocator@twice-mmap-new-race-nomemset.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-bmg-7/ig=
t@xe_exec_system_allocator@twice-mmap-new-race-nomemset.html">DMESG-FAIL</a=
> +65 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-lnl-5/igt@xe_exec_=
threads@threads-bal-userptr-invalidate.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-lnl-7/igt@xe_exe=
c_threads@threads-bal-userptr-invalidate.html">DMESG-WARN</a> +14 other tes=
ts dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-single-load@engine-drm_xe_engine_class_video_=
enhance0:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-1/igt@xe_pmu@=
engine-activity-single-load@engine-drm_xe_engine_class_video_enhance0.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
155352v1/shard-adlp-2/igt@xe_pmu@engine-activity-single-load@engine-drm_xe_=
engine_class_video_enhance0.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-misaligned-binds-1073741824:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-8/igt@xe_vm@l=
arge-split-misaligned-binds-1073741824.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-adlp-2/igt@xe_vm=
@large-split-misaligned-binds-1073741824.html">DMESG-WARN</a> +41 other tes=
ts dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_pm_rpm@modeset-lpsp:<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-bmg-2/igt@kms_pm_r=
pm@modeset-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard=
-bmg-4/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@kms_pipe_stress@stress-xrgb8888-xtiled}:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-8/igt@kms_pip=
e_stress@stress-xrgb8888-xtiled.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-adlp-1/igt@kms_pipe_str=
ess@stress-xrgb8888-xtiled.html">DMESG-WARN</a></li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-dg2-464/igt@kms_pi=
pe_stress@stress-xrgb8888-xtiled.html">PASS</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-dg2-466/igt@kms_pipe_s=
tress@stress-xrgb8888-xtiled.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>{igt@xe_configfs@ctx-restore-post-bb-invalid}:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-lnl-7/igt@xe_confi=
gfs@ctx-restore-post-bb-invalid.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-lnl-1/igt@xe_configfs@c=
tx-restore-post-bb-invalid.html">ABORT</a> +4 other tests abort</li>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-3/igt@xe_conf=
igfs@ctx-restore-post-bb-invalid.html">PASS</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-adlp-9/igt@xe_configfs=
@ctx-restore-post-bb-invalid.html">ABORT</a></li>
</ul>
</li>
<li>
<p>{igt@xe_exec_system_allocator@many-64k-mmap-remap-ro-dontunmap}:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-bmg-6/igt@xe_exec_=
system_allocator@many-64k-mmap-remap-ro-dontunmap.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-bmg-7=
/igt@xe_exec_system_allocator@many-64k-mmap-remap-ro-dontunmap.html">DMESG-=
FAIL</a> +10 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-free-ma=
dvise}:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-bmg-5/igt@xe_exec_=
system_allocator@threads-many-large-execqueues-mmap-free-madvise.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15535=
2v1/shard-bmg-6/igt@xe_exec_system_allocator@threads-many-large-execqueues-=
mmap-free-madvise.html">ABORT</a> +3 other tests abort</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_system_allocator@twice-large-free-madvise}:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-lnl-4/igt@xe_exec_=
system_allocator@twice-large-free-madvise.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-lnl-5/igt@xe_=
exec_system_allocator@twice-large-free-madvise.html">DMESG-FAIL</a> +14 oth=
er tests dmesg-fail</li>
</ul>
</li>
<li>
<p>{igt@xe_fault_injection@inject-fault-probe-function-guc_wait_ucode}:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-dg2-433/igt@xe_fau=
lt_injection@inject-fault-probe-function-guc_wait_ucode.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard=
-dg2-434/igt@xe_fault_injection@inject-fault-probe-function-guc_wait_ucode.=
html">ABORT</a> +1 other test abort</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-155352v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-dg2-464/igt@core_h=
otunplug@hotreplug.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-155352v1/shard-dg2-466/igt@core_hotunplug@hotreplug=
.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/5466">Intel XE#5466</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-3/igt@kms_ato=
mic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/s=
hard-adlp-4/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-h=
dmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3908">Intel XE#3908</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155352v1/shard-dg2-464/igt@kms_bw@linear-tiling-1-disp=
lays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155352v1/shard-dg2-432/igt@kms_ccs@bad-rotation-90-yf-=
tiled-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +97 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155352v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y=
f-tiled-ccs@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155352v1/shard-bmg-4/igt@kms_ccs@random-ccs-data-y-til=
ed-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155352v1/shard-dg2-434/igt@kms_cdclk@mode-transition@p=
ipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4417">Intel XE#4417</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155352v1/shard-bmg-1/igt@kms_content_protection@atomic=
@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-2/igt@kms_cur=
sor_crc@cursor-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-155352v1/shard-adlp-6/igt@kms_cursor_crc@cursor=
-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/5545">Intel XE#5545</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-2/igt@kms_cur=
sor_crc@cursor-suspend@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-adlp-6/igt@kms_c=
ursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html">DMESG-FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-dg2-435/igt@kms_cu=
rsor_legacy@2x-long-flip-vs-cursor-atomic.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-dg2-433/igt@k=
ms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html">INCOMPLETE</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226">Intel XE#322=
6</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-bmg-4/igt@kms_flip=
@2x-flip-vs-rmfb-interruptible.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-bmg-6/igt@kms_flip@2x-fl=
ip-vs-rmfb-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-3/igt@kms_fli=
p@basic-flip-vs-wf_vblank.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-adlp-2/igt@kms_flip@basic-fli=
p-vs-wf_vblank.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +2 other tests dmesg-warn=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-3/igt@kms_fro=
ntbuffer_tracking@fbc-1p-pri-indfb-multidraw.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-adlp-9/i=
gt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html">ABORT</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#=
3970</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155352v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fb=
cdrrs-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155352v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fb=
cpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155352v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcp=
sr-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155352v1/shard-dg2-434/igt@kms_plane_cursor@overlay@pi=
pe-a-hdmi-a-6-size-64.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-dg2-432/igt@kms_pl=
ane_lowres@tiling-x.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155352v1/shard-dg2-434/igt@kms_plane_lowres@tiling=
-x.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/5681">Intel XE#5681</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-8/igt@kms_pm_=
rpm@basic-pci-d3-state.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-155352v1/shard-adlp-1/igt@kms_pm_rpm@basic-pci-=
d3-state.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/5545">Intel XE#5545</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-hang@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-9/igt@kms_vbl=
ank@query-forked-hang@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-adlp-4/igt@kms_vb=
lank@query-forked-hang@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel =
XE#4173</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@reset-with-attention:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155352v1/shard-bmg-4/igt@xe_eudebug_online@reset-with-=
attention.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-dg2-436/igt@xe_exe=
c_basic@multigpu-no-exec-null-defer-bind.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-dg2-432/igt@xe=
_exec_basic@multigpu-no-exec-null-defer-bind.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +=
4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-execqueues-preempt-fence-early:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-9/igt@xe_exec=
_compute_mode@many-execqueues-preempt-fence-early.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-adlp-=
6/igt@xe_exec_compute_mode@many-execqueues-preempt-fence-early.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625">In=
tel XE#5625</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-userptr-invalidate-race:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-6/igt@xe_exec=
_compute_mode@many-userptr-invalidate-race.html">PASS</a> -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-adlp-1/igt@x=
e_exec_compute_mode@many-userptr-invalidate-race.html">ABORT</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5790">Intel XE#5790=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-invalid-userptr-fault:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155352v1/shard-dg2-464/igt@xe_exec_fault_mode@many-inv=
alid-userptr-fault.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/288">Intel XE#288</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-file-mlock-nomem=
set:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155352v1/shard-dg2-464/igt@xe_exec_system_allocator@ma=
ny-large-execqueues-mmap-file-mlock-nomemset.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +=
9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-new:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-bmg-7/igt@xe_exec_=
system_allocator@threads-many-large-execqueues-new.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-bmg-=
2/igt@xe_exec_system_allocator@threads-many-large-execqueues-new.html">ABOR=
T</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970"=
>Intel XE#3970</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-fd-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-bmg-7/igt@xe_exec_=
threads@threads-bal-mixed-fd-rebind.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-bmg-3/igt@xe_exec_t=
hreads@threads-bal-mixed-fd-rebind.html">DMESG-FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>) +3 ot=
her tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-dg2-463/igt@xe_exe=
c_threads@threads-bal-userptr-invalidate.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-dg2-464/igt@xe=
_exec_threads@threads-bal-userptr-invalidate.html">DMESG-FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-fd-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-8/igt@xe_exec=
_threads@threads-mixed-fd-userptr-invalidate.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-adlp-1/i=
gt@xe_exec_threads@threads-mixed-fd-userptr-invalidate.html">DMESG-FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Inte=
l XE#3876</a>) +9 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-2/igt@xe_faul=
t_injection@inject-fault-probe-function-xe_guc_ads_init.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard=
-adlp-8/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.=
html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/5530">Intel XE#5530</a>) +5 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-unbind-all:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-2/igt@xe_pm@s=
2idle-vm-bind-unbind-all.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-adlp-8/igt@xe_pm@s2idle-vm-bin=
d-unbind-all.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4504">Intel XE#4504</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-rpm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155352v1/shard-dg2-464/igt@xe_pxp@pxp-stale-bo-bind-po=
st-rpm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel=
 XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4345">Intel XE#4345</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-155352v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tile=
d-dg2-rc-ccs-cc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6014">Intel X=
E#6014</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-155352v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@=
pipe-c-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html">DMESG-WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Int=
el XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3113">Intel XE#3113</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-155352v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-ti=
led-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-bmg-6/igt@kms_flip=
@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/s=
hard-bmg-7/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">=
PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-4/igt@kms_fli=
p@flip-vs-expired-vblank-interruptible@d-hdmi-a1.html">DMESG-WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4=
543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
55352v1/shard-adlp-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hd=
mi-a1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-3/igt@kms_fli=
p@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1553=
52v1/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a>=
 +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-once-null-rebind.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-dg2-434=
/igt@xe_exec_basic@multigpu-once-null-rebind.html">PASS</a> +2 other tests =
pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-8/igt@xe_exec=
_reset@parallel-gt-reset.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-adlp-6/i=
gt@xe_exec_reset@parallel-gt-reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-lnl-1/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-lnl-7/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-lnl-7/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-lnl-3=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-l=
nl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/sha=
rd-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434=
/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200=
f434/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f3=
1200f434/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f=
68f31200f434/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01=
997f68f31200f434/shard-lnl-8/igt@xe_module_load@load.html">SKIP</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9=
fb01997f68f31200f434/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c=
3bb9fb01997f68f31200f434/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77=
cd8c3bb9fb01997f68f31200f434/shard-lnl-5/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66=
ed77cd8c3bb9fb01997f68f31200f434/shard-lnl-5/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5=
ad66ed77cd8c3bb9fb01997f68f31200f434/shard-lnl-2/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-=
0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-lnl-2/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3=
859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-lnl-3/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-lnl-2/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-lnl-3/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-lnl-8/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-lnl-7/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-lnl-=
5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-=
lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/sh=
ard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f43=
4/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; (<a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-lnl=
-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-155352v1/shard-lnl-5/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155=
352v1/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-lnl-7/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-155352v1/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-lnl=
-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-155352v1/shard-lnl-8/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155=
352v1/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-lnl-7/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-155352v1/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-lnl=
-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-155352v1/shard-lnl-4/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155=
352v1/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-lnl-3/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-155352v1/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-lnl=
-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-155352v1/shard-lnl-2/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155=
352v1/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-lnl-1/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-155352v1/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-lnl=
-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-155352v1/shard-lnl-1/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155=
352v1/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-lnl-1/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-155352v1/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>)</l=
i>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-bmg-3/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-bmg-3/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-bmg-2/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-bmg-7=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-b=
mg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/sha=
rd-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434=
/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200=
f434/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f3=
1200f434/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f=
68f31200f434/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01=
997f68f31200f434/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9=
fb01997f68f31200f434/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c=
3bb9fb01997f68f31200f434/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77=
cd8c3bb9fb01997f68f31200f434/shard-bmg-5/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66=
ed77cd8c3bb9fb01997f68f31200f434/shard-bmg-6/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5=
ad66ed77cd8c3bb9fb01997f68f31200f434/shard-bmg-1/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-=
0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-bmg-7/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3=
859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-bmg-2/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-bmg-3/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-bmg-2/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-bmg-5/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-bmg-6/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-bmg-=
6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-=
bmg-6/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/sh=
ard-bmg-5/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a>) -&gt; (<a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-bmg-7=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155352v1/shard-bmg-3/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15535=
2v1/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-bmg-5/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-155352v1/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-bmg-7=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155352v1/shard-bmg-4/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15535=
2v1/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-bmg-8/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-155352v1/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-bmg-8=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155352v1/shard-bmg-6/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15535=
2v1/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-bmg-3/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-155352v1/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-bmg-5=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155352v1/shard-bmg-2/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15535=
2v1/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-bmg-4/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-155352v1/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-bmg-3=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155352v1/shard-bmg-1/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15535=
2v1/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-bmg-1/igt@xe_module_=
load@load.html">PASS</a>)</li>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-3/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-2/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-2/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-ad=
lp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/sha=
rd-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f43=
4/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f312=
00f434/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f6=
8f31200f434/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01=
997f68f31200f434/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb=
9fb01997f68f31200f434/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd=
8c3bb9fb01997f68f31200f434/shard-adlp-3/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66e=
d77cd8c3bb9fb01997f68f31200f434/shard-adlp-6/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5=
ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-1/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859=
-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-8/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-8/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-3/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-6/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-6/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-ad=
lp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/sha=
rd-adlp-8/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f43=
4/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f312=
00f434/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f6=
8f31200f434/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01=
997f68f31200f434/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb=
9fb01997f68f31200f434/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd=
8c3bb9fb01997f68f31200f434/shard-adlp-9/igt@xe_module_load@load.html">PASS<=
/a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">I=
ntel XE#378</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/5612">Intel XE#5612</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-155352v1/shard-adlp-9/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v=
1/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-adlp-8/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-155352v1/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-adlp=
-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-155352v1/shard-adlp-1/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
5352v1/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-adlp-9/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-155352v1/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard=
-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-adlp-9/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-155352v1/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-adlp-6/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-155352v1/shard-adlp-8/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/=
shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-adlp-8/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-155352v1/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-adlp-2=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155352v1/shard-adlp-3/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1553=
52v1/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-adlp-1/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-155352v1/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-a=
dlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-adlp-3/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-155352v1/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-2/igt@kms_big=
_fb@x-tiled-8bpp-rotate-0.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-adlp-3/i=
gt@kms_big_fb@x-tiled-8bpp-rotate-0.html">DMESG-WARN</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-bmg-6/igt@kms_cont=
ent_protection@atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-bmg-1/igt@kms_conte=
nt_protection@atomic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-8/igt@kms_fli=
p@flip-vs-rmfb.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4543">Intel XE#4543</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/5208">Intel XE#5208</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-adlp-6=
/igt@kms_flip@flip-vs-rmfb.html">DMESG-WARN</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/5208">Intel XE#5208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1553=
52v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1553=
52v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2311">Intel XE#2311</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/shard-adlp-4/igt@xe_pm@d=
3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/shard-adlp-1/igt@x=
e_pm@d3cold-basic-exec.html">ABORT</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/5545">Intel XE#5545</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434 -&gt; xe-pw-155=
352v1</li>
</ul>
<p>IGT_8572: 8572<br />
  xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434: 0aa5ad66ed77cd8c3bb9fb0=
1997f68f31200f434<br />
  xe-pw-155352v1: 155352v1</p>

</body>
</html>

--===============7021425282183219826==--
