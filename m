Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 413FBC5DF6B
	for <intel-xe@archiver.kernel.org>; Sat, 21 Feb 2026 03:08:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBD7210E0FF;
	Sat, 21 Feb 2026 03:08:02 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C1CB10E03B;
 Sat, 21 Feb 2026 03:08:01 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7284569345209192733=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/i915/vrr=3A_partial_re?=
 =?utf-8?q?vert_of_dda7dcd9da73c5327aef42b89f0519bb51e84217?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Benjamin Tissoires" <bentiss@kernel.org>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 21 Feb 2026 03:08:01 -0000
Message-ID: <177164328135.270871.559341417835054915@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260218-wip-fix-iris-plus-v1-1-e6b969defd6d@kernel.org>
In-Reply-To: <20260218-wip-fix-iris-plus-v1-1-e6b969defd6d@kernel.org>
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

--===============7284569345209192733==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/vrr: partial revert of dda7dcd9da73c5327aef42b89f0519bb51e84217
URL   : https://patchwork.freedesktop.org/series/161891/
State : success

== Summary ==

CI Bug Log - changes from xe-4579-84d640df1ee7e526fd84de4cc1b8bb1e9d391ee1_FULL -> xe-pw-161891v1_FULL
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

  New tests have been introduced between xe-4579-84d640df1ee7e526fd84de4cc1b8bb1e9d391ee1_FULL and xe-pw-161891v1_FULL:

### New IGT tests (10) ###

  * igt@kms_dp_link_training@non-uhbr-mst:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_dp_link_training@non-uhbr-sst:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.23] s

  * igt@kms_dp_link_training@uhbr-mst:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_dp_link_training@uhbr-sst:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 1.16] s

  * igt@kms_flip@flip-vs-panning-vs-hang@d-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.72] s

  * igt@kms_flip@flip-vs-rmfb@d-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [3.98] s

  * igt@kms_flip@nonexisting-fb@d-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.23] s

  * igt@kms_setmode@basic@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.12] s

  * igt@kms_setmode@basic@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.12] s

  * igt@xe_pmu@gt-c6-idle:
    - Statuses : 2 pass(s)
    - Exec time: [4.00, 4.01] s

  

Known issues
------------

  Here are the changes found in xe-pw-161891v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-d-hdmi-a-3:
    - shard-bmg:          [PASS][1] -> [INCOMPLETE][2] ([Intel XE#4912]) +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4579-84d640df1ee7e526fd84de4cc1b8bb1e9d391ee1/shard-bmg-7/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-hdmi-a-3.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/shard-bmg-6/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-hdmi-a-3.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#2327]) +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/shard-bmg-9/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#1124]) +2 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/shard-bmg-9/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2652]) +7 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/shard-bmg-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#2887]) +4 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/shard-bmg-9/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2252]) +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/shard-bmg-2/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-1:
    - shard-bmg:          NOTRUN -> [FAIL][8] ([Intel XE#3304])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/shard-bmg-5/igt@kms_content_protection@lic-type-0@pipe-a-dp-1.html

  * igt@kms_content_protection@uevent@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][9] ([Intel XE#6707])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/shard-bmg-2/igt@kms_content_protection@uevent@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2320]) +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/shard-bmg-9/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2321]) +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/shard-bmg-9/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2244])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/shard-bmg-9/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [PASS][13] -> [FAIL][14] ([Intel XE#301]) +1 other test fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4579-84d640df1ee7e526fd84de4cc1b8bb1e9d391ee1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#7178]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#4141])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#7061])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2311]) +3 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2313]) +4 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#870])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/shard-bmg-9/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#1406] / [Intel XE#1489]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/shard-bmg-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr@pr-sprite-render:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/shard-bmg-9/igt@kms_psr@pr-sprite-render.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#1435])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/shard-bmg-9/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_sharpness_filter@filter-tap:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#6503])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/shard-bmg-9/igt@kms_sharpness_filter@filter-tap.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#1499]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/shard-bmg-9/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@xe_eudebug@vm-bind-clear-faultable:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#4837])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/shard-bmg-9/igt@xe_eudebug@vm-bind-clear-faultable.html

  * igt@xe_evict@evict-cm-threads-small-multi-queue:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#7140])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/shard-bmg-9/igt@xe_evict@evict-cm-threads-small-multi-queue.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2322])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/shard-bmg-2/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html

  * igt@xe_exec_fault_mode@once-multi-queue-rebind-imm:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#7136]) +3 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/shard-bmg-9/igt@xe_exec_fault_mode@once-multi-queue-rebind-imm.html

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-dyn-priority-smem:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#6874]) +4 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/shard-bmg-9/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-dyn-priority-smem.html

  * igt@xe_exec_threads@threads-multi-queue-rebind-err:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#7138]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/shard-bmg-9/igt@xe_exec_threads@threads-multi-queue-rebind-err.html

  * igt@xe_mmap@small-bar:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#586])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/shard-bmg-9/igt@xe_mmap@small-bar.html

  * igt@xe_multigpu_svm@mgpu-latency-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#6964])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/shard-bmg-9/igt@xe_multigpu_svm@mgpu-latency-prefetch.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#944])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/shard-bmg-9/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  
#### Possible fixes ####

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs:
    - shard-bmg:          [DMESG-WARN][35] -> [PASS][36] +1 other test pass
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4579-84d640df1ee7e526fd84de4cc1b8bb1e9d391ee1/shard-bmg-2/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/shard-bmg-1/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [FAIL][37] -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4579-84d640df1ee7e526fd84de4cc1b8bb1e9d391ee1/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [FAIL][39] ([Intel XE#301]) -> [PASS][40] +1 other test pass
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4579-84d640df1ee7e526fd84de4cc1b8bb1e9d391ee1/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-bmg:          [INCOMPLETE][41] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][42] +1 other test pass
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4579-84d640df1ee7e526fd84de4cc1b8bb1e9d391ee1/shard-bmg-8/igt@kms_flip@flip-vs-suspend.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/shard-bmg-9/igt@kms_flip@flip-vs-suspend.html

  * igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_create:
    - shard-bmg:          [ABORT][43] -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4579-84d640df1ee7e526fd84de4cc1b8bb1e9d391ee1/shard-bmg-6/igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_create.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/shard-bmg-1/igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_create.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-lnl:          [DMESG-WARN][45] ([Intel XE#7161]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4579-84d640df1ee7e526fd84de4cc1b8bb1e9d391ee1/shard-lnl-4/igt@xe_pm@s4-vm-bind-unbind-all.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/shard-lnl-5/igt@xe_pm@s4-vm-bind-unbind-all.html

  
#### Warnings ####

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][47] ([Intel XE#3544]) -> [SKIP][48] ([Intel XE#3374] / [Intel XE#3544])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4579-84d640df1ee7e526fd84de4cc1b8bb1e9d391ee1/shard-bmg-9/igt@kms_hdr@brightness-with-hdr.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-bmg:          [ABORT][49] ([Intel XE#5466]) -> [ABORT][50] ([Intel XE#5466] / [Intel XE#6652])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4579-84d640df1ee7e526fd84de4cc1b8bb1e9d391ee1/shard-bmg-2/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/shard-bmg-3/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4912
  [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652
  [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#7140]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140
  [Intel XE#7161]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7161
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-4579-84d640df1ee7e526fd84de4cc1b8bb1e9d391ee1 -> xe-pw-161891v1

  IGT_8764: 8764
  xe-4579-84d640df1ee7e526fd84de4cc1b8bb1e9d391ee1: 84d640df1ee7e526fd84de4cc1b8bb1e9d391ee1
  xe-pw-161891v1: 161891v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/index.html

--===============7284569345209192733==
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
<tr><td><b>Series:</b></td><td>drm/i915/vrr: partial revert of dda7dcd9da73c5327aef42b89f0519bb51e84217</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161891/">https://patchwork.freedesktop.org/series/161891/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4579-84d640df1ee7e526fd84de4cc1b8bb1e9d391ee1_FULL -&gt; xe-pw-161891v1_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>New tests</h2>
<p>New tests have been introduced between xe-4579-84d640df1ee7e526fd84de4cc1b8bb1e9d391ee1_FULL and xe-pw-161891v1_FULL:</p>
<h3>New IGT tests (10)</h3>
<ul>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 1.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-vs-hang@d-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb@d-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@nonexisting-fb@d-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.12] s</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@gt-c6-idle:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.00, 4.01] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-161891v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4579-84d640df1ee7e526fd84de4cc1b8bb1e9d391ee1/shard-bmg-7/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-hdmi-a-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/shard-bmg-6/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-hdmi-a-3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4912">Intel XE#4912</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/shard-bmg-9/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/shard-bmg-9/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/shard-bmg-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/shard-bmg-9/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/shard-bmg-2/igt@kms_chamelium_audio@hdmi-audio-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/shard-bmg-5/igt@kms_content_protection@lic-type-0@pipe-a-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/shard-bmg-2/igt@kms_content_protection@uevent@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707">Intel XE#6707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/shard-bmg-9/igt@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/shard-bmg-9/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/shard-bmg-9/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4579-84d640df1ee7e526fd84de4cc1b8bb1e9d391ee1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/shard-bmg-9/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/shard-bmg-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/shard-bmg-9/igt@kms_psr@pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/shard-bmg-9/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-tap:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/shard-bmg-9/igt@kms_sharpness_filter@filter-tap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/shard-bmg-9/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@vm-bind-clear-faultable:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/shard-bmg-9/igt@xe_eudebug@vm-bind-clear-faultable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-small-multi-queue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/shard-bmg-9/igt@xe_evict@evict-cm-threads-small-multi-queue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140">Intel XE#7140</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/shard-bmg-2/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-rebind-imm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/shard-bmg-9/igt@xe_exec_fault_mode@once-multi-queue-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-dyn-priority-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/shard-bmg-9/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-dyn-priority-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-rebind-err:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/shard-bmg-9/igt@xe_exec_threads@threads-multi-queue-rebind-err.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/shard-bmg-9/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/586">Intel XE#586</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-latency-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/shard-bmg-9/igt@xe_multigpu_svm@mgpu-latency-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/shard-bmg-9/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4579-84d640df1ee7e526fd84de4cc1b8bb1e9d391ee1/shard-bmg-2/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/shard-bmg-1/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4579-84d640df1ee7e526fd84de4cc1b8bb1e9d391ee1/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4579-84d640df1ee7e526fd84de4cc1b8bb1e9d391ee1/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4579-84d640df1ee7e526fd84de4cc1b8bb1e9d391ee1/shard-bmg-8/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/shard-bmg-9/igt@kms_flip@flip-vs-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_create:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4579-84d640df1ee7e526fd84de4cc1b8bb1e9d391ee1/shard-bmg-6/igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_create.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/shard-bmg-1/igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_create.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4579-84d640df1ee7e526fd84de4cc1b8bb1e9d391ee1/shard-lnl-4/igt@xe_pm@s4-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7161">Intel XE#7161</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/shard-lnl-5/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4579-84d640df1ee7e526fd84de4cc1b8bb1e9d391ee1/shard-bmg-9/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4579-84d640df1ee7e526fd84de4cc1b8bb1e9d391ee1/shard-bmg-2/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466">Intel XE#5466</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161891v1/shard-bmg-3/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466">Intel XE#5466</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652">Intel XE#6652</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4579-84d640df1ee7e526fd84de4cc1b8bb1e9d391ee1 -&gt; xe-pw-161891v1</li>
</ul>
<p>IGT_8764: 8764<br />
  xe-4579-84d640df1ee7e526fd84de4cc1b8bb1e9d391ee1: 84d640df1ee7e526fd84de4cc1b8bb1e9d391ee1<br />
  xe-pw-161891v1: 161891v1</p>

</body>
</html>

--===============7284569345209192733==--
