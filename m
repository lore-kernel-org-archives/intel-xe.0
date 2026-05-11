Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94D77CD37AC
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 14:39:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56A2710E53F;
	Mon, 11 May 2026 14:39:48 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 761EF10E53F;
 Mon, 11 May 2026 14:39:46 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4571528324022544051=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/xe/madvise=3A_Skip_inv?=
 =?utf-8?q?alidation_for_purgeable_state_updates?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arvind Yadav" <arvind.yadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 11 May 2026 14:39:46 -0000
Message-ID: <177851038647.56530.14180037478911199160@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260511055405.91510-1-arvind.yadav@intel.com>
In-Reply-To: <20260511055405.91510-1-arvind.yadav@intel.com>
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

--===============4571528324022544051==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/madvise: Skip invalidation for purgeable state updates
URL   : https://patchwork.freedesktop.org/series/166291/
State : failure

== Summary ==

CI Bug Log - changes from xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c_FULL -> xe-pw-166291v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-166291v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-166291v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-166291v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_reset@long-spin-reuse-many-preempt-gt1-threads:
    - shard-bmg:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-3/igt@xe_exec_reset@long-spin-reuse-many-preempt-gt1-threads.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-10/igt@xe_exec_reset@long-spin-reuse-many-preempt-gt1-threads.html

  
Known issues
------------

  Here are the changes found in xe-pw-166291v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#1124]) +2 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-4/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#2887]) +2 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-4/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2252])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-4/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html

  * igt@kms_content_protection@atomic-hdcp14@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][6] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-2/igt@kms_content_protection@atomic-hdcp14@pipe-a-dp-2.html

  * igt@kms_content_protection@dp-mst-type-0-suspend-resume:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#6974])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-4/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2321] / [Intel XE#7355])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-4/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2244])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-8/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:
    - shard-lnl:          [PASS][10] -> [FAIL][11] ([Intel XE#6266]) +1 other test fail
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-lnl-3/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-lnl-8/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [PASS][12] -> [FAIL][13] ([Intel XE#301])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [PASS][14] -> [FAIL][15] ([Intel XE#301] / [Intel XE#3149]) +1 other test fail
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#4141]) +1 other test skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2311]) +10 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#7061] / [Intel XE#7356])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#7061])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-4/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2313]) +8 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-8/igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][21] -> [SKIP][22] ([Intel XE#1503])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-1/igt@kms_hdr@invalid-hdr.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-6/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010:
    - shard-bmg:          [PASS][23] -> [SKIP][24] ([Intel XE#7922]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-1/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-6/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#7283])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-4/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping.html

  * igt@kms_psr@psr2-sprite-blt:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-4/igt@kms_psr@psr2-sprite-blt.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#3904] / [Intel XE#7342])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@xe_eudebug@basic-client-th:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#7636]) +3 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-8/igt@xe_eudebug@basic-client-th.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2322] / [Intel XE#7372]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind.html

  * igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#7136]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-4/igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate.html

  * igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#6874]) +6 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-4/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#7138]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-4/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate.html

  * igt@xe_multigpu_svm@mgpu-latency-copy-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#6964])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-4/igt@xe_multigpu_svm@mgpu-latency-copy-prefetch.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#2284] / [Intel XE#7370])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-4/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_query@multigpu-query-oa-units:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#944])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-8/igt@xe_query@multigpu-query-oa-units.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-bmg:          [PASS][36] -> [ABORT][37] ([Intel XE#7914])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-1/igt@xe_wedged@wedged-mode-toggle.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-9/igt@xe_wedged@wedged-mode-toggle.html

  
#### Possible fixes ####

  * igt@core_getversion@basic:
    - shard-bmg:          [FAIL][38] -> [PASS][39]
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@core_getversion@basic.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-2/igt@core_getversion@basic.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-3:
    - shard-bmg:          [ABORT][40] ([Intel XE#5545] / [Intel XE#6652] / [Intel XE#7814]) -> [PASS][41] +1 other test pass
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-3.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [INCOMPLETE][42] ([Intel XE#7084]) -> [PASS][43] +1 other test pass
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [DMESG-WARN][44] ([Intel XE#5354]) -> [PASS][45]
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3:
    - shard-bmg:          [DMESG-FAIL][46] ([Intel XE#5545]) -> [PASS][47] +2 other tests pass
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-wf_vblank:
    - shard-bmg:          [SKIP][48] ([Intel XE#6557] / [Intel XE#6703]) -> [PASS][49] +1 other test pass
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@kms_flip@2x-flip-vs-wf_vblank.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-8/igt@kms_flip@2x-flip-vs-wf_vblank.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - shard-bmg:          [FAIL][50] ([Intel XE#3098]) -> [PASS][51] +1 other test pass
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-1/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-6/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f:
    - shard-bmg:          [SKIP][52] ([Intel XE#7915]) -> [PASS][53] +1 other test pass
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-3/igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-10/igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f.html

  * igt@xe_exec_system_allocator@threads-many-stride-free-nomemset:
    - shard-bmg:          [SKIP][54] ([Intel XE#6703]) -> [PASS][55] +208 other tests pass
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-stride-free-nomemset.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-stride-free-nomemset.html

  * igt@xe_module_load@reload-no-display:
    - shard-bmg:          [DMESG-WARN][56] -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@xe_module_load@reload-no-display.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-8/igt@xe_module_load@reload-no-display.html

  
#### Warnings ####

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-bmg:          [SKIP][58] ([Intel XE#6703]) -> [SKIP][59] ([Intel XE#610] / [Intel XE#7387])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-2/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
    - shard-bmg:          [SKIP][60] ([Intel XE#6703]) -> [SKIP][61] ([Intel XE#1124]) +2 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-2/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html

  * igt@kms_bw@connected-linear-tiling-2-displays-target-3840x2160p:
    - shard-bmg:          [SKIP][62] ([Intel XE#6703]) -> [SKIP][63] ([Intel XE#7679])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-target-3840x2160p.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-target-3840x2160p.html

  * igt@kms_bw@linear-tiling-1-displays-target-1920x1080p:
    - shard-bmg:          [SKIP][64] ([Intel XE#6703]) -> [SKIP][65] ([Intel XE#367])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-target-1920x1080p.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-8/igt@kms_bw@linear-tiling-1-displays-target-1920x1080p.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-ccs:
    - shard-bmg:          [SKIP][66] ([Intel XE#6703]) -> [SKIP][67] ([Intel XE#2887]) +2 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-2/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-bmg:          [SKIP][68] ([Intel XE#6703]) -> [SKIP][69] ([Intel XE#3432]) +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-bmg:          [SKIP][70] ([Intel XE#6703]) -> [SKIP][71] ([Intel XE#2325] / [Intel XE#7358])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@kms_chamelium_color@ctm-0-75.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-8/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-bmg:          [SKIP][72] ([Intel XE#6703]) -> [SKIP][73] ([Intel XE#2252])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@kms_chamelium_frames@dp-crc-fast.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-2/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_content_protection@atomic-hdcp14:
    - shard-bmg:          [SKIP][74] ([Intel XE#6703]) -> [FAIL][75] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@kms_content_protection@atomic-hdcp14.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-2/igt@kms_content_protection@atomic-hdcp14.html

  * igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:
    - shard-bmg:          [SKIP][76] ([Intel XE#6703]) -> [SKIP][77] ([Intel XE#6974])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-8/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html

  * igt@kms_cursor_crc@cursor-offscreen-max-size:
    - shard-bmg:          [SKIP][78] ([Intel XE#6703]) -> [SKIP][79] ([Intel XE#2320])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-max-size.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-max-size.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-bmg:          [SKIP][80] ([Intel XE#6703]) -> [SKIP][81] ([Intel XE#2321] / [Intel XE#7355])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-2/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-bmg:          [SKIP][82] ([Intel XE#6703]) -> [SKIP][83] ([Intel XE#2244])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-2/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-bmg:          [SKIP][84] ([Intel XE#6703]) -> [SKIP][85] ([Intel XE#7178] / [Intel XE#7351])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][86] ([Intel XE#6703]) -> [SKIP][87] ([Intel XE#2311]) +23 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][88] ([Intel XE#6703]) -> [SKIP][89] ([Intel XE#4141]) +2 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][90] ([Intel XE#6557] / [Intel XE#6703]) -> [SKIP][91] ([Intel XE#4141])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-mmap-wc:
    - shard-bmg:          [SKIP][92] ([Intel XE#6703]) -> [SKIP][93] ([Intel XE#7061]) +5 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-mmap-wc.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-2/igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][94] ([Intel XE#6703]) -> [SKIP][95] ([Intel XE#2313]) +16 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-render.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-2/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping:
    - shard-bmg:          [SKIP][96] ([Intel XE#6703]) -> [SKIP][97] ([Intel XE#7283]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-8/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-bmg:          [SKIP][98] ([Intel XE#6703]) -> [SKIP][99] ([Intel XE#1489]) +3 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-8/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-bmg:          [SKIP][100] ([Intel XE#6703]) -> [SKIP][101] ([Intel XE#2387] / [Intel XE#7429])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@kms_psr2_su@page_flip-p010.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-2/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@psr2-suspend:
    - shard-bmg:          [SKIP][102] ([Intel XE#6703]) -> [SKIP][103] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@kms_psr@psr2-suspend.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-2/igt@kms_psr@psr2-suspend.html

  * igt@kms_sharpness_filter@invalid-filter-with-plane:
    - shard-bmg:          [SKIP][104] ([Intel XE#6703]) -> [SKIP][105] ([Intel XE#6503])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@kms_sharpness_filter@invalid-filter-with-plane.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-8/igt@kms_sharpness_filter@invalid-filter-with-plane.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][106] ([Intel XE#1729] / [Intel XE#7424]) -> [SKIP][107] ([Intel XE#2426] / [Intel XE#5848])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@flip-basic:
    - shard-bmg:          [SKIP][108] ([Intel XE#6703]) -> [SKIP][109] ([Intel XE#1499])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@kms_vrr@flip-basic.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-2/igt@kms_vrr@flip-basic.html

  * igt@xe_eudebug_online@set-breakpoint-sigint-debugger:
    - shard-bmg:          [SKIP][110] ([Intel XE#6703]) -> [SKIP][111] ([Intel XE#7636]) +3 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-8/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html

  * igt@xe_eudebug_sriov@deny-sriov:
    - shard-bmg:          [SKIP][112] ([Intel XE#6703]) -> [SKIP][113] ([Intel XE#5793] / [Intel XE#7320] / [Intel XE#7464])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@xe_eudebug_sriov@deny-sriov.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-2/igt@xe_eudebug_sriov@deny-sriov.html

  * igt@xe_evict@evict-small-external-multi-queue-cm:
    - shard-bmg:          [SKIP][114] ([Intel XE#6703]) -> [SKIP][115] ([Intel XE#7140])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@xe_evict@evict-small-external-multi-queue-cm.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-8/igt@xe_evict@evict-small-external-multi-queue-cm.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:
    - shard-bmg:          [SKIP][116] ([Intel XE#6703]) -> [SKIP][117] ([Intel XE#2322] / [Intel XE#7372]) +1 other test skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html

  * igt@xe_exec_fault_mode@many-multi-queue-rebind-prefetch:
    - shard-bmg:          [SKIP][118] ([Intel XE#6703]) -> [SKIP][119] ([Intel XE#7136]) +3 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@xe_exec_fault_mode@many-multi-queue-rebind-prefetch.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-8/igt@xe_exec_fault_mode@many-multi-queue-rebind-prefetch.html

  * igt@xe_exec_multi_queue@one-queue-preempt-mode-close-fd-smem:
    - shard-bmg:          [SKIP][120] ([Intel XE#6703]) -> [SKIP][121] ([Intel XE#6874]) +6 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@xe_exec_multi_queue@one-queue-preempt-mode-close-fd-smem.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-2/igt@xe_exec_multi_queue@one-queue-preempt-mode-close-fd-smem.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-fd-basic:
    - shard-bmg:          [SKIP][122] ([Intel XE#6703]) -> [SKIP][123] ([Intel XE#7138]) +3 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-mixed-fd-basic.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-mixed-fd-basic.html

  * igt@xe_page_reclaim@basic-mixed:
    - shard-bmg:          [SKIP][124] ([Intel XE#6703]) -> [SKIP][125] ([Intel XE#7793]) +1 other test skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@xe_page_reclaim@basic-mixed.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-2/igt@xe_page_reclaim@basic-mixed.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-bmg:          [SKIP][126] ([Intel XE#6703]) -> [SKIP][127] ([Intel XE#2284] / [Intel XE#7370])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@xe_pm@d3cold-mmap-vram.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-8/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pxp@pxp-stale-queue-post-termination-irq:
    - shard-bmg:          [SKIP][128] ([Intel XE#6703]) -> [SKIP][129] ([Intel XE#4733] / [Intel XE#7417])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@xe_pxp@pxp-stale-queue-post-termination-irq.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-2/igt@xe_pxp@pxp-stale-queue-post-termination-irq.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5793
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#6266]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557
  [Intel XE#6652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652
  [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#7140]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7320
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
  [Intel XE#7464]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7464
  [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7814
  [Intel XE#7914]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7914
  [Intel XE#7915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915
  [Intel XE#7922]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7922
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c -> xe-pw-166291v1

  IGT_8902: d28bd0b9e0347c58ca9b012c02de7e2ad5ffe847 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c: a86f5af06a7f8fa3c0a87caa138d06824f87878c
  xe-pw-166291v1: 166291v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/index.html

--===============4571528324022544051==
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
<tr><td><b>Series:</b></td><td>drm/xe/madvise: Skip invalidation for purgeable state updates</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/166291/">https://patchwork.freedesktop.org/series/166291/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c_FULL -&gt; xe-pw-166291v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-166291v1_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-166291v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-166291v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_reset@long-spin-reuse-many-preempt-gt1-threads:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-3/igt@xe_exec_reset@long-spin-reuse-many-preempt-gt1-threads.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-10/igt@xe_exec_reset@long-spin-reuse-many-preempt-gt1-threads.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-166291v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-4/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-4/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm-disable:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-4/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-hdcp14@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-2/igt@kms_content_protection@atomic-hdcp14@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-suspend-resume:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-4/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-4/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-8/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-lnl-3/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-lnl-8/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266">Intel XE#6266</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-4/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-8/igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-1/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-6/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-1/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-6/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7922">Intel XE#7922</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-4/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-4/igt@kms_psr@psr2-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-client-th:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-8/igt@xe_eudebug@basic-client-th.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-4/igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-4/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-4/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-latency-copy-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-4/igt@xe_multigpu_svm@mgpu-latency-copy-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-4/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-oa-units:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-8/igt@xe_query@multigpu-query-oa-units.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-1/igt@xe_wedged@wedged-mode-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-9/igt@xe_wedged@wedged-mode-toggle.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7914">Intel XE#7914</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_getversion@basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@core_getversion@basic.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-2/igt@core_getversion@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-3.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652">Intel XE#6652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7814">Intel XE#7814</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354">Intel XE#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@kms_flip@2x-flip-vs-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-8/igt@kms_flip@2x-flip-vs-wf_vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-6/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-3/igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-10/igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-free-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-stride-free-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-stride-free-nomemset.html">PASS</a> +208 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@xe_module_load@reload-no-display.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-8/igt@xe_module_load@reload-no-display.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-2/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387">Intel XE#7387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-2/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-target-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-8/igt@kms_bw@linear-tiling-1-displays-target-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-2/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-8/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-2/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-hdcp14:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@kms_content_protection@atomic-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-2/igt@kms_content_protection@atomic-hdcp14.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-8/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-max-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-2/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-2/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-2/igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-2/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-8/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-8/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-2/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429">Intel XE#7429</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@kms_psr@psr2-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-2/igt@kms_psr@psr2-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-plane:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@kms_sharpness_filter@invalid-filter-with-plane.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-8/igt@kms_sharpness_filter@invalid-filter-with-plane.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-2/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint-sigint-debugger:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-8/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-sriov:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@xe_eudebug_sriov@deny-sriov.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-2/igt@xe_eudebug_sriov@deny-sriov.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5793">Intel XE#5793</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7320">Intel XE#7320</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7464">Intel XE#7464</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-multi-queue-cm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@xe_evict@evict-small-external-multi-queue-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-8/igt@xe_evict@evict-small-external-multi-queue-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140">Intel XE#7140</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-rebind-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@xe_exec_fault_mode@many-multi-queue-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-8/igt@xe_exec_fault_mode@many-multi-queue-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-preempt-mode-close-fd-smem:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@xe_exec_multi_queue@one-queue-preempt-mode-close-fd-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-2/igt@xe_exec_multi_queue@one-queue-preempt-mode-close-fd-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-fd-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-mixed-fd-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-mixed-fd-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@basic-mixed:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@xe_page_reclaim@basic-mixed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-2/igt@xe_page_reclaim@basic-mixed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-8/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-queue-post-termination-irq:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@xe_pxp@pxp-stale-queue-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v1/shard-bmg-2/igt@xe_pxp@pxp-stale-queue-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c -&gt; xe-pw-166291v1</li>
</ul>
<p>IGT_8902: d28bd0b9e0347c58ca9b012c02de7e2ad5ffe847 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5039-a86f5af06a7f8fa3c0a87caa138d06824f87878c: a86f5af06a7f8fa3c0a87caa138d06824f87878c<br />
  xe-pw-166291v1: 166291v1</p>

</body>
</html>

--===============4571528324022544051==--
