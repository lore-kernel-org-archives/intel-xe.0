Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0892C624D0
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 12:05:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47CE010E510;
	Wed,  2 Sep 2026 12:05:58 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B85AE10E510;
 Wed,  2 Sep 2026 12:05:56 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4118391712781470525=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_Use_SIG=5FID_logs_for_GuC_?=
 =?utf-8?q?component?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 02 Sep 2026 12:05:56 -0000
Message-ID: <178835075674.112573.11635430528766277712@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260901211204.131972-7-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20260901211204.131972-7-umesh.nerlige.ramappa@intel.com>
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

--===============4118391712781470525==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Use SIG_ID logs for GuC component
URL   : https://patchwork.freedesktop.org/series/173177/
State : success

== Summary ==

CI Bug Log - changes from xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b_FULL -> xe-pw-173177v1_FULL
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

  Here are the changes found in xe-pw-173177v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@x-tiled-8bpp-rotate-0:
    - shard-lnl:          [PASS][1] -> [ABORT][2] ([Intel XE#4760])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b/shard-lnl-3/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-lnl-5/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#1124])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-4/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#3432])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2252])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-4/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][6] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +2 other tests fail
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-5/igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#1508])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-4/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#4156] / [Intel XE#7425])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-4/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [PASS][9] -> [FAIL][10] ([Intel XE#301] / [Intel XE#3149]) +2 other tests fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#7178] / [Intel XE#7351])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#7061])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#4141])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2311]) +8 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2350] / [Intel XE#7503])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-1/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-move:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2313]) +10 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-8/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-move.html

  * igt@kms_pm_dc@dc3co-framedrop-check@pr-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#8395] / [Intel XE#8396])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-5/igt@kms_pm_dc@dc3co-framedrop-check@pr-xrgb8888.html

  * igt@kms_pm_dc@dc3co-framedrop-check@psr2-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#8396]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-5/igt@kms_pm_dc@dc3co-framedrop-check@psr2-xrgb8888.html

  * igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#1489]) +2 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-4/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@fbc-pr-sprite-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-3/igt@kms_psr@fbc-pr-sprite-plane-onoff.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#3904] / [Intel XE#7342])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-8/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          NOTRUN -> [FAIL][22] ([Intel XE#1729] / [Intel XE#7424])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-bmg:          [PASS][23] -> [FAIL][24] ([Intel XE#7992])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b/shard-bmg-1/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-7/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind-imm:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#8374]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-4/igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind-imm.html

  * igt@xe_exec_multi_queue@many-queues-close-fd-smem:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#8364]) +3 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-4/igt@xe_exec_multi_queue@many-queues-close-fd-smem.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#8378]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-4/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate.html

  * igt@xe_fault_injection@inject-fault-probe-function-guc_wait_ucode:
    - shard-bmg:          [PASS][28] -> [ABORT][29] ([Intel XE#8007])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-guc_wait_ucode.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-9/igt@xe_fault_injection@inject-fault-probe-function-guc_wait_ucode.html

  * igt@xe_multigpu_svm@mgpu-migration-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#6964])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-4/igt@xe_multigpu_svm@mgpu-migration-prefetch.html

  * igt@xe_page_reclaim@prl-max-entries:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#7793]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-3/igt@xe_page_reclaim@prl-max-entries.html

  * igt@xe_prefetch_fault@prefetch-fault-svm:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#7599])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-1/igt@xe_prefetch_fault@prefetch-fault-svm.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#944])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-8/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotunbind-rebind-with-load:
    - shard-bmg:          [SKIP][34] ([Intel XE#8749]) -> [PASS][35]
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b/shard-bmg-5/igt@core_hotunplug@hotunbind-rebind-with-load.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-5/igt@core_hotunplug@hotunbind-rebind-with-load.html

  * igt@kms_atomic_transition@plane-all-transition:
    - shard-bmg:          [DMESG-FAIL][36] -> [PASS][37]
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b/shard-bmg-5/igt@kms_atomic_transition@plane-all-transition.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-5/igt@kms_atomic_transition@plane-all-transition.html

  * igt@kms_atomic_transition@plane-all-transition@pipe-b-hdmi-a-3:
    - shard-bmg:          [DMESG-FAIL][38] ([Intel XE#7774]) -> [PASS][39]
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b/shard-bmg-5/igt@kms_atomic_transition@plane-all-transition@pipe-b-hdmi-a-3.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-5/igt@kms_atomic_transition@plane-all-transition@pipe-b-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [INCOMPLETE][40] ([Intel XE#7084] / [Intel XE#8150]) -> [PASS][41] +1 other test pass
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [FAIL][42] ([Intel XE#7809]) -> [PASS][43]
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_flip@2x-plain-flip-ts-check@ac-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][44] ([Intel XE#6266]) -> [PASS][45] +1 other test pass
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b/shard-bmg-10/igt@kms_flip@2x-plain-flip-ts-check@ac-dp2-hdmi-a3.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check@ac-dp2-hdmi-a3.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-bmg:          [SKIP][46] ([Intel XE#8710]) -> [PASS][47]
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b/shard-bmg-5/igt@kms_pm_rpm@modeset-non-lpsp.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-5/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][48] ([Intel XE#6321] / [Intel XE#8355]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-small.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_system_allocator@threads-many-large-mmap-new-huge-nomemset:
    - shard-bmg:          [INCOMPLETE][50] ([Intel XE#8159]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b/shard-bmg-9/igt@xe_exec_system_allocator@threads-many-large-mmap-new-huge-nomemset.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-1/igt@xe_exec_system_allocator@threads-many-large-mmap-new-huge-nomemset.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:
    - shard-bmg:          [SKIP][52] ([Intel XE#8589]) -> [PASS][53] +115 other tests pass
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html

  * igt@xe_gt_freq@freq_suspend:
    - shard-bmg:          [ABORT][54] ([Intel XE#9093]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b/shard-bmg-4/igt@xe_gt_freq@freq_suspend.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-3/igt@xe_gt_freq@freq_suspend.html

  
#### Warnings ####

  * igt@kms_big_fb@y-tiled-16bpp-rotate-0:
    - shard-bmg:          [SKIP][56] ([Intel XE#8589]) -> [SKIP][57] ([Intel XE#1124]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b/shard-bmg-5/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-5/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p:
    - shard-bmg:          [SKIP][58] ([Intel XE#8589]) -> [SKIP][59] ([Intel XE#7679])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-target-3840x2160p:
    - shard-bmg:          [SKIP][60] ([Intel XE#8589]) -> [SKIP][61] ([Intel XE#367])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b/shard-bmg-5/igt@kms_bw@linear-tiling-4-displays-target-3840x2160p.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-5/igt@kms_bw@linear-tiling-4-displays-target-3840x2160p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          [SKIP][62] ([Intel XE#8589]) -> [SKIP][63] ([Intel XE#3432])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_cdclk@mode-transition:
    - shard-bmg:          [SKIP][64] ([Intel XE#8589]) -> [SKIP][65] ([Intel XE#2724] / [Intel XE#7449])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b/shard-bmg-5/igt@kms_cdclk@mode-transition.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-5/igt@kms_cdclk@mode-transition.html

  * igt@kms_chamelium_hpd@dp-hpd:
    - shard-bmg:          [SKIP][66] ([Intel XE#8589]) -> [SKIP][67] ([Intel XE#2252]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b/shard-bmg-5/igt@kms_chamelium_hpd@dp-hpd.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-5/igt@kms_chamelium_hpd@dp-hpd.html

  * igt@kms_content_protection@lic-type-0-hdcp14:
    - shard-bmg:          [SKIP][68] ([Intel XE#8589]) -> [FAIL][69] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b/shard-bmg-5/igt@kms_content_protection@lic-type-0-hdcp14.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-5/igt@kms_content_protection@lic-type-0-hdcp14.html

  * igt@kms_cursor_crc@cursor-sliding-64x21:
    - shard-bmg:          [SKIP][70] ([Intel XE#8589]) -> [SKIP][71] ([Intel XE#2320]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-64x21.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-64x21.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-bmg:          [SKIP][72] ([Intel XE#8589]) -> [SKIP][73] ([Intel XE#8265]) +1 other test skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b/shard-bmg-5/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-5/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-lnl:          [FAIL][74] ([Intel XE#301]) -> [FAIL][75] ([Intel XE#301] / [Intel XE#3149])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-bmg:          [SKIP][76] ([Intel XE#8589]) -> [SKIP][77] ([Intel XE#7178] / [Intel XE#7351])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][78] ([Intel XE#8589]) -> [SKIP][79] ([Intel XE#2311]) +8 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-mmap-wc.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-mmap-wc:
    - shard-bmg:          [SKIP][80] ([Intel XE#8589]) -> [SKIP][81] ([Intel XE#7061])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b/shard-bmg-5/igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-mmap-wc.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt:
    - shard-bmg:          [SKIP][82] ([Intel XE#8589]) -> [SKIP][83] ([Intel XE#4141]) +3 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][84] ([Intel XE#8589]) -> [SKIP][85] ([Intel XE#2313]) +7 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-move.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-move.html

  * igt@kms_pm_dc@dc3co-framedrop-check:
    - shard-bmg:          [SKIP][86] ([Intel XE#8589]) -> [SKIP][87] ([Intel XE#8395] / [Intel XE#8396])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b/shard-bmg-5/igt@kms_pm_dc@dc3co-framedrop-check.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-5/igt@kms_pm_dc@dc3co-framedrop-check.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:
    - shard-bmg:          [SKIP][88] ([Intel XE#8589]) -> [SKIP][89] ([Intel XE#1489])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b/shard-bmg-5/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-5/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr@pr-sprite-blt:
    - shard-bmg:          [SKIP][90] ([Intel XE#8589]) -> [SKIP][91] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b/shard-bmg-5/igt@kms_psr@pr-sprite-blt.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-5/igt@kms_psr@pr-sprite-blt.html

  * igt@kms_sharpness_filter@invalid-filter-with-scaler:
    - shard-bmg:          [SKIP][92] ([Intel XE#8589]) -> [SKIP][93] ([Intel XE#6503]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b/shard-bmg-5/igt@kms_sharpness_filter@invalid-filter-with-scaler.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-5/igt@kms_sharpness_filter@invalid-filter-with-scaler.html

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate-race:
    - shard-bmg:          [SKIP][94] ([Intel XE#8589]) -> [SKIP][95] ([Intel XE#2322] / [Intel XE#7372])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b/shard-bmg-5/igt@xe_exec_basic@multigpu-once-userptr-invalidate-race.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-5/igt@xe_exec_basic@multigpu-once-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-multi-queue-imm:
    - shard-bmg:          [SKIP][96] ([Intel XE#8589]) -> [SKIP][97] ([Intel XE#8374]) +2 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b/shard-bmg-5/igt@xe_exec_fault_mode@many-multi-queue-imm.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-5/igt@xe_exec_fault_mode@many-multi-queue-imm.html

  * igt@xe_exec_multi_queue@many-execs-preempt-mode-dyn-priority:
    - shard-bmg:          [SKIP][98] ([Intel XE#8589]) -> [SKIP][99] ([Intel XE#8364]) +4 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b/shard-bmg-5/igt@xe_exec_multi_queue@many-execs-preempt-mode-dyn-priority.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-5/igt@xe_exec_multi_queue@many-execs-preempt-mode-dyn-priority.html

  * igt@xe_exec_reset@multi-queue-cancel:
    - shard-bmg:          [SKIP][100] ([Intel XE#8589]) -> [SKIP][101] ([Intel XE#8369])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b/shard-bmg-5/igt@xe_exec_reset@multi-queue-cancel.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-5/igt@xe_exec_reset@multi-queue-cancel.html

  * igt@xe_exec_threads@threads-multi-queue-cm-fd-basic:
    - shard-bmg:          [SKIP][102] ([Intel XE#8589]) -> [SKIP][103] ([Intel XE#8378]) +1 other test skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-cm-fd-basic.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-cm-fd-basic.html

  * igt@xe_peer2peer@read:
    - shard-bmg:          [SKIP][104] ([Intel XE#6953] / [Intel XE#7326] / [Intel XE#7353]) -> [SKIP][105] ([Intel XE#2427] / [Intel XE#6953] / [Intel XE#7326] / [Intel XE#7353])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b/shard-bmg-5/igt@xe_peer2peer@read.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-5/igt@xe_peer2peer@read.html

  * igt@xe_query@multigpu-query-gt-list:
    - shard-bmg:          [SKIP][106] ([Intel XE#8589]) -> [SKIP][107] ([Intel XE#944])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b/shard-bmg-5/igt@xe_query@multigpu-query-gt-list.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-5/igt@xe_query@multigpu-query-gt-list.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760
  [Intel XE#6266]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7326]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7353]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425
  [Intel XE#7449]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449
  [Intel XE#7503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7503
  [Intel XE#7599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7774]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7809]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7809
  [Intel XE#7992]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
  [Intel XE#8159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395
  [Intel XE#8396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396
  [Intel XE#8589]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589
  [Intel XE#8710]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8710
  [Intel XE#8749]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8749
  [Intel XE#9093]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9093
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b -> xe-pw-173177v1

  IGT_9079: 9079
  xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b: c53467440a5196138d2d6610e269a43b6b47bf6b
  xe-pw-173177v1: 173177v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/index.html

--===============4118391712781470525==
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
<tr><td><b>Series:</b></td><td>Use SIG_ID logs for GuC component</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/173177/">https://patchwork.freedesktop.org/series/173177/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b_FULL -&gt; xe-pw-173177v1_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-173177v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b/shard-lnl-3/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-lnl-5/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760">Intel XE#4760</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-4/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-4/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-5/igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-4/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-4/igt@kms_fbcon_fbt@fbc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156">Intel XE#4156</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425">Intel XE#7425</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-1/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350">Intel XE#2350</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7503">Intel XE#7503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-8/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-framedrop-check@pr-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-5/igt@kms_pm_dc@dc3co-framedrop-check@pr-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395">Intel XE#8395</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-framedrop-check@psr2-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-5/igt@kms_pm_dc@dc3co-framedrop-check@psr2-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-4/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-3/igt@kms_psr@fbc-pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-8/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b/shard-bmg-1/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-7/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992">Intel XE#7992</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind-imm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-4/igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-close-fd-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-4/igt@xe_exec_multi_queue@many-queues-close-fd-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-4/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-guc_wait_ucode:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-guc_wait_ucode.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-9/igt@xe_fault_injection@inject-fault-probe-function-guc_wait_ucode.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-migration-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-4/igt@xe_multigpu_svm@mgpu-migration-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@prl-max-entries:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-3/igt@xe_page_reclaim@prl-max-entries.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_prefetch_fault@prefetch-fault-svm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-1/igt@xe_prefetch_fault@prefetch-fault-svm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599">Intel XE#7599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-8/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunbind-rebind-with-load:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b/shard-bmg-5/igt@core_hotunplug@hotunbind-rebind-with-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8749">Intel XE#8749</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-5/igt@core_hotunplug@hotunbind-rebind-with-load.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b/shard-bmg-5/igt@kms_atomic_transition@plane-all-transition.html">DMESG-FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-5/igt@kms_atomic_transition@plane-all-transition.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b/shard-bmg-5/igt@kms_atomic_transition@plane-all-transition@pipe-b-hdmi-a-3.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774">Intel XE#7774</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-5/igt@kms_atomic_transition@plane-all-transition@pipe-b-hdmi-a-3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7809">Intel XE#7809</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b/shard-bmg-10/igt@kms_flip@2x-plain-flip-ts-check@ac-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266">Intel XE#6266</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check@ac-dp2-hdmi-a3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b/shard-bmg-5/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8710">Intel XE#8710</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-5/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355">Intel XE#8355</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-new-huge-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b/shard-bmg-9/igt@xe_exec_system_allocator@threads-many-large-mmap-new-huge-nomemset.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159">Intel XE#8159</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-1/igt@xe_exec_system_allocator@threads-many-large-mmap-new-huge-nomemset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html">PASS</a> +115 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b/shard-bmg-4/igt@xe_gt_freq@freq_suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9093">Intel XE#9093</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-3/igt@xe_gt_freq@freq_suspend.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b/shard-bmg-5/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-5/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b/shard-bmg-5/igt@kms_bw@linear-tiling-4-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-5/igt@kms_bw@linear-tiling-4-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b/shard-bmg-5/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-5/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449">Intel XE#7449</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b/shard-bmg-5/igt@kms_chamelium_hpd@dp-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-5/igt@kms_chamelium_hpd@dp-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0-hdcp14:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b/shard-bmg-5/igt@kms_content_protection@lic-type-0-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-5/igt@kms_content_protection@lic-type-0-hdcp14.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b/shard-bmg-5/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-5/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b/shard-bmg-5/igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-framedrop-check:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b/shard-bmg-5/igt@kms_pm_dc@dc3co-framedrop-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-5/igt@kms_pm_dc@dc3co-framedrop-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395">Intel XE#8395</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b/shard-bmg-5/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-5/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b/shard-bmg-5/igt@kms_psr@pr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-5/igt@kms_psr@pr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaler:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b/shard-bmg-5/igt@kms_sharpness_filter@invalid-filter-with-scaler.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-5/igt@kms_sharpness_filter@invalid-filter-with-scaler.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b/shard-bmg-5/igt@xe_exec_basic@multigpu-once-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-5/igt@xe_exec_basic@multigpu-once-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-imm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b/shard-bmg-5/igt@xe_exec_fault_mode@many-multi-queue-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-5/igt@xe_exec_fault_mode@many-multi-queue-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-execs-preempt-mode-dyn-priority:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b/shard-bmg-5/igt@xe_exec_multi_queue@many-execs-preempt-mode-dyn-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-5/igt@xe_exec_multi_queue@many-execs-preempt-mode-dyn-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-cancel:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b/shard-bmg-5/igt@xe_exec_reset@multi-queue-cancel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-5/igt@xe_exec_reset@multi-queue-cancel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-fd-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-cm-fd-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-cm-fd-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b/shard-bmg-5/igt@xe_peer2peer@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953">Intel XE#6953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326">Intel XE#7326</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353">Intel XE#7353</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-5/igt@xe_peer2peer@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">Intel XE#2427</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953">Intel XE#6953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326">Intel XE#7326</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353">Intel XE#7353</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-gt-list:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b/shard-bmg-5/igt@xe_query@multigpu-query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v1/shard-bmg-5/igt@xe_query@multigpu-query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b -&gt; xe-pw-173177v1</li>
</ul>
<p>IGT_9079: 9079<br />
  xe-5671-c53467440a5196138d2d6610e269a43b6b47bf6b: c53467440a5196138d2d6610e269a43b6b47bf6b<br />
  xe-pw-173177v1: 173177v1</p>

</body>
</html>

--===============4118391712781470525==--
