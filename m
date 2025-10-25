Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A87CCCF9E3
	for <intel-xe@archiver.kernel.org>; Sat, 25 Oct 2025 07:17:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3A7D10E231;
	Sat, 25 Oct 2025 07:17:07 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48D1D10E231;
 Sat, 25 Oct 2025 07:17:06 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2653389641693535589=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Pagefault_refactor?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 25 Oct 2025 07:17:06 -0000
Message-ID: <176137662627.54467.7602361501346319860@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251024180414.1379284-1-matthew.brost@intel.com>
In-Reply-To: <20251024180414.1379284-1-matthew.brost@intel.com>
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

--===============2653389641693535589==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Pagefault refactor
URL   : https://patchwork.freedesktop.org/series/156508/
State : failure

== Summary ==

CI Bug Log - changes from xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e_FULL -> xe-pw-156508v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-156508v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-156508v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-156508v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-hdmi-a-1:
    - shard-adlp:         [PASS][1] -> [ABORT][2] +12 other tests abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/shard-adlp-1/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-hdmi-a-1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-adlp-2/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-hdmi-a-1.html

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][3] -> [ABORT][4] +12 other tests abort
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/shard-dg2-466/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-hdmi-a-6.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-dg2-434/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-hdmi-a-6.html

  
#### Warnings ####

  * igt@xe_exec_reset@cm-cat-error:
    - shard-adlp:         [DMESG-WARN][5] ([Intel XE#3868]) -> [ABORT][6] +1 other test abort
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/shard-adlp-8/igt@xe_exec_reset@cm-cat-error.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-adlp-8/igt@xe_exec_reset@cm-cat-error.html

  
Known issues
------------

  Here are the changes found in xe-pw-156508v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2652] / [Intel XE#787]) +7 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-bmg-2/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [PASS][8] -> [INCOMPLETE][9] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [PASS][10] -> [INCOMPLETE][11] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][12] -> [INCOMPLETE][13] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-bmg:          [PASS][14] -> [SKIP][15] ([Intel XE#2291]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][16] -> [FAIL][17] ([Intel XE#5299])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_dp_aux_dev:
    - shard-bmg:          [PASS][18] -> [SKIP][19] ([Intel XE#3009])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/shard-bmg-1/igt@kms_dp_aux_dev.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-bmg-6/igt@kms_dp_aux_dev.html

  * igt@kms_flip@2x-plain-flip:
    - shard-bmg:          [PASS][20] -> [SKIP][21] ([Intel XE#2316]) +2 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/shard-bmg-7/igt@kms_flip@2x-plain-flip.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-bmg-6/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@d-hdmi-a1:
    - shard-adlp:         [PASS][22] -> [DMESG-WARN][23] ([Intel XE#4543]) +3 other tests dmesg-warn
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/shard-adlp-1/igt@kms_flip@flip-vs-absolute-wf_vblank@d-hdmi-a1.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-adlp-2/igt@kms_flip@flip-vs-absolute-wf_vblank@d-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#5390])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2313])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-bmg:          [PASS][26] -> [SKIP][27] ([Intel XE#4596])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-none.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-adlp:         [PASS][28] -> [DMESG-WARN][29] ([Intel XE#2953] / [Intel XE#4173]) +2 other tests dmesg-warn
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/shard-adlp-4/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-adlp-4/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-bmg:          [PASS][30] -> [SKIP][31] ([Intel XE#1435]) +2 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/shard-bmg-1/igt@kms_setmode@clone-exclusive-crtc.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@xe_exec_basic@multigpu-once-basic:
    - shard-dg2-set2:     [PASS][32] -> [INCOMPLETE][33] ([Intel XE#4842])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/shard-dg2-436/igt@xe_exec_basic@multigpu-once-basic.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-dg2-435/igt@xe_exec_basic@multigpu-once-basic.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:
    - shard-lnl:          [PASS][34] -> [FAIL][35] ([Intel XE#5625])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/shard-lnl-1/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-lnl-7/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#4943])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-bmg-3/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge-nomemset.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
    - shard-dg2-set2:     [PASS][37] -> [DMESG-WARN][38] ([Intel XE#5893])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/shard-dg2-436/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-dg2-435/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html

  * igt@xe_pmu@fn-engine-activity-sched-if-idle@engine-drm_xe_engine_class_video_enhance1:
    - shard-bmg:          [PASS][39] -> [DMESG-WARN][40] ([Intel XE#3876] / [Intel XE#3970]) +1 other test dmesg-warn
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/shard-bmg-2/igt@xe_pmu@fn-engine-activity-sched-if-idle@engine-drm_xe_engine_class_video_enhance1.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-bmg-2/igt@xe_pmu@fn-engine-activity-sched-if-idle@engine-drm_xe_engine_class_video_enhance1.html

  * igt@xe_pmu@gt-frequency:
    - shard-dg2-set2:     [PASS][41] -> [FAIL][42] ([Intel XE#4819]) +1 other test fail
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/shard-dg2-466/igt@xe_pmu@gt-frequency.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-dg2-434/igt@xe_pmu@gt-frequency.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][43] ([Intel XE#4543]) -> [PASS][44] +2 other tests pass
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/shard-adlp-6/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-1.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-adlp-3/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-1.html

  * igt@kms_color@deep-color@pipe-c-hdmi-a-6-gamma:
    - shard-dg2-set2:     [FAIL][45] -> [PASS][46] +1 other test pass
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/shard-dg2-463/igt@kms_color@deep-color@pipe-c-hdmi-a-6-gamma.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-dg2-464/igt@kms_color@deep-color@pipe-c-hdmi-a-6-gamma.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:
    - shard-bmg:          [DMESG-WARN][47] ([Intel XE#5354]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/shard-bmg-3/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-bmg-7/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-bmg:          [SKIP][49] ([Intel XE#2291]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
    - shard-bmg:          [SKIP][51] ([Intel XE#2316]) -> [PASS][52] +3 other tests pass
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][53] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][54] +4 other tests pass
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/shard-adlp-4/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-adlp-3/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y:
    - shard-adlp:         [DMESG-FAIL][55] ([Intel XE#4543]) -> [PASS][56] +2 other tests pass
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [FAIL][57] ([Intel XE#4459]) -> [PASS][58] +1 other test pass
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/shard-lnl-7/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:
    - shard-lnl:          [FAIL][59] ([Intel XE#5625]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/shard-lnl-5/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-lnl-8/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html

  
#### Warnings ####

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][61] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345] / [Intel XE#6168]) -> [INCOMPLETE][62] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][63] ([Intel XE#2311]) -> [SKIP][64] ([Intel XE#2312]) +7 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][65] ([Intel XE#2312]) -> [SKIP][66] ([Intel XE#5390]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][67] ([Intel XE#5390]) -> [SKIP][68] ([Intel XE#2312]) +3 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][69] ([Intel XE#2312]) -> [SKIP][70] ([Intel XE#2311]) +7 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][71] ([Intel XE#2312]) -> [SKIP][72] ([Intel XE#2313]) +7 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:
    - shard-bmg:          [SKIP][73] ([Intel XE#2313]) -> [SKIP][74] ([Intel XE#2312]) +7 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][75] ([Intel XE#1729]) -> [SKIP][76] ([Intel XE#2426])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][77] ([Intel XE#2426]) -> [SKIP][78] ([Intel XE#2509])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-bmg:          [ABORT][79] ([Intel XE#4917] / [Intel XE#5466] / [Intel XE#5530]) -> [ABORT][80] ([Intel XE#5466] / [Intel XE#5530])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/shard-bmg-3/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-bmg-8/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  * igt@xe_pmu@all-fn-engine-activity-load@engine-drm_xe_engine_class_render0:
    - shard-adlp:         [TIMEOUT][81] ([Intel XE#5213] / [Intel XE#6421]) -> [ABORT][82] ([Intel XE#5545]) +1 other test abort
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/shard-adlp-3/igt@xe_pmu@all-fn-engine-activity-load@engine-drm_xe_engine_class_render0.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-adlp-1/igt@xe_pmu@all-fn-engine-activity-load@engine-drm_xe_engine_class_render0.html

  * igt@xe_sriov_scheduling@equal-throughput:
    - shard-adlp:         [DMESG-FAIL][83] ([Intel XE#3868] / [Intel XE#5213]) -> [ABORT][84] ([Intel XE#4917]) +1 other test abort
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/shard-adlp-3/igt@xe_sriov_scheduling@equal-throughput.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-adlp-6/igt@xe_sriov_scheduling@equal-throughput.html

  
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4819]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4819
  [Intel XE#4842]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4842
  [Intel XE#4917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5213]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5213
  [Intel XE#5299]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299
  [Intel XE#5354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
  [Intel XE#5530]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
  [Intel XE#5893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5893
  [Intel XE#6168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168
  [Intel XE#6421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6421
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787


Build changes
-------------

  * Linux: xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e -> xe-pw-156508v1

  IGT_8596: 8596
  xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e: dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e
  xe-pw-156508v1: 156508v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/index.html

--===============2653389641693535589==
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
<tr><td><b>Series:</b></td><td>Pagefault refactor</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/156508/">https://patchwork.freedesktop.org/series/156508/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e_FULL -&gt; xe-pw-156508v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-156508v1_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-156508v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-156508v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/shard-adlp-1/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-adlp-2/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-hdmi-a-1.html">ABORT</a> +12 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/shard-dg2-466/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-dg2-434/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-hdmi-a-6.html">ABORT</a> +12 other tests abort</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_exec_reset@cm-cat-error:<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/shard-adlp-8/igt@xe_exec_reset@cm-cat-error.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868">Intel XE#3868</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-adlp-8/igt@xe_exec_reset@cm-cat-error.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-156508v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-bmg-2/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299">Intel XE#5299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/shard-bmg-1/igt@kms_dp_aux_dev.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-bmg-6/igt@kms_dp_aux_dev.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Intel XE#3009</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/shard-bmg-7/igt@kms_flip@2x-plain-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-bmg-6/igt@kms_flip@2x-plain-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/shard-adlp-1/igt@kms_flip@flip-vs-absolute-wf_vblank@d-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-adlp-2/igt@kms_flip@flip-vs-absolute-wf_vblank@d-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-none.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/shard-adlp-4/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-adlp-4/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/shard-bmg-1/igt@kms_setmode@clone-exclusive-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/shard-dg2-436/igt@xe_exec_basic@multigpu-once-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-dg2-435/igt@xe_exec_basic@multigpu-once-basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4842">Intel XE#4842</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/shard-lnl-1/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-lnl-7/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625">Intel XE#5625</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-bmg-3/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/shard-dg2-436/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-dg2-435/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5893">Intel XE#5893</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-sched-if-idle@engine-drm_xe_engine_class_video_enhance1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/shard-bmg-2/igt@xe_pmu@fn-engine-activity-sched-if-idle@engine-drm_xe_engine_class_video_enhance1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-bmg-2/igt@xe_pmu@fn-engine-activity-sched-if-idle@engine-drm_xe_engine_class_video_enhance1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@gt-frequency:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/shard-dg2-466/igt@xe_pmu@gt-frequency.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-dg2-434/igt@xe_pmu@gt-frequency.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4819">Intel XE#4819</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/shard-adlp-6/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-adlp-3/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color@pipe-c-hdmi-a-6-gamma:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/shard-dg2-463/igt@kms_color@deep-color@pipe-c-hdmi-a-6-gamma.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-dg2-464/igt@kms_color@deep-color@pipe-c-hdmi-a-6-gamma.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/shard-bmg-3/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354">Intel XE#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-bmg-7/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/shard-adlp-4/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-adlp-3/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/shard-lnl-7/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459">Intel XE#4459</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/shard-lnl-5/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625">Intel XE#5625</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-lnl-8/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168">Intel XE#6168</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/shard-bmg-3/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917">Intel XE#4917</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466">Intel XE#5466</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530">Intel XE#5530</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-bmg-8/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466">Intel XE#5466</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530">Intel XE#5530</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@all-fn-engine-activity-load@engine-drm_xe_engine_class_render0:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/shard-adlp-3/igt@xe_pmu@all-fn-engine-activity-load@engine-drm_xe_engine_class_render0.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5213">Intel XE#5213</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6421">Intel XE#6421</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-adlp-1/igt@xe_pmu@all-fn-engine-activity-load@engine-drm_xe_engine_class_render0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@equal-throughput:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/shard-adlp-3/igt@xe_sriov_scheduling@equal-throughput.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868">Intel XE#3868</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5213">Intel XE#5213</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156508v1/shard-adlp-6/igt@xe_sriov_scheduling@equal-throughput.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917">Intel XE#4917</a>) +1 other test abort</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e -&gt; xe-pw-156508v1</li>
</ul>
<p>IGT_8596: 8596<br />
  xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e: dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e<br />
  xe-pw-156508v1: 156508v1</p>

</body>
</html>

--===============2653389641693535589==--
