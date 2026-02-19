Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FD36E9A048
	for <intel-xe@archiver.kernel.org>; Thu, 19 Feb 2026 15:44:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB914890BE;
	Thu, 19 Feb 2026 15:44:54 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D22E7890BE;
 Thu, 19 Feb 2026 15:44:53 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4511287425329463225=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_Fix_fs=5Freclaim_deadlock_?=
 =?utf-8?q?caused_by_CCS_save/restore_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 19 Feb 2026 15:44:53 -0000
Message-ID: <177151589382.267023.12919364043143625096@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260219105433.2234194-5-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20260219105433.2234194-5-satyanarayana.k.v.p@intel.com>
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

--===============4511287425329463225==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fix fs_reclaim deadlock caused by CCS save/restore (rev7)
URL   : https://patchwork.freedesktop.org/series/160841/
State : failure

== Summary ==

CI Bug Log - changes from xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f_FULL -> xe-pw-160841v7_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-160841v7_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-160841v7_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-160841v7_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_pm@s4-basic:
    - shard-lnl:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/shard-lnl-8/igt@xe_pm@s4-basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-lnl-1/igt@xe_pm@s4-basic.html

  
Known issues
------------

  Here are the changes found in xe-pw-160841v7_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-lnl:          [PASS][3] -> [FAIL][4] ([Intel XE#3718] / [Intel XE#7265]) +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/shard-lnl-1/igt@kms_async_flips@alternate-sync-async-flip.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-lnl-8/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2327]) +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][6] ([Intel XE#1124])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-lnl-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#1124]) +2 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-7/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2314] / [Intel XE#2894])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#367])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-7/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@bad-rotation-90-yf-tiled-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#2887])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-lnl-6/igt@kms_ccs@bad-rotation-90-yf-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2652] / [Intel XE#787]) +8 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_chamelium_hpd@common-hpd-after-hibernate:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2252]) +4 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@kms_chamelium_hpd@common-hpd-after-hibernate.html

  * igt@kms_content_protection@legacy-hdcp14@pipe-a-dp-1:
    - shard-bmg:          NOTRUN -> [FAIL][13] ([Intel XE#3304])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-5/igt@kms_content_protection@legacy-hdcp14@pipe-a-dp-1.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2321]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-8/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2286])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2244])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#4156])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [PASS][18] -> [FAIL][19] ([Intel XE#301]) +1 other test fail
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_flip@flip-vs-suspend@c-hdmi-a3:
    - shard-bmg:          [PASS][20] -> [INCOMPLETE][21] ([Intel XE#2049] / [Intel XE#2597])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/shard-bmg-8/igt@kms_flip@flip-vs-suspend@c-hdmi-a3.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-7/igt@kms_flip@flip-vs-suspend@c-hdmi-a3.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#7178])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#4141]) +3 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2311]) +10 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#656])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#7061])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2313]) +11 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#3374] / [Intel XE#3544])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#6901])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-7/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#7283])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#7283])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-lnl-6/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#6886]) +3 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2391])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-5/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#1406] / [Intel XE#1489]) +2 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#1406] / [Intel XE#2893])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-lnl-6/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr@psr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +7 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-8/igt@kms_psr@psr-suspend.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#3414] / [Intel XE#3904])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-lnl-6/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2330])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][39] -> [FAIL][40] ([Intel XE#4459]) +1 other test fail
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/shard-lnl-8/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@xe_eudebug@basic-vm-access-parameters-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#4837])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-lnl-6/igt@xe_eudebug@basic-vm-access-parameters-userptr.html

  * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#4837]) +2 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html

  * igt@xe_eudebug_online@pagefault-read-stress:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#6665] / [Intel XE#6681])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@xe_eudebug_online@pagefault-read-stress.html

  * igt@xe_eudebug_online@resume-one:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#4837] / [Intel XE#6665])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-5/igt@xe_eudebug_online@resume-one.html

  * igt@xe_eudebug_sriov@deny-eudebug:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#5793])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@xe_eudebug_sriov@deny-eudebug.html

  * igt@xe_evict@evict-small-multi-queue-cm:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#7140]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@xe_evict@evict-small-multi-queue-cm.html

  * igt@xe_evict@evict-small-multi-queue-priority-cm:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#6540] / [Intel XE#688])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-lnl-6/igt@xe_evict@evict-small-multi-queue-priority-cm.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2322]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html

  * igt@xe_exec_fault_mode@many-multi-queue-imm:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#7136]) +6 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-7/igt@xe_exec_fault_mode@many-multi-queue-imm.html

  * igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-dyn-priority:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#6874])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-lnl-6/igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-dyn-priority.html

  * igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#6874]) +8 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr.html

  * igt@xe_exec_system_allocator@many-stride-new-prefetch:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][52] ([Intel XE#7098])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@xe_exec_system_allocator@many-stride-new-prefetch.html

  * igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#7138]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr.html

  * igt@xe_multigpu_svm@mgpu-coherency-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#6964])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@xe_multigpu_svm@mgpu-coherency-prefetch.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#4733])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-bmg:          [FAIL][56] ([Intel XE#3718] / [Intel XE#6078]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2:
    - shard-bmg:          [FAIL][58] ([Intel XE#6078]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2.html

  * igt@kms_async_flips@test-time-stamp:
    - shard-bmg:          [INCOMPLETE][60] ([Intel XE#1727] / [Intel XE#4912] / [Intel XE#6819]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/shard-bmg-3/igt@kms_async_flips@test-time-stamp.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@kms_async_flips@test-time-stamp.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [INCOMPLETE][62] ([Intel XE#7084]) -> [PASS][63] +1 other test pass
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:
    - shard-bmg:          [DMESG-WARN][64] ([Intel XE#5354]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/shard-bmg-9/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-7/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-bmg:          [INCOMPLETE][66] -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/shard-bmg-10/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-8/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@xe_exec_system_allocator@many-stride-mmap-remap-eocheck:
    - shard-bmg:          [SKIP][68] ([Intel XE#6703]) -> [PASS][69] +80 other tests pass
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/shard-bmg-2/igt@xe_exec_system_allocator@many-stride-mmap-remap-eocheck.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@xe_exec_system_allocator@many-stride-mmap-remap-eocheck.html

  * igt@xe_exec_system_allocator@once-large-malloc-race:
    - shard-bmg:          [DMESG-FAIL][70] ([Intel XE#5213] / [Intel XE#5545] / [Intel XE#6652]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/shard-bmg-2/igt@xe_exec_system_allocator@once-large-malloc-race.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@xe_exec_system_allocator@once-large-malloc-race.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:
    - shard-lnl:          [FAIL][72] ([Intel XE#5625]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/shard-lnl-2/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-lnl-6/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html

  
#### Warnings ####

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-bmg:          [SKIP][74] ([Intel XE#6703]) -> [SKIP][75] ([Intel XE#2370])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-bmg:          [SKIP][76] ([Intel XE#6703]) -> [SKIP][77] ([Intel XE#2327])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/shard-bmg-2/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-180:
    - shard-bmg:          [SKIP][78] ([Intel XE#6703]) -> [SKIP][79] ([Intel XE#1124])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/shard-bmg-2/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-bmg:          [SKIP][80] ([Intel XE#6703]) -> [SKIP][81] ([Intel XE#2328]) +1 other test skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/shard-bmg-2/igt@kms_big_fb@y-tiled-addfb.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          [SKIP][82] ([Intel XE#6703]) -> [SKIP][83] ([Intel XE#2887]) +1 other test skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/shard-bmg-2/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-bmg:          [SKIP][84] ([Intel XE#6703]) -> [SKIP][85] ([Intel XE#2325])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/shard-bmg-2/igt@kms_chamelium_color@ctm-negative.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_cursor_crc@cursor-offscreen-256x85:
    - shard-bmg:          [SKIP][86] ([Intel XE#6703]) -> [SKIP][87] ([Intel XE#2320])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-256x85.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-256x85.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-bmg:          [SKIP][88] ([Intel XE#6703]) -> [SKIP][89] ([Intel XE#2321])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/shard-bmg-2/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_dsc@dsc-basic:
    - shard-bmg:          [SKIP][90] ([Intel XE#6703]) -> [SKIP][91] ([Intel XE#2244])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/shard-bmg-2/igt@kms_dsc@dsc-basic.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@kms_dsc@dsc-basic.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][92] ([Intel XE#6703]) -> [SKIP][93] ([Intel XE#4141])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][94] ([Intel XE#6703]) -> [SKIP][95] ([Intel XE#2311]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render:
    - shard-bmg:          [SKIP][96] ([Intel XE#6703]) -> [SKIP][97] ([Intel XE#7061]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-bmg:          [SKIP][98] ([Intel XE#6703]) -> [SKIP][99] ([Intel XE#2313])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-bmg:          [SKIP][100] ([Intel XE#6703]) -> [SKIP][101] ([Intel XE#6911])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/shard-bmg-2/igt@kms_joiner@basic-force-ultra-joiner.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-bmg:          [SKIP][102] ([Intel XE#6703]) -> [SKIP][103] ([Intel XE#2393])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/shard-bmg-2/igt@kms_plane_lowres@tiling-y.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:
    - shard-bmg:          [SKIP][104] ([Intel XE#6703]) -> [SKIP][105] ([Intel XE#6886])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-bmg:          [SKIP][106] ([Intel XE#1406] / [Intel XE#6703]) -> [SKIP][107] ([Intel XE#1406] / [Intel XE#1489])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr@pr-cursor-plane-move:
    - shard-bmg:          [SKIP][108] ([Intel XE#1406] / [Intel XE#6703]) -> [SKIP][109] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/shard-bmg-2/igt@kms_psr@pr-cursor-plane-move.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@kms_psr@pr-cursor-plane-move.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][110] ([Intel XE#2426]) -> [SKIP][111] ([Intel XE#2509])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_eudebug@vm-bind-clear-faultable:
    - shard-bmg:          [SKIP][112] ([Intel XE#6703]) -> [SKIP][113] ([Intel XE#4837])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/shard-bmg-2/igt@xe_eudebug@vm-bind-clear-faultable.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@xe_eudebug@vm-bind-clear-faultable.html

  * igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-vram:
    - shard-bmg:          [SKIP][114] ([Intel XE#6703]) -> [SKIP][115] ([Intel XE#4837] / [Intel XE#6665])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/shard-bmg-2/igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-vram.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-vram.html

  * igt@xe_evict@evict-beng-large-external-cm:
    - shard-lnl:          [SKIP][116] ([Intel XE#688]) -> [SKIP][117] ([Intel XE#6540] / [Intel XE#688]) +66 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/shard-lnl-3/igt@xe_evict@evict-beng-large-external-cm.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-lnl-3/igt@xe_evict@evict-beng-large-external-cm.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
    - shard-bmg:          [SKIP][118] ([Intel XE#6703]) -> [SKIP][119] ([Intel XE#2322]) +2 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/shard-bmg-2/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html

  * igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate:
    - shard-bmg:          [SKIP][120] ([Intel XE#6703]) -> [SKIP][121] ([Intel XE#7136])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/shard-bmg-2/igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate.html

  * igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-basic:
    - shard-bmg:          [SKIP][122] ([Intel XE#6703]) -> [SKIP][123] ([Intel XE#6874]) +4 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/shard-bmg-2/igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-basic.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-basic.html

  * igt@xe_exec_threads@threads-multi-queue-fd-userptr:
    - shard-bmg:          [SKIP][124] ([Intel XE#6703]) -> [SKIP][125] ([Intel XE#7138])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-fd-userptr.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@xe_exec_threads@threads-multi-queue-fd-userptr.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4912
  [Intel XE#5213]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5213
  [Intel XE#5354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
  [Intel XE#5793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5793
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652
  [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
  [Intel XE#6681]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6681
  [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
  [Intel XE#6819]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6819
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901
  [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7098
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#7140]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7265
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787


Build changes
-------------

  * Linux: xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f -> xe-pw-160841v7

  IGT_8761: 8761
  xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f: c81e41f7aca96f583296a2a875f0179484b7a81f
  xe-pw-160841v7: 160841v7

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/index.html

--===============4511287425329463225==
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
<tr><td><b>Series:</b></td><td>Fix fs_reclaim deadlock caused by CCS save/restore (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160841/">https://patchwork.freedesktop.org/series/160841/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f_FULL -&gt; xe-pw-160841v7_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-160841v7_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-160841v7_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-160841v7_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_pm@s4-basic:<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/shard-lnl-8/igt@xe_pm@s4-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-lnl-1/igt@xe_pm@s4-basic.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-160841v7_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/shard-lnl-1/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-lnl-8/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7265">Intel XE#7265</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-lnl-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-7/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-7/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-yf-tiled-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-lnl-6/igt@kms_ccs@bad-rotation-90-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-hibernate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@kms_chamelium_hpd@common-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy-hdcp14@pipe-a-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-5/igt@kms_content_protection@legacy-hdcp14@pipe-a-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-8/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@kms_fbcon_fbt@fbc-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156">Intel XE#4156</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/shard-bmg-8/igt@kms_flip@flip-vs-suspend@c-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-7/igt@kms_flip@flip-vs-suspend@c-hdmi-a3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-7/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901">Intel XE#6901</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-lnl-6/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-5/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391">Intel XE#2391</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-lnl-6/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-8/igt@kms_psr@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-lnl-6/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/shard-lnl-8/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459">Intel XE#4459</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-lnl-6/igt@xe_eudebug@basic-vm-access-parameters-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-metadata-discovery:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@pagefault-read-stress:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@xe_eudebug_online@pagefault-read-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6681">Intel XE#6681</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@resume-one:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-5/igt@xe_eudebug_online@resume-one.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-eudebug:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@xe_eudebug_sriov@deny-eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5793">Intel XE#5793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue-cm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@xe_evict@evict-small-multi-queue-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140">Intel XE#7140</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue-priority-cm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-lnl-6/igt@xe_evict@evict-small-multi-queue-priority-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540">Intel XE#6540</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-imm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-7/igt@xe_exec_fault_mode@many-multi-queue-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-dyn-priority:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-lnl-6/igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-dyn-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-new-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@xe_exec_system_allocator@many-stride-new-prefetch.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7098">Intel XE#7098</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-coherency-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@xe_multigpu_svm@mgpu-coherency-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/shard-bmg-3/igt@kms_async_flips@test-time-stamp.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4912">Intel XE#4912</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6819">Intel XE#6819</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@kms_async_flips@test-time-stamp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/shard-bmg-9/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354">Intel XE#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-7/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/shard-bmg-10/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-8/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-remap-eocheck:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/shard-bmg-2/igt@xe_exec_system_allocator@many-stride-mmap-remap-eocheck.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@xe_exec_system_allocator@many-stride-mmap-remap-eocheck.html">PASS</a> +80 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-malloc-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/shard-bmg-2/igt@xe_exec_system_allocator@once-large-malloc-race.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5213">Intel XE#5213</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652">Intel XE#6652</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@xe_exec_system_allocator@once-large-malloc-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/shard-lnl-2/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625">Intel XE#5625</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-lnl-6/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/shard-bmg-2/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/shard-bmg-2/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/shard-bmg-2/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328">Intel XE#2328</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/shard-bmg-2/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/shard-bmg-2/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-256x85:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/shard-bmg-2/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/shard-bmg-2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/shard-bmg-2/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911">Intel XE#6911</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/shard-bmg-2/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-plane-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/shard-bmg-2/igt@kms_psr@pr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@kms_psr@pr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@vm-bind-clear-faultable:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/shard-bmg-2/igt@xe_eudebug@vm-bind-clear-faultable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@xe_eudebug@vm-bind-clear-faultable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-vram:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/shard-bmg-2/igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-external-cm:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/shard-lnl-3/igt@xe_evict@evict-beng-large-external-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-lnl-3/igt@xe_evict@evict-beng-large-external-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540">Intel XE#6540</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +66 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/shard-bmg-2/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/shard-bmg-2/igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/shard-bmg-2/igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-fd-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-fd-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v7/shard-bmg-3/igt@xe_exec_threads@threads-multi-queue-fd-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f -&gt; xe-pw-160841v7</li>
</ul>
<p>IGT_8761: 8761<br />
  xe-4575-c81e41f7aca96f583296a2a875f0179484b7a81f: c81e41f7aca96f583296a2a875f0179484b7a81f<br />
  xe-pw-160841v7: 160841v7</p>

</body>
</html>

--===============4511287425329463225==--
