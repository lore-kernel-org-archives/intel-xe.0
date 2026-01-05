Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 988CFC79F8C
	for <intel-xe@archiver.kernel.org>; Mon,  5 Jan 2026 14:04:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5860A10E3D8;
	Mon,  5 Jan 2026 14:04:51 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B9C610E122;
 Mon,  5 Jan 2026 14:04:50 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5286874679013211129=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Enable_THP_support_in_drm?=
 =?utf-8?q?=5Fpagemap_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 05 Jan 2026 14:04:50 -0000
Message-ID: <176762189063.126139.14439132436100181018@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260105111945.73292-1-francois.dugast@intel.com>
In-Reply-To: <20260105111945.73292-1-francois.dugast@intel.com>
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

--===============5286874679013211129==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Enable THP support in drm_pagemap (rev2)
URL   : https://patchwork.freedesktop.org/series/159119/
State : failure

== Summary ==

CI Bug Log - changes from xe-4329-f5136cded03e959ebb00a1160e5f00973c38007e_FULL -> xe-pw-159119v2_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-159119v2_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-159119v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-159119v2_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:
    - shard-bmg:          NOTRUN -> [ABORT][1] +6 other tests abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v2/shard-bmg-9/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html

  * igt@xe_module_load@reload-no-display:
    - shard-bmg:          [PASS][2] -> [ABORT][3] +10 other tests abort
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4329-f5136cded03e959ebb00a1160e5f00973c38007e/shard-bmg-3/igt@xe_module_load@reload-no-display.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v2/shard-bmg-8/igt@xe_module_load@reload-no-display.html

  
Known issues
------------

  Here are the changes found in xe-pw-159119v2_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#2327]) +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v2/shard-bmg-2/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#610]) +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v2/shard-bmg-2/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#1124])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v2/shard-bmg-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#607])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v2/shard-bmg-10/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_bw@linear-tiling-4-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#367])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v2/shard-bmg-10/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2887]) +2 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v2/shard-bmg-9/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#3432])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v2/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2652] / [Intel XE#787]) +8 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v2/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-dp-2.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2252]) +2 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v2/shard-bmg-2/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_cursor_crc@cursor-onscreen-64x21:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2320]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v2/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-64x21.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2244]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v2/shard-bmg-2/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3:
    - shard-bmg:          [PASS][15] -> [FAIL][16] ([Intel XE#3149] / [Intel XE#3321]) +1 other test fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4329-f5136cded03e959ebb00a1160e5f00973c38007e/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v2/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [PASS][17] -> [FAIL][18] ([Intel XE#301])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4329-f5136cded03e959ebb00a1160e5f00973c38007e/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v2/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2293] / [Intel XE#2380]) +2 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v2/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2293]) +2 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v2/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2311]) +6 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v2/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#4141]) +3 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2350])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v2/shard-bmg-1/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2313]) +10 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v2/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-2:
    - shard-bmg:          [PASS][25] -> [ABORT][26] ([Intel XE#6740]) +3 other tests abort
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4329-f5136cded03e959ebb00a1160e5f00973c38007e/shard-bmg-2/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-2.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v2/shard-bmg-3/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-2.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#6911])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v2/shard-bmg-10/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2925])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v2/shard-bmg-9/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v2/shard-bmg-2/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#1406] / [Intel XE#1489]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v2/shard-bmg-1/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html

  * igt@kms_psr@pr-primary-render:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +8 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v2/shard-bmg-10/igt@kms_psr@pr-primary-render.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#1435])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v2/shard-bmg-1/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_vrr@cmrr:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2168])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v2/shard-bmg-2/igt@kms_vrr@cmrr.html

  * igt@xe_eudebug@vma-ufence:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#4837]) +3 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v2/shard-bmg-1/igt@xe_eudebug@vma-ufence.html

  * igt@xe_eudebug_online@pagefault-write:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#4837] / [Intel XE#6665]) +2 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v2/shard-bmg-2/igt@xe_eudebug_online@pagefault-write.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2322]) +3 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v2/shard-bmg-10/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html

  * igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#6874]) +12 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v2/shard-bmg-2/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-userptr-invalidate.html

  * igt@xe_exec_system_allocator@once-mmap-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#4943]) +5 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v2/shard-bmg-1/igt@xe_exec_system_allocator@once-mmap-huge-nomemset.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#4733])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v2/shard-bmg-2/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#944]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v2/shard-bmg-2/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  
#### Possible fixes ####

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [FAIL][41] ([Intel XE#301]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4329-f5136cded03e959ebb00a1160e5f00973c38007e/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v2/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_vblank@ts-continuation-modeset-hang:
    - shard-bmg:          [ABORT][43] ([Intel XE#5545]) -> [PASS][44] +1 other test pass
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4329-f5136cded03e959ebb00a1160e5f00973c38007e/shard-bmg-2/igt@kms_vblank@ts-continuation-modeset-hang.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v2/shard-bmg-1/igt@kms_vblank@ts-continuation-modeset-hang.html

  * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
    - shard-lnl:          [FAIL][45] ([Intel XE#2142]) -> [PASS][46] +1 other test pass
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4329-f5136cded03e959ebb00a1160e5f00973c38007e/shard-lnl-5/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v2/shard-lnl-4/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:
    - shard-lnl:          [FAIL][47] ([Intel XE#5625]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4329-f5136cded03e959ebb00a1160e5f00973c38007e/shard-lnl-4/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v2/shard-lnl-7/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][49], [PASS][50], [PASS][51], [PASS][52], [PASS][53], [PASS][54], [PASS][55], [PASS][56], [PASS][57], [PASS][58], [PASS][59], [PASS][60], [PASS][61], [SKIP][62], [PASS][63], [PASS][64], [PASS][65], [PASS][66], [PASS][67], [PASS][68], [PASS][69]) ([Intel XE#2457]) -> ([PASS][70], [PASS][71], [PASS][72], [PASS][73], [PASS][74], [PASS][75], [PASS][76], [PASS][77], [PASS][78], [PASS][79], [PASS][80], [PASS][81], [PASS][82], [PASS][83], [PASS][84], [PASS][85], [PASS][86], [PASS][87], [PASS][88], [PASS][89], [PASS][90])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4329-f5136cded03e959ebb00a1160e5f00973c38007e/shard-bmg-7/igt@xe_module_load@load.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4329-f5136cded03e959ebb00a1160e5f00973c38007e/shard-bmg-10/igt@xe_module_load@load.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4329-f5136cded03e959ebb00a1160e5f00973c38007e/shard-bmg-10/igt@xe_module_load@load.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4329-f5136cded03e959ebb00a1160e5f00973c38007e/shard-bmg-2/igt@xe_module_load@load.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4329-f5136cded03e959ebb00a1160e5f00973c38007e/shard-bmg-9/igt@xe_module_load@load.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4329-f5136cded03e959ebb00a1160e5f00973c38007e/shard-bmg-3/igt@xe_module_load@load.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4329-f5136cded03e959ebb00a1160e5f00973c38007e/shard-bmg-3/igt@xe_module_load@load.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4329-f5136cded03e959ebb00a1160e5f00973c38007e/shard-bmg-3/igt@xe_module_load@load.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4329-f5136cded03e959ebb00a1160e5f00973c38007e/shard-bmg-8/igt@xe_module_load@load.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4329-f5136cded03e959ebb00a1160e5f00973c38007e/shard-bmg-8/igt@xe_module_load@load.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4329-f5136cded03e959ebb00a1160e5f00973c38007e/shard-bmg-8/igt@xe_module_load@load.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4329-f5136cded03e959ebb00a1160e5f00973c38007e/shard-bmg-9/igt@xe_module_load@load.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4329-f5136cded03e959ebb00a1160e5f00973c38007e/shard-bmg-10/igt@xe_module_load@load.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4329-f5136cded03e959ebb00a1160e5f00973c38007e/shard-bmg-7/igt@xe_module_load@load.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4329-f5136cded03e959ebb00a1160e5f00973c38007e/shard-bmg-7/igt@xe_module_load@load.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4329-f5136cded03e959ebb00a1160e5f00973c38007e/shard-bmg-7/igt@xe_module_load@load.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4329-f5136cded03e959ebb00a1160e5f00973c38007e/shard-bmg-1/igt@xe_module_load@load.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4329-f5136cded03e959ebb00a1160e5f00973c38007e/shard-bmg-1/igt@xe_module_load@load.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4329-f5136cded03e959ebb00a1160e5f00973c38007e/shard-bmg-2/igt@xe_module_load@load.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4329-f5136cded03e959ebb00a1160e5f00973c38007e/shard-bmg-2/igt@xe_module_load@load.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4329-f5136cded03e959ebb00a1160e5f00973c38007e/shard-bmg-9/igt@xe_module_load@load.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v2/shard-bmg-3/igt@xe_module_load@load.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v2/shard-bmg-7/igt@xe_module_load@load.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v2/shard-bmg-8/igt@xe_module_load@load.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v2/shard-bmg-7/igt@xe_module_load@load.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v2/shard-bmg-8/igt@xe_module_load@load.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v2/shard-bmg-9/igt@xe_module_load@load.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v2/shard-bmg-9/igt@xe_module_load@load.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v2/shard-bmg-8/igt@xe_module_load@load.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v2/shard-bmg-10/igt@xe_module_load@load.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v2/shard-bmg-1/igt@xe_module_load@load.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v2/shard-bmg-1/igt@xe_module_load@load.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v2/shard-bmg-1/igt@xe_module_load@load.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v2/shard-bmg-9/igt@xe_module_load@load.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v2/shard-bmg-8/igt@xe_module_load@load.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v2/shard-bmg-3/igt@xe_module_load@load.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v2/shard-bmg-10/igt@xe_module_load@load.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v2/shard-bmg-2/igt@xe_module_load@load.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v2/shard-bmg-9/igt@xe_module_load@load.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v2/shard-bmg-1/igt@xe_module_load@load.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v2/shard-bmg-2/igt@xe_module_load@load.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v2/shard-bmg-10/igt@xe_module_load@load.html

  * igt@xe_pmu@engine-activity-accuracy-50:
    - shard-lnl:          [FAIL][91] ([Intel XE#6251]) -> [PASS][92] +5 other tests pass
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4329-f5136cded03e959ebb00a1160e5f00973c38007e/shard-lnl-3/igt@xe_pmu@engine-activity-accuracy-50.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v2/shard-lnl-3/igt@xe_pmu@engine-activity-accuracy-50.html

  
#### Warnings ####

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][93] ([Intel XE#3544]) -> [SKIP][94] ([Intel XE#3374] / [Intel XE#3544])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4329-f5136cded03e959ebb00a1160e5f00973c38007e/shard-bmg-9/igt@kms_hdr@brightness-with-hdr.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v2/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [ABORT][95] ([Intel XE#6740]) -> [SKIP][96] ([Intel XE#1503])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4329-f5136cded03e959ebb00a1160e5f00973c38007e/shard-bmg-3/igt@kms_hdr@invalid-hdr.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v2/shard-bmg-2/igt@kms_hdr@invalid-hdr.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#6251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251
  [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
  [Intel XE#6740]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-4329-f5136cded03e959ebb00a1160e5f00973c38007e -> xe-pw-159119v2

  IGT_8682: 8682
  xe-4329-f5136cded03e959ebb00a1160e5f00973c38007e: f5136cded03e959ebb00a1160e5f00973c38007e
  xe-pw-159119v2: 159119v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v2/index.html

--===============5286874679013211129==
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
<tr><td><b>Series:</b></td><td>Enable THP support in drm_pagemap (rev2)</td=
></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/159119/">https://patchwork.freedesktop.org/series/159119/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-159119v2/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-159119v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4329-f5136cded03e959ebb00a1160e5f00973=
c38007e_FULL -&gt; xe-pw-159119v2_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-159119v2_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-159119v2_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1591=
19v2_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159119v2/shard-bmg-9/igt@xe_fault_injection@inject-fau=
lt-probe-function-xe_ggtt_init_early.html">ABORT</a> +6 other tests abort</=
li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4329-f5136cded03e959ebb00a1160e5f00973c38007e/shard-bmg-3/igt@xe_modul=
e_load@reload-no-display.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-159119v2/shard-bmg-8/igt@xe_module_load@reloa=
d-no-display.html">ABORT</a> +10 other tests abort</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-159119v2_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159119v2/shard-bmg-2/igt@kms_big_fb@linear-16bpp-rotat=
e-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159119v2/shard-bmg-2/igt@kms_big_fb@y-tiled-addfb-size=
-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/610">Intel XE#610</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159119v2/shard-bmg-9/igt@kms_big_fb@y-tiled-max-hw-str=
ide-64bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159119v2/shard-bmg-10/igt@kms_big_fb@yf-tiled-addfb-si=
ze-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159119v2/shard-bmg-10/igt@kms_bw@linear-tiling-4-displ=
ays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159119v2/shard-bmg-9/igt@kms_ccs@crc-primary-basic-4-t=
iled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159119v2/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4=
-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159119v2/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-bas=
ic-4-tiled-lnl-ccs@pipe-b-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159119v2/shard-bmg-2/igt@kms_chamelium_hpd@common-hpd-=
after-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2252">Intel XE#2252</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-64x21:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159119v2/shard-bmg-2/igt@kms_cursor_crc@cursor-onscree=
n-64x21.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159119v2/shard-bmg-2/igt@kms_dsc@dsc-fractional-bpp.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2244">Intel XE#2244</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4329-f5136cded03e959ebb00a1160e5f00973c38007e/shard-bmg-3/igt@kms_flip=
@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v2/shard-bmg-2/igt@kms=
_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Inte=
l XE#3321</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4329-f5136cded03e959ebb00a1160e5f00973c38007e/shard-lnl-5/igt@kms_flip=
@flip-vs-expired-vblank@a-edp1.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v2/shard-lnl-2/igt@kms_flip@flip-=
vs-expired-vblank@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159119v2/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bp=
p-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380=
</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling=
@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159119v2/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel X=
E#2293</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159119v2/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs=
-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +6 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159119v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-=
1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +3 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159119v2/shard-bmg-1/igt@kms_frontbuffer_tracking@plan=
e-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2350">Intel XE#2350</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159119v2/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-=
2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +10 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4329-f5136cded03e959ebb00a1160e5f00973c38007e/shard-bmg-2/igt@kms_hdr@=
bpc-switch-dpms@pipe-a-dp-2.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-159119v2/shard-bmg-3/igt@kms_hdr@bpc-switc=
h-dpms@pipe-a-dp-2.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/6740">Intel XE#6740</a>) +3 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159119v2/shard-bmg-10/igt@kms_joiner@basic-force-ultra=
-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6911">Intel XE#6911</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159119v2/shard-bmg-9/igt@kms_joiner@switch-modeset-ult=
ra-joiner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2925">Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159119v2/shard-bmg-2/igt@kms_pm_rpm@dpms-lpsp.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439=
">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3141">Intel XE#3141</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159119v2/shard-bmg-1/igt@kms_psr2_sf@pr-plane-move-sf-=
dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159119v2/shard-bmg-10/igt@kms_psr@pr-primary-render.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +8 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159119v2/shard-bmg-1/igt@kms_setmode@basic-clone-singl=
e-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159119v2/shard-bmg-2/igt@kms_vrr@cmrr.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel =
XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@vma-ufence:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159119v2/shard-bmg-1/igt@xe_eudebug@vma-ufence.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/483=
7">Intel XE#4837</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@pagefault-write:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159119v2/shard-bmg-2/igt@xe_eudebug_online@pagefault-w=
rite.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4837">Intel XE#4837</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/6665">Intel XE#6665</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159119v2/shard-bmg-10/igt@xe_exec_basic@multigpu-many-=
execqueues-many-vm-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +3 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-userptr-invalidate=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159119v2/shard-bmg-2/igt@xe_exec_multi_queue@many-exec=
s-preempt-mode-fault-userptr-invalidate.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +12 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159119v2/shard-bmg-1/igt@xe_exec_system_allocator@once=
-mmap-huge-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159119v2/shard-bmg-2/igt@xe_pxp@pxp-stale-bo-exec-post=
-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159119v2/shard-bmg-2/igt@xe_query@multigpu-query-inval=
id-uc-fw-version-mbz.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4329-f5136cded03e959ebb00a1160e5f00973c38007e/shard-lnl-5/igt@kms_flip=
@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v2/shard-lnl-2/igt@km=
s_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset-hang:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4329-f5136cded03e959ebb00a1160e5f00973c38007e/shard-bmg-2/igt@kms_vbla=
nk@ts-continuation-modeset-hang.html">ABORT</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v2/shard-bmg-1/ig=
t@kms_vblank@ts-continuation-modeset-hang.html">PASS</a> +1 other test pass=
</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4329-f5136cded03e959ebb00a1160e5f00973c38007e/shard-lnl-5/igt@kms_vrr@=
seamless-rr-switch-virtual@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2142">Intel XE#2142</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v2/shard-l=
nl-4/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">PASS</a> +1 =
other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4329-f5136cded03e959ebb00a1160e5f00973c38007e/shard-lnl-4/igt@xe_exec_=
system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625">Intel XE#=
5625</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
159119v2/shard-lnl-7/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx=
-uc-multi-vma.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-4329-f5136cded03e959ebb00a1160e5f00973c38007e/shard-bmg-7/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-4329-f5136cded03e959ebb00a1160e5f00973c38007e/shard-bmg-10/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-4329-f5136cded03e959ebb00a1160e5f00973c38007e/shard-bmg-10/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-4329-f5136cded03e959ebb00a1160e5f00973c38007e/shard-bmg=
-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-4329-f5136cded03e959ebb00a1160e5f00973c38007e/shard=
-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-4329-f5136cded03e959ebb00a1160e5f00973c38007e/s=
hard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-4329-f5136cded03e959ebb00a1160e5f00973c3800=
7e/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-4329-f5136cded03e959ebb00a1160e5f00973c=
38007e/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-4329-f5136cded03e959ebb00a1160e5f00=
973c38007e/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-4329-f5136cded03e959ebb00a1160e=
5f00973c38007e/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4329-f5136cded03e959ebb00a=
1160e5f00973c38007e/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4329-f5136cded03e959eb=
b00a1160e5f00973c38007e/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4329-f5136cded03e9=
59ebb00a1160e5f00973c38007e/shard-bmg-10/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4329-f5136cde=
d03e959ebb00a1160e5f00973c38007e/shard-bmg-7/igt@xe_module_load@load.html">=
SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4329-f513=
6cded03e959ebb00a1160e5f00973c38007e/shard-bmg-7/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4329-=
f5136cded03e959ebb00a1160e5f00973c38007e/shard-bmg-7/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4=
329-f5136cded03e959ebb00a1160e5f00973c38007e/shard-bmg-1/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-4329-f5136cded03e959ebb00a1160e5f00973c38007e/shard-bmg-1/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-4329-f5136cded03e959ebb00a1160e5f00973c38007e/shard-bmg-2/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-4329-f5136cded03e959ebb00a1160e5f00973c38007e/shard-bmg-2/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-4329-f5136cded03e959ebb00a1160e5f00973c38007e/shard-bmg-9/ig=
t@xe_module_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2457">Intel XE#2457</a>) -&gt; (<a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v2/shard-bmg-3/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-159119v2/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v2/shard-bm=
g-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-159119v2/shard-bmg-7/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
9119v2/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v2/shard-bmg-9/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-159119v2/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v2/shard-bm=
g-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-159119v2/shard-bmg-10/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
59119v2/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v2/shard-bmg-1/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-159119v2/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v2/shard-b=
mg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-159119v2/shard-bmg-8/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
59119v2/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v2/shard-bmg-10/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-159119v2/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v2/shard-=
bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-159119v2/shard-bmg-1/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
159119v2/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v2/shard-bmg-10/igt@xe_m=
odule_load@load.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-50:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4329-f5136cded03e959ebb00a1160e5f00973c38007e/shard-lnl-3/igt@xe_pmu@e=
ngine-activity-accuracy-50.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/6251">Intel XE#6251</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v2/shard-lnl-3/igt@xe_p=
mu@engine-activity-accuracy-50.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4329-f5136cded03e959ebb00a1160e5f00973c38007e/shard-bmg-9/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-159119v2/shard-bmg-7/igt@kms_hdr@bri=
ghtness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4329-f5136cded03e959ebb00a1160e5f00973c38007e/shard-bmg-3/igt@kms_hdr@=
invalid-hdr.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/6740">Intel XE#6740</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-159119v2/shard-bmg-2/igt@kms_hdr@invalid-hd=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4329-f5136cded03e959ebb00a1160e5f00973c38007e -&gt; xe-pw-159=
119v2</li>
</ul>
<p>IGT_8682: 8682<br />
  xe-4329-f5136cded03e959ebb00a1160e5f00973c38007e: f5136cded03e959ebb00a11=
60e5f00973c38007e<br />
  xe-pw-159119v2: 159119v2</p>

</body>
</html>

--===============5286874679013211129==--
