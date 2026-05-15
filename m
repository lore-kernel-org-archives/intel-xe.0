Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D5F2CD343F
	for <intel-xe@archiver.kernel.org>; Fri, 15 May 2026 12:10:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07AA410F50A;
	Fri, 15 May 2026 12:10:35 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6536310F4F3;
 Fri, 15 May 2026 12:10:33 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4608231983788414453=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/xe/pf=3A_Fix_CFI_failu?=
 =?utf-8?q?re_in_debugfs_access_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mohanram Meenakshisundaram" <mohanram.meenakshisundaram@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 15 May 2026 12:10:33 -0000
Message-ID: <177884703340.75062.2647341151069875391@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260514090352.1554803-1-mohanram.meenakshisundaram@intel.com>
In-Reply-To: <20260514090352.1554803-1-mohanram.meenakshisundaram@intel.com>
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

--===============4608231983788414453==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/pf: Fix CFI failure in debugfs access (rev2)
URL   : https://patchwork.freedesktop.org/series/166565/
State : failure

== Summary ==

CI Bug Log - changes from xe-5063-121c16f9d8c56ea07263df84ab971cc10870fe88_FULL -> xe-pw-166565v2_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-166565v2_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-166565v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-166565v2_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_module_load@force-load:
    - shard-bmg:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5063-121c16f9d8c56ea07263df84ab971cc10870fe88/shard-bmg-7/igt@xe_module_load@force-load.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166565v2/shard-bmg-2/igt@xe_module_load@force-load.html

  
Known issues
------------

  Here are the changes found in xe-pw-166565v2_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-lnl:          [PASS][3] -> [FAIL][4] ([Intel XE#3718] / [Intel XE#7265])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5063-121c16f9d8c56ea07263df84ab971cc10870fe88/shard-lnl-5/igt@kms_async_flips@alternate-sync-async-flip.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166565v2/shard-lnl-2/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-edp-1:
    - shard-lnl:          [PASS][5] -> [FAIL][6] ([Intel XE#7265])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5063-121c16f9d8c56ea07263df84ab971cc10870fe88/shard-lnl-5/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-edp-1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166565v2/shard-lnl-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-edp-1.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][7] -> [SKIP][8] ([Intel XE#1503])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5063-121c16f9d8c56ea07263df84ab971cc10870fe88/shard-bmg-8/igt@kms_hdr@invalid-hdr.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166565v2/shard-bmg-6/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010:
    - shard-bmg:          [PASS][9] -> [SKIP][10] ([Intel XE#7922]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5063-121c16f9d8c56ea07263df84ab971cc10870fe88/shard-bmg-8/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166565v2/shard-bmg-6/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html

  * igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010:
    - shard-bmg:          [PASS][11] -> [SKIP][12] ([Intel XE#7915]) +3 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5063-121c16f9d8c56ea07263df84ab971cc10870fe88/shard-bmg-9/igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166565v2/shard-bmg-7/igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-bmg:          [PASS][13] -> [SKIP][14] ([Intel XE#6703]) +25 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5063-121c16f9d8c56ea07263df84ab971cc10870fe88/shard-bmg-7/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166565v2/shard-bmg-2/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_rotation_crc@multiplane-rotation:
    - shard-bmg:          [PASS][15] -> [DMESG-FAIL][16] ([Intel XE#7129] / [Intel XE#7774])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5063-121c16f9d8c56ea07263df84ab971cc10870fe88/shard-bmg-7/igt@kms_rotation_crc@multiplane-rotation.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166565v2/shard-bmg-2/igt@kms_rotation_crc@multiplane-rotation.html

  * igt@xe_pxp@pxp-optout:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#4733] / [Intel XE#7417])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166565v2/shard-bmg-1/igt@xe_pxp@pxp-optout.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-bmg:          [PASS][18] -> [ABORT][19] ([Intel XE#7914])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5063-121c16f9d8c56ea07263df84ab971cc10870fe88/shard-bmg-1/igt@xe_wedged@wedged-mode-toggle.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166565v2/shard-bmg-8/igt@xe_wedged@wedged-mode-toggle.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-bmg:          [FAIL][20] ([Intel XE#3718] / [Intel XE#6078]) -> [PASS][21]
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5063-121c16f9d8c56ea07263df84ab971cc10870fe88/shard-bmg-9/igt@kms_async_flips@alternate-sync-async-flip.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166565v2/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2:
    - shard-bmg:          [FAIL][22] ([Intel XE#6078]) -> [PASS][23]
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5063-121c16f9d8c56ea07263df84ab971cc10870fe88/shard-bmg-9/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166565v2/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [FAIL][24] ([Intel XE#301]) -> [PASS][25] +1 other test pass
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5063-121c16f9d8c56ea07263df84ab971cc10870fe88/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166565v2/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
    - shard-lnl:          [FAIL][26] ([Intel XE#2142]) -> [PASS][27] +1 other test pass
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5063-121c16f9d8c56ea07263df84ab971cc10870fe88/shard-lnl-8/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166565v2/shard-lnl-3/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][28] ([Intel XE#6321]) -> [PASS][29]
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5063-121c16f9d8c56ea07263df84ab971cc10870fe88/shard-bmg-10/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166565v2/shard-bmg-5/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_exec_reset@long-spin-many-preempt-gt1-threads:
    - shard-bmg:          [FAIL][30] ([Intel XE#7956]) -> [PASS][31]
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5063-121c16f9d8c56ea07263df84ab971cc10870fe88/shard-bmg-3/igt@xe_exec_reset@long-spin-many-preempt-gt1-threads.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166565v2/shard-bmg-8/igt@xe_exec_reset@long-spin-many-preempt-gt1-threads.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][32] ([Intel XE#2311]) -> [SKIP][33] ([Intel XE#6703]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5063-121c16f9d8c56ea07263df84ab971cc10870fe88/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-mmap-wc.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166565v2/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-render:
    - shard-bmg:          [SKIP][34] ([Intel XE#7061] / [Intel XE#7356]) -> [SKIP][35] ([Intel XE#6703])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5063-121c16f9d8c56ea07263df84ab971cc10870fe88/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-render.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166565v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][36] ([Intel XE#2313]) -> [SKIP][37] ([Intel XE#6703]) +2 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5063-121c16f9d8c56ea07263df84ab971cc10870fe88/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-indfb-msflip-blt.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166565v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][38] ([Intel XE#2313]) -> [SKIP][39] ([Intel XE#6557] / [Intel XE#6703])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5063-121c16f9d8c56ea07263df84ab971cc10870fe88/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166565v2/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][40] ([Intel XE#3544] / [Intel XE#7915] / [Intel XE#7916]) -> [SKIP][41] ([Intel XE#3544] / [Intel XE#7916])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5063-121c16f9d8c56ea07263df84ab971cc10870fe88/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166565v2/shard-bmg-10/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f:
    - shard-bmg:          [SKIP][42] ([Intel XE#7915]) -> [SKIP][43] ([Intel XE#7916]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5063-121c16f9d8c56ea07263df84ab971cc10870fe88/shard-bmg-8/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166565v2/shard-bmg-10/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f.html

  * igt@kms_psr@psr2-cursor-plane-onoff:
    - shard-bmg:          [SKIP][44] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][45] ([Intel XE#6703])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5063-121c16f9d8c56ea07263df84ab971cc10870fe88/shard-bmg-7/igt@kms_psr@psr2-cursor-plane-onoff.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166565v2/shard-bmg-2/igt@kms_psr@psr2-cursor-plane-onoff.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][46] ([Intel XE#2426] / [Intel XE#5848]) -> [FAIL][47] ([Intel XE#1729] / [Intel XE#7424])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5063-121c16f9d8c56ea07263df84ab971cc10870fe88/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166565v2/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][48] ([Intel XE#2509] / [Intel XE#7437]) -> [SKIP][49] ([Intel XE#2426] / [Intel XE#5848])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5063-121c16f9d8c56ea07263df84ab971cc10870fe88/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166565v2/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_evict@evict-small-multi-queue-priority:
    - shard-bmg:          [SKIP][50] ([Intel XE#7140]) -> [SKIP][51] ([Intel XE#6703])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5063-121c16f9d8c56ea07263df84ab971cc10870fe88/shard-bmg-7/igt@xe_evict@evict-small-multi-queue-priority.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166565v2/shard-bmg-2/igt@xe_evict@evict-small-multi-queue-priority.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-prefetch:
    - shard-bmg:          [SKIP][52] ([Intel XE#7136]) -> [SKIP][53] ([Intel XE#6703])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5063-121c16f9d8c56ea07263df84ab971cc10870fe88/shard-bmg-7/igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-prefetch.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166565v2/shard-bmg-2/igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-prefetch.html

  * igt@xe_exec_multi_queue@two-queues-priority:
    - shard-bmg:          [SKIP][54] ([Intel XE#6874]) -> [SKIP][55] ([Intel XE#6703]) +2 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5063-121c16f9d8c56ea07263df84ab971cc10870fe88/shard-bmg-7/igt@xe_exec_multi_queue@two-queues-priority.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166565v2/shard-bmg-2/igt@xe_exec_multi_queue@two-queues-priority.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-basic:
    - shard-bmg:          [SKIP][56] ([Intel XE#7138]) -> [SKIP][57] ([Intel XE#6703])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5063-121c16f9d8c56ea07263df84ab971cc10870fe88/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-mixed-basic.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166565v2/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-mixed-basic.html

  
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557
  [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7129
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#7140]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140
  [Intel XE#7265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7265
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7774]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774
  [Intel XE#7914]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7914
  [Intel XE#7915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915
  [Intel XE#7916]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7916
  [Intel XE#7922]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7922
  [Intel XE#7956]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7956


Build changes
-------------

  * Linux: xe-5063-121c16f9d8c56ea07263df84ab971cc10870fe88 -> xe-pw-166565v2

  IGT_8912: 22222b7d987067331459c2a866e6387a669b7f70 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5063-121c16f9d8c56ea07263df84ab971cc10870fe88: 121c16f9d8c56ea07263df84ab971cc10870fe88
  xe-pw-166565v2: 166565v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166565v2/index.html

--===============4608231983788414453==
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
<tr><td><b>Series:</b></td><td>drm/xe/pf: Fix CFI failure in debugfs access (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/166565/">https://patchwork.freedesktop.org/series/166565/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166565v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166565v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5063-121c16f9d8c56ea07263df84ab971cc10870fe88_FULL -&gt; xe-pw-166565v2_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-166565v2_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-166565v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-166565v2_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_module_load@force-load:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5063-121c16f9d8c56ea07263df84ab971cc10870fe88/shard-bmg-7/igt@xe_module_load@force-load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166565v2/shard-bmg-2/igt@xe_module_load@force-load.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-166565v2_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5063-121c16f9d8c56ea07263df84ab971cc10870fe88/shard-lnl-5/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166565v2/shard-lnl-2/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7265">Intel XE#7265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5063-121c16f9d8c56ea07263df84ab971cc10870fe88/shard-lnl-5/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166565v2/shard-lnl-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7265">Intel XE#7265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5063-121c16f9d8c56ea07263df84ab971cc10870fe88/shard-bmg-8/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166565v2/shard-bmg-6/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5063-121c16f9d8c56ea07263df84ab971cc10870fe88/shard-bmg-8/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166565v2/shard-bmg-6/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7922">Intel XE#7922</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5063-121c16f9d8c56ea07263df84ab971cc10870fe88/shard-bmg-9/igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166565v2/shard-bmg-7/igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5063-121c16f9d8c56ea07263df84ab971cc10870fe88/shard-bmg-7/igt@kms_plane@plane-panning-bottom-right-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166565v2/shard-bmg-2/igt@kms_plane@plane-panning-bottom-right-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5063-121c16f9d8c56ea07263df84ab971cc10870fe88/shard-bmg-7/igt@kms_rotation_crc@multiplane-rotation.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166565v2/shard-bmg-2/igt@kms_rotation_crc@multiplane-rotation.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7129">Intel XE#7129</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774">Intel XE#7774</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-optout:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166565v2/shard-bmg-1/igt@xe_pxp@pxp-optout.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5063-121c16f9d8c56ea07263df84ab971cc10870fe88/shard-bmg-1/igt@xe_wedged@wedged-mode-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166565v2/shard-bmg-8/igt@xe_wedged@wedged-mode-toggle.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7914">Intel XE#7914</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5063-121c16f9d8c56ea07263df84ab971cc10870fe88/shard-bmg-9/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166565v2/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5063-121c16f9d8c56ea07263df84ab971cc10870fe88/shard-bmg-9/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166565v2/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5063-121c16f9d8c56ea07263df84ab971cc10870fe88/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166565v2/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5063-121c16f9d8c56ea07263df84ab971cc10870fe88/shard-lnl-8/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142">Intel XE#2142</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166565v2/shard-lnl-3/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5063-121c16f9d8c56ea07263df84ab971cc10870fe88/shard-bmg-10/igt@xe_evict@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166565v2/shard-bmg-5/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@long-spin-many-preempt-gt1-threads:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5063-121c16f9d8c56ea07263df84ab971cc10870fe88/shard-bmg-3/igt@xe_exec_reset@long-spin-many-preempt-gt1-threads.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7956">Intel XE#7956</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166565v2/shard-bmg-8/igt@xe_exec_reset@long-spin-many-preempt-gt1-threads.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5063-121c16f9d8c56ea07263df84ab971cc10870fe88/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166565v2/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5063-121c16f9d8c56ea07263df84ab971cc10870fe88/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166565v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5063-121c16f9d8c56ea07263df84ab971cc10870fe88/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166565v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5063-121c16f9d8c56ea07263df84ab971cc10870fe88/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166565v2/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5063-121c16f9d8c56ea07263df84ab971cc10870fe88/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7916">Intel XE#7916</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166565v2/shard-bmg-10/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7916">Intel XE#7916</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5063-121c16f9d8c56ea07263df84ab971cc10870fe88/shard-bmg-8/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166565v2/shard-bmg-10/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7916">Intel XE#7916</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5063-121c16f9d8c56ea07263df84ab971cc10870fe88/shard-bmg-7/igt@kms_psr@psr2-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166565v2/shard-bmg-2/igt@kms_psr@psr2-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5063-121c16f9d8c56ea07263df84ab971cc10870fe88/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166565v2/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5063-121c16f9d8c56ea07263df84ab971cc10870fe88/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437">Intel XE#7437</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166565v2/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue-priority:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5063-121c16f9d8c56ea07263df84ab971cc10870fe88/shard-bmg-7/igt@xe_evict@evict-small-multi-queue-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140">Intel XE#7140</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166565v2/shard-bmg-2/igt@xe_evict@evict-small-multi-queue-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5063-121c16f9d8c56ea07263df84ab971cc10870fe88/shard-bmg-7/igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166565v2/shard-bmg-2/igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-priority:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5063-121c16f9d8c56ea07263df84ab971cc10870fe88/shard-bmg-7/igt@xe_exec_multi_queue@two-queues-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166565v2/shard-bmg-2/igt@xe_exec_multi_queue@two-queues-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5063-121c16f9d8c56ea07263df84ab971cc10870fe88/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-mixed-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166565v2/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-mixed-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5063-121c16f9d8c56ea07263df84ab971cc10870fe88 -&gt; xe-pw-166565v2</li>
</ul>
<p>IGT_8912: 22222b7d987067331459c2a866e6387a669b7f70 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5063-121c16f9d8c56ea07263df84ab971cc10870fe88: 121c16f9d8c56ea07263df84ab971cc10870fe88<br />
  xe-pw-166565v2: 166565v2</p>

</body>
</html>

--===============4608231983788414453==--
