Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2C82C43602
	for <intel-xe@archiver.kernel.org>; Mon,  6 Jul 2026 17:31:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ED7E10E3C6;
	Mon,  6 Jul 2026 17:31:22 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B2F910E3C6;
 Mon,  6 Jul 2026 17:31:21 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7951767725687207680=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/xe=3A_Add_debugfs_knob?=
 =?utf-8?q?_to_disable_Mid-Thread_Preemption_per_GT_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Varun Gupta" <varun.gupta@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 06 Jul 2026 17:31:21 -0000
Message-ID: <178335908129.156774.16887037171977015260@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260618042421.483657-1-varun.gupta@intel.com>
In-Reply-To: <20260618042421.483657-1-varun.gupta@intel.com>
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

--===============7951767725687207680==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Add debugfs knob to disable Mid-Thread Preemption per GT (rev4)
URL   : https://patchwork.freedesktop.org/series/168743/
State : success

== Summary ==

CI Bug Log - changes from xe-5345-9179ea89567d036ecc9013cc27af4a367aeb14b9_FULL -> xe-pw-168743v4_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

New tests
---------

  New tests have been introduced between xe-5345-9179ea89567d036ecc9013cc27af4a367aeb14b9_FULL and xe-pw-168743v4_FULL:

### New IGT tests (9) ###

  * igt@kms_flip@blocking-absolute-wf_vblank-interruptible@a-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [4.21] s

  * igt@kms_flip@blocking-absolute-wf_vblank-interruptible@b-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [4.13] s

  * igt@kms_flip@blocking-absolute-wf_vblank-interruptible@c-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [4.13] s

  * igt@kms_flip@flip-vs-rmfb@a-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [4.12] s

  * igt@kms_flip@flip-vs-rmfb@b-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [4.04] s

  * igt@kms_flip@flip-vs-rmfb@c-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [4.05] s

  * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset@a-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [1.00] s

  * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset@b-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [0.85] s

  * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset@c-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [0.85] s

  

Known issues
------------

  Here are the changes found in xe-pw-168743v4_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-lnl:          [PASS][1] -> [FAIL][2] ([Intel XE#3718] / [Intel XE#7265]) +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5345-9179ea89567d036ecc9013cc27af4a367aeb14b9/shard-lnl-8/igt@kms_async_flips@alternate-sync-async-flip.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v4/shard-lnl-7/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#1124])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v4/shard-bmg-10/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_bw@linear-tiling-2-displays-target-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#367])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v4/shard-bmg-10/igt@kms_bw@linear-tiling-2-displays-target-2560x1440p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][5] ([Intel XE#7084] / [Intel XE#8150])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v4/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2.html

  * igt@kms_chamelium_audio@dp-audio-after-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#2252]) +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v4/shard-bmg-10/igt@kms_chamelium_audio@dp-audio-after-suspend.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2325] / [Intel XE#7358])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v4/shard-bmg-10/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2390] / [Intel XE#6974])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v4/shard-bmg-10/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2320]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v4/shard-bmg-10/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2286] / [Intel XE#6035])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v4/shard-bmg-10/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3:
    - shard-bmg:          [PASS][11] -> [FAIL][12] ([Intel XE#3149] / [Intel XE#3321]) +1 other test fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5345-9179ea89567d036ecc9013cc27af4a367aeb14b9/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v4/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [PASS][13] -> [FAIL][14] ([Intel XE#3098] / [Intel XE#3149]) +1 other test fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5345-9179ea89567d036ecc9013cc27af4a367aeb14b9/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v4/shard-bmg-5/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [PASS][15] -> [FAIL][16] ([Intel XE#301])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5345-9179ea89567d036ecc9013cc27af4a367aeb14b9/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v4/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#4141]) +2 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v4/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#7061] / [Intel XE#7356])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v4/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2311]) +8 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v4/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2313]) +12 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v4/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#7061])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v4/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-mmap-wc.html

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#7283])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v4/shard-bmg-10/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-lnl:          [PASS][23] -> [FAIL][24] ([Intel XE#2029] / [Intel XE#7395])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5345-9179ea89567d036ecc9013cc27af4a367aeb14b9/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v4/shard-lnl-8/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_psr@fbc-psr2-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v4/shard-bmg-10/igt@kms_psr@fbc-psr2-suspend.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#3904] / [Intel XE#7342])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v4/shard-bmg-10/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@xe_eudebug@basic-vm-bind-extended-discovery:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#7636]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v4/shard-bmg-10/igt@xe_eudebug@basic-vm-bind-extended-discovery.html

  * igt@xe_exec_basic@multigpu-once-null:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2322] / [Intel XE#7372])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v4/shard-bmg-10/igt@xe_exec_basic@multigpu-once-null.html

  * igt@xe_exec_fault_mode@many-multi-queue-invalid-userptr-fault:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#8374]) +2 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v4/shard-bmg-10/igt@xe_exec_fault_mode@many-multi-queue-invalid-userptr-fault.html

  * igt@xe_exec_multi_queue@two-queues-basic-smem:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#8364]) +4 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v4/shard-bmg-10/igt@xe_exec_multi_queue@two-queues-basic-smem.html

  * igt@xe_exec_system_allocator@twice-large-free-race:
    - shard-lnl:          [PASS][31] -> [ABORT][32] ([Intel XE#8007])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5345-9179ea89567d036ecc9013cc27af4a367aeb14b9/shard-lnl-3/igt@xe_exec_system_allocator@twice-large-free-race.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v4/shard-lnl-8/igt@xe_exec_system_allocator@twice-large-free-race.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#8378])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v4/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-rebind.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
    - shard-bmg:          [PASS][34] -> [ABORT][35] ([Intel XE#8007]) +1 other test abort
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5345-9179ea89567d036ecc9013cc27af4a367aeb14b9/shard-bmg-9/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v4/shard-bmg-9/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html

  * igt@xe_mmap@small-bar:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#586] / [Intel XE#7323] / [Intel XE#7384])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v4/shard-bmg-10/igt@xe_mmap@small-bar.html

  * igt@xe_multigpu_svm@mgpu-latency-copy-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#6964])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v4/shard-bmg-10/igt@xe_multigpu_svm@mgpu-latency-copy-prefetch.html

  * igt@xe_query@multigpu-query-invalid-size:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#944])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v4/shard-bmg-10/igt@xe_query@multigpu-query-invalid-size.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-bmg:          [FAIL][39] ([Intel XE#3718] / [Intel XE#6078]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5345-9179ea89567d036ecc9013cc27af4a367aeb14b9/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v4/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2:
    - shard-bmg:          [FAIL][41] ([Intel XE#6078]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5345-9179ea89567d036ecc9013cc27af4a367aeb14b9/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v4/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2:
    - shard-bmg:          [INCOMPLETE][43] ([Intel XE#7084] / [Intel XE#8150]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5345-9179ea89567d036ecc9013cc27af4a367aeb14b9/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v4/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [FAIL][45] ([Intel XE#7571]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5345-9179ea89567d036ecc9013cc27af4a367aeb14b9/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v4/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@xe_configfs@gt-types-allowed:
    - shard-bmg:          [ABORT][47] ([Intel XE#8007]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5345-9179ea89567d036ecc9013cc27af4a367aeb14b9/shard-bmg-8/igt@xe_configfs@gt-types-allowed.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v4/shard-bmg-10/igt@xe_configfs@gt-types-allowed.html

  
#### Warnings ####

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][49] ([Intel XE#1729] / [Intel XE#7424]) -> [SKIP][50] ([Intel XE#2426] / [Intel XE#5848])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5345-9179ea89567d036ecc9013cc27af4a367aeb14b9/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v4/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][51] ([Intel XE#2509] / [Intel XE#7437]) -> [SKIP][52] ([Intel XE#2426] / [Intel XE#5848])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5345-9179ea89567d036ecc9013cc27af4a367aeb14b9/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v4/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7265
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7323
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7384]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7384
  [Intel XE#7395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7395
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571
  [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-5345-9179ea89567d036ecc9013cc27af4a367aeb14b9 -> xe-pw-168743v4

  IGT_8990: 8990
  xe-5345-9179ea89567d036ecc9013cc27af4a367aeb14b9: 9179ea89567d036ecc9013cc27af4a367aeb14b9
  xe-pw-168743v4: 168743v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v4/index.html

--===============7951767725687207680==
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
<tr><td><b>Series:</b></td><td>drm/xe: Add debugfs knob to disable Mid-Thread Preemption per GT (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/168743/">https://patchwork.freedesktop.org/series/168743/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5345-9179ea89567d036ecc9013cc27af4a367aeb14b9_FULL -&gt; xe-pw-168743v4_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>New tests</h2>
<p>New tests have been introduced between xe-5345-9179ea89567d036ecc9013cc27af4a367aeb14b9_FULL and xe-pw-168743v4_FULL:</p>
<h3>New IGT tests (9)</h3>
<ul>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank-interruptible@a-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank-interruptible@b-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank-interruptible@c-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb@a-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb@b-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb@c-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset@a-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset@b-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset@c-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.85] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-168743v4_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5345-9179ea89567d036ecc9013cc27af4a367aeb14b9/shard-lnl-8/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v4/shard-lnl-7/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7265">Intel XE#7265</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v4/shard-bmg-10/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v4/shard-bmg-10/igt@kms_bw@linear-tiling-2-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v4/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio-after-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v4/shard-bmg-10/igt@kms_chamelium_audio@dp-audio-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v4/shard-bmg-10/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v4/shard-bmg-10/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v4/shard-bmg-10/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v4/shard-bmg-10/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035">Intel XE#6035</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5345-9179ea89567d036ecc9013cc27af4a367aeb14b9/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v4/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5345-9179ea89567d036ecc9013cc27af4a367aeb14b9/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v4/shard-bmg-5/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5345-9179ea89567d036ecc9013cc27af4a367aeb14b9/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v4/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v4/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v4/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v4/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v4/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v4/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v4/shard-bmg-10/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5345-9179ea89567d036ecc9013cc27af4a367aeb14b9/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v4/shard-lnl-8/igt@kms_pm_dc@deep-pkgc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029">Intel XE#2029</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7395">Intel XE#7395</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v4/shard-bmg-10/igt@kms_psr@fbc-psr2-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v4/shard-bmg-10/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-extended-discovery:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v4/shard-bmg-10/igt@xe_eudebug@basic-vm-bind-extended-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v4/shard-bmg-10/igt@xe_exec_basic@multigpu-once-null.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-invalid-userptr-fault:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v4/shard-bmg-10/igt@xe_exec_fault_mode@many-multi-queue-invalid-userptr-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-basic-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v4/shard-bmg-10/igt@xe_exec_multi_queue@two-queues-basic-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-free-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5345-9179ea89567d036ecc9013cc27af4a367aeb14b9/shard-lnl-3/igt@xe_exec_system_allocator@twice-large-free-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v4/shard-lnl-8/igt@xe_exec_system_allocator@twice-large-free-race.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v4/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5345-9179ea89567d036ecc9013cc27af4a367aeb14b9/shard-bmg-9/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v4/shard-bmg-9/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v4/shard-bmg-10/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/586">Intel XE#586</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7323">Intel XE#7323</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7384">Intel XE#7384</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-latency-copy-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v4/shard-bmg-10/igt@xe_multigpu_svm@mgpu-latency-copy-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v4/shard-bmg-10/igt@xe_query@multigpu-query-invalid-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5345-9179ea89567d036ecc9013cc27af4a367aeb14b9/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v4/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5345-9179ea89567d036ecc9013cc27af4a367aeb14b9/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v4/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5345-9179ea89567d036ecc9013cc27af4a367aeb14b9/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v4/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5345-9179ea89567d036ecc9013cc27af4a367aeb14b9/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571">Intel XE#7571</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v4/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_configfs@gt-types-allowed:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5345-9179ea89567d036ecc9013cc27af4a367aeb14b9/shard-bmg-8/igt@xe_configfs@gt-types-allowed.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v4/shard-bmg-10/igt@xe_configfs@gt-types-allowed.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5345-9179ea89567d036ecc9013cc27af4a367aeb14b9/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v4/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5345-9179ea89567d036ecc9013cc27af4a367aeb14b9/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437">Intel XE#7437</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v4/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5345-9179ea89567d036ecc9013cc27af4a367aeb14b9 -&gt; xe-pw-168743v4</li>
</ul>
<p>IGT_8990: 8990<br />
  xe-5345-9179ea89567d036ecc9013cc27af4a367aeb14b9: 9179ea89567d036ecc9013cc27af4a367aeb14b9<br />
  xe-pw-168743v4: 168743v4</p>

</body>
</html>

--===============7951767725687207680==--
