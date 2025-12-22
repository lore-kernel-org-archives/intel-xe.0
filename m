Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAB35E674B5
	for <intel-xe@archiver.kernel.org>; Mon, 22 Dec 2025 15:50:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FC9810E388;
	Mon, 22 Dec 2025 15:50:24 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DBCD10E31D;
 Mon, 22 Dec 2025 15:50:24 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7433517887182715858=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFull=3A_success_for_nova-core=3A_Memory_manage?=
 =?utf-8?q?ment_initial_patches?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 22 Dec 2025 15:50:24 -0000
Message-ID: <176641862405.111296.14060189877955564882@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251219203805.1246586-1-joelagnelf@nvidia.com>
In-Reply-To: <20251219203805.1246586-1-joelagnelf@nvidia.com>
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

--===============7433517887182715858==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: nova-core: Memory management initial patches
URL   : https://patchwork.freedesktop.org/series/159316/
State : success

== Summary ==

CI Bug Log - changes from xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7_FULL -> xe-pw-159316v1_FULL
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

  Here are the changes found in xe-pw-159316v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unplug-rescan:
    - shard-bmg:          [PASS][1] -> [SKIP][2] ([Intel XE#6779])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-10/igt@core_hotunplug@unplug-rescan.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@core_hotunplug@unplug-rescan.html

  * igt@core_setmaster@master-drop-set-shared-fd:
    - shard-bmg:          [PASS][3] -> [SKIP][4] ([Intel XE#6914])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-10/igt@core_setmaster@master-drop-set-shared-fd.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@core_setmaster@master-drop-set-shared-fd.html

  * igt@fbdev@unaligned-read:
    - shard-bmg:          [PASS][5] -> [SKIP][6] ([Intel XE#2134]) +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-2/igt@fbdev@unaligned-read.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@fbdev@unaligned-read.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#6703]) +86 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_cursor_crc@cursor-alpha-opaque:
    - shard-bmg:          [PASS][8] -> [DMESG-FAIL][9] ([Intel XE#5545]) +1 other test dmesg-fail
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-1/igt@kms_cursor_crc@cursor-alpha-opaque.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-2/igt@kms_cursor_crc@cursor-alpha-opaque.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-bmg:          [PASS][10] -> [SKIP][11] ([Intel XE#2291])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-9/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          [PASS][12] -> [SKIP][13] ([Intel XE#2316]) +2 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-9/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [PASS][14] -> [FAIL][15] ([Intel XE#301]) +4 other tests fail
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2293])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2313])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [ABORT][18] ([Intel XE#6740])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-7/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-bmg:          [PASS][19] -> [ABORT][20] ([Intel XE#6740]) +3 other tests abort
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-3/igt@kms_hdr@invalid-metadata-sizes.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-9/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#6911])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-9/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#6693])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@kms_pm_rpm@basic-pci-d3-state.html

  * igt@kms_pm_rpm@modeset-stress-extra-wait:
    - shard-bmg:          [PASS][23] -> [SKIP][24] ([Intel XE#6693])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-2/igt@kms_pm_rpm@modeset-stress-extra-wait.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@kms_pm_rpm@modeset-stress-extra-wait.html

  * igt@kms_psr@psr2-sprite-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#1406] / [Intel XE#6703]) +3 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@kms_psr@psr2-sprite-plane-onoff.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          [PASS][26] -> [SKIP][27] ([Intel XE#1435])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-9/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [PASS][28] -> [INCOMPLETE][29] ([Intel XE#6321])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-9/igt@xe_evict@evict-mixed-many-threads-small.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-4/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_system_allocator@process-many-stride-mmap-new-huge:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#4943])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-9/igt@xe_exec_system_allocator@process-many-stride-mmap-new-huge.html

  * igt@xe_exec_system_allocator@threads-many-execqueues-new-nomemset:
    - shard-bmg:          [PASS][31] -> [SKIP][32] ([Intel XE#6557] / [Intel XE#6703]) +5 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-execqueues-new-nomemset.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-execqueues-new-nomemset.html

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-remap-madvise:
    - shard-bmg:          [PASS][33] -> [INCOMPLETE][34] ([Intel XE#6480])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-7/igt@xe_exec_system_allocator@threads-many-stride-mmap-remap-madvise.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-1/igt@xe_exec_system_allocator@threads-many-stride-mmap-remap-madvise.html

  * igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_copy0:
    - shard-lnl:          [PASS][35] -> [FAIL][36] ([Intel XE#6251])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-lnl-4/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_copy0.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-lnl-3/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_copy0.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#944])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-9/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:
    - shard-bmg:          [PASS][38] -> [SKIP][39] ([Intel XE#6703]) +359 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-2/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html

  * igt@xe_vm@large-split-binds-536870912:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#6557] / [Intel XE#6703])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@xe_vm@large-split-binds-536870912.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-bmg:          [SKIP][41] ([Intel XE#6779]) -> [PASS][42] +1 other test pass
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-5/igt@core_hotunplug@hotrebind-lateclose.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-10/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:
    - shard-bmg:          [SKIP][43] ([Intel XE#2291]) -> [PASS][44] +1 other test pass
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [FAIL][45] ([Intel XE#6715]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
    - shard-bmg:          [SKIP][47] ([Intel XE#2316]) -> [PASS][48] +2 other tests pass
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-bmg:          [SKIP][49] ([Intel XE#4596]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-none.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_pm_rpm@legacy-planes:
    - shard-bmg:          [SKIP][51] ([Intel XE#6693]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-5/igt@kms_pm_rpm@legacy-planes.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-3/igt@kms_pm_rpm@legacy-planes.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][53] ([Intel XE#6321]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-3/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-9/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_exec_balancer@many-execqueues-cm-virtual-rebind:
    - shard-bmg:          [SKIP][55] ([Intel XE#6557] / [Intel XE#6703]) -> [PASS][56] +1 other test pass
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-5/igt@xe_exec_balancer@many-execqueues-cm-virtual-rebind.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-3/igt@xe_exec_balancer@many-execqueues-cm-virtual-rebind.html

  * igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:
    - shard-bmg:          [SKIP][57] ([Intel XE#6703]) -> [PASS][58] +272 other tests pass
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html

  * igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0:
    - shard-lnl:          [FAIL][59] ([Intel XE#6251]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-lnl-4/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-lnl-3/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0.html

  
#### Warnings ####

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-bmg:          [SKIP][61] ([Intel XE#2370]) -> [SKIP][62] ([Intel XE#6703])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-10/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-bmg:          [SKIP][63] ([Intel XE#2327]) -> [SKIP][64] ([Intel XE#6703]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-4/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          [SKIP][65] ([Intel XE#1124]) -> [SKIP][66] ([Intel XE#6703]) +6 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-2/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - shard-bmg:          [SKIP][67] ([Intel XE#6703]) -> [SKIP][68] ([Intel XE#1124]) +6 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-5/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-7/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-bmg:          [SKIP][69] ([Intel XE#2314] / [Intel XE#2894]) -> [SKIP][70] ([Intel XE#6703]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-10/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [SKIP][71] ([Intel XE#6703]) -> [SKIP][72] ([Intel XE#367]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-5/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-10/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-bmg:          [SKIP][73] ([Intel XE#367]) -> [SKIP][74] ([Intel XE#6703])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-4/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-bmg:          [SKIP][75] ([Intel XE#2887]) -> [SKIP][76] ([Intel XE#6703]) +11 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-4/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][77] ([Intel XE#2652] / [Intel XE#787]) -> [SKIP][78] ([Intel XE#6703])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-10/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-ccs:
    - shard-bmg:          [SKIP][79] ([Intel XE#6703]) -> [SKIP][80] ([Intel XE#2887]) +7 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-5/igt@kms_ccs@bad-rotation-90-y-tiled-ccs.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-10/igt@kms_ccs@bad-rotation-90-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-bmg:          [SKIP][81] ([Intel XE#6703]) -> [SKIP][82] ([Intel XE#3432]) +1 other test skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-bmg:          [SKIP][83] ([Intel XE#2325]) -> [SKIP][84] ([Intel XE#6703]) +2 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-10/igt@kms_chamelium_color@ctm-max.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_hpd@dp-hpd-storm:
    - shard-bmg:          [SKIP][85] ([Intel XE#2252]) -> [SKIP][86] ([Intel XE#6703]) +4 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-2/igt@kms_chamelium_hpd@dp-hpd-storm.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@kms_chamelium_hpd@dp-hpd-storm.html

  * igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:
    - shard-bmg:          [SKIP][87] ([Intel XE#6703]) -> [SKIP][88] ([Intel XE#2252]) +4 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-5/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-3/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
    - shard-bmg:          [DMESG-FAIL][89] -> [FAIL][90] ([Intel XE#1178]) +1 other test fail
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-1/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-3/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-bmg:          [SKIP][91] ([Intel XE#6703]) -> [SKIP][92] ([Intel XE#2390])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-5/igt@kms_content_protection@dp-mst-lic-type-0.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-10/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@type1:
    - shard-bmg:          [SKIP][93] ([Intel XE#2341]) -> [SKIP][94] ([Intel XE#6703])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-4/igt@kms_content_protection@type1.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-bmg:          [SKIP][95] ([Intel XE#2320]) -> [SKIP][96] ([Intel XE#6703]) +2 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-4/igt@kms_cursor_crc@cursor-offscreen-32x32.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-random-64x21:
    - shard-bmg:          [SKIP][97] ([Intel XE#6703]) -> [SKIP][98] ([Intel XE#2320])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-5/igt@kms_cursor_crc@cursor-random-64x21.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-10/igt@kms_cursor_crc@cursor-random-64x21.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-bmg:          [SKIP][99] ([Intel XE#6703]) -> [SKIP][100] ([Intel XE#2321]) +1 other test skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-10/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-bmg:          [SKIP][101] ([Intel XE#2291]) -> [SKIP][102] ([Intel XE#6703])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-bmg:          [SKIP][103] ([Intel XE#2244]) -> [SKIP][104] ([Intel XE#6703])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-4/igt@kms_dsc@dsc-with-bpc-formats.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-bmg:          [SKIP][105] ([Intel XE#4156]) -> [SKIP][106] ([Intel XE#6703])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-2/igt@kms_fbcon_fbt@fbc.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-bmg:          [SKIP][107] ([Intel XE#6703]) -> [SKIP][108] ([Intel XE#2375])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-5/igt@kms_feature_discovery@dp-mst.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-3/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
    - shard-bmg:          [SKIP][109] ([Intel XE#2316]) -> [SKIP][110] ([Intel XE#6703]) +1 other test skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-4/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-bmg:          [SKIP][111] ([Intel XE#6703]) -> [SKIP][112] ([Intel XE#2293] / [Intel XE#2380])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:
    - shard-bmg:          [SKIP][113] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][114] ([Intel XE#6703]) +3 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][115] ([Intel XE#2311]) -> [SKIP][116] ([Intel XE#6703]) +13 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][117] ([Intel XE#2312]) -> [SKIP][118] ([Intel XE#6703]) +9 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][119] ([Intel XE#4141]) -> [SKIP][120] ([Intel XE#6703]) +9 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][121] ([Intel XE#6703]) -> [SKIP][122] ([Intel XE#4141]) +4 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][123] ([Intel XE#2312]) -> [SKIP][124] ([Intel XE#4141]) +1 other test skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][125] ([Intel XE#4141]) -> [SKIP][126] ([Intel XE#2312]) +4 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][127] ([Intel XE#6703]) -> [SKIP][128] ([Intel XE#2311]) +9 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-mmap-wc.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff:
    - shard-bmg:          [SKIP][129] ([Intel XE#2312]) -> [SKIP][130] ([Intel XE#2311]) +6 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][131] ([Intel XE#2311]) -> [SKIP][132] ([Intel XE#2312]) +5 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-rte:
    - shard-bmg:          [SKIP][133] ([Intel XE#2313]) -> [SKIP][134] ([Intel XE#2312]) +8 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-2p-rte.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][135] ([Intel XE#2312]) -> [SKIP][136] ([Intel XE#2313]) +5 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render:
    - shard-bmg:          [SKIP][137] ([Intel XE#2313]) -> [SKIP][138] ([Intel XE#6703]) +12 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-bmg:          [SKIP][139] ([Intel XE#2352]) -> [SKIP][140] ([Intel XE#6703])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-bmg:          [SKIP][141] ([Intel XE#6703]) -> [SKIP][142] ([Intel XE#2350])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-5/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-10/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][143] ([Intel XE#6703]) -> [SKIP][144] ([Intel XE#2313]) +12 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-10/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][145] ([Intel XE#6703]) -> [ABORT][146] ([Intel XE#6740])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-5/igt@kms_hdr@invalid-hdr.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-7/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][147] ([Intel XE#6703]) -> [SKIP][148] ([Intel XE#5021])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-y.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-10/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          [SKIP][149] ([Intel XE#4596]) -> [SKIP][150] ([Intel XE#6703])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-yf.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-bmg:          [SKIP][151] ([Intel XE#870]) -> [SKIP][152] ([Intel XE#6703])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-10/igt@kms_pm_backlight@basic-brightness.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-bmg:          [SKIP][153] ([Intel XE#6703]) -> [SKIP][154] ([Intel XE#2392])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-5/igt@kms_pm_dc@dc5-psr.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-10/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-bmg:          [SKIP][155] ([Intel XE#3309]) -> [SKIP][156] ([Intel XE#6703])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-2/igt@kms_pm_dc@dc5-retention-flops.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-bmg:          [SKIP][157] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836]) -> [SKIP][158] ([Intel XE#6693])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-4/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          [SKIP][159] ([Intel XE#1406] / [Intel XE#6703]) -> [SKIP][160] ([Intel XE#1406] / [Intel XE#1489]) +2 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-7/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-bmg:          [SKIP][161] ([Intel XE#1406] / [Intel XE#1489]) -> [SKIP][162] ([Intel XE#1406] / [Intel XE#6703]) +6 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-10/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr@pr-suspend:
    - shard-bmg:          [SKIP][163] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) -> [SKIP][164] ([Intel XE#1406] / [Intel XE#6703]) +4 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-2/igt@kms_psr@pr-suspend.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@kms_psr@pr-suspend.html

  * igt@kms_psr@psr2-no-drrs:
    - shard-bmg:          [SKIP][165] ([Intel XE#1406] / [Intel XE#6703]) -> [SKIP][166] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +4 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-5/igt@kms_psr@psr2-no-drrs.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-3/igt@kms_psr@psr2-no-drrs.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-bmg:          [SKIP][167] ([Intel XE#1406] / [Intel XE#2414]) -> [SKIP][168] ([Intel XE#1406] / [Intel XE#6703])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-bmg:          [SKIP][169] ([Intel XE#2330]) -> [SKIP][170] ([Intel XE#6703])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-bmg:          [SKIP][171] ([Intel XE#3414] / [Intel XE#3904]) -> [SKIP][172] ([Intel XE#6703])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-4/igt@kms_rotation_crc@sprite-rotation-90.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_sharpness_filter@filter-formats:
    - shard-bmg:          [SKIP][173] ([Intel XE#6503]) -> [SKIP][174] ([Intel XE#6703])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-2/igt@kms_sharpness_filter@filter-formats.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@kms_sharpness_filter@filter-formats.html

  * igt@kms_sharpness_filter@invalid-filter-with-scaler:
    - shard-bmg:          [SKIP][175] ([Intel XE#6703]) -> [SKIP][176] ([Intel XE#6503])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-5/igt@kms_sharpness_filter@invalid-filter-with-scaler.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-3/igt@kms_sharpness_filter@invalid-filter-with-scaler.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-bmg:          [SKIP][177] ([Intel XE#2450]) -> [SKIP][178] ([Intel XE#6557] / [Intel XE#6703])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-2/igt@kms_tv_load_detect@load-detect.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@max-min:
    - shard-bmg:          [SKIP][179] ([Intel XE#6703]) -> [SKIP][180] ([Intel XE#1499])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-5/igt@kms_vrr@max-min.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-3/igt@kms_vrr@max-min.html

  * igt@xe_eudebug@basic-client:
    - shard-bmg:          [SKIP][181] ([Intel XE#4837]) -> [SKIP][182] ([Intel XE#6703]) +4 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-10/igt@xe_eudebug@basic-client.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@xe_eudebug@basic-client.html

  * igt@xe_eudebug@basic-vm-access-parameters:
    - shard-bmg:          [SKIP][183] ([Intel XE#6703]) -> [SKIP][184] ([Intel XE#4837]) +2 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-5/igt@xe_eudebug@basic-vm-access-parameters.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-3/igt@xe_eudebug@basic-vm-access-parameters.html

  * igt@xe_eudebug@basic-vm-bind-ufence-reconnect:
    - shard-bmg:          [SKIP][185] ([Intel XE#4837]) -> [SKIP][186] ([Intel XE#6557] / [Intel XE#6703])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-4/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html

  * igt@xe_eudebug_online@set-breakpoint-faultable:
    - shard-bmg:          [SKIP][187] ([Intel XE#4837] / [Intel XE#6665]) -> [SKIP][188] ([Intel XE#6703]) +3 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-4/igt@xe_eudebug_online@set-breakpoint-faultable.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@xe_eudebug_online@set-breakpoint-faultable.html

  * igt@xe_eudebug_online@set-breakpoint-sigint-debugger:
    - shard-bmg:          [SKIP][189] ([Intel XE#6703]) -> [SKIP][190] ([Intel XE#4837] / [Intel XE#6665]) +3 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-5/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-3/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html

  * igt@xe_eudebug_sriov@deny-eudebug:
    - shard-bmg:          [SKIP][191] ([Intel XE#5793]) -> [SKIP][192] ([Intel XE#6703])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-2/igt@xe_eudebug_sriov@deny-eudebug.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@xe_eudebug_sriov@deny-eudebug.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind:
    - shard-bmg:          [SKIP][193] ([Intel XE#6703]) -> [SKIP][194] ([Intel XE#2322]) +3 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-10/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - shard-bmg:          [SKIP][195] ([Intel XE#2322]) -> [SKIP][196] ([Intel XE#6703]) +5 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-4/igt@xe_exec_basic@multigpu-once-null-rebind.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@xe_exec_basic@multigpu-once-null-rebind.html

  * igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-userptr-invalidate:
    - shard-bmg:          [SKIP][197] ([Intel XE#6874]) -> [SKIP][198] ([Intel XE#6703]) +20 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-10/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-userptr-invalidate.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-userptr-invalidate.html

  * igt@xe_exec_multi_queue@max-queues-preempt-mode-basic:
    - shard-bmg:          [SKIP][199] ([Intel XE#6703]) -> [SKIP][200] ([Intel XE#6874]) +14 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-5/igt@xe_exec_multi_queue@max-queues-preempt-mode-basic.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-10/igt@xe_exec_multi_queue@max-queues-preempt-mode-basic.html

  * igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset:
    - shard-bmg:          [SKIP][201] ([Intel XE#6703]) -> [SKIP][202] ([Intel XE#4943]) +7 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-3/igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge-nomemset:
    - shard-bmg:          [SKIP][203] ([Intel XE#4943]) -> [SKIP][204] ([Intel XE#6703]) +15 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge-nomemset.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge-nomemset.html

  * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:
    - shard-bmg:          [ABORT][205] -> [SKIP][206] ([Intel XE#6703])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-10/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html

  * igt@xe_pat@pat-index-xelp:
    - shard-bmg:          [SKIP][207] ([Intel XE#6703]) -> [SKIP][208] ([Intel XE#2245])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-5/igt@xe_pat@pat-index-xelp.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-3/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pm@d3cold-basic:
    - shard-bmg:          [SKIP][209] ([Intel XE#6703]) -> [SKIP][210] ([Intel XE#2284])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-5/igt@xe_pm@d3cold-basic.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-7/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@d3cold-i2c:
    - shard-bmg:          [SKIP][211] ([Intel XE#5694]) -> [SKIP][212] ([Intel XE#6703])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-4/igt@xe_pm@d3cold-i2c.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@xe_pm@d3cold-i2c.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-bmg:          [SKIP][213] ([Intel XE#2284]) -> [SKIP][214] ([Intel XE#6703])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-2/igt@xe_pm@s3-d3cold-basic-exec.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-bmg:          [SKIP][215] ([Intel XE#579]) -> [SKIP][216] ([Intel XE#6703])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-2/igt@xe_pm@vram-d3cold-threshold.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pxp@display-black-pxp-fb:
    - shard-bmg:          [SKIP][217] ([Intel XE#4733]) -> [SKIP][218] ([Intel XE#6703])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-4/igt@xe_pxp@display-black-pxp-fb.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@xe_pxp@display-black-pxp-fb.html

  * igt@xe_pxp@pxp-optout:
    - shard-bmg:          [SKIP][219] ([Intel XE#6703]) -> [SKIP][220] ([Intel XE#4733])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-5/igt@xe_pxp@pxp-optout.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-10/igt@xe_pxp@pxp-optout.html

  * igt@xe_query@multigpu-query-engines:
    - shard-bmg:          [SKIP][221] ([Intel XE#944]) -> [SKIP][222] ([Intel XE#6703]) +3 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-2/igt@xe_query@multigpu-query-engines.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@xe_query@multigpu-query-engines.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-bmg:          [SKIP][223] ([Intel XE#6703]) -> [SKIP][224] ([Intel XE#944])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-5/igt@xe_query@multigpu-query-invalid-cs-cycles.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-3/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
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
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#5793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5793
  [Intel XE#6251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6480
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557
  [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
  [Intel XE#6693]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693
  [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
  [Intel XE#6715]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6715
  [Intel XE#6740]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740
  [Intel XE#6779]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6779
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
  [Intel XE#6914]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6914
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7 -> xe-pw-159316v1

  IGT_8674: f38f4d8e9c65aff45ac807e646d06e38bc3193a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7: 5f136224303e8b3130c6e2297fe52b44a77702c7
  xe-pw-159316v1: 159316v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/index.html

--===============7433517887182715858==
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
<tr><td><b>Series:</b></td><td>nova-core: Memory management initial patches</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/159316/">https://patchwork.freedesktop.org/series/159316/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7_FULL -&gt; xe-pw-159316v1_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-159316v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unplug-rescan:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-10/igt@core_hotunplug@unplug-rescan.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@core_hotunplug@unplug-rescan.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6779">Intel XE#6779</a>)</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-shared-fd:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-10/igt@core_setmaster@master-drop-set-shared-fd.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@core_setmaster@master-drop-set-shared-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6914">Intel XE#6914</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@unaligned-read:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-2/igt@fbdev@unaligned-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@fbdev@unaligned-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +86 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-alpha-opaque:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-1/igt@kms_cursor_crc@cursor-alpha-opaque.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-2/igt@kms_cursor_crc@cursor-alpha-opaque.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-9/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-9/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-7/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740">Intel XE#6740</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-3/igt@kms_hdr@invalid-metadata-sizes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-9/igt@kms_hdr@invalid-metadata-sizes.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740">Intel XE#6740</a>) +3 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-9/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911">Intel XE#6911</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@kms_pm_rpm@basic-pci-d3-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693">Intel XE#6693</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-stress-extra-wait:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-2/igt@kms_pm_rpm@modeset-stress-extra-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@kms_pm_rpm@modeset-stress-extra-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693">Intel XE#6693</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@kms_psr@psr2-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-9/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-9/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-4/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-new-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-9/igt@xe_exec_system_allocator@process-many-stride-mmap-new-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-new-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-execqueues-new-nomemset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-execqueues-new-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-remap-madvise:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-7/igt@xe_exec_system_allocator@threads-many-stride-mmap-remap-madvise.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-1/igt@xe_exec_system_allocator@threads-many-stride-mmap-remap-madvise.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6480">Intel XE#6480</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_copy0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-lnl-4/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_copy0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-lnl-3/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_copy0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251">Intel XE#6251</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-9/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-2/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +359 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-binds-536870912:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@xe_vm@large-split-binds-536870912.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-5/igt@core_hotunplug@hotrebind-lateclose.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6779">Intel XE#6779</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-10/igt@core_hotunplug@hotrebind-lateclose.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6715">Intel XE#6715</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-none.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-5/igt@kms_pm_rpm@legacy-planes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693">Intel XE#6693</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-3/igt@kms_pm_rpm@legacy-planes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-3/igt@xe_evict@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-9/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-cm-virtual-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-5/igt@xe_exec_balancer@many-execqueues-cm-virtual-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-3/igt@xe_exec_balancer@many-execqueues-cm-virtual-rebind.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html">PASS</a> +272 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-lnl-4/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251">Intel XE#6251</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-lnl-3/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-10/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-4/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-2/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-5/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-7/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-10/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-5/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-10/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-4/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-4/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-10/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-5/igt@kms_ccs@bad-rotation-90-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-10/igt@kms_ccs@bad-rotation-90-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-10/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-2/igt@kms_chamelium_hpd@dp-hpd-storm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@kms_chamelium_hpd@dp-hpd-storm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-5/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-3/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-1/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html">DMESG-FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-3/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-5/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-10/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-4/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-4/igt@kms_cursor_crc@cursor-offscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-64x21:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-5/igt@kms_cursor_crc@cursor-random-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-10/igt@kms_cursor_crc@cursor-random-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-10/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-4/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-2/igt@kms_fbcon_fbt@fbc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156">Intel XE#4156</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@kms_fbcon_fbt@fbc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-5/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-3/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375">Intel XE#2375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-4/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-rte:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-2p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-5/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-10/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350">Intel XE#2350</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-10/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-5/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-7/igt@kms_hdr@invalid-hdr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740">Intel XE#6740</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-10/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-10/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-5/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-10/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392">Intel XE#2392</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-2/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309">Intel XE#3309</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-4/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693">Intel XE#6693</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-7/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-10/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-2/igt@kms_psr@pr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@kms_psr@pr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-no-drrs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-5/igt@kms_psr@psr2-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-3/igt@kms_psr@psr2-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-4/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-formats:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-2/igt@kms_sharpness_filter@filter-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@kms_sharpness_filter@filter-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaler:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-5/igt@kms_sharpness_filter@invalid-filter-with-scaler.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-3/igt@kms_sharpness_filter@invalid-filter-with-scaler.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-2/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450">Intel XE#2450</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-5/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-3/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-client:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-10/igt@xe_eudebug@basic-client.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@xe_eudebug@basic-client.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-5/igt@xe_eudebug@basic-vm-access-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-3/igt@xe_eudebug@basic-vm-access-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-reconnect:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-4/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint-faultable:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-4/igt@xe_eudebug_online@set-breakpoint-faultable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@xe_eudebug_online@set-breakpoint-faultable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint-sigint-debugger:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-5/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-3/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-eudebug:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-2/igt@xe_eudebug_sriov@deny-eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5793">Intel XE#5793</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@xe_eudebug_sriov@deny-eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-10/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-4/igt@xe_exec_basic@multigpu-once-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@xe_exec_basic@multigpu-once-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-10/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@max-queues-preempt-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-5/igt@xe_exec_multi_queue@max-queues-preempt-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-10/igt@xe_exec_multi_queue@max-queues-preempt-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-3/igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-10/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-5/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-3/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-5/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-7/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-i2c:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-4/igt@xe_pm@d3cold-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694">Intel XE#5694</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@xe_pm@d3cold-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-2/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-2/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-black-pxp-fb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-4/igt@xe_pxp@display-black-pxp-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@xe_pxp@display-black-pxp-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-optout:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-5/igt@xe_pxp@pxp-optout.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-10/igt@xe_pxp@pxp-optout.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-2/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-5/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7/shard-bmg-5/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159316v1/shard-bmg-3/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7 -&gt; xe-pw-159316v1</li>
</ul>
<p>IGT_8674: f38f4d8e9c65aff45ac807e646d06e38bc3193a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4290-5f136224303e8b3130c6e2297fe52b44a77702c7: 5f136224303e8b3130c6e2297fe52b44a77702c7<br />
  xe-pw-159316v1: 159316v1</p>

</body>
</html>

--===============7433517887182715858==--
