Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31AE3C87FD3
	for <intel-xe@archiver.kernel.org>; Wed,  6 Aug 2025 14:20:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E849710E787;
	Wed,  6 Aug 2025 14:20:35 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BE8E10E786;
 Wed,  6 Aug 2025 14:20:35 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2558523308337649968=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe=3A_remove_GuC_reloa?=
 =?utf-8?q?d_in_D3Hot_path_=28rev11=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 06 Aug 2025 14:20:35 -0000
Message-ID: <175449003536.216502.18391945844656682463@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250806120314.738154-1-raag.jadav@intel.com>
In-Reply-To: <20250806120314.738154-1-raag.jadav@intel.com>
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

--===============2558523308337649968==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: remove GuC reload in D3Hot path (rev11)
URL   : https://patchwork.freedesktop.org/series/135265/
State : failure

== Summary ==

CI Bug Log - changes from xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c_FULL -> xe-pw-135265v11_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-135265v11_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-135265v11_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-135265v11_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][1] +3 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-dg2-463/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-dg2-set2:     [PASS][2] -> [DMESG-WARN][3] +52 other tests dmesg-warn
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-dg2-432/igt@kms_flip@2x-dpms-vs-vblank-race.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-dg2-434/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-dg2-set2:     [PASS][4] -> [FAIL][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-dg2-432/igt@kms_pm_rpm@system-suspend-modeset.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-dg2-434/igt@kms_pm_rpm@system-suspend-modeset.html
    - shard-lnl:          [PASS][6] -> [FAIL][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-lnl-2/igt@kms_pm_rpm@system-suspend-modeset.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-lnl-7/igt@kms_pm_rpm@system-suspend-modeset.html
    - shard-bmg:          [PASS][8] -> [FAIL][9]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-8/igt@kms_pm_rpm@system-suspend-modeset.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-2/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_properties@connector-properties-legacy:
    - shard-bmg:          [PASS][10] -> [DMESG-WARN][11] +3 other tests dmesg-warn
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-1/igt@kms_properties@connector-properties-legacy.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-4/igt@kms_properties@connector-properties-legacy.html

  * igt@kms_properties@connector-properties-legacy@pipe-a-edp-1:
    - shard-lnl:          [PASS][12] -> [DMESG-WARN][13] +8 other tests dmesg-warn
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-lnl-2/igt@kms_properties@connector-properties-legacy@pipe-a-edp-1.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-lnl-3/igt@kms_properties@connector-properties-legacy@pipe-a-edp-1.html

  * igt@xe_exec_balancer@many-execqueues-cm-parallel-basic:
    - shard-adlp:         [PASS][14] -> [DMESG-FAIL][15] +2 other tests dmesg-fail
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-adlp-1/igt@xe_exec_balancer@many-execqueues-cm-parallel-basic.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-adlp-9/igt@xe_exec_balancer@many-execqueues-cm-parallel-basic.html
    - shard-dg2-set2:     [PASS][16] -> [DMESG-FAIL][17] +1 other test dmesg-fail
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-dg2-466/igt@xe_exec_balancer@many-execqueues-cm-parallel-basic.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-dg2-464/igt@xe_exec_balancer@many-execqueues-cm-parallel-basic.html

  * igt@xe_exec_compute_mode@many-basic:
    - shard-adlp:         [PASS][18] -> [TIMEOUT][19]
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-adlp-9/igt@xe_exec_compute_mode@many-basic.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-adlp-3/igt@xe_exec_compute_mode@many-basic.html

  * igt@xe_exec_system_allocator@many-mmap-shared-remap:
    - shard-lnl:          [PASS][20] -> [DMESG-FAIL][21]
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-lnl-4/igt@xe_exec_system_allocator@many-mmap-shared-remap.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-lnl-2/igt@xe_exec_system_allocator@many-mmap-shared-remap.html

  * igt@xe_exec_system_allocator@process-many-stride-mmap-remap-ro-eocheck:
    - shard-bmg:          [PASS][22] -> [DMESG-FAIL][23] +2 other tests dmesg-fail
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-5/igt@xe_exec_system_allocator@process-many-stride-mmap-remap-ro-eocheck.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-7/igt@xe_exec_system_allocator@process-many-stride-mmap-remap-ro-eocheck.html

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap:
    - shard-bmg:          [PASS][24] -> [TIMEOUT][25] +9 other tests timeout
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-6/igt@xe_exec_system_allocator@threads-many-execqueues-mmap.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-execqueues-mmap.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-remap-dontunmap-eocheck:
    - shard-lnl:          [PASS][26] -> [TIMEOUT][27] +2 other tests timeout
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-lnl-3/igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-remap-dontunmap-eocheck.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-lnl-2/igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-remap-dontunmap-eocheck.html

  * igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate-race:
    - shard-lnl:          [PASS][28] -> [INCOMPLETE][29]
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-lnl-2/igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate-race.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-lnl-4/igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-bal-rebind:
    - shard-adlp:         [PASS][30] -> [DMESG-WARN][31] +40 other tests dmesg-warn
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-adlp-4/igt@xe_exec_threads@threads-bal-rebind.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-adlp-8/igt@xe_exec_threads@threads-bal-rebind.html

  * igt@xe_exec_threads@threads-mixed-shared-vm-userptr-rebind:
    - shard-adlp:         [PASS][32] -> [INCOMPLETE][33] +1 other test incomplete
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-adlp-6/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-rebind.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-adlp-4/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-rebind.html
    - shard-dg2-set2:     [PASS][34] -> [INCOMPLETE][35]
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-dg2-432/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-rebind.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-dg2-432/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-rebind.html

  * igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_create:
    - shard-dg2-set2:     [PASS][36] -> [ABORT][37] +6 other tests abort
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-dg2-432/igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_create.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-dg2-432/igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_create.html
    - shard-bmg:          [PASS][38] -> [ABORT][39] +1 other test abort
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-8/igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_create.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-1/igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_create.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_pcode_probe_early:
    - shard-lnl:          [PASS][40] -> [ABORT][41] +3 other tests abort
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-lnl-8/igt@xe_fault_injection@inject-fault-probe-function-xe_pcode_probe_early.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-lnl-5/igt@xe_fault_injection@inject-fault-probe-function-xe_pcode_probe_early.html

  * igt@xe_pm@d3hot-multiple-execs:
    - shard-dg2-set2:     [PASS][42] -> [TIMEOUT][43]
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-dg2-432/igt@xe_pm@d3hot-multiple-execs.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-dg2-432/igt@xe_pm@d3hot-multiple-execs.html

  * igt@xe_pmu@fn-engine-activity-load:
    - shard-adlp:         [PASS][44] -> [ABORT][45] +11 other tests abort
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-adlp-4/igt@xe_pmu@fn-engine-activity-load.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-adlp-2/igt@xe_pmu@fn-engine-activity-load.html

  * igt@xe_pmu@fn-engine-activity-sched-if-idle@engine-drm_xe_engine_class_video_decode1:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][46]
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-adlp-1/igt@xe_pmu@fn-engine-activity-sched-if-idle@engine-drm_xe_engine_class_video_decode1.html

  
#### Warnings ####

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-dg2-set2:     [SKIP][47] ([Intel XE#1392]) -> [DMESG-WARN][48] +2 other tests dmesg-warn
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-dg2-434/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     [FAIL][49] ([Intel XE#1173]) -> [DMESG-FAIL][50] +1 other test dmesg-fail
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-dg2-464/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-dg2-433/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_async_flips@async-flip-dpms@pipe-c-dp-4}:
    - shard-dg2-set2:     [PASS][51] -> [DMESG-WARN][52] +7 other tests dmesg-warn
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-dg2-434/igt@kms_async_flips@async-flip-dpms@pipe-c-dp-4.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-dg2-436/igt@kms_async_flips@async-flip-dpms@pipe-c-dp-4.html

  * {igt@kms_async_flips@async-flip-dpms@pipe-c-hdmi-a-3}:
    - shard-bmg:          [PASS][53] -> [SKIP][54] +6 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-3/igt@kms_async_flips@async-flip-dpms@pipe-c-hdmi-a-3.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-2/igt@kms_async_flips@async-flip-dpms@pipe-c-hdmi-a-3.html

  * {igt@xe_configfs@engines-allowed}:
    - shard-adlp:         [PASS][55] -> [ABORT][56]
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-adlp-9/igt@xe_configfs@engines-allowed.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-adlp-3/igt@xe_configfs@engines-allowed.html
    - shard-bmg:          [PASS][57] -> [ABORT][58]
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-3/igt@xe_configfs@engines-allowed.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-4/igt@xe_configfs@engines-allowed.html
    - shard-dg2-set2:     [PASS][59] -> [ABORT][60]
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-dg2-466/igt@xe_configfs@engines-allowed.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-dg2-436/igt@xe_configfs@engines-allowed.html

  * {igt@xe_pmu@engine-activity-after-load-start}:
    - shard-adlp:         [PASS][61] -> [DMESG-WARN][62] +2 other tests dmesg-warn
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-adlp-9/igt@xe_pmu@engine-activity-after-load-start.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-adlp-3/igt@xe_pmu@engine-activity-after-load-start.html

  
Known issues
------------

  Here are the changes found in xe-pw-135265v11_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing:
    - shard-adlp:         [PASS][63] -> [DMESG-WARN][64] ([Intel XE#2953] / [Intel XE#4173]) +1 other test dmesg-warn
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-adlp-6/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-adlp-4/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#316]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-dg2-463/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#1124])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [PASS][67] -> [SKIP][68] ([Intel XE#2314] / [Intel XE#2894])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][69] ([Intel XE#2191])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-dg2-463/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#455] / [Intel XE#787]) +7 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#787]) +41 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [PASS][72] -> [INCOMPLETE][73] ([Intel XE#3862]) +1 other test incomplete
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [PASS][74] -> [INCOMPLETE][75] ([Intel XE#3862]) +1 other test incomplete
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][76] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) +1 other test incomplete
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#306])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-dg2-463/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-dg2-set2:     NOTRUN -> [SKIP][78] ([Intel XE#373]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-dg2-463/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][79] -> [SKIP][80] ([Intel XE#2291]) +3 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-bmg:          [PASS][81] -> [SKIP][82] ([Intel XE#4354])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-2/igt@kms_dp_link_training@non-uhbr-sst.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-6/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#4422])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-dg2-463/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-bmg:          [PASS][84] -> [DMESG-WARN][85] ([Intel XE#5208] / [Intel XE#5320])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-8/igt@kms_flip@2x-dpms-vs-vblank-race.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-2/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@2x-plain-flip:
    - shard-bmg:          [PASS][86] -> [SKIP][87] ([Intel XE#2316]) +4 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-2/igt@kms_flip@2x-plain-flip.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-6/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@basic-plain-flip@b-hdmi-a1:
    - shard-adlp:         [PASS][88] -> [DMESG-WARN][89] ([Intel XE#4543])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-adlp-2/igt@kms_flip@basic-plain-flip@b-hdmi-a1.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-adlp-4/igt@kms_flip@basic-plain-flip@b-hdmi-a1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [PASS][90] -> [FAIL][91] ([Intel XE#301] / [Intel XE#3149]) +1 other test fail
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [PASS][92] -> [INCOMPLETE][93] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][94] ([Intel XE#455]) +2 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
    - shard-adlp:         [PASS][95] -> [DMESG-FAIL][96] ([Intel XE#4543]) +1 other test dmesg-fail
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#651]) +4 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-msflip-blt:
    - shard-lnl:          [PASS][98] -> [DMESG-WARN][99] ([Intel XE#5320]) +169 other tests dmesg-warn
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-msflip-blt.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-lnl-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][100] ([Intel XE#653]) +4 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-bmg:          [PASS][101] -> [SKIP][102] ([Intel XE#3012])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-2/igt@kms_joiner@basic-force-big-joiner.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-bmg:          [PASS][103] -> [SKIP][104] ([Intel XE#4596])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-x.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_plane_multiple@tiling-4:
    - shard-bmg:          [PASS][105] -> [DMESG-WARN][106] ([Intel XE#5175] / [Intel XE#5320])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-4/igt@kms_plane_multiple@tiling-4.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-3/igt@kms_plane_multiple@tiling-4.html

  * igt@kms_properties@crtc-properties-legacy@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][107] ([Intel XE#5320]) +2 other tests dmesg-warn
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-5/igt@kms_properties@crtc-properties-legacy@pipe-a-dp-2.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][108] ([Intel XE#1489])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-dg2-463/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr@psr2-basic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][109] ([Intel XE#2850] / [Intel XE#929])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-dg2-463/igt@kms_psr@psr2-basic.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [PASS][110] -> [FAIL][111] ([Intel XE#2883])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-lnl-4/igt@kms_setmode@basic@pipe-b-edp-1.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-lnl-2/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-bmg:          [PASS][112] -> [SKIP][113] ([Intel XE#1435])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-5/igt@kms_setmode@invalid-clone-single-crtc.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_vblank@query-forked-busy:
    - shard-bmg:          [PASS][114] -> [INCOMPLETE][115] ([Intel XE#4488]) +1 other test incomplete
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-8/igt@kms_vblank@query-forked-busy.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-3/igt@kms_vblank@query-forked-busy.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-dg2-set2:     [PASS][116] -> [INCOMPLETE][117] ([Intel XE#4488]) +1 other test incomplete
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-dg2-435/igt@kms_vblank@ts-continuation-suspend.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-dg2-466/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][118] -> [FAIL][119] ([Intel XE#4459]) +1 other test fail
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@xe_exec_balancer@many-parallel-userptr-invalidate:
    - shard-bmg:          [PASS][120] -> [DMESG-WARN][121] ([Intel XE#5320]) +23 other tests dmesg-warn
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-8/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-1/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html

  * igt@xe_exec_basic@many-execqueues-null:
    - shard-adlp:         [PASS][122] -> [DMESG-WARN][123] ([Intel XE#3876]) +1 other test dmesg-warn
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-adlp-9/igt@xe_exec_basic@many-execqueues-null.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-adlp-3/igt@xe_exec_basic@many-execqueues-null.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:
    - shard-dg2-set2:     [PASS][124] -> [DMESG-FAIL][125] ([Intel XE#3876]) +2 other tests dmesg-fail
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-dg2-463/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-dg2-464/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-race-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][126] ([Intel XE#288])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-dg2-463/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-race-imm.html

  * igt@xe_exec_fault_mode@once-invalid-fault:
    - shard-lnl:          [PASS][127] -> [DMESG-FAIL][128] ([Intel XE#5320]) +27 other tests dmesg-fail
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-lnl-2/igt@xe_exec_fault_mode@once-invalid-fault.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-lnl-4/igt@xe_exec_fault_mode@once-invalid-fault.html

  * igt@xe_exec_system_allocator@many-execqueues-new-race-nomemset:
    - shard-lnl:          [PASS][129] -> [ABORT][130] ([Intel XE#5320]) +2 other tests abort
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-lnl-5/igt@xe_exec_system_allocator@many-execqueues-new-race-nomemset.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-lnl-1/igt@xe_exec_system_allocator@many-execqueues-new-race-nomemset.html

  * igt@xe_exec_system_allocator@many-free:
    - shard-bmg:          [PASS][131] -> [ABORT][132] ([Intel XE#5320])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-7/igt@xe_exec_system_allocator@many-free.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-6/igt@xe_exec_system_allocator@many-free.html

  * igt@xe_exec_system_allocator@many-stride-mmap-new-race-nomemset:
    - shard-lnl:          [PASS][133] -> [INCOMPLETE][134] ([Intel XE#5320])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-lnl-2/igt@xe_exec_system_allocator@many-stride-mmap-new-race-nomemset.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-lnl-3/igt@xe_exec_system_allocator@many-stride-mmap-new-race-nomemset.html

  * igt@xe_exec_system_allocator@process-many-new-nomemset:
    - shard-bmg:          [PASS][135] -> [DMESG-FAIL][136] ([Intel XE#5320]) +24 other tests dmesg-fail
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-3/igt@xe_exec_system_allocator@process-many-new-nomemset.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-2/igt@xe_exec_system_allocator@process-many-new-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-busy-nomemset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][137] ([Intel XE#4915]) +31 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-dg2-463/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-busy-nomemset.html

  * igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate-race:
    - shard-bmg:          [PASS][138] -> [INCOMPLETE][139] ([Intel XE#4842])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-6/igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate-race.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-2/igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-hang-fd-basic:
    - shard-adlp:         [PASS][140] -> [DMESG-WARN][141] ([Intel XE#5213])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-adlp-4/igt@xe_exec_threads@threads-hang-fd-basic.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-adlp-1/igt@xe_exec_threads@threads-hang-fd-basic.html
    - shard-bmg:          [PASS][142] -> [DMESG-WARN][143] ([Intel XE#5213])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-5/igt@xe_exec_threads@threads-hang-fd-basic.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-6/igt@xe_exec_threads@threads-hang-fd-basic.html
    - shard-dg2-set2:     [PASS][144] -> [DMESG-WARN][145] ([Intel XE#5213])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-dg2-463/igt@xe_exec_threads@threads-hang-fd-basic.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-dg2-464/igt@xe_exec_threads@threads-hang-fd-basic.html
    - shard-lnl:          [PASS][146] -> [DMESG-WARN][147] ([Intel XE#5213])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-lnl-1/igt@xe_exec_threads@threads-hang-fd-basic.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-lnl-3/igt@xe_exec_threads@threads-hang-fd-basic.html

  * igt@xe_exec_threads@threads-hang-shared-vm-userptr:
    - shard-adlp:         [PASS][148] -> [DMESG-FAIL][149] ([Intel XE#3876])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-adlp-4/igt@xe_exec_threads@threads-hang-shared-vm-userptr.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-adlp-8/igt@xe_exec_threads@threads-hang-shared-vm-userptr.html

  * igt@xe_module_load@reload-no-display:
    - shard-bmg:          [PASS][150] -> [ABORT][151] ([Intel XE#5087])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-7/igt@xe_module_load@reload-no-display.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-7/igt@xe_module_load@reload-no-display.html
    - shard-dg2-set2:     [PASS][152] -> [ABORT][153] ([Intel XE#5087]) +1 other test abort
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-dg2-432/igt@xe_module_load@reload-no-display.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-dg2-432/igt@xe_module_load@reload-no-display.html
    - shard-lnl:          [PASS][154] -> [ABORT][155] ([Intel XE#5087])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-lnl-3/igt@xe_module_load@reload-no-display.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-lnl-2/igt@xe_module_load@reload-no-display.html

  * igt@xe_oa@mmio-triggered-reports:
    - shard-dg2-set2:     NOTRUN -> [SKIP][156] ([Intel XE#3573]) +1 other test skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-dg2-463/igt@xe_oa@mmio-triggered-reports.html

  * igt@xe_pat@pat-index-xe2:
    - shard-bmg:          [PASS][157] -> [FAIL][158] ([Intel XE#5507]) +1 other test fail
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-4/igt@xe_pat@pat-index-xe2.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-8/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pm@d3cold-i2c:
    - shard-dg2-set2:     NOTRUN -> [SKIP][159] ([Intel XE#5694])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-dg2-463/igt@xe_pm@d3cold-i2c.html

  * igt@xe_pm@s2idle-vm-bind-unbind-all:
    - shard-bmg:          [PASS][160] -> [DMESG-WARN][161] ([Intel XE#4504] / [Intel XE#5320])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-8/igt@xe_pm@s2idle-vm-bind-unbind-all.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-3/igt@xe_pm@s2idle-vm-bind-unbind-all.html
    - shard-dg2-set2:     [PASS][162] -> [DMESG-WARN][163] ([Intel XE#4504])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-dg2-464/igt@xe_pm@s2idle-vm-bind-unbind-all.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-dg2-433/igt@xe_pm@s2idle-vm-bind-unbind-all.html
    - shard-lnl:          [PASS][164] -> [DMESG-WARN][165] ([Intel XE#4504] / [Intel XE#5320])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-lnl-3/igt@xe_pm@s2idle-vm-bind-unbind-all.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-lnl-8/igt@xe_pm@s2idle-vm-bind-unbind-all.html

  * igt@xe_sysfs_timeslice_duration@timeslice_duration_us-timeout@vcs:
    - shard-bmg:          [PASS][166] -> [DMESG-WARN][167] ([Intel XE#5213] / [Intel XE#5320]) +1 other test dmesg-warn
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-4/igt@xe_sysfs_timeslice_duration@timeslice_duration_us-timeout@vcs.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-3/igt@xe_sysfs_timeslice_duration@timeslice_duration_us-timeout@vcs.html
    - shard-lnl:          [PASS][168] -> [DMESG-WARN][169] ([Intel XE#5213] / [Intel XE#5320]) +1 other test dmesg-warn
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-lnl-8/igt@xe_sysfs_timeslice_duration@timeslice_duration_us-timeout@vcs.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-lnl-8/igt@xe_sysfs_timeslice_duration@timeslice_duration_us-timeout@vcs.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-bmg:          [SKIP][170] ([Intel XE#2291]) -> [PASS][171]
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [FAIL][172] ([Intel XE#4633]) -> [PASS][173]
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-bmg:          [SKIP][174] ([Intel XE#2316]) -> [PASS][175]
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-6/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-3/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][176] ([Intel XE#4543]) -> [PASS][177] +8 other tests pass
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-adlp-6/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-adlp-4/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1.html

  * igt@kms_hdr@static-toggle:
    - shard-bmg:          [SKIP][178] ([Intel XE#1503]) -> [PASS][179] +1 other test pass
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-6/igt@kms_hdr@static-toggle.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-2/igt@kms_hdr@static-toggle.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-bmg:          [SKIP][180] ([Intel XE#2571]) -> [PASS][181]
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-3/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-bmg:          [DMESG-WARN][182] ([Intel XE#3876]) -> [PASS][183]
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-3/igt@xe_exec_reset@parallel-gt-reset.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-2/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-bo-map-nomemset:
    - shard-bmg:          [FAIL][184] ([Intel XE#4937]) -> [PASS][185]
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-bo-map-nomemset.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-8/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-bo-map-nomemset.html

  * igt@xe_pm@s2idle-multiple-execs:
    - shard-adlp:         [DMESG-WARN][186] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][187]
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-adlp-3/igt@xe_pm@s2idle-multiple-execs.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-adlp-1/igt@xe_pm@s2idle-multiple-execs.html

  
#### Warnings ####

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [FAIL][188] ([Intel XE#1178]) -> [SKIP][189] ([Intel XE#2341])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-5/igt@kms_content_protection@atomic.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-6/igt@kms_content_protection@atomic.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-bmg:          [SKIP][190] ([Intel XE#2291]) -> [DMESG-WARN][191] ([Intel XE#5320])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-5/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][192] ([Intel XE#2312]) -> [SKIP][193] ([Intel XE#2311]) +8 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][194] ([Intel XE#2312]) -> [SKIP][195] ([Intel XE#5390]) +2 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][196] ([Intel XE#5390]) -> [SKIP][197] ([Intel XE#2312]) +7 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][198] ([Intel XE#2311]) -> [SKIP][199] ([Intel XE#2312]) +10 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][200] ([Intel XE#2313]) -> [SKIP][201] ([Intel XE#2312]) +11 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:
    - shard-bmg:          [SKIP][202] ([Intel XE#2313]) -> [INCOMPLETE][203] ([Intel XE#2594])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][204] ([Intel XE#2312]) -> [SKIP][205] ([Intel XE#2313]) +9 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][206] ([Intel XE#1729]) -> [SKIP][207] ([Intel XE#2426])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][208] ([Intel XE#2426]) -> [SKIP][209] ([Intel XE#2509])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-adlp:         [ABORT][210] ([Intel XE#4917] / [Intel XE#5530]) -> [ABORT][211] ([Intel XE#5530])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-adlp-1/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-adlp-9/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
  [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4488
  [Intel XE#4504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4504
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4633]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633
  [Intel XE#4842]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4842
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917
  [Intel XE#4937]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4937
  [Intel XE#5087]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5087
  [Intel XE#5175]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5175
  [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
  [Intel XE#5213]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5213
  [Intel XE#5320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5320
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5507]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5507
  [Intel XE#5530]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530
  [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929


Build changes
-------------

  * Linux: xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c -> xe-pw-135265v11

  IGT_8487: 8487
  xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c: 7b7457e249a1f7db97122bc6b9384e5e2f45475c
  xe-pw-135265v11: 135265v11

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/index.html

--===============2558523308337649968==
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
<tr><td><b>Series:</b></td><td>drm/xe: remove GuC reload in D3Hot path (rev11)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135265/">https://patchwork.freedesktop.org/series/135265/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c_FULL -&gt; xe-pw-135265v11_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-135265v11_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-135265v11_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-135265v11_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-dg2-463/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">DMESG-WARN</a> +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-dg2-432/igt@kms_flip@2x-dpms-vs-vblank-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-dg2-434/igt@kms_flip@2x-dpms-vs-vblank-race.html">DMESG-WARN</a> +52 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-dg2-432/igt@kms_pm_rpm@system-suspend-modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-dg2-434/igt@kms_pm_rpm@system-suspend-modeset.html">FAIL</a></li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-lnl-2/igt@kms_pm_rpm@system-suspend-modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-lnl-7/igt@kms_pm_rpm@system-suspend-modeset.html">FAIL</a></li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-8/igt@kms_pm_rpm@system-suspend-modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-2/igt@kms_pm_rpm@system-suspend-modeset.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-1/igt@kms_properties@connector-properties-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-4/igt@kms_properties@connector-properties-legacy.html">DMESG-WARN</a> +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-legacy@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-lnl-2/igt@kms_properties@connector-properties-legacy@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-lnl-3/igt@kms_properties@connector-properties-legacy@pipe-a-edp-1.html">DMESG-WARN</a> +8 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-cm-parallel-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-adlp-1/igt@xe_exec_balancer@many-execqueues-cm-parallel-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-adlp-9/igt@xe_exec_balancer@many-execqueues-cm-parallel-basic.html">DMESG-FAIL</a> +2 other tests dmesg-fail</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-dg2-466/igt@xe_exec_balancer@many-execqueues-cm-parallel-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-dg2-464/igt@xe_exec_balancer@many-execqueues-cm-parallel-basic.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-adlp-9/igt@xe_exec_compute_mode@many-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-adlp-3/igt@xe_exec_compute_mode@many-basic.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-shared-remap:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-lnl-4/igt@xe_exec_system_allocator@many-mmap-shared-remap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-lnl-2/igt@xe_exec_system_allocator@many-mmap-shared-remap.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-remap-ro-eocheck:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-5/igt@xe_exec_system_allocator@process-many-stride-mmap-remap-ro-eocheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-7/igt@xe_exec_system_allocator@process-many-stride-mmap-remap-ro-eocheck.html">DMESG-FAIL</a> +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-6/igt@xe_exec_system_allocator@threads-many-execqueues-mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-execqueues-mmap.html">TIMEOUT</a> +9 other tests timeout</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-remap-dontunmap-eocheck:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-lnl-3/igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-remap-dontunmap-eocheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-lnl-2/igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-remap-dontunmap-eocheck.html">TIMEOUT</a> +2 other tests timeout</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-lnl-2/igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-lnl-4/igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate-race.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-rebind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-adlp-4/igt@xe_exec_threads@threads-bal-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-adlp-8/igt@xe_exec_threads@threads-bal-rebind.html">DMESG-WARN</a> +40 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-shared-vm-userptr-rebind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-adlp-6/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-adlp-4/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-rebind.html">INCOMPLETE</a> +1 other test incomplete</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-dg2-432/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-dg2-432/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-rebind.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_create:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-dg2-432/igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_create.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-dg2-432/igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_create.html">ABORT</a> +6 other tests abort</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-8/igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_create.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-1/igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_create.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_pcode_probe_early:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-lnl-8/igt@xe_fault_injection@inject-fault-probe-function-xe_pcode_probe_early.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-lnl-5/igt@xe_fault_injection@inject-fault-probe-function-xe_pcode_probe_early.html">ABORT</a> +3 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-dg2-432/igt@xe_pm@d3hot-multiple-execs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-dg2-432/igt@xe_pm@d3hot-multiple-execs.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-load:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-adlp-4/igt@xe_pmu@fn-engine-activity-load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-adlp-2/igt@xe_pmu@fn-engine-activity-load.html">ABORT</a> +11 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-sched-if-idle@engine-drm_xe_engine_class_video_decode1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-adlp-1/igt@xe_pmu@fn-engine-activity-sched-if-idle@engine-drm_xe_engine_class_video_decode1.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-dg2-434/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html">DMESG-WARN</a> +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-dg2-464/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-dg2-433/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@kms_async_flips@async-flip-dpms@pipe-c-dp-4}:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-dg2-434/igt@kms_async_flips@async-flip-dpms@pipe-c-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-dg2-436/igt@kms_async_flips@async-flip-dpms@pipe-c-dp-4.html">DMESG-WARN</a> +7 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@async-flip-dpms@pipe-c-hdmi-a-3}:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-3/igt@kms_async_flips@async-flip-dpms@pipe-c-hdmi-a-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-2/igt@kms_async_flips@async-flip-dpms@pipe-c-hdmi-a-3.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@xe_configfs@engines-allowed}:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-adlp-9/igt@xe_configfs@engines-allowed.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-adlp-3/igt@xe_configfs@engines-allowed.html">ABORT</a></li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-3/igt@xe_configfs@engines-allowed.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-4/igt@xe_configfs@engines-allowed.html">ABORT</a></li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-dg2-466/igt@xe_configfs@engines-allowed.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-dg2-436/igt@xe_configfs@engines-allowed.html">ABORT</a></li>
</ul>
</li>
<li>
<p>{igt@xe_pmu@engine-activity-after-load-start}:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-adlp-9/igt@xe_pmu@engine-activity-after-load-start.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-adlp-3/igt@xe_pmu@engine-activity-after-load-start.html">DMESG-WARN</a> +2 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-135265v11_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-adlp-6/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-adlp-4/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-dg2-463/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-dg2-463/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +41 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-dg2-463/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-dg2-463/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-2/igt@kms_dp_link_training@non-uhbr-sst.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-6/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-dg2-463/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-8/igt@kms_flip@2x-dpms-vs-vblank-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-2/igt@kms_flip@2x-dpms-vs-vblank-race.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208">Intel XE#5208</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5320">Intel XE#5320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-2/igt@kms_flip@2x-plain-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-6/igt@kms_flip@2x-plain-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-adlp-2/igt@kms_flip@basic-plain-flip@b-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-adlp-4/igt@kms_flip@basic-plain-flip@b-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-msflip-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-lnl-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-msflip-blt.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5320">Intel XE#5320</a>) +169 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-2/igt@kms_joiner@basic-force-big-joiner.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-4:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-4/igt@kms_plane_multiple@tiling-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-3/igt@kms_plane_multiple@tiling-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5175">Intel XE#5175</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5320">Intel XE#5320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_properties@crtc-properties-legacy@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-5/igt@kms_properties@crtc-properties-legacy@pipe-a-dp-2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5320">Intel XE#5320</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-dg2-463/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-dg2-463/igt@kms_psr@psr2-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-lnl-4/igt@kms_setmode@basic@pipe-b-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-lnl-2/igt@kms_setmode@basic@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-5/igt@kms_setmode@invalid-clone-single-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-busy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-8/igt@kms_vblank@query-forked-busy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-3/igt@kms_vblank@query-forked-busy.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4488">Intel XE#4488</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-dg2-435/igt@kms_vblank@ts-continuation-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-dg2-466/igt@kms_vblank@ts-continuation-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4488">Intel XE#4488</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459">Intel XE#4459</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-parallel-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-8/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-1/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5320">Intel XE#5320</a>) +23 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-null:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-adlp-9/igt@xe_exec_basic@many-execqueues-null.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-adlp-3/igt@xe_exec_basic@many-execqueues-null.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-dg2-463/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-dg2-464/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-dg2-463/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-race-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-invalid-fault:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-lnl-2/igt@xe_exec_fault_mode@once-invalid-fault.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-lnl-4/igt@xe_exec_fault_mode@once-invalid-fault.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5320">Intel XE#5320</a>) +27 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-new-race-nomemset:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-lnl-5/igt@xe_exec_system_allocator@many-execqueues-new-race-nomemset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-lnl-1/igt@xe_exec_system_allocator@many-execqueues-new-race-nomemset.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5320">Intel XE#5320</a>) +2 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-free:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-7/igt@xe_exec_system_allocator@many-free.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-6/igt@xe_exec_system_allocator@many-free.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5320">Intel XE#5320</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-new-race-nomemset:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-lnl-2/igt@xe_exec_system_allocator@many-stride-mmap-new-race-nomemset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-lnl-3/igt@xe_exec_system_allocator@many-stride-mmap-new-race-nomemset.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5320">Intel XE#5320</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-new-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-3/igt@xe_exec_system_allocator@process-many-new-nomemset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-2/igt@xe_exec_system_allocator@process-many-new-nomemset.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5320">Intel XE#5320</a>) +24 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-busy-nomemset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-dg2-463/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-busy-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-6/igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-2/igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate-race.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4842">Intel XE#4842</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-adlp-4/igt@xe_exec_threads@threads-hang-fd-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-adlp-1/igt@xe_exec_threads@threads-hang-fd-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5213">Intel XE#5213</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-5/igt@xe_exec_threads@threads-hang-fd-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-6/igt@xe_exec_threads@threads-hang-fd-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5213">Intel XE#5213</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-dg2-463/igt@xe_exec_threads@threads-hang-fd-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-dg2-464/igt@xe_exec_threads@threads-hang-fd-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5213">Intel XE#5213</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-lnl-1/igt@xe_exec_threads@threads-hang-fd-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-lnl-3/igt@xe_exec_threads@threads-hang-fd-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5213">Intel XE#5213</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-shared-vm-userptr:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-adlp-4/igt@xe_exec_threads@threads-hang-shared-vm-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-adlp-8/igt@xe_exec_threads@threads-hang-shared-vm-userptr.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-7/igt@xe_module_load@reload-no-display.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-7/igt@xe_module_load@reload-no-display.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5087">Intel XE#5087</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-dg2-432/igt@xe_module_load@reload-no-display.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-dg2-432/igt@xe_module_load@reload-no-display.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5087">Intel XE#5087</a>) +1 other test abort</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-lnl-3/igt@xe_module_load@reload-no-display.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-lnl-2/igt@xe_module_load@reload-no-display.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5087">Intel XE#5087</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-dg2-463/igt@xe_oa@mmio-triggered-reports.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-4/igt@xe_pat@pat-index-xe2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-8/igt@xe_pat@pat-index-xe2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5507">Intel XE#5507</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-i2c:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-dg2-463/igt@xe_pm@d3cold-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694">Intel XE#5694</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-unbind-all:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-8/igt@xe_pm@s2idle-vm-bind-unbind-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-3/igt@xe_pm@s2idle-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4504">Intel XE#4504</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5320">Intel XE#5320</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-dg2-464/igt@xe_pm@s2idle-vm-bind-unbind-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-dg2-433/igt@xe_pm@s2idle-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4504">Intel XE#4504</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-lnl-3/igt@xe_pm@s2idle-vm-bind-unbind-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-lnl-8/igt@xe_pm@s2idle-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4504">Intel XE#4504</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5320">Intel XE#5320</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_timeslice_duration@timeslice_duration_us-timeout@vcs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-4/igt@xe_sysfs_timeslice_duration@timeslice_duration_us-timeout@vcs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-3/igt@xe_sysfs_timeslice_duration@timeslice_duration_us-timeout@vcs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5213">Intel XE#5213</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5320">Intel XE#5320</a>) +1 other test dmesg-warn</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-lnl-8/igt@xe_sysfs_timeslice_duration@timeslice_duration_us-timeout@vcs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-lnl-8/igt@xe_sysfs_timeslice_duration@timeslice_duration_us-timeout@vcs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5213">Intel XE#5213</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5320">Intel XE#5320</a>) +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633">Intel XE#4633</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-6/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-3/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-adlp-6/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-adlp-4/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-6/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-2/igt@kms_hdr@static-toggle.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571">Intel XE#2571</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-3/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-3/igt@xe_exec_reset@parallel-gt-reset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-2/igt@xe_exec_reset@parallel-gt-reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-bo-map-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-bo-map-nomemset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4937">Intel XE#4937</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-8/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-bo-map-nomemset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-adlp-3/igt@xe_pm@s2idle-multiple-execs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-adlp-1/igt@xe_pm@s2idle-multiple-execs.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-5/igt@kms_content_protection@atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-6/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-5/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5320">Intel XE#5320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594">Intel XE#2594</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-adlp-1/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917">Intel XE#4917</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530">Intel XE#5530</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v11/shard-adlp-9/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530">Intel XE#5530</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c -&gt; xe-pw-135265v11</li>
</ul>
<p>IGT_8487: 8487<br />
  xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c: 7b7457e249a1f7db97122bc6b9384e5e2f45475c<br />
  xe-pw-135265v11: 135265v11</p>

</body>
</html>

--===============2558523308337649968==--
