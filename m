Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F01B4C61DC4
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 19:01:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81F0A10F142;
	Thu, 27 Aug 2026 19:01:12 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1E1710F142;
 Thu, 27 Aug 2026 19:01:10 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6253379857099865688=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_Enable_joiner_cursor_fast_?=
 =?utf-8?q?updates_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nemesa Garg" <nemesa.garg@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 27 Aug 2026 19:01:10 -0000
Message-ID: <178785727065.93222.13695666476789520294@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260827164203.2371794-1-nemesa.garg@intel.com>
In-Reply-To: <20260827164203.2371794-1-nemesa.garg@intel.com>
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

--===============6253379857099865688==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Enable joiner cursor fast updates (rev7)
URL   : https://patchwork.freedesktop.org/series/165272/
State : failure

== Summary ==

CI Bug Log - changes from xe-5655-98ac27fc649cf3f3f07a56c0d3df839be8bfa95d_FULL -> xe-pw-165272v7_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-165272v7_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-165272v7_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-165272v7_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_reset@gt-stress-reset-concurrent-submit:
    - shard-lnl:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5655-98ac27fc649cf3f3f07a56c0d3df839be8bfa95d/shard-lnl-5/igt@xe_exec_reset@gt-stress-reset-concurrent-submit.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-lnl-4/igt@xe_exec_reset@gt-stress-reset-concurrent-submit.html

  
New tests
---------

  New tests have been introduced between xe-5655-98ac27fc649cf3f3f07a56c0d3df839be8bfa95d_FULL and xe-pw-165272v7_FULL:

### New IGT tests (1) ###

  * igt@kms_flip_scaled_crc:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in xe-pw-165272v7_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@pan:
    - shard-bmg:          [PASS][3] -> [FAIL][4] ([Intel XE#2488])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5655-98ac27fc649cf3f3f07a56c0d3df839be8bfa95d/shard-bmg-2/igt@fbdev@pan.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-10/igt@fbdev@pan.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-bmg:          [PASS][5] -> [FAIL][6] ([Intel XE#3718] / [Intel XE#6078])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5655-98ac27fc649cf3f3f07a56c0d3df839be8bfa95d/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-2:
    - shard-bmg:          [PASS][7] -> [FAIL][8] ([Intel XE#6078])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5655-98ac27fc649cf3f3f07a56c0d3df839be8bfa95d/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-2.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-2.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2327])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-1/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#607] / [Intel XE#7361])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#1124])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@linear-tiling-2-displays-target-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#367])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@kms_bw@linear-tiling-2-displays-target-2160x1440p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2887])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#3432])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2325] / [Intel XE#7358]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_hpd@dp-hpd-storm:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2252]) +1 other test skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@kms_chamelium_hpd@dp-hpd-storm.html

  * igt@kms_content_protection@uevent-hdcp14:
    - shard-bmg:          NOTRUN -> [FAIL][17] ([Intel XE#6707] / [Intel XE#7439]) +1 other test fail
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@kms_content_protection@uevent-hdcp14.html

  * igt@kms_cursor_legacy@forked-bo@all-pipes:
    - shard-bmg:          [PASS][18] -> [DMESG-FAIL][19] ([Intel XE#7774]) +1 other test dmesg-fail
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5655-98ac27fc649cf3f3f07a56c0d3df839be8bfa95d/shard-bmg-3/igt@kms_cursor_legacy@forked-bo@all-pipes.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@kms_cursor_legacy@forked-bo@all-pipes.html

  * igt@kms_dsc@dsc-basic-ultrajoiner:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#8265]) +2 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@kms_dsc@dsc-basic-ultrajoiner.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [PASS][21] -> [FAIL][22] ([Intel XE#3321]) +1 other test fail
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5655-98ac27fc649cf3f3f07a56c0d3df839be8bfa95d/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#7178] / [Intel XE#7351]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2311]) +7 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#4141]) +3 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2313]) +20 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#7283])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-1/igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#1489]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr@fbc-psr-cursor-plane-move:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2234] / [Intel XE#2850])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-7/igt@kms_psr@fbc-psr-cursor-plane-move.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2330] / [Intel XE#5813])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_sharpness_filter@invalid-filter-with-nearest-neighbor:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#6503])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@kms_sharpness_filter@invalid-filter-with-nearest-neighbor.html

  * igt@kms_vrr@lobf:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2168] / [Intel XE#7444])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@kms_vrr@lobf.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2322] / [Intel XE#7372]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@once-multi-queue-rebind-imm:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#8374]) +2 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@xe_exec_fault_mode@once-multi-queue-rebind-imm.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-basic:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#8364]) +8 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-7/igt@xe_exec_multi_queue@few-execs-preempt-mode-basic.html

  * igt@xe_exec_reset@cm-multi-queue-gt-reset:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#8369])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@xe_exec_reset@cm-multi-queue-gt-reset.html

  * igt@xe_exec_system_allocator@once-mmap-remap-ro-dontunmap:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#8589]) +33 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@xe_exec_system_allocator@once-mmap-remap-ro-dontunmap.html

  * igt@xe_module_load@many-reload:
    - shard-bmg:          [PASS][38] -> [ABORT][39] ([Intel XE#8007]) +2 other tests abort
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5655-98ac27fc649cf3f3f07a56c0d3df839be8bfa95d/shard-bmg-10/igt@xe_module_load@many-reload.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-4/igt@xe_module_load@many-reload.html

  * igt@xe_multigpu_svm@mgpu-xgpu-access-basic:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#6964])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-7/igt@xe_multigpu_svm@mgpu-xgpu-access-basic.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#1420] / [Intel XE#7590])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-7/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_vm@large-userptr-split-misaligned-binds-67108864:
    - shard-bmg:          [PASS][42] -> [SKIP][43] ([Intel XE#8589]) +47 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5655-98ac27fc649cf3f3f07a56c0d3df839be8bfa95d/shard-bmg-3/igt@xe_vm@large-userptr-split-misaligned-binds-67108864.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@xe_vm@large-userptr-split-misaligned-binds-67108864.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][44] ([Intel XE#8963])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@xe_wedged@wedged-at-any-timeout.html

  
#### Possible fixes ####

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-lnl:          [FAIL][45] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5655-98ac27fc649cf3f3f07a56c0d3df839be8bfa95d/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [FAIL][47] ([Intel XE#301]) -> [PASS][48] +1 other test pass
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5655-98ac27fc649cf3f3f07a56c0d3df839be8bfa95d/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early:
    - shard-bmg:          [ABORT][49] ([Intel XE#8007]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5655-98ac27fc649cf3f3f07a56c0d3df839be8bfa95d/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html

  
#### Warnings ####

  * igt@intel_hwmon@hwmon-write:
    - shard-bmg:          [FAIL][51] ([Intel XE#8583]) -> [SKIP][52] ([Intel XE#5177] / [Intel XE#8589])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5655-98ac27fc649cf3f3f07a56c0d3df839be8bfa95d/shard-bmg-3/igt@intel_hwmon@hwmon-write.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@intel_hwmon@hwmon-write.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
    - shard-bmg:          [SKIP][53] ([Intel XE#1124]) -> [SKIP][54] ([Intel XE#8589])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5655-98ac27fc649cf3f3f07a56c0d3df839be8bfa95d/shard-bmg-3/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html

  * igt@kms_bw@linear-tiling-2-displays-target-3840x2160p:
    - shard-bmg:          [SKIP][55] ([Intel XE#367]) -> [SKIP][56] ([Intel XE#8589])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5655-98ac27fc649cf3f3f07a56c0d3df839be8bfa95d/shard-bmg-3/igt@kms_bw@linear-tiling-2-displays-target-3840x2160p.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@kms_bw@linear-tiling-2-displays-target-3840x2160p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs:
    - shard-bmg:          [SKIP][57] ([Intel XE#2887]) -> [SKIP][58] ([Intel XE#8589])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5655-98ac27fc649cf3f3f07a56c0d3df839be8bfa95d/shard-bmg-3/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][59] ([Intel XE#2652]) -> [SKIP][60] ([Intel XE#8589])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5655-98ac27fc649cf3f3f07a56c0d3df839be8bfa95d/shard-bmg-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
    - shard-bmg:          [SKIP][61] ([Intel XE#2252]) -> [SKIP][62] ([Intel XE#8589]) +1 other test skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5655-98ac27fc649cf3f3f07a56c0d3df839be8bfa95d/shard-bmg-3/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-bmg:          [SKIP][63] ([Intel XE#4331] / [Intel XE#7227]) -> [SKIP][64] ([Intel XE#8589])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5655-98ac27fc649cf3f3f07a56c0d3df839be8bfa95d/shard-bmg-3/igt@kms_dp_linktrain_fallback@dsc-fallback.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][65] ([Intel XE#301] / [Intel XE#3149]) -> [FAIL][66] ([Intel XE#301])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5655-98ac27fc649cf3f3f07a56c0d3df839be8bfa95d/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-bmg:          [SKIP][67] ([Intel XE#7178] / [Intel XE#7351]) -> [SKIP][68] ([Intel XE#8589])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5655-98ac27fc649cf3f3f07a56c0d3df839be8bfa95d/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-blt:
    - shard-bmg:          [SKIP][69] ([Intel XE#7061]) -> [SKIP][70] ([Intel XE#8589])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5655-98ac27fc649cf3f3f07a56c0d3df839be8bfa95d/shard-bmg-3/igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-blt.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][71] ([Intel XE#4141]) -> [SKIP][72] ([Intel XE#8589]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5655-98ac27fc649cf3f3f07a56c0d3df839be8bfa95d/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][73] ([Intel XE#2311]) -> [SKIP][74] ([Intel XE#8589]) +3 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5655-98ac27fc649cf3f3f07a56c0d3df839be8bfa95d/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-modesetfrombusy:
    - shard-bmg:          [SKIP][75] ([Intel XE#2313]) -> [SKIP][76] ([Intel XE#8589]) +3 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5655-98ac27fc649cf3f3f07a56c0d3df839be8bfa95d/shard-bmg-3/igt@kms_frontbuffer_tracking@psrhdr-modesetfrombusy.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@kms_frontbuffer_tracking@psrhdr-modesetfrombusy.html

  * igt@kms_panel_fitting@legacy:
    - shard-bmg:          [SKIP][77] ([Intel XE#2486]) -> [SKIP][78] ([Intel XE#8589])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5655-98ac27fc649cf3f3f07a56c0d3df839be8bfa95d/shard-bmg-3/igt@kms_panel_fitting@legacy.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier:
    - shard-bmg:          [SKIP][79] ([Intel XE#7283]) -> [SKIP][80] ([Intel XE#8589])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5655-98ac27fc649cf3f3f07a56c0d3df839be8bfa95d/shard-bmg-3/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          [SKIP][81] ([Intel XE#5020] / [Intel XE#7348]) -> [SKIP][82] ([Intel XE#8589])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5655-98ac27fc649cf3f3f07a56c0d3df839be8bfa95d/shard-bmg-3/igt@kms_plane_multiple@tiling-yf.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:
    - shard-bmg:          [SKIP][83] ([Intel XE#1489]) -> [SKIP][84] ([Intel XE#8589]) +2 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5655-98ac27fc649cf3f3f07a56c0d3df839be8bfa95d/shard-bmg-3/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][85] ([Intel XE#2426] / [Intel XE#5848]) -> [SKIP][86] ([Intel XE#2509] / [Intel XE#7437])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5655-98ac27fc649cf3f3f07a56c0d3df839be8bfa95d/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_exec_multi_queue@one-queue-preempt-mode-priority:
    - shard-bmg:          [SKIP][87] ([Intel XE#8364]) -> [SKIP][88] ([Intel XE#8589]) +2 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5655-98ac27fc649cf3f3f07a56c0d3df839be8bfa95d/shard-bmg-3/igt@xe_exec_multi_queue@one-queue-preempt-mode-priority.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@xe_exec_multi_queue@one-queue-preempt-mode-priority.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-fd-rebind:
    - shard-bmg:          [SKIP][89] ([Intel XE#8378]) -> [SKIP][90] ([Intel XE#8589]) +1 other test skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5655-98ac27fc649cf3f3f07a56c0d3df839be8bfa95d/shard-bmg-3/igt@xe_exec_threads@threads-multi-queue-mixed-fd-rebind.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-mixed-fd-rebind.html

  * igt@xe_page_reclaim@binds-1g-partial:
    - shard-bmg:          [SKIP][91] ([Intel XE#7793]) -> [SKIP][92] ([Intel XE#8589])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5655-98ac27fc649cf3f3f07a56c0d3df839be8bfa95d/shard-bmg-3/igt@xe_page_reclaim@binds-1g-partial.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@xe_page_reclaim@binds-1g-partial.html

  * igt@xe_pat@xa-app-transient-media-on:
    - shard-bmg:          [SKIP][93] ([Intel XE#7590]) -> [SKIP][94] ([Intel XE#8589])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5655-98ac27fc649cf3f3f07a56c0d3df839be8bfa95d/shard-bmg-3/igt@xe_pat@xa-app-transient-media-on.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@xe_pat@xa-app-transient-media-on.html

  * igt@xe_pm@d3hot-i2c:
    - shard-bmg:          [SKIP][95] ([Intel XE#5742] / [Intel XE#7328] / [Intel XE#7400]) -> [SKIP][96] ([Intel XE#8589])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5655-98ac27fc649cf3f3f07a56c0d3df839be8bfa95d/shard-bmg-3/igt@xe_pm@d3hot-i2c.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@xe_pm@d3hot-i2c.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2488
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5177]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5177
  [Intel XE#5742]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7227
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7328
  [Intel XE#7348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7400
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439
  [Intel XE#7444]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7444
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7774]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8583]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8583
  [Intel XE#8589]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589
  [Intel XE#8963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963


Build changes
-------------

  * Linux: xe-5655-98ac27fc649cf3f3f07a56c0d3df839be8bfa95d -> xe-pw-165272v7

  IGT_9076: 8f42b0189d73d9912ad58c99cfaa4ff46c20fcc3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5655-98ac27fc649cf3f3f07a56c0d3df839be8bfa95d: 98ac27fc649cf3f3f07a56c0d3df839be8bfa95d
  xe-pw-165272v7: 165272v7

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/index.html

--===============6253379857099865688==
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
<tr><td><b>Series:</b></td><td>Enable joiner cursor fast updates (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/165272/">https://patchwork.freedesktop.org/series/165272/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5655-98ac27fc649cf3f3f07a56c0d3df839be8bfa95d_FULL -&gt; xe-pw-165272v7_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-165272v7_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-165272v7_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-165272v7_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_reset@gt-stress-reset-concurrent-submit:<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5655-98ac27fc649cf3f3f07a56c0d3df839be8bfa95d/shard-lnl-5/igt@xe_exec_reset@gt-stress-reset-concurrent-submit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-lnl-4/igt@xe_exec_reset@gt-stress-reset-concurrent-submit.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-5655-98ac27fc649cf3f3f07a56c0d3df839be8bfa95d_FULL and xe-pw-165272v7_FULL:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_flip_scaled_crc:<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-165272v7_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@pan:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5655-98ac27fc649cf3f3f07a56c0d3df839be8bfa95d/shard-bmg-2/igt@fbdev@pan.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-10/igt@fbdev@pan.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2488">Intel XE#2488</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5655-98ac27fc649cf3f3f07a56c0d3df839be8bfa95d/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5655-98ac27fc649cf3f3f07a56c0d3df839be8bfa95d/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-1/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361">Intel XE#7361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-target-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@kms_bw@linear-tiling-2-displays-target-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@kms_chamelium_hpd@dp-hpd-storm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent-hdcp14:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@kms_content_protection@uevent-hdcp14.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707">Intel XE#6707</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439">Intel XE#7439</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-bo@all-pipes:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5655-98ac27fc649cf3f3f07a56c0d3df839be8bfa95d/shard-bmg-3/igt@kms_cursor_legacy@forked-bo@all-pipes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@kms_cursor_legacy@forked-bo@all-pipes.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774">Intel XE#7774</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic-ultrajoiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@kms_dsc@dsc-basic-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5655-98ac27fc649cf3f3f07a56c0d3df839be8bfa95d/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-1/igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-plane-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-7/igt@kms_psr@fbc-psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-nearest-neighbor:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@kms_sharpness_filter@invalid-filter-with-nearest-neighbor.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7444">Intel XE#7444</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-rebind-imm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@xe_exec_fault_mode@once-multi-queue-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-7/igt@xe_exec_multi_queue@few-execs-preempt-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-multi-queue-gt-reset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@xe_exec_reset@cm-multi-queue-gt-reset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-remap-ro-dontunmap:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@xe_exec_system_allocator@once-mmap-remap-ro-dontunmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5655-98ac27fc649cf3f3f07a56c0d3df839be8bfa95d/shard-bmg-10/igt@xe_module_load@many-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-4/igt@xe_module_load@many-reload.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) +2 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-xgpu-access-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-7/igt@xe_multigpu_svm@mgpu-xgpu-access-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-7/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-split-misaligned-binds-67108864:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5655-98ac27fc649cf3f3f07a56c0d3df839be8bfa95d/shard-bmg-3/igt@xe_vm@large-userptr-split-misaligned-binds-67108864.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@xe_vm@large-userptr-split-misaligned-binds-67108864.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) +47 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963">Intel XE#8963</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5655-98ac27fc649cf3f3f07a56c0d3df839be8bfa95d/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5655-98ac27fc649cf3f3f07a56c0d3df839be8bfa95d/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5655-98ac27fc649cf3f3f07a56c0d3df839be8bfa95d/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5655-98ac27fc649cf3f3f07a56c0d3df839be8bfa95d/shard-bmg-3/igt@intel_hwmon@hwmon-write.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8583">Intel XE#8583</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@intel_hwmon@hwmon-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5177">Intel XE#5177</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5655-98ac27fc649cf3f3f07a56c0d3df839be8bfa95d/shard-bmg-3/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5655-98ac27fc649cf3f3f07a56c0d3df839be8bfa95d/shard-bmg-3/igt@kms_bw@linear-tiling-2-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@kms_bw@linear-tiling-2-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5655-98ac27fc649cf3f3f07a56c0d3df839be8bfa95d/shard-bmg-3/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5655-98ac27fc649cf3f3f07a56c0d3df839be8bfa95d/shard-bmg-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5655-98ac27fc649cf3f3f07a56c0d3df839be8bfa95d/shard-bmg-3/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5655-98ac27fc649cf3f3f07a56c0d3df839be8bfa95d/shard-bmg-3/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331">Intel XE#4331</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7227">Intel XE#7227</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5655-98ac27fc649cf3f3f07a56c0d3df839be8bfa95d/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5655-98ac27fc649cf3f3f07a56c0d3df839be8bfa95d/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5655-98ac27fc649cf3f3f07a56c0d3df839be8bfa95d/shard-bmg-3/igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5655-98ac27fc649cf3f3f07a56c0d3df839be8bfa95d/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5655-98ac27fc649cf3f3f07a56c0d3df839be8bfa95d/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-modesetfrombusy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5655-98ac27fc649cf3f3f07a56c0d3df839be8bfa95d/shard-bmg-3/igt@kms_frontbuffer_tracking@psrhdr-modesetfrombusy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@kms_frontbuffer_tracking@psrhdr-modesetfrombusy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5655-98ac27fc649cf3f3f07a56c0d3df839be8bfa95d/shard-bmg-3/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486">Intel XE#2486</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5655-98ac27fc649cf3f3f07a56c0d3df839be8bfa95d/shard-bmg-3/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5655-98ac27fc649cf3f3f07a56c0d3df839be8bfa95d/shard-bmg-3/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020">Intel XE#5020</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348">Intel XE#7348</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5655-98ac27fc649cf3f3f07a56c0d3df839be8bfa95d/shard-bmg-3/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5655-98ac27fc649cf3f3f07a56c0d3df839be8bfa95d/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437">Intel XE#7437</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-preempt-mode-priority:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5655-98ac27fc649cf3f3f07a56c0d3df839be8bfa95d/shard-bmg-3/igt@xe_exec_multi_queue@one-queue-preempt-mode-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@xe_exec_multi_queue@one-queue-preempt-mode-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-fd-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5655-98ac27fc649cf3f3f07a56c0d3df839be8bfa95d/shard-bmg-3/igt@xe_exec_threads@threads-multi-queue-mixed-fd-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-mixed-fd-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@binds-1g-partial:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5655-98ac27fc649cf3f3f07a56c0d3df839be8bfa95d/shard-bmg-3/igt@xe_page_reclaim@binds-1g-partial.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@xe_page_reclaim@binds-1g-partial.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@xa-app-transient-media-on:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5655-98ac27fc649cf3f3f07a56c0d3df839be8bfa95d/shard-bmg-3/igt@xe_pat@xa-app-transient-media-on.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@xe_pat@xa-app-transient-media-on.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-i2c:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5655-98ac27fc649cf3f3f07a56c0d3df839be8bfa95d/shard-bmg-3/igt@xe_pm@d3hot-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742">Intel XE#5742</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7328">Intel XE#7328</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7400">Intel XE#7400</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165272v7/shard-bmg-5/igt@xe_pm@d3hot-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5655-98ac27fc649cf3f3f07a56c0d3df839be8bfa95d -&gt; xe-pw-165272v7</li>
</ul>
<p>IGT_9076: 8f42b0189d73d9912ad58c99cfaa4ff46c20fcc3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5655-98ac27fc649cf3f3f07a56c0d3df839be8bfa95d: 98ac27fc649cf3f3f07a56c0d3df839be8bfa95d<br />
  xe-pw-165272v7: 165272v7</p>

</body>
</html>

--===============6253379857099865688==--
