Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 731C8C5AD55
	for <intel-xe@archiver.kernel.org>; Mon, 10 Aug 2026 13:16:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25FCB10E846;
	Mon, 10 Aug 2026 13:16:31 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 625A410E846;
 Mon, 10 Aug 2026 13:16:30 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1879245936008691313=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_KUnit_test_for_VF_provisio?=
 =?utf-8?q?ning_error_handling_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 10 Aug 2026 13:16:30 -0000
Message-ID: <178636779039.34770.15803589750639417747@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260810101428.1009573-8-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20260810101428.1009573-8-satyanarayana.k.v.p@intel.com>
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

--===============1879245936008691313==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: KUnit test for VF provisioning error handling (rev5)
URL   : https://patchwork.freedesktop.org/series/170198/
State : failure

== Summary ==

CI Bug Log - changes from xe-5569-2de1755571efc432ef6cc8512d080f68203a1d3a_FULL -> xe-pw-170198v5_FULL
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with xe-pw-170198v5_FULL need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-170198v5_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-170198v5_FULL:

### IGT changes ###

#### Warnings ####

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-bmg:          [SKIP][1] ([Intel XE#1489]) -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5569-2de1755571efc432ef6cc8512d080f68203a1d3a/shard-bmg-7/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v5/shard-bmg-5/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  
New tests
---------

  New tests have been introduced between xe-5569-2de1755571efc432ef6cc8512d080f68203a1d3a_FULL and xe-pw-170198v5_FULL:

### New IGT tests (1) ###

  * igt@kms_pipe_crc_basic:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in xe-pw-170198v5_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-bmg:          [PASS][3] -> [FAIL][4] ([Intel XE#3718] / [Intel XE#6078])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5569-2de1755571efc432ef6cc8512d080f68203a1d3a/shard-bmg-9/igt@kms_async_flips@alternate-sync-async-flip.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v5/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-lnl:          [PASS][5] -> [FAIL][6] ([Intel XE#3718] / [Intel XE#7265])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5569-2de1755571efc432ef6cc8512d080f68203a1d3a/shard-lnl-5/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v5/shard-lnl-3/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-edp-1:
    - shard-lnl:          [PASS][7] -> [FAIL][8] ([Intel XE#7265])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5569-2de1755571efc432ef6cc8512d080f68203a1d3a/shard-lnl-5/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-edp-1.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v5/shard-lnl-3/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-edp-1.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-2:
    - shard-bmg:          [PASS][9] -> [FAIL][10] ([Intel XE#6078])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5569-2de1755571efc432ef6cc8512d080f68203a1d3a/shard-bmg-9/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-2.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v5/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [PASS][11] -> [INCOMPLETE][12] ([Intel XE#7084] / [Intel XE#8150]) +1 other test incomplete
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5569-2de1755571efc432ef6cc8512d080f68203a1d3a/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v5/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:
    - shard-bmg:          [PASS][13] -> [FAIL][14] ([Intel XE#3321]) +1 other test fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5569-2de1755571efc432ef6cc8512d080f68203a1d3a/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v5/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
    - shard-lnl:          [PASS][15] -> [FAIL][16] ([Intel XE#301])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5569-2de1755571efc432ef6cc8512d080f68203a1d3a/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v5/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-lnl:          [PASS][17] -> [FAIL][18] ([Intel XE#301] / [Intel XE#3149]) +1 other test fail
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5569-2de1755571efc432ef6cc8512d080f68203a1d3a/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v5/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@xe_exec_system_allocator@many-large-execqueues-new-race-nomemset:
    - shard-bmg:          [PASS][19] -> [SKIP][20] ([Intel XE#8589]) +47 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5569-2de1755571efc432ef6cc8512d080f68203a1d3a/shard-bmg-7/igt@xe_exec_system_allocator@many-large-execqueues-new-race-nomemset.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v5/shard-bmg-5/igt@xe_exec_system_allocator@many-large-execqueues-new-race-nomemset.html

  * igt@xe_fault_injection@inject-fault-probe-function-guc_wait_ucode:
    - shard-bmg:          [PASS][21] -> [ABORT][22] ([Intel XE#8007])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5569-2de1755571efc432ef6cc8512d080f68203a1d3a/shard-bmg-9/igt@xe_fault_injection@inject-fault-probe-function-guc_wait_ucode.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v5/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-guc_wait_ucode.html

  * igt@xe_wedged@basic-wedged:
    - shard-lnl:          [PASS][23] -> [ABORT][24] ([Intel XE#3119])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5569-2de1755571efc432ef6cc8512d080f68203a1d3a/shard-lnl-3/igt@xe_wedged@basic-wedged.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v5/shard-lnl-2/igt@xe_wedged@basic-wedged.html

  
#### Possible fixes ####

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][25] ([Intel XE#6321] / [Intel XE#8355]) -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5569-2de1755571efc432ef6cc8512d080f68203a1d3a/shard-bmg-7/igt@xe_evict@evict-mixed-many-threads-small.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v5/shard-bmg-10/igt@xe_evict@evict-mixed-many-threads-small.html

  
#### Warnings ####

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-bmg:          [FAIL][27] ([Intel XE#3718] / [Intel XE#6078]) -> [SKIP][28] ([Intel XE#8589])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5569-2de1755571efc432ef6cc8512d080f68203a1d3a/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v5/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_chamelium_audio@hdmi-audio-after-suspend:
    - shard-bmg:          [SKIP][29] ([Intel XE#2252]) -> [SKIP][30] ([Intel XE#8589])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5569-2de1755571efc432ef6cc8512d080f68203a1d3a/shard-bmg-7/igt@kms_chamelium_audio@hdmi-audio-after-suspend.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v5/shard-bmg-5/igt@kms_chamelium_audio@hdmi-audio-after-suspend.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][31] ([Intel XE#2286] / [Intel XE#6035]) -> [SKIP][32] ([Intel XE#8589])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5569-2de1755571efc432ef6cc8512d080f68203a1d3a/shard-bmg-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v5/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][33] ([Intel XE#2311]) -> [SKIP][34] ([Intel XE#8589]) +4 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5569-2de1755571efc432ef6cc8512d080f68203a1d3a/shard-bmg-7/igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-pri-indfb-draw-render.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v5/shard-bmg-5/igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-render:
    - shard-bmg:          [SKIP][35] ([Intel XE#7061]) -> [SKIP][36] ([Intel XE#8589])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5569-2de1755571efc432ef6cc8512d080f68203a1d3a/shard-bmg-7/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-render.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v5/shard-bmg-5/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][37] ([Intel XE#2313]) -> [SKIP][38] ([Intel XE#8589]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5569-2de1755571efc432ef6cc8512d080f68203a1d3a/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v5/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][39] ([Intel XE#3544]) -> [SKIP][40] ([Intel XE#3374] / [Intel XE#3544])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5569-2de1755571efc432ef6cc8512d080f68203a1d3a/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v5/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier:
    - shard-bmg:          [SKIP][41] ([Intel XE#7283]) -> [SKIP][42] ([Intel XE#8589])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5569-2de1755571efc432ef6cc8512d080f68203a1d3a/shard-bmg-7/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v5/shard-bmg-5/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-bmg:          [SKIP][43] ([Intel XE#1489]) -> [SKIP][44] ([Intel XE#8589])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5569-2de1755571efc432ef6cc8512d080f68203a1d3a/shard-bmg-7/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v5/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-bmg:          [SKIP][45] ([Intel XE#2330] / [Intel XE#5813]) -> [SKIP][46] ([Intel XE#8589])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5569-2de1755571efc432ef6cc8512d080f68203a1d3a/shard-bmg-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v5/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][47] ([Intel XE#2426] / [Intel XE#5848]) -> [FAIL][48] ([Intel XE#1729] / [Intel XE#7424])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5569-2de1755571efc432ef6cc8512d080f68203a1d3a/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v5/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-bmg:          [SKIP][49] ([Intel XE#1499]) -> [SKIP][50] ([Intel XE#8589])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5569-2de1755571efc432ef6cc8512d080f68203a1d3a/shard-bmg-7/igt@kms_vrr@seamless-rr-switch-vrr.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v5/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:
    - shard-bmg:          [SKIP][51] ([Intel XE#2322] / [Intel XE#7372]) -> [SKIP][52] ([Intel XE#8589])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5569-2de1755571efc432ef6cc8512d080f68203a1d3a/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v5/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue:
    - shard-bmg:          [SKIP][53] ([Intel XE#8374]) -> [SKIP][54] ([Intel XE#8589])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5569-2de1755571efc432ef6cc8512d080f68203a1d3a/shard-bmg-7/igt@xe_exec_fault_mode@many-execqueues-multi-queue.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v5/shard-bmg-5/igt@xe_exec_fault_mode@many-execqueues-multi-queue.html

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-userptr-invalidate:
    - shard-bmg:          [SKIP][55] ([Intel XE#8364]) -> [SKIP][56] ([Intel XE#8589])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5569-2de1755571efc432ef6cc8512d080f68203a1d3a/shard-bmg-7/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-userptr-invalidate.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v5/shard-bmg-5/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-userptr-invalidate.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-rebind:
    - shard-bmg:          [SKIP][57] ([Intel XE#8378]) -> [SKIP][58] ([Intel XE#8589])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5569-2de1755571efc432ef6cc8512d080f68203a1d3a/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-mixed-rebind.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v5/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-mixed-rebind.html

  
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3119]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3119
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7265
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
  [Intel XE#8355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8589]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589


Build changes
-------------

  * Linux: xe-5569-2de1755571efc432ef6cc8512d080f68203a1d3a -> xe-pw-170198v5

  IGT_9047: 9047
  xe-5569-2de1755571efc432ef6cc8512d080f68203a1d3a: 2de1755571efc432ef6cc8512d080f68203a1d3a
  xe-pw-170198v5: 170198v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v5/index.html

--===============1879245936008691313==
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
<tr><td><b>Series:</b></td><td>KUnit test for VF provisioning error handling (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/170198/">https://patchwork.freedesktop.org/series/170198/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5569-2de1755571efc432ef6cc8512d080f68203a1d3a_FULL -&gt; xe-pw-170198v5_FULL</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with xe-pw-170198v5_FULL need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-170198v5_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-170198v5_FULL:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5569-2de1755571efc432ef6cc8512d080f68203a1d3a/shard-bmg-7/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v5/shard-bmg-5/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-5569-2de1755571efc432ef6cc8512d080f68203a1d3a_FULL and xe-pw-170198v5_FULL:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_pipe_crc_basic:<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-170198v5_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5569-2de1755571efc432ef6cc8512d080f68203a1d3a/shard-bmg-9/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v5/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5569-2de1755571efc432ef6cc8512d080f68203a1d3a/shard-lnl-5/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v5/shard-lnl-3/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7265">Intel XE#7265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5569-2de1755571efc432ef6cc8512d080f68203a1d3a/shard-lnl-5/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v5/shard-lnl-3/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7265">Intel XE#7265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5569-2de1755571efc432ef6cc8512d080f68203a1d3a/shard-bmg-9/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v5/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5569-2de1755571efc432ef6cc8512d080f68203a1d3a/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v5/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5569-2de1755571efc432ef6cc8512d080f68203a1d3a/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v5/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5569-2de1755571efc432ef6cc8512d080f68203a1d3a/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v5/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5569-2de1755571efc432ef6cc8512d080f68203a1d3a/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v5/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-new-race-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5569-2de1755571efc432ef6cc8512d080f68203a1d3a/shard-bmg-7/igt@xe_exec_system_allocator@many-large-execqueues-new-race-nomemset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v5/shard-bmg-5/igt@xe_exec_system_allocator@many-large-execqueues-new-race-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) +47 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-guc_wait_ucode:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5569-2de1755571efc432ef6cc8512d080f68203a1d3a/shard-bmg-9/igt@xe_fault_injection@inject-fault-probe-function-guc_wait_ucode.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v5/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-guc_wait_ucode.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5569-2de1755571efc432ef6cc8512d080f68203a1d3a/shard-lnl-3/igt@xe_wedged@basic-wedged.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v5/shard-lnl-2/igt@xe_wedged@basic-wedged.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3119">Intel XE#3119</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_evict@evict-mixed-many-threads-small:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5569-2de1755571efc432ef6cc8512d080f68203a1d3a/shard-bmg-7/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355">Intel XE#8355</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v5/shard-bmg-10/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5569-2de1755571efc432ef6cc8512d080f68203a1d3a/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v5/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-after-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5569-2de1755571efc432ef6cc8512d080f68203a1d3a/shard-bmg-7/igt@kms_chamelium_audio@hdmi-audio-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v5/shard-bmg-5/igt@kms_chamelium_audio@hdmi-audio-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5569-2de1755571efc432ef6cc8512d080f68203a1d3a/shard-bmg-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035">Intel XE#6035</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v5/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5569-2de1755571efc432ef6cc8512d080f68203a1d3a/shard-bmg-7/igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v5/shard-bmg-5/igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5569-2de1755571efc432ef6cc8512d080f68203a1d3a/shard-bmg-7/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v5/shard-bmg-5/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5569-2de1755571efc432ef6cc8512d080f68203a1d3a/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v5/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5569-2de1755571efc432ef6cc8512d080f68203a1d3a/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v5/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5569-2de1755571efc432ef6cc8512d080f68203a1d3a/shard-bmg-7/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v5/shard-bmg-5/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5569-2de1755571efc432ef6cc8512d080f68203a1d3a/shard-bmg-7/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v5/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5569-2de1755571efc432ef6cc8512d080f68203a1d3a/shard-bmg-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v5/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5569-2de1755571efc432ef6cc8512d080f68203a1d3a/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v5/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5569-2de1755571efc432ef6cc8512d080f68203a1d3a/shard-bmg-7/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v5/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5569-2de1755571efc432ef6cc8512d080f68203a1d3a/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v5/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5569-2de1755571efc432ef6cc8512d080f68203a1d3a/shard-bmg-7/igt@xe_exec_fault_mode@many-execqueues-multi-queue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v5/shard-bmg-5/igt@xe_exec_fault_mode@many-execqueues-multi-queue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5569-2de1755571efc432ef6cc8512d080f68203a1d3a/shard-bmg-7/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v5/shard-bmg-5/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5569-2de1755571efc432ef6cc8512d080f68203a1d3a/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-mixed-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v5/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-mixed-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5569-2de1755571efc432ef6cc8512d080f68203a1d3a -&gt; xe-pw-170198v5</li>
</ul>
<p>IGT_9047: 9047<br />
  xe-5569-2de1755571efc432ef6cc8512d080f68203a1d3a: 2de1755571efc432ef6cc8512d080f68203a1d3a<br />
  xe-pw-170198v5: 170198v5</p>

</body>
</html>

--===============1879245936008691313==--
