Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 264D7C982C3
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 15:04:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6B2E10E002;
	Wed, 16 Sep 2026 15:04:20 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D991810E3D6;
 Wed, 16 Sep 2026 15:04:19 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3944555915527188196=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_Squash_of_Refresh_TTM_LRU_?=
 =?utf-8?q?on_SVM_prefetch?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 16 Sep 2026 15:04:19 -0000
Message-ID: <178957105988.173285.3174244509814309386@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260916125822.2605659-2-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260916125822.2605659-2-himal.prasad.ghimiray@intel.com>
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

--===============3944555915527188196==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Squash of Refresh TTM LRU on SVM prefetch
URL   : https://patchwork.freedesktop.org/series/174287/
State : failure

== Summary ==

CI Bug Log - changes from xe-5756-c373843e45faabf54710d4edaabac110b2de855c_FULL -> xe-pw-174287v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-174287v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-174287v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-174287v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-prefetch:
    - shard-bmg:          [PASS][1] -> [ABORT][2] +12 other tests abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5756-c373843e45faabf54710d4edaabac110b2de855c/shard-bmg-9/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-prefetch.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174287v1/shard-bmg-7/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-prefetch.html

  
Known issues
------------

  Here are the changes found in xe-pw-174287v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotunbind-rebind-with-load:
    - shard-bmg:          [PASS][3] -> [ABORT][4] ([Intel XE#8007])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5756-c373843e45faabf54710d4edaabac110b2de855c/shard-bmg-2/igt@core_hotunplug@hotunbind-rebind-with-load.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174287v1/shard-bmg-9/igt@core_hotunplug@hotunbind-rebind-with-load.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-bmg:          [PASS][5] -> [FAIL][6] ([Intel XE#8098]) +1 other test fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5756-c373843e45faabf54710d4edaabac110b2de855c/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174287v1/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][7] ([Intel XE#1407])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174287v1/shard-lnl-8/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][8] ([Intel XE#1124])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174287v1/shard-lnl-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2:
    - shard-bmg:          [PASS][9] -> [INCOMPLETE][10] ([Intel XE#7084] / [Intel XE#8150])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5756-c373843e45faabf54710d4edaabac110b2de855c/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174287v1/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4:
    - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#7358])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174287v1/shard-lnl-2/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#309] / [Intel XE#7343])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174287v1/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-cur-indfb-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#6312])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174287v1/shard-lnl-2/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-plflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#6312] / [Intel XE#651])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174287v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#656] / [Intel XE#7905]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174287v1/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#7865]) +2 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174287v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#7905]) +3 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174287v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:
    - shard-bmg:          [PASS][18] -> [INCOMPLETE][19] ([Intel XE#1035]) +1 other test incomplete
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5756-c373843e45faabf54710d4edaabac110b2de855c/shard-bmg-3/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174287v1/shard-bmg-6/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#2893] / [Intel XE#7304]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174287v1/shard-lnl-8/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#1127] / [Intel XE#5813])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174287v1/shard-lnl-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@xe_evict@evict-beng-small-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#6540] / [Intel XE#688])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174287v1/shard-lnl-8/igt@xe_evict@evict-beng-small-multi-vm.html

  * igt@xe_exec_balancer@twice-parallel-basic:
    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#7482]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174287v1/shard-lnl-2/igt@xe_exec_balancer@twice-parallel-basic.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#1392]) +2 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174287v1/shard-lnl-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-rebind-imm:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#8374]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174287v1/shard-lnl-8/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-rebind-imm.html

  * igt@xe_exec_multi_queue@max-queues-basic-smem:
    - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#8364]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174287v1/shard-lnl-2/igt@xe_exec_multi_queue@max-queues-basic-smem.html

  * igt@xe_exec_system_allocator@process-many-execqueues-malloc-prefetch-madvise:
    - shard-bmg:          [PASS][27] -> [INCOMPLETE][28] ([Intel XE#8159]) +2 other tests incomplete
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5756-c373843e45faabf54710d4edaabac110b2de855c/shard-bmg-1/igt@xe_exec_system_allocator@process-many-execqueues-malloc-prefetch-madvise.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174287v1/shard-bmg-3/igt@xe_exec_system_allocator@process-many-execqueues-malloc-prefetch-madvise.html

  * igt@xe_pm@s3-exec-after:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#584] / [Intel XE#7369])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174287v1/shard-lnl-8/igt@xe_pm@s3-exec-after.html

  * igt@xe_pm@s3-vm-bind-unbind-all:
    - shard-bmg:          [PASS][30] -> [INCOMPLETE][31] ([Intel XE#8175])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5756-c373843e45faabf54710d4edaabac110b2de855c/shard-bmg-3/igt@xe_pm@s3-vm-bind-unbind-all.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174287v1/shard-bmg-6/igt@xe_pm@s3-vm-bind-unbind-all.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#944])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174287v1/shard-lnl-2/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  
#### Possible fixes ####

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-lnl:          [FAIL][33] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5756-c373843e45faabf54710d4edaabac110b2de855c/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174287v1/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][35] ([Intel XE#1503]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5756-c373843e45faabf54710d4edaabac110b2de855c/shard-bmg-3/igt@kms_hdr@invalid-hdr.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174287v1/shard-bmg-8/igt@kms_hdr@invalid-hdr.html

  * igt@xe_exec_threads@threads-hang-userptr-invalidate-race:
    - shard-lnl:          [FAIL][37] ([Intel XE#9096]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5756-c373843e45faabf54710d4edaabac110b2de855c/shard-lnl-1/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174287v1/shard-lnl-8/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html

  
#### Warnings ####

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][39] ([Intel XE#301] / [Intel XE#3149]) -> [FAIL][40] ([Intel XE#301])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5756-c373843e45faabf54710d4edaabac110b2de855c/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174287v1/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][41] ([Intel XE#3544]) -> [SKIP][42] ([Intel XE#3374] / [Intel XE#3544])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5756-c373843e45faabf54710d4edaabac110b2de855c/shard-bmg-9/igt@kms_hdr@brightness-with-hdr.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174287v1/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][43] ([Intel XE#2509] / [Intel XE#7437]) -> [SKIP][44] ([Intel XE#2426] / [Intel XE#5848])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5756-c373843e45faabf54710d4edaabac110b2de855c/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174287v1/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_exec_reset@gt-reset-fault-injection:
    - shard-bmg:          [ABORT][45] ([Intel XE#9145]) -> [ABORT][46] ([Intel XE#9131] / [Intel XE#9145])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5756-c373843e45faabf54710d4edaabac110b2de855c/shard-bmg-3/igt@xe_exec_reset@gt-reset-fault-injection.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174287v1/shard-bmg-8/igt@xe_exec_reset@gt-reset-fault-injection.html
    - shard-lnl:          [ABORT][47] ([Intel XE#9140] / [Intel XE#9145]) -> [DMESG-WARN][48] ([Intel XE#9130])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5756-c373843e45faabf54710d4edaabac110b2de855c/shard-lnl-5/igt@xe_exec_reset@gt-reset-fault-injection.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174287v1/shard-lnl-2/igt@xe_exec_reset@gt-reset-fault-injection.html

  * igt@xe_wedged@basic-wedged:
    - shard-lnl:          [ABORT][49] ([Intel XE#8963]) -> [DMESG-WARN][50] ([Intel XE#8963])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5756-c373843e45faabf54710d4edaabac110b2de855c/shard-lnl-7/igt@xe_wedged@basic-wedged.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174287v1/shard-lnl-8/igt@xe_wedged@basic-wedged.html

  
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7369
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8098
  [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
  [Intel XE#8159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159
  [Intel XE#8175]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8175
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963
  [Intel XE#9096]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096
  [Intel XE#9130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9130
  [Intel XE#9131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9131
  [Intel XE#9140]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9140
  [Intel XE#9145]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9145
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-5756-c373843e45faabf54710d4edaabac110b2de855c -> xe-pw-174287v1

  IGT_9099: 9099
  xe-5756-c373843e45faabf54710d4edaabac110b2de855c: c373843e45faabf54710d4edaabac110b2de855c
  xe-pw-174287v1: 174287v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174287v1/index.html

--===============3944555915527188196==
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
<tr><td><b>Series:</b></td><td>Squash of Refresh TTM LRU on SVM prefetch</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/174287/">https://patchwork.freedesktop.org/series/174287/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174287v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174287v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5756-c373843e45faabf54710d4edaabac110b2de855c_FULL -&gt; xe-pw-174287v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-174287v1_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-174287v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-174287v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-prefetch:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5756-c373843e45faabf54710d4edaabac110b2de855c/shard-bmg-9/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174287v1/shard-bmg-7/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-prefetch.html">ABORT</a> +12 other tests abort</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-174287v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunbind-rebind-with-load:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5756-c373843e45faabf54710d4edaabac110b2de855c/shard-bmg-2/igt@core_hotunplug@hotunbind-rebind-with-load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174287v1/shard-bmg-9/igt@core_hotunplug@hotunbind-rebind-with-load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5756-c373843e45faabf54710d4edaabac110b2de855c/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174287v1/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8098">Intel XE#8098</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174287v1/shard-lnl-8/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174287v1/shard-lnl-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5756-c373843e45faabf54710d4edaabac110b2de855c/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174287v1/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174287v1/shard-lnl-2/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174287v1/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174287v1/shard-lnl-2/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174287v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174287v1/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174287v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174287v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5756-c373843e45faabf54710d4edaabac110b2de855c/shard-bmg-3/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174287v1/shard-bmg-6/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174287v1/shard-lnl-8/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174287v1/shard-lnl-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174287v1/shard-lnl-8/igt@xe_evict@evict-beng-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540">Intel XE#6540</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-parallel-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174287v1/shard-lnl-2/igt@xe_exec_balancer@twice-parallel-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174287v1/shard-lnl-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-rebind-imm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174287v1/shard-lnl-8/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@max-queues-basic-smem:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174287v1/shard-lnl-2/igt@xe_exec_multi_queue@max-queues-basic-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-malloc-prefetch-madvise:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5756-c373843e45faabf54710d4edaabac110b2de855c/shard-bmg-1/igt@xe_exec_system_allocator@process-many-execqueues-malloc-prefetch-madvise.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174287v1/shard-bmg-3/igt@xe_exec_system_allocator@process-many-execqueues-malloc-prefetch-madvise.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159">Intel XE#8159</a>) +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-exec-after:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174287v1/shard-lnl-8/igt@xe_pm@s3-exec-after.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#584</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7369">Intel XE#7369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-unbind-all:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5756-c373843e45faabf54710d4edaabac110b2de855c/shard-bmg-3/igt@xe_pm@s3-vm-bind-unbind-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174287v1/shard-bmg-6/igt@xe_pm@s3-vm-bind-unbind-all.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8175">Intel XE#8175</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174287v1/shard-lnl-2/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5756-c373843e45faabf54710d4edaabac110b2de855c/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174287v1/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5756-c373843e45faabf54710d4edaabac110b2de855c/shard-bmg-3/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174287v1/shard-bmg-8/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5756-c373843e45faabf54710d4edaabac110b2de855c/shard-lnl-1/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096">Intel XE#9096</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174287v1/shard-lnl-8/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5756-c373843e45faabf54710d4edaabac110b2de855c/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174287v1/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5756-c373843e45faabf54710d4edaabac110b2de855c/shard-bmg-9/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174287v1/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5756-c373843e45faabf54710d4edaabac110b2de855c/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437">Intel XE#7437</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174287v1/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-reset-fault-injection:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5756-c373843e45faabf54710d4edaabac110b2de855c/shard-bmg-3/igt@xe_exec_reset@gt-reset-fault-injection.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9145">Intel XE#9145</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174287v1/shard-bmg-8/igt@xe_exec_reset@gt-reset-fault-injection.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9131">Intel XE#9131</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9145">Intel XE#9145</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5756-c373843e45faabf54710d4edaabac110b2de855c/shard-lnl-5/igt@xe_exec_reset@gt-reset-fault-injection.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9140">Intel XE#9140</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9145">Intel XE#9145</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174287v1/shard-lnl-2/igt@xe_exec_reset@gt-reset-fault-injection.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9130">Intel XE#9130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5756-c373843e45faabf54710d4edaabac110b2de855c/shard-lnl-7/igt@xe_wedged@basic-wedged.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963">Intel XE#8963</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174287v1/shard-lnl-8/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963">Intel XE#8963</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5756-c373843e45faabf54710d4edaabac110b2de855c -&gt; xe-pw-174287v1</li>
</ul>
<p>IGT_9099: 9099<br />
  xe-5756-c373843e45faabf54710d4edaabac110b2de855c: c373843e45faabf54710d4edaabac110b2de855c<br />
  xe-pw-174287v1: 174287v1</p>

</body>
</html>

--===============3944555915527188196==--
