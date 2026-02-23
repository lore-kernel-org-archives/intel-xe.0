Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FBC7EA4FB3
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 11:58:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19FE810E2E4;
	Mon, 23 Feb 2026 11:58:14 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA75010E2E4;
 Mon, 23 Feb 2026 11:58:12 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6567871179039274525=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_series_starting_with_=5Bv5?=
 =?utf-8?q?=2C1/1=5D_drm/xe/gsc=3A_Fix_GSC_proxy_cleanup_on_early_initializa?=
 =?utf-8?q?tion_failure?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Zhanjun Dong" <zhanjun.dong@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 23 Feb 2026 11:58:12 -0000
Message-ID: <177184789280.274619.5701282333151691807@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260220225308.101469-1-zhanjun.dong@intel.com>
In-Reply-To: <20260220225308.101469-1-zhanjun.dong@intel.com>
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

--===============6567871179039274525==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [v5,1/1] drm/xe/gsc: Fix GSC proxy cleanup on early initialization failure
URL   : https://patchwork.freedesktop.org/series/161912/
State : failure

== Summary ==

CI Bug Log - changes from xe-4584-7c2ed7e89e283615b5f133d0205061934541e26d_FULL -> xe-pw-161912v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-161912v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-161912v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-161912v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-bmg:          [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4584-7c2ed7e89e283615b5f133d0205061934541e26d/shard-bmg-9/igt@kms_vblank@ts-continuation-suspend.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-bmg-1/igt@kms_vblank@ts-continuation-suspend.html

  * igt@xe_exec_balancer@many-execqueues-virtual-userptr-rebind:
    - shard-bmg:          [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4584-7c2ed7e89e283615b5f133d0205061934541e26d/shard-bmg-4/igt@xe_exec_balancer@many-execqueues-virtual-userptr-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-bmg-5/igt@xe_exec_balancer@many-execqueues-virtual-userptr-rebind.html

  * igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_create:
    - shard-lnl:          [PASS][5] -> [ABORT][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4584-7c2ed7e89e283615b5f133d0205061934541e26d/shard-lnl-8/igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_create.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-lnl-3/igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_create.html

  
Known issues
------------

  Here are the changes found in xe-pw-161912v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#1124])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-bmg-5/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [SKIP][8] ([Intel XE#1124]) +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-lnl-8/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#1512])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-lnl-8/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#2887]) +2 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-lnl-8/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-1:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2652]) +3 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-1.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2252])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html

  * igt@kms_chamelium_edid@vga-edid-read:
    - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#373])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-lnl-8/igt@kms_chamelium_edid@vga-edid-read.html

  * igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-1:
    - shard-bmg:          NOTRUN -> [FAIL][14] ([Intel XE#3304]) +1 other test fail
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-bmg-5/igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-1.html

  * igt@kms_cursor_crc@cursor-rapid-movement-256x85:
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#1424])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-lnl-8/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#1421]) +1 other test skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-lnl-8/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [PASS][17] -> [FAIL][18] ([Intel XE#301]) +1 other test fail
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4584-7c2ed7e89e283615b5f133d0205061934541e26d/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#1397] / [Intel XE#1745])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#1397])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#7178])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-modesetfrombusy:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#651]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#4141])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#7061])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2311])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#7061])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#656]) +5 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-lnl-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#6900])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-lnl-8/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_plane_cursor@primary:
    - shard-bmg:          [PASS][29] -> [FAIL][30] ([Intel XE#7201] / [Intel XE#7299])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4584-7c2ed7e89e283615b5f133d0205061934541e26d/shard-bmg-5/igt@kms_plane_cursor@primary.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-bmg-2/igt@kms_plane_cursor@primary.html

  * igt@kms_plane_cursor@primary@pipe-c-dp-2-size-256:
    - shard-bmg:          NOTRUN -> [FAIL][31] ([Intel XE#7201] / [Intel XE#7299])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-bmg-2/igt@kms_plane_cursor@primary@pipe-c-dp-2-size-256.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#599])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-lnl-8/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#2763] / [Intel XE#6886]) +3 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-lnl-8/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#870])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-bmg-5/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#1406] / [Intel XE#2893]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-lnl-8/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#1435])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-bmg-5/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@xe_eudebug@attach-debug-metadata:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#4837])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-lnl-8/igt@xe_eudebug@attach-debug-metadata.html

  * igt@xe_eudebug_online@single-step-one:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#4837] / [Intel XE#6665])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-lnl-8/igt@xe_eudebug_online@single-step-one.html

  * igt@xe_evict@evict-small:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#6540] / [Intel XE#688])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-lnl-8/igt@xe_evict@evict-small.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#1392]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-lnl-8/igt@xe_exec_basic@multigpu-once-bindexecqueue.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-priority:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#6874]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-bmg-5/igt@xe_exec_multi_queue@few-execs-preempt-mode-priority.html

  * igt@xe_exec_multi_queue@max-queues-preempt-mode-dyn-priority-smem:
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#6874]) +4 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-lnl-8/igt@xe_exec_multi_queue@max-queues-preempt-mode-dyn-priority-smem.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-single-vma:
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#6196])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-lnl-8/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-single-vma.html

  * igt@xe_exec_threads@threads-multi-queue-cm-basic:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#7138]) +2 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-lnl-8/igt@xe_exec_threads@threads-multi-queue-cm-basic.html

  * igt@xe_exec_threads@threads-multi-queue-rebind-err:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#7138])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-rebind-err.html

  * igt@xe_mmap@pci-membarrier-parallel:
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#5100])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-lnl-8/igt@xe_mmap@pci-membarrier-parallel.html

  * igt@xe_multigpu_svm@mgpu-concurrent-access-prefetch:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#6964])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-lnl-8/igt@xe_multigpu_svm@mgpu-concurrent-access-prefetch.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#579])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-lnl-8/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_query@multigpu-query-pxp-status:
    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#944]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-lnl-8/igt@xe_query@multigpu-query-pxp-status.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#3342])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-lnl-8/igt@xe_sriov_flr@flr-each-isolation.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [FAIL][51] -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4584-7c2ed7e89e283615b5f133d0205061934541e26d/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [FAIL][53] ([Intel XE#301]) -> [PASS][54] +1 other test pass
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4584-7c2ed7e89e283615b5f133d0205061934541e26d/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-bmg:          [INCOMPLETE][55] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][56] +1 other test pass
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4584-7c2ed7e89e283615b5f133d0205061934541e26d/shard-bmg-5/igt@kms_flip@flip-vs-suspend.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-bmg-5/igt@kms_flip@flip-vs-suspend.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:
    - shard-lnl:          [FAIL][57] ([Intel XE#5625]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4584-7c2ed7e89e283615b5f133d0205061934541e26d/shard-lnl-1/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-lnl-7/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html

  * igt@xe_exec_system_allocator@twice-large-mmap-shared-remap-dontunmap:
    - shard-bmg:          [DMESG-FAIL][59] ([Intel XE#5213] / [Intel XE#5545] / [Intel XE#6652]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4584-7c2ed7e89e283615b5f133d0205061934541e26d/shard-bmg-2/igt@xe_exec_system_allocator@twice-large-mmap-shared-remap-dontunmap.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-bmg-6/igt@xe_exec_system_allocator@twice-large-mmap-shared-remap-dontunmap.html

  * igt@xe_exec_system_allocator@twice-mmap-free-nomemset:
    - shard-bmg:          [SKIP][61] ([Intel XE#6703]) -> [PASS][62] +36 other tests pass
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4584-7c2ed7e89e283615b5f133d0205061934541e26d/shard-bmg-2/igt@xe_exec_system_allocator@twice-mmap-free-nomemset.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-bmg-6/igt@xe_exec_system_allocator@twice-mmap-free-nomemset.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
    - shard-lnl:          [ABORT][63] ([Intel XE#4757]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4584-7c2ed7e89e283615b5f133d0205061934541e26d/shard-lnl-2/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-lnl-8/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-bmg:          [SKIP][65] ([Intel XE#6557] / [Intel XE#6703]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4584-7c2ed7e89e283615b5f133d0205061934541e26d/shard-bmg-2/igt@xe_sriov_flr@flr-each-isolation.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-bmg-6/igt@xe_sriov_flr@flr-each-isolation.html

  
#### Warnings ####

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-bmg:          [SKIP][67] ([Intel XE#6703]) -> [SKIP][68] ([Intel XE#2887])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4584-7c2ed7e89e283615b5f133d0205061934541e26d/shard-bmg-2/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-bmg-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_cursor_crc@cursor-rapid-movement-256x85:
    - shard-bmg:          [SKIP][69] ([Intel XE#6557] / [Intel XE#6703]) -> [SKIP][70] ([Intel XE#2320])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4584-7c2ed7e89e283615b5f133d0205061934541e26d/shard-bmg-2/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-bmg-6/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-bmg:          [SKIP][71] ([Intel XE#6703]) -> [SKIP][72] ([Intel XE#7178])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4584-7c2ed7e89e283615b5f133d0205061934541e26d/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][73] ([Intel XE#6703]) -> [SKIP][74] ([Intel XE#2311])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4584-7c2ed7e89e283615b5f133d0205061934541e26d/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-rte:
    - shard-bmg:          [SKIP][75] ([Intel XE#6703]) -> [SKIP][76] ([Intel XE#2313])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4584-7c2ed7e89e283615b5f133d0205061934541e26d/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-rte.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-rte.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][77] ([Intel XE#3544]) -> [SKIP][78] ([Intel XE#3374] / [Intel XE#3544])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4584-7c2ed7e89e283615b5f133d0205061934541e26d/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          [SKIP][79] ([Intel XE#6703]) -> [SKIP][80] ([Intel XE#6911])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4584-7c2ed7e89e283615b5f133d0205061934541e26d/shard-bmg-2/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_vrr@flip-suspend:
    - shard-bmg:          [SKIP][81] ([Intel XE#6703]) -> [SKIP][82] ([Intel XE#1499])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4584-7c2ed7e89e283615b5f133d0205061934541e26d/shard-bmg-2/igt@kms_vrr@flip-suspend.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-bmg-6/igt@kms_vrr@flip-suspend.html

  * igt@xe_eudebug@attach-debug-metadata:
    - shard-bmg:          [SKIP][83] ([Intel XE#6703]) -> [SKIP][84] ([Intel XE#4837])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4584-7c2ed7e89e283615b5f133d0205061934541e26d/shard-bmg-2/igt@xe_eudebug@attach-debug-metadata.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-bmg-6/igt@xe_eudebug@attach-debug-metadata.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue:
    - shard-bmg:          [SKIP][85] ([Intel XE#6703]) -> [SKIP][86] ([Intel XE#2322])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4584-7c2ed7e89e283615b5f133d0205061934541e26d/shard-bmg-2/igt@xe_exec_basic@multigpu-once-bindexecqueue.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-bmg-6/igt@xe_exec_basic@multigpu-once-bindexecqueue.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd-smem:
    - shard-bmg:          [SKIP][87] ([Intel XE#6703]) -> [SKIP][88] ([Intel XE#6874]) +3 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4584-7c2ed7e89e283615b5f133d0205061934541e26d/shard-bmg-2/igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd-smem.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-bmg-6/igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd-smem.html

  * igt@xe_query@multigpu-query-pxp-status:
    - shard-bmg:          [SKIP][89] ([Intel XE#6703]) -> [SKIP][90] ([Intel XE#944])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4584-7c2ed7e89e283615b5f133d0205061934541e26d/shard-bmg-2/igt@xe_query@multigpu-query-pxp-status.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-bmg-6/igt@xe_query@multigpu-query-pxp-status.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4757]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4757
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#5100]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100
  [Intel XE#5213]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5213
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#6196]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6196
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#6557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652
  [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
  [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6900
  [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7201
  [Intel XE#7299]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7299
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-4584-7c2ed7e89e283615b5f133d0205061934541e26d -> xe-pw-161912v1

  IGT_8764: 8764
  xe-4584-7c2ed7e89e283615b5f133d0205061934541e26d: 7c2ed7e89e283615b5f133d0205061934541e26d
  xe-pw-161912v1: 161912v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/index.html

--===============6567871179039274525==
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
<tr><td><b>Series:</b></td><td>series starting with [v5,1/1] drm/xe/gsc: Fix GSC proxy cleanup on early initialization failure</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161912/">https://patchwork.freedesktop.org/series/161912/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4584-7c2ed7e89e283615b5f133d0205061934541e26d_FULL -&gt; xe-pw-161912v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-161912v1_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-161912v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-161912v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4584-7c2ed7e89e283615b5f133d0205061934541e26d/shard-bmg-9/igt@kms_vblank@ts-continuation-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-bmg-1/igt@kms_vblank@ts-continuation-suspend.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-virtual-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4584-7c2ed7e89e283615b5f133d0205061934541e26d/shard-bmg-4/igt@xe_exec_balancer@many-execqueues-virtual-userptr-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-bmg-5/igt@xe_exec_balancer@many-execqueues-virtual-userptr-rebind.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_create:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4584-7c2ed7e89e283615b5f133d0205061934541e26d/shard-lnl-8/igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_create.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-lnl-3/igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_create.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-161912v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-bmg-5/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-lnl-8/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-lnl-8/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512">Intel XE#1512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-lnl-8/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@vga-edid-read:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-lnl-8/igt@kms_chamelium_edid@vga-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-bmg-5/igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-256x85:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-lnl-8/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-lnl-8/igt@kms_flip@2x-dpms-vs-vblank-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4584-7c2ed7e89e283615b5f133d0205061934541e26d/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-modesetfrombusy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-lnl-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-lnl-8/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6900">Intel XE#6900</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4584-7c2ed7e89e283615b5f133d0205061934541e26d/shard-bmg-5/igt@kms_plane_cursor@primary.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-bmg-2/igt@kms_plane_cursor@primary.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7201">Intel XE#7201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7299">Intel XE#7299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-c-dp-2-size-256:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-bmg-2/igt@kms_plane_cursor@primary@pipe-c-dp-2-size-256.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7201">Intel XE#7201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7299">Intel XE#7299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-lnl-8/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-lnl-8/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-bmg-5/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-lnl-8/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-bmg-5/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@attach-debug-metadata:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-lnl-8/igt@xe_eudebug@attach-debug-metadata.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step-one:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-lnl-8/igt@xe_eudebug_online@single-step-one.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-lnl-8/igt@xe_evict@evict-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540">Intel XE#6540</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-lnl-8/igt@xe_exec_basic@multigpu-once-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-priority:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-bmg-5/igt@xe_exec_multi_queue@few-execs-preempt-mode-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@max-queues-preempt-mode-dyn-priority-smem:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-lnl-8/igt@xe_exec_multi_queue@max-queues-preempt-mode-dyn-priority-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-single-vma:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-lnl-8/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-single-vma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6196">Intel XE#6196</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-lnl-8/igt@xe_exec_threads@threads-multi-queue-cm-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-rebind-err:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-rebind-err.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier-parallel:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-lnl-8/igt@xe_mmap@pci-membarrier-parallel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100">Intel XE#5100</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-concurrent-access-prefetch:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-lnl-8/igt@xe_multigpu_svm@mgpu-concurrent-access-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-lnl-8/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-pxp-status:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-lnl-8/igt@xe_query@multigpu-query-pxp-status.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-lnl-8/igt@xe_sriov_flr@flr-each-isolation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4584-7c2ed7e89e283615b5f133d0205061934541e26d/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4584-7c2ed7e89e283615b5f133d0205061934541e26d/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4584-7c2ed7e89e283615b5f133d0205061934541e26d/shard-bmg-5/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-bmg-5/igt@kms_flip@flip-vs-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4584-7c2ed7e89e283615b5f133d0205061934541e26d/shard-lnl-1/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625">Intel XE#5625</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-lnl-7/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-mmap-shared-remap-dontunmap:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4584-7c2ed7e89e283615b5f133d0205061934541e26d/shard-bmg-2/igt@xe_exec_system_allocator@twice-large-mmap-shared-remap-dontunmap.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5213">Intel XE#5213</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652">Intel XE#6652</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-bmg-6/igt@xe_exec_system_allocator@twice-large-mmap-shared-remap-dontunmap.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-free-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4584-7c2ed7e89e283615b5f133d0205061934541e26d/shard-bmg-2/igt@xe_exec_system_allocator@twice-mmap-free-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-bmg-6/igt@xe_exec_system_allocator@twice-mmap-free-nomemset.html">PASS</a> +36 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4584-7c2ed7e89e283615b5f133d0205061934541e26d/shard-lnl-2/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4757">Intel XE#4757</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-lnl-8/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4584-7c2ed7e89e283615b5f133d0205061934541e26d/shard-bmg-2/igt@xe_sriov_flr@flr-each-isolation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-bmg-6/igt@xe_sriov_flr@flr-each-isolation.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4584-7c2ed7e89e283615b5f133d0205061934541e26d/shard-bmg-2/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-bmg-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-256x85:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4584-7c2ed7e89e283615b5f133d0205061934541e26d/shard-bmg-2/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-bmg-6/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4584-7c2ed7e89e283615b5f133d0205061934541e26d/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4584-7c2ed7e89e283615b5f133d0205061934541e26d/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-rte:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4584-7c2ed7e89e283615b5f133d0205061934541e26d/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4584-7c2ed7e89e283615b5f133d0205061934541e26d/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4584-7c2ed7e89e283615b5f133d0205061934541e26d/shard-bmg-2/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911">Intel XE#6911</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4584-7c2ed7e89e283615b5f133d0205061934541e26d/shard-bmg-2/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-bmg-6/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@attach-debug-metadata:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4584-7c2ed7e89e283615b5f133d0205061934541e26d/shard-bmg-2/igt@xe_eudebug@attach-debug-metadata.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-bmg-6/igt@xe_eudebug@attach-debug-metadata.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4584-7c2ed7e89e283615b5f133d0205061934541e26d/shard-bmg-2/igt@xe_exec_basic@multigpu-once-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-bmg-6/igt@xe_exec_basic@multigpu-once-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd-smem:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4584-7c2ed7e89e283615b5f133d0205061934541e26d/shard-bmg-2/igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-bmg-6/igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-pxp-status:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4584-7c2ed7e89e283615b5f133d0205061934541e26d/shard-bmg-2/igt@xe_query@multigpu-query-pxp-status.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161912v1/shard-bmg-6/igt@xe_query@multigpu-query-pxp-status.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4584-7c2ed7e89e283615b5f133d0205061934541e26d -&gt; xe-pw-161912v1</li>
</ul>
<p>IGT_8764: 8764<br />
  xe-4584-7c2ed7e89e283615b5f133d0205061934541e26d: 7c2ed7e89e283615b5f133d0205061934541e26d<br />
  xe-pw-161912v1: 161912v1</p>

</body>
</html>

--===============6567871179039274525==--
