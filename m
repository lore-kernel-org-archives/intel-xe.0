Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7A23C43458
	for <intel-xe@archiver.kernel.org>; Sat, 11 Jul 2026 04:04:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A10410E275;
	Sat, 11 Jul 2026 04:04:10 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACB8F10E71E;
 Sat, 11 Jul 2026 04:04:09 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4366218291381704700=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/xe=3A_Add_and_use_more?=
 =?utf-8?q?_KLV_helpers_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 11 Jul 2026 04:04:09 -0000
Message-ID: <178374264970.177922.13875538103727859525@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260707220816.677-1-michal.wajdeczko@intel.com>
In-Reply-To: <20260707220816.677-1-michal.wajdeczko@intel.com>
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

--===============4366218291381704700==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Add and use more KLV helpers (rev5)
URL   : https://patchwork.freedesktop.org/series/169511/
State : success

== Summary ==

CI Bug Log - changes from xe-5383-08cdb6010efc9b2f58f740fc59dadc8c119f8b55_FULL -> xe-pw-169511v5_FULL
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

  Here are the changes found in xe-pw-169511v5_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][1] ([Intel XE#1124]) +1 other test skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v5/shard-lnl-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_bw@linear-tiling-1-displays-target-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][2] ([Intel XE#367])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v5/shard-bmg-3/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#2887])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v5/shard-bmg-3/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][4] ([Intel XE#2887])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v5/shard-lnl-6/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_chamelium_hpd@common-hpd-after-hibernate:
    - shard-lnl:          NOTRUN -> [SKIP][5] ([Intel XE#373])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v5/shard-lnl-4/igt@kms_chamelium_hpd@common-hpd-after-hibernate.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3:
    - shard-bmg:          [PASS][6] -> [FAIL][7] ([Intel XE#3321]) +1 other test fail
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5383-08cdb6010efc9b2f58f740fc59dadc8c119f8b55/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v5/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [PASS][8] -> [FAIL][9] ([Intel XE#301]) +1 other test fail
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5383-08cdb6010efc9b2f58f740fc59dadc8c119f8b55/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v5/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#7178] / [Intel XE#7351])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v5/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#7178] / [Intel XE#7351])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v5/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2311])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v5/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-indfb-plflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#7905]) +4 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v5/shard-lnl-6/igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#4141])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v5/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#7865])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v5/shard-lnl-6/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2313]) +1 other test skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v5/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move:
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#656] / [Intel XE#7905]) +2 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v5/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][18] -> [SKIP][19] ([Intel XE#1503])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5383-08cdb6010efc9b2f58f740fc59dadc8c119f8b55/shard-bmg-6/igt@kms_hdr@invalid-hdr.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v5/shard-bmg-9/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#7283])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v5/shard-bmg-3/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping.html

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#2893] / [Intel XE#7304])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v5/shard-lnl-4/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@fbc-pr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2234] / [Intel XE#2850])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v5/shard-bmg-3/igt@kms_psr@fbc-pr-suspend.html

  * igt@xe_exec_balancer@no-exec-cm-virtual-userptr-invalidate-race:
    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#7482])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v5/shard-lnl-6/igt@xe_exec_balancer@no-exec-cm-virtual-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-invalid-fault:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#8374])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v5/shard-bmg-3/igt@xe_exec_fault_mode@many-execqueues-multi-queue-invalid-fault.html

  * igt@xe_exec_fault_mode@twice-multi-queue-invalid-fault:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#8374])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v5/shard-lnl-6/igt@xe_exec_fault_mode@twice-multi-queue-invalid-fault.html

  * igt@xe_exec_multi_queue@two-queues-close-fd:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#8364]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v5/shard-bmg-3/igt@xe_exec_multi_queue@two-queues-close-fd.html

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-close-fd-smem:
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#8364]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v5/shard-lnl-4/igt@xe_exec_multi_queue@two-queues-preempt-mode-close-fd-smem.html

  * igt@xe_exec_reset@cm-multi-queue-gt-reset:
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#8369])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v5/shard-lnl-6/igt@xe_exec_reset@cm-multi-queue-gt-reset.html

  * igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads:
    - shard-bmg:          [PASS][29] -> [FAIL][30] ([Intel XE#7850])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5383-08cdb6010efc9b2f58f740fc59dadc8c119f8b55/shard-bmg-6/igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v5/shard-bmg-6/igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads.html

  * igt@xe_exec_threads@threads-multi-queue-cm-basic:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#8378])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v5/shard-lnl-4/igt@xe_exec_threads@threads-multi-queue-cm-basic.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:
    - shard-bmg:          [PASS][32] -> [ABORT][33] ([Intel XE#8007]) +2 other tests abort
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5383-08cdb6010efc9b2f58f740fc59dadc8c119f8b55/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v5/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html

  * igt@xe_pmu@fn-engine-activity-sched-if-idle:
    - shard-bmg:          [PASS][34] -> [FAIL][35] ([Intel XE#7992])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5383-08cdb6010efc9b2f58f740fc59dadc8c119f8b55/shard-bmg-10/igt@xe_pmu@fn-engine-activity-sched-if-idle.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v5/shard-bmg-8/igt@xe_pmu@fn-engine-activity-sched-if-idle.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#4733] / [Intel XE#7417])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v5/shard-bmg-3/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html

  * igt@xe_wedged@basic-wedged:
    - shard-lnl:          [PASS][37] -> [ABORT][38] ([Intel XE#3119])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5383-08cdb6010efc9b2f58f740fc59dadc8c119f8b55/shard-lnl-1/igt@xe_wedged@basic-wedged.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v5/shard-lnl-7/igt@xe_wedged@basic-wedged.html

  
#### Possible fixes ####

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [FAIL][39] ([Intel XE#301]) -> [PASS][40] +1 other test pass
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5383-08cdb6010efc9b2f58f740fc59dadc8c119f8b55/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v5/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc:
    - shard-bmg:          [ABORT][41] ([Intel XE#8007]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5383-08cdb6010efc9b2f58f740fc59dadc8c119f8b55/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v5/shard-bmg-3/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html

  
#### Warnings ####

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-lnl:          [ABORT][43] ([Intel XE#8007]) -> [SKIP][44] ([Intel XE#2321] / [Intel XE#7355])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5383-08cdb6010efc9b2f58f740fc59dadc8c119f8b55/shard-lnl-2/igt@kms_cursor_crc@cursor-offscreen-512x170.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v5/shard-lnl-4/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][45] ([Intel XE#3544]) -> [SKIP][46] ([Intel XE#3374] / [Intel XE#3544])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5383-08cdb6010efc9b2f58f740fc59dadc8c119f8b55/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v5/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][47] ([Intel XE#2426] / [Intel XE#5848]) -> [SKIP][48] ([Intel XE#2509] / [Intel XE#7437])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5383-08cdb6010efc9b2f58f740fc59dadc8c119f8b55/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v5/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3119]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3119
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7850
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#7992]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378


Build changes
-------------

  * Linux: xe-5383-08cdb6010efc9b2f58f740fc59dadc8c119f8b55 -> xe-pw-169511v5

  IGT_9002: 9002
  xe-5383-08cdb6010efc9b2f58f740fc59dadc8c119f8b55: 08cdb6010efc9b2f58f740fc59dadc8c119f8b55
  xe-pw-169511v5: 169511v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v5/index.html

--===============4366218291381704700==
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
<tr><td><b>Series:</b></td><td>drm/xe: Add and use more KLV helpers (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/169511/">https://patchwork.freedesktop.org/series/169511/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5383-08cdb6010efc9b2f58f740fc59dadc8c119f8b55_FULL -&gt; xe-pw-169511v5_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-169511v5_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v5/shard-lnl-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v5/shard-bmg-3/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v5/shard-bmg-3/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v5/shard-lnl-6/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-hibernate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v5/shard-lnl-4/igt@kms_chamelium_hpd@common-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5383-08cdb6010efc9b2f58f740fc59dadc8c119f8b55/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v5/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5383-08cdb6010efc9b2f58f740fc59dadc8c119f8b55/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v5/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v5/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v5/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v5/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v5/shard-lnl-6/igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v5/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v5/shard-lnl-6/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v5/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v5/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5383-08cdb6010efc9b2f58f740fc59dadc8c119f8b55/shard-bmg-6/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v5/shard-bmg-9/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v5/shard-bmg-3/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v5/shard-lnl-4/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v5/shard-bmg-3/igt@kms_psr@fbc-pr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-cm-virtual-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v5/shard-lnl-6/igt@xe_exec_balancer@no-exec-cm-virtual-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-invalid-fault:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v5/shard-bmg-3/igt@xe_exec_fault_mode@many-execqueues-multi-queue-invalid-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-invalid-fault:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v5/shard-lnl-6/igt@xe_exec_fault_mode@twice-multi-queue-invalid-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-close-fd:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v5/shard-bmg-3/igt@xe_exec_multi_queue@two-queues-close-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-preempt-mode-close-fd-smem:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v5/shard-lnl-4/igt@xe_exec_multi_queue@two-queues-preempt-mode-close-fd-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-multi-queue-gt-reset:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v5/shard-lnl-6/igt@xe_exec_reset@cm-multi-queue-gt-reset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5383-08cdb6010efc9b2f58f740fc59dadc8c119f8b55/shard-bmg-6/igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v5/shard-bmg-6/igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7850">Intel XE#7850</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v5/shard-lnl-4/igt@xe_exec_threads@threads-multi-queue-cm-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5383-08cdb6010efc9b2f58f740fc59dadc8c119f8b55/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v5/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) +2 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-sched-if-idle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5383-08cdb6010efc9b2f58f740fc59dadc8c119f8b55/shard-bmg-10/igt@xe_pmu@fn-engine-activity-sched-if-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v5/shard-bmg-8/igt@xe_pmu@fn-engine-activity-sched-if-idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992">Intel XE#7992</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v5/shard-bmg-3/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5383-08cdb6010efc9b2f58f740fc59dadc8c119f8b55/shard-lnl-1/igt@xe_wedged@basic-wedged.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v5/shard-lnl-7/igt@xe_wedged@basic-wedged.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3119">Intel XE#3119</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5383-08cdb6010efc9b2f58f740fc59dadc8c119f8b55/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v5/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5383-08cdb6010efc9b2f58f740fc59dadc8c119f8b55/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v5/shard-bmg-3/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5383-08cdb6010efc9b2f58f740fc59dadc8c119f8b55/shard-lnl-2/igt@kms_cursor_crc@cursor-offscreen-512x170.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v5/shard-lnl-4/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5383-08cdb6010efc9b2f58f740fc59dadc8c119f8b55/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v5/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5383-08cdb6010efc9b2f58f740fc59dadc8c119f8b55/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v5/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437">Intel XE#7437</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5383-08cdb6010efc9b2f58f740fc59dadc8c119f8b55 -&gt; xe-pw-169511v5</li>
</ul>
<p>IGT_9002: 9002<br />
  xe-5383-08cdb6010efc9b2f58f740fc59dadc8c119f8b55: 08cdb6010efc9b2f58f740fc59dadc8c119f8b55<br />
  xe-pw-169511v5: 169511v5</p>

</body>
</html>

--===============4366218291381704700==--
