Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21FABCCF9F0
	for <intel-xe@archiver.kernel.org>; Sat,  1 Nov 2025 06:59:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2C8810E318;
	Sat,  1 Nov 2025 06:59:38 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21D4A10E0F6;
 Sat,  1 Nov 2025 06:59:37 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2479205614512764826=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Pagefault_refactor_=28rev3?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 01 Nov 2025 06:59:37 -0000
Message-ID: <176198037712.8737.927399515982325855@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251031165416.2871503-1-matthew.brost@intel.com>
In-Reply-To: <20251031165416.2871503-1-matthew.brost@intel.com>
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

--===============2479205614512764826==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Pagefault refactor (rev3)
URL   : https://patchwork.freedesktop.org/series/156508/
State : failure

== Summary ==

CI Bug Log - changes from xe-4023-514fac1c82d99307294e5c8a00f91fe5ab0150ab_FULL -> xe-pw-156508v3_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-156508v3_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-156508v3_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-156508v3_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind:
    - shard-dg2-set2:     [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4023-514fac1c82d99307294e5c8a00f91fe5ab0150ab/shard-dg2-434/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v3/shard-dg2-463/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.html

  
Known issues
------------

  Here are the changes found in xe-pw-156508v3_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-adlp:         [PASS][3] -> [FAIL][4] ([Intel XE#3908]) +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4023-514fac1c82d99307294e5c8a00f91fe5ab0150ab/shard-adlp-9/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v3/shard-adlp-3/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][5] ([Intel XE#1124]) +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v3/shard-dg2-463/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-bmg:          [PASS][6] -> [SKIP][7] ([Intel XE#2314] / [Intel XE#2894])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4023-514fac1c82d99307294e5c8a00f91fe5ab0150ab/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v3/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v3/shard-bmg-1/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][9] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v3/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][10] ([Intel XE#787]) +6 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v3/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][11] ([Intel XE#6168])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v3/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][12] ([Intel XE#1727] / [Intel XE#3113])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v3/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][13] -> [DMESG-WARN][14] ([Intel XE#5354])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4023-514fac1c82d99307294e5c8a00f91fe5ab0150ab/shard-bmg-8/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v3/shard-bmg-7/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-bmg:          [PASS][15] -> [SKIP][16] ([Intel XE#2291]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4023-514fac1c82d99307294e5c8a00f91fe5ab0150ab/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v3/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-bmg:          [PASS][17] -> [FAIL][18] ([Intel XE#1475])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4023-514fac1c82d99307294e5c8a00f91fe5ab0150ab/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v3/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#323])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v3/shard-dg2-463/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dp_aux_dev:
    - shard-bmg:          [PASS][20] -> [SKIP][21] ([Intel XE#3009])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4023-514fac1c82d99307294e5c8a00f91fe5ab0150ab/shard-bmg-1/igt@kms_dp_aux_dev.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v3/shard-bmg-6/igt@kms_dp_aux_dev.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-bmg:          [PASS][22] -> [SKIP][23] ([Intel XE#2316]) +5 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4023-514fac1c82d99307294e5c8a00f91fe5ab0150ab/shard-bmg-5/igt@kms_flip@2x-modeset-vs-vblank-race.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v3/shard-bmg-6/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank:
    - shard-adlp:         [PASS][24] -> [DMESG-WARN][25] ([Intel XE#4543]) +3 other tests dmesg-warn
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4023-514fac1c82d99307294e5c8a00f91fe5ab0150ab/shard-adlp-8/igt@kms_flip@flip-vs-blocking-wf-vblank.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v3/shard-adlp-3/igt@kms_flip@flip-vs-blocking-wf-vblank.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#6312])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v3/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-slowdraw:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2311])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v3/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-slowdraw.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#651]) +2 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v3/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#653]) +2 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v3/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-bmg:          [PASS][30] -> [SKIP][31] ([Intel XE#1503])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4023-514fac1c82d99307294e5c8a00f91fe5ab0150ab/shard-bmg-4/igt@kms_hdr@invalid-metadata-sizes.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v3/shard-bmg-6/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#346])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v3/shard-dg2-463/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-adlp:         [PASS][33] -> [DMESG-WARN][34] ([Intel XE#2953] / [Intel XE#4173]) +2 other tests dmesg-warn
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4023-514fac1c82d99307294e5c8a00f91fe5ab0150ab/shard-adlp-4/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v3/shard-adlp-8/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#870])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v3/shard-dg2-463/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#1406] / [Intel XE#1489])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v3/shard-dg2-463/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr@psr2-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v3/shard-dg2-463/igt@kms_psr@psr2-suspend.html

  * igt@kms_vrr@flip-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#455])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v3/shard-dg2-463/igt@kms_vrr@flip-dpms.html

  * igt@xe_eudebug_online@resume-one:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#4837]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v3/shard-dg2-463/igt@xe_eudebug_online@resume-one.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [PASS][40] -> [INCOMPLETE][41] ([Intel XE#6321]) +1 other test incomplete
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4023-514fac1c82d99307294e5c8a00f91fe5ab0150ab/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v3/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_fault_mode@once-rebind-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#288]) +2 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v3/shard-dg2-463/igt@xe_exec_fault_mode@once-rebind-imm.html

  * igt@xe_exec_reset@cm-close-fd:
    - shard-adlp:         [PASS][43] -> [DMESG-WARN][44] ([Intel XE#3868])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4023-514fac1c82d99307294e5c8a00f91fe5ab0150ab/shard-adlp-9/igt@xe_exec_reset@cm-close-fd.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v3/shard-adlp-3/igt@xe_exec_reset@cm-close-fd.html

  * igt@xe_exec_system_allocator@madvise-preffered-loc-atomic-cpu:
    - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#4915]) +39 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v3/shard-dg2-463/igt@xe_exec_system_allocator@madvise-preffered-loc-atomic-cpu.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
    - shard-dg2-set2:     [PASS][46] -> [DMESG-WARN][47] ([Intel XE#5893])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4023-514fac1c82d99307294e5c8a00f91fe5ab0150ab/shard-dg2-434/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v3/shard-dg2-463/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html

  * igt@xe_oa@oa-unit-concurrent-oa-buffer-read:
    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#3573])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v3/shard-dg2-463/igt@xe_oa@oa-unit-concurrent-oa-buffer-read.html

  * igt@xe_pm@s2idle-vm-bind-userptr:
    - shard-adlp:         [PASS][49] -> [DMESG-WARN][50] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#4504])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4023-514fac1c82d99307294e5c8a00f91fe5ab0150ab/shard-adlp-9/igt@xe_pm@s2idle-vm-bind-userptr.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v3/shard-adlp-3/igt@xe_pm@s2idle-vm-bind-userptr.html

  * igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random:
    - shard-adlp:         [PASS][51] -> [DMESG-FAIL][52] ([Intel XE#3868] / [Intel XE#5213] / [Intel XE#5545]) +1 other test dmesg-fail
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4023-514fac1c82d99307294e5c8a00f91fe5ab0150ab/shard-adlp-8/igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v3/shard-adlp-2/igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random.html

  
#### Possible fixes ####

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [DMESG-FAIL][53] ([Intel XE#4543]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4023-514fac1c82d99307294e5c8a00f91fe5ab0150ab/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v3/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][55] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4023-514fac1c82d99307294e5c8a00f91fe5ab0150ab/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v3/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][57] ([Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4023-514fac1c82d99307294e5c8a00f91fe5ab0150ab/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v3/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][59] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4023-514fac1c82d99307294e5c8a00f91fe5ab0150ab/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v3/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-bmg:          [SKIP][61] ([Intel XE#2291]) -> [PASS][62] +1 other test pass
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4023-514fac1c82d99307294e5c8a00f91fe5ab0150ab/shard-bmg-6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v3/shard-bmg-1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [DMESG-WARN][63] ([Intel XE#5354]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4023-514fac1c82d99307294e5c8a00f91fe5ab0150ab/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v3/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [FAIL][65] ([Intel XE#1475]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4023-514fac1c82d99307294e5c8a00f91fe5ab0150ab/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v3/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_flip@2x-busy-flip:
    - shard-bmg:          [SKIP][67] ([Intel XE#2316]) -> [PASS][68] +1 other test pass
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4023-514fac1c82d99307294e5c8a00f91fe5ab0150ab/shard-bmg-6/igt@kms_flip@2x-busy-flip.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v3/shard-bmg-2/igt@kms_flip@2x-busy-flip.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [FAIL][69] ([Intel XE#301]) -> [PASS][70] +1 other test pass
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4023-514fac1c82d99307294e5c8a00f91fe5ab0150ab/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v3/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-bmg:          [SKIP][71] ([Intel XE#4596]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4023-514fac1c82d99307294e5c8a00f91fe5ab0150ab/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-4.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v3/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-adlp:         [DMESG-WARN][73] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][74] +7 other tests pass
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4023-514fac1c82d99307294e5c8a00f91fe5ab0150ab/shard-adlp-8/igt@kms_vblank@ts-continuation-suspend.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v3/shard-adlp-3/igt@kms_vblank@ts-continuation-suspend.html

  * igt@xe_exec_basic@many-basic-defer-mmap:
    - shard-dg2-set2:     [FAIL][75] -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4023-514fac1c82d99307294e5c8a00f91fe5ab0150ab/shard-dg2-435/igt@xe_exec_basic@many-basic-defer-mmap.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v3/shard-dg2-466/igt@xe_exec_basic@many-basic-defer-mmap.html

  * igt@xe_gt_freq@freq_fixed_idle:
    - shard-dg2-set2:     [FAIL][77] ([Intel XE#6407]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4023-514fac1c82d99307294e5c8a00f91fe5ab0150ab/shard-dg2-432/igt@xe_gt_freq@freq_fixed_idle.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v3/shard-dg2-463/igt@xe_gt_freq@freq_fixed_idle.html

  
#### Warnings ####

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][79] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522]) -> [INCOMPLETE][80] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345] / [Intel XE#6168])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4023-514fac1c82d99307294e5c8a00f91fe5ab0150ab/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v3/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][81] ([Intel XE#2312]) -> [SKIP][82] ([Intel XE#2311]) +6 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4023-514fac1c82d99307294e5c8a00f91fe5ab0150ab/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v3/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][83] ([Intel XE#2311]) -> [SKIP][84] ([Intel XE#2312]) +11 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4023-514fac1c82d99307294e5c8a00f91fe5ab0150ab/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v3/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][85] ([Intel XE#2312]) -> [SKIP][86] ([Intel XE#5390]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4023-514fac1c82d99307294e5c8a00f91fe5ab0150ab/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v3/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][87] ([Intel XE#5390]) -> [SKIP][88] ([Intel XE#2312]) +8 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4023-514fac1c82d99307294e5c8a00f91fe5ab0150ab/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][89] ([Intel XE#2312]) -> [SKIP][90] ([Intel XE#2313]) +7 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4023-514fac1c82d99307294e5c8a00f91fe5ab0150ab/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v3/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:
    - shard-bmg:          [SKIP][91] ([Intel XE#2313]) -> [SKIP][92] ([Intel XE#2312]) +11 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4023-514fac1c82d99307294e5c8a00f91fe5ab0150ab/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v3/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#3868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4504
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#5213]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5213
  [Intel XE#5354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5893
  [Intel XE#6168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6407
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929


Build changes
-------------

  * Linux: xe-4023-514fac1c82d99307294e5c8a00f91fe5ab0150ab -> xe-pw-156508v3

  IGT_8604: 8604
  xe-4023-514fac1c82d99307294e5c8a00f91fe5ab0150ab: 514fac1c82d99307294e5c8a00f91fe5ab0150ab
  xe-pw-156508v3: 156508v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v3/index.html

--===============2479205614512764826==
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
<tr><td><b>Series:</b></td><td>Pagefault refactor (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/156508/">https://patchwork.freedesktop.org/series/156508/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-156508v3/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-156508v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4023-514fac1c82d99307294e5c8a00f91fe5a=
b0150ab_FULL -&gt; xe-pw-156508v3_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-156508v3_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-156508v3_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1565=
08v3_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind:<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4023-514fac1c82d99307294e5c8a00f91fe5ab0150ab/shard-dg2-434/igt@xe_exe=
c_basic@multigpu-many-execqueues-many-vm-rebind.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v3/shard-dg2-463=
/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.html">INCOMPLETE=
</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-156508v3_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4023-514fac1c82d99307294e5c8a00f91fe5ab0150ab/shard-adlp-9/igt@kms_ato=
mic_transition@plane-toggle-modeset-transition.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v3/shard-adlp-3/i=
gt@kms_atomic_transition@plane-toggle-modeset-transition.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908">Intel XE=
#3908</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156508v3/shard-dg2-463/igt@kms_big_fb@y-tiled-64bpp-ro=
tate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4023-514fac1c82d99307294e5c8a00f91fe5ab0150ab/shard-bmg-4/igt@kms_bw@c=
onnected-linear-tiling-2-displays-3840x2160p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v3/shard-bmg-6/ig=
t@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2=
314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
94">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156508v3/shard-bmg-1/igt@kms_ccs@crc-primary-basic-4-t=
iled-lnl-ccs@pipe-b-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156508v3/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-=
y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156508v3/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-=
y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +6 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156508v3/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs-cc@pipe-b-dp-4.html">INCOMPLETE</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/6168">Intel XE#6168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156508v3/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html">DMESG-WARN</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3=
113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4023-514fac1c82d99307294e5c8a00f91fe5ab0150ab/shard-bmg-8/igt@kms_curs=
or_legacy@cursor-vs-flip-atomic-transitions-varying-size.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v3/shar=
d-bmg-7/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-siz=
e.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/5354">Intel XE#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4023-514fac1c82d99307294e5c8a00f91fe5ab0150ab/shard-bmg-5/igt@kms_curs=
or_legacy@cursorb-vs-flipa-legacy.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v3/shard-bmg-6/igt@kms_cursor_=
legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4023-514fac1c82d99307294e5c8a00f91fe5ab0150ab/shard-bmg-4/igt@kms_curs=
or_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v3/shard-bmg-4/igt@k=
ms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:<=
/p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156508v3/shard-dg2-463/igt@kms_cursor_legacy@short-bus=
y-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4023-514fac1c82d99307294e5c8a00f91fe5ab0150ab/shard-bmg-1/igt@kms_dp_a=
ux_dev.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-156508v3/shard-bmg-6/igt@kms_dp_aux_dev.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Intel XE#3009=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4023-514fac1c82d99307294e5c8a00f91fe5ab0150ab/shard-bmg-5/igt@kms_flip=
@2x-modeset-vs-vblank-race.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-156508v3/shard-bmg-6/igt@kms_flip@2x-modese=
t-vs-vblank-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2316">Intel XE#2316</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4023-514fac1c82d99307294e5c8a00f91fe5ab0150ab/shard-adlp-8/igt@kms_fli=
p@flip-vs-blocking-wf-vblank.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-156508v3/shard-adlp-3/igt@kms_flip@flip-v=
s-blocking-wf-vblank.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +3 other tests dmes=
g-warn</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-mmap-wc:</=
p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156508v3/shard-dg2-463/igt@kms_frontbuffer_tracking@dr=
rs-1p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-slowdraw:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156508v3/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs=
-slowdraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156508v3/shard-dg2-463/igt@kms_frontbuffer_tracking@fb=
cdrrs-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156508v3/shard-dg2-463/igt@kms_frontbuffer_tracking@ps=
r-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4023-514fac1c82d99307294e5c8a00f91fe5ab0150ab/shard-bmg-4/igt@kms_hdr@=
invalid-metadata-sizes.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-156508v3/shard-bmg-6/igt@kms_hdr@invalid-metada=
ta-sizes.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156508v3/shard-dg2-463/igt@kms_joiner@invalid-modeset-=
big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4023-514fac1c82d99307294e5c8a00f91fe5ab0150ab/shard-adlp-4/igt@kms_pla=
ne@plane-panning-bottom-right-suspend.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v3/shard-adlp-8/igt@kms_pl=
ane@plane-panning-bottom-right-suspend.html">DMESG-WARN</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel =
XE#4173</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156508v3/shard-dg2-463/igt@kms_pm_backlight@fade-with-=
suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156508v3/shard-dg2-463/igt@kms_psr2_sf@psr2-overlay-pl=
ane-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156508v3/shard-dg2-463/igt@kms_psr@psr2-suspend.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
06">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156508v3/shard-dg2-463/igt@kms_vrr@flip-dpms.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">=
Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@resume-one:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156508v3/shard-dg2-463/igt@xe_eudebug_online@resume-on=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4837">Intel XE#4837</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4023-514fac1c82d99307294e5c8a00f91fe5ab0150ab/shard-bmg-5/igt@xe_evict=
@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v3/shard-bmg-1/igt@xe_evict@evic=
t-mixed-many-threads-small.html">INCOMPLETE</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>) +1 other test=
 incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156508v3/shard-dg2-463/igt@xe_exec_fault_mode@once-reb=
ind-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/288">Intel XE#288</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-close-fd:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4023-514fac1c82d99307294e5c8a00f91fe5ab0150ab/shard-adlp-9/igt@xe_exec=
_reset@cm-close-fd.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-156508v3/shard-adlp-3/igt@xe_exec_reset@cm-close-fd=
.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3868">Intel XE#3868</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@madvise-preffered-loc-atomic-cpu:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156508v3/shard-dg2-463/igt@xe_exec_system_allocator@ma=
dvise-preffered-loc-atomic-cpu.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +39 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4023-514fac1c82d99307294e5c8a00f91fe5ab0150ab/shard-dg2-434/igt@xe_fau=
lt_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v3/shard-dg2-4=
63/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/58=
93">Intel XE#5893</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-concurrent-oa-buffer-read:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156508v3/shard-dg2-463/igt@xe_oa@oa-unit-concurrent-oa=
-buffer-read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-userptr:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4023-514fac1c82d99307294e5c8a00f91fe5ab0150ab/shard-adlp-9/igt@xe_pm@s=
2idle-vm-bind-userptr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-156508v3/shard-adlp-3/igt@xe_pm@s2idle-vm-bind-u=
serptr.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4504">Intel XE#4504</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4023-514fac1c82d99307294e5c8a00f91fe5ab0150ab/shard-adlp-8/igt@xe_srio=
v_scheduling@nonpreempt-engine-resets@numvfs-random.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v3/shard-adl=
p-2/igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random.html">DM=
ESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3868">Intel XE#3868</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/5213">Intel XE#5213</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a>) +1 other test dmesg-=
fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4023-514fac1c82d99307294e5c8a00f91fe5ab0150ab/shard-adlp-8/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel X=
E#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-156508v3/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0=
-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4023-514fac1c82d99307294e5c8a00f91fe5ab0150ab/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE=
#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v3/shard-dg2-463/igt@kms_c=
cs@random-ccs-data-4-tiled-dg2-mc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4023-514fac1c82d99307294e5c8a00f91fe5ab0150ab/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel =
XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4212">Intel XE#4212</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-156508v3/shard-dg2-463/igt@kms_ccs@random-cc=
s-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4023-514fac1c82d99307294e5c8a00f91fe5ab0150ab/shard-dg2-435/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel X=
E#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v3/shard-dg=
2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html">P=
ASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4023-514fac1c82d99307294e5c8a00f91fe5ab0150ab/shard-bmg-6/igt@kms_curs=
or_legacy@2x-long-cursor-vs-flip-legacy.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v3/shard-b=
mg-1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">PASS</a> +1 =
other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4023-514fac1c82d99307294e5c8a00f91fe5ab0150ab/shard-bmg-1/igt@kms_curs=
or_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354">=
Intel XE#5354</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-156508v3/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic=
-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4023-514fac1c82d99307294e5c8a00f91fe5ab0150ab/shard-bmg-5/igt@kms_curs=
or_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v3/shard-bmg-6/ig=
t@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-busy-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4023-514fac1c82d99307294e5c8a00f91fe5ab0150ab/shard-bmg-6/igt@kms_flip=
@2x-busy-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-156508v3/shard-bmg-2/igt@kms_flip@2x-busy-=
flip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4023-514fac1c82d99307294e5c8a00f91fe5ab0150ab/shard-lnl-1/igt@kms_flip=
@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v3/shard-lnl-8/igt@km=
s_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4023-514fac1c82d99307294e5c8a00f91fe5ab0150ab/shard-bmg-6/igt@kms_plan=
e_multiple@2x-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v3/shard-bmg-2/igt@kms_plan=
e_multiple@2x-tiling-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4023-514fac1c82d99307294e5c8a00f91fe5ab0150ab/shard-adlp-8/igt@kms_vbl=
ank@ts-continuation-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v3=
/shard-adlp-3/igt@kms_vblank@ts-continuation-suspend.html">PASS</a> +7 othe=
r tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4023-514fac1c82d99307294e5c8a00f91fe5ab0150ab/shard-dg2-435/igt@xe_exe=
c_basic@many-basic-defer-mmap.html">FAIL</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v3/shard-dg2-466/igt@xe_exec_basic=
@many-basic-defer-mmap.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_fixed_idle:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4023-514fac1c82d99307294e5c8a00f91fe5ab0150ab/shard-dg2-432/igt@xe_gt_=
freq@freq_fixed_idle.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/6407">Intel XE#6407</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v3/shard-dg2-463/igt@xe_gt_fr=
eq@freq_fixed_idle.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4023-514fac1c82d99307294e5c8a00f91fe5ab0150ab/shard-dg2-435/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel=
 XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v3/shard-=
dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">I=
ntel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/6168">Intel XE#6168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4023-514fac1c82d99307294e5c8a00f91fe5ab0150ab/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1565=
08v3/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2311">Intel XE#2311</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4023-514fac1c82d99307294e5c8a00f91fe5ab0150ab/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#=
2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
156508v3/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indf=
b-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4023-514fac1c82d99307294e5c8a00f91fe5ab0150ab/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1565=
08v3/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/5390">Intel XE#5390</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4023-514fac1c82d99307294e5c8a00f91fe5ab0150ab/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5=
390</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
56508v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4023-514fac1c82d99307294e5c8a00f91fe5ab0150ab/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1565=
08v3/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-=
onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2313">Intel XE#2313</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4023-514fac1c82d99307294e5c8a00f91fe5ab0150ab/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v=
3/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2312">Intel XE#2312</a>) +11 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4023-514fac1c82d99307294e5c8a00f91fe5ab0150ab -&gt; xe-pw-156=
508v3</li>
</ul>
<p>IGT_8604: 8604<br />
  xe-4023-514fac1c82d99307294e5c8a00f91fe5ab0150ab: 514fac1c82d99307294e5c8=
a00f91fe5ab0150ab<br />
  xe-pw-156508v3: 156508v3</p>

</body>
</html>

--===============2479205614512764826==--
