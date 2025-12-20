Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6F42E668AC
	for <intel-xe@archiver.kernel.org>; Sat, 20 Dec 2025 01:22:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B27110E0A6;
	Sat, 20 Dec 2025 01:22:16 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B1D510E0A6;
 Sat, 20 Dec 2025 01:22:15 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2027755273025362784=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Attempt_to_fixup_reset=2C_?=
 =?utf-8?q?wedge=2C_unload_corner_cases?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 20 Dec 2025 01:22:15 -0000
Message-ID: <176619373529.108745.1349708094434518869@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251218214418.4037401-1-matthew.brost@intel.com>
In-Reply-To: <20251218214418.4037401-1-matthew.brost@intel.com>
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

--===============2027755273025362784==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Attempt to fixup reset, wedge, unload corner cases
URL   : https://patchwork.freedesktop.org/series/159247/
State : failure

== Summary ==

CI Bug Log - changes from xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4_FULL -> xe-pw-159247v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-159247v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-159247v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-159247v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:
    - shard-bmg:          [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-10/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-8/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html

  
Known issues
------------

  Here are the changes found in xe-pw-159247v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_getversion@all-cards:
    - shard-bmg:          [PASS][3] -> [FAIL][4] ([Intel XE#6914])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-4/igt@core_getversion@all-cards.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@core_getversion@all-cards.html

  * igt@core_hotunplug@unbind-rebind:
    - shard-bmg:          [PASS][5] -> [SKIP][6] ([Intel XE#6779])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-8/igt@core_hotunplug@unbind-rebind.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@core_hotunplug@unbind-rebind.html

  * igt@core_setmaster@master-drop-set-user:
    - shard-bmg:          [PASS][7] -> [FAIL][8] ([Intel XE#4674])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-8/igt@core_setmaster@master-drop-set-user.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@core_setmaster@master-drop-set-user.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2327]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-10/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#1124]) +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-10/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_bw@linear-tiling-3-displays-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#367])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-10/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2887]) +4 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-10/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2724])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-10/igt@kms_cdclk@mode-transition.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2252]) +2 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-10/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_content_protection@srm@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][15] ([Intel XE#1178])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-1/igt@kms_content_protection@srm@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2321]) +1 other test skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-10/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:
    - shard-bmg:          [PASS][17] -> [SKIP][18] ([Intel XE#2291]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2286])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-10/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [PASS][20] -> [SKIP][21] ([Intel XE#4302])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-1/igt@kms_display_modes@extended-mode-basic.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-4/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2244])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-10/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
    - shard-bmg:          [PASS][23] -> [SKIP][24] ([Intel XE#2316]) +3 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-2/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-bmg:          [PASS][25] -> [INCOMPLETE][26] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-9/igt@kms_flip@flip-vs-suspend.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-2/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@wf_vblank-ts-check:
    - shard-bmg:          [PASS][27] -> [SKIP][28] ([Intel XE#6703]) +429 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-4/igt@kms_flip@wf_vblank-ts-check.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_flip@wf_vblank-ts-check.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2293]) +3 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#4141]) +5 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2311]) +11 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2313]) +6 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#6901])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-10/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-bmg:          [PASS][34] -> [SKIP][35] ([Intel XE#4596])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-none.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#5020])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-10/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#6886]) +7 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#1406] / [Intel XE#1489]) +2 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-10/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr@psr2-sprite-blt:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-10/igt@kms_psr@psr2-sprite-blt.html

  * igt@kms_sharpness_filter@filter-tap:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#6503])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-10/igt@kms_sharpness_filter@filter-tap.html

  * igt@xe_eudebug@multigpu-basic-client:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#4837]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-10/igt@xe_eudebug@multigpu-basic-client.html

  * igt@xe_eudebug_online@pagefault-read:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#4837] / [Intel XE#6665])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-10/igt@xe_eudebug_online@pagefault-read.html

  * igt@xe_exec_basic@multigpu-once-null-defer-mmap:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#2322]) +2 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-10/igt@xe_exec_basic@multigpu-once-null-defer-mmap.html

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#6874]) +8 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-10/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority.html

  * igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#4943]) +8 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-10/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:
    - shard-lnl:          [PASS][46] -> [FAIL][47] ([Intel XE#5625])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-lnl-4/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-lnl-3/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-prefetch:
    - shard-bmg:          [PASS][48] -> [SKIP][49] ([Intel XE#6557] / [Intel XE#6703]) +4 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-8/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-prefetch.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-prefetch.html

  * igt@xe_module_load@reload-no-display:
    - shard-bmg:          [PASS][50] -> [FAIL][51] ([Intel XE#6913]) +1 other test fail
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-4/igt@xe_module_load@reload-no-display.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@xe_module_load@reload-no-display.html

  * igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_decode0:
    - shard-lnl:          [PASS][52] -> [FAIL][53] ([Intel XE#6251]) +1 other test fail
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-lnl-1/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_decode0.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-lnl-7/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_decode0.html

  * igt@xe_query@multigpu-query-invalid-size:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#944])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-10/igt@xe_query@multigpu-query-invalid-size.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotreplug-lateclose:
    - shard-bmg:          [SKIP][55] ([Intel XE#6779]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@core_hotunplug@hotreplug-lateclose.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-8/igt@core_hotunplug@hotreplug-lateclose.html

  * igt@core_setmaster@master-drop-set-root:
    - shard-bmg:          [FAIL][57] ([Intel XE#6910]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@core_setmaster@master-drop-set-root.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-1/igt@core_setmaster@master-drop-set-root.html

  * igt@device_reset@unbind-reset-rebind:
    - shard-bmg:          [SKIP][59] ([Intel XE#6815]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@device_reset@unbind-reset-rebind.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-8/igt@device_reset@unbind-reset-rebind.html

  * igt@fbdev@nullptr:
    - shard-bmg:          [SKIP][61] ([Intel XE#2134]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@fbdev@nullptr.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-4/igt@fbdev@nullptr.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-bmg:          [INCOMPLETE][63] ([Intel XE#2705] / [Intel XE#6766]) -> [PASS][64] +1 other test pass
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-10/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_cursor_edge_walk@256x256-right-edge:
    - shard-bmg:          [FAIL][65] -> [PASS][66] +1 other test pass
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-2/igt@kms_cursor_edge_walk@256x256-right-edge.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-3/igt@kms_cursor_edge_walk@256x256-right-edge.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-bmg:          [SKIP][67] ([Intel XE#2291]) -> [PASS][68] +1 other test pass
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
    - shard-bmg:          [SKIP][69] ([Intel XE#2316]) -> [PASS][70] +1 other test pass
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-4/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-8/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [FAIL][71] ([Intel XE#301]) -> [PASS][72] +1 other test pass
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_pipe_crc_basic@disable-crc-after-crtc:
    - shard-bmg:          [SKIP][73] ([Intel XE#6557] / [Intel XE#6703]) -> [PASS][74] +5 other tests pass
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@kms_pipe_crc_basic@disable-crc-after-crtc.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-1/igt@kms_pipe_crc_basic@disable-crc-after-crtc.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-bmg:          [SKIP][75] ([Intel XE#6693]) -> [PASS][76] +1 other test pass
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-8/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race:
    - shard-bmg:          [SKIP][77] ([Intel XE#6703]) -> [PASS][78] +426 other tests pass
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-1/igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_system_allocator@many-stride-malloc-prefetch:
    - shard-bmg:          [WARN][79] ([Intel XE#5786]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-7/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-9/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html

  * igt@xe_module_load@reload:
    - shard-bmg:          [FAIL][81] ([Intel XE#6913]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@xe_module_load@reload.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-1/igt@xe_module_load@reload.html

  
#### Warnings ####

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-bmg:          [SKIP][83] ([Intel XE#6703]) -> [SKIP][84] ([Intel XE#2327]) +5 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-1/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-bmg:          [SKIP][85] ([Intel XE#2327]) -> [SKIP][86] ([Intel XE#6703]) +3 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-8/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-270:
    - shard-bmg:          [SKIP][87] ([Intel XE#6703]) -> [SKIP][88] ([Intel XE#1124]) +7 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-4/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-bmg:          [SKIP][89] ([Intel XE#2328]) -> [SKIP][90] ([Intel XE#6703])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-8/igt@kms_big_fb@y-tiled-addfb.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-bmg:          [SKIP][91] ([Intel XE#6703]) -> [SKIP][92] ([Intel XE#610])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-bmg:          [SKIP][93] ([Intel XE#1124]) -> [SKIP][94] ([Intel XE#6703]) +6 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-bmg:          [SKIP][95] ([Intel XE#6703]) -> [SKIP][96] ([Intel XE#2314] / [Intel XE#2894])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-bmg:          [SKIP][97] ([Intel XE#2314] / [Intel XE#2894]) -> [SKIP][98] ([Intel XE#6703]) +2 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-8/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
    - shard-bmg:          [SKIP][99] ([Intel XE#367]) -> [SKIP][100] ([Intel XE#6703])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-4/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-4-displays-3840x2160p:
    - shard-bmg:          [SKIP][101] ([Intel XE#6703]) -> [SKIP][102] ([Intel XE#367]) +2 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-1/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs:
    - shard-bmg:          [SKIP][103] ([Intel XE#2887]) -> [SKIP][104] ([Intel XE#6557] / [Intel XE#6703])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-4/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][105] ([Intel XE#2652] / [Intel XE#787]) -> [SKIP][106] ([Intel XE#6703]) +2 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-8/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
    - shard-bmg:          [SKIP][107] ([Intel XE#3432]) -> [SKIP][108] ([Intel XE#6703])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          [SKIP][109] ([Intel XE#2887]) -> [SKIP][110] ([Intel XE#6703]) +6 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          [SKIP][111] ([Intel XE#6703]) -> [SKIP][112] ([Intel XE#2887]) +11 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-bmg:          [SKIP][113] ([Intel XE#2724]) -> [SKIP][114] ([Intel XE#6703])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-8/igt@kms_cdclk@mode-transition-all-outputs.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-bmg:          [SKIP][115] ([Intel XE#6703]) -> [SKIP][116] ([Intel XE#2724])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@kms_cdclk@plane-scaling.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-8/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_color@degamma:
    - shard-bmg:          [SKIP][117] ([Intel XE#2325]) -> [SKIP][118] ([Intel XE#6703])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-8/igt@kms_chamelium_color@degamma.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:
    - shard-bmg:          [SKIP][119] ([Intel XE#6703]) -> [SKIP][120] ([Intel XE#2252]) +6 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-4/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-bmg:          [SKIP][121] ([Intel XE#2252]) -> [SKIP][122] ([Intel XE#6703]) +7 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-4/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-bmg:          [SKIP][123] ([Intel XE#6703]) -> [SKIP][124] ([Intel XE#2390])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@kms_content_protection@dp-mst-type-0.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-8/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@lic-type-1:
    - shard-bmg:          [SKIP][125] ([Intel XE#2341]) -> [SKIP][126] ([Intel XE#6703])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-4/igt@kms_content_protection@lic-type-1.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@mei-interface:
    - shard-bmg:          [SKIP][127] ([Intel XE#6703]) -> [SKIP][128] ([Intel XE#2341])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@kms_content_protection@mei-interface.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-4/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          [SKIP][129] ([Intel XE#6703]) -> [FAIL][130] ([Intel XE#1178])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@kms_content_protection@srm.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-1/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          [FAIL][131] ([Intel XE#6707]) -> [SKIP][132] ([Intel XE#6703])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-8/igt@kms_content_protection@uevent.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42:
    - shard-bmg:          [SKIP][133] ([Intel XE#2320]) -> [SKIP][134] ([Intel XE#6703])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-128x42.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-128x42.html

  * igt@kms_cursor_crc@cursor-onscreen-max-size:
    - shard-bmg:          [SKIP][135] ([Intel XE#6703]) -> [SKIP][136] ([Intel XE#2320]) +3 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-max-size.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-max-size.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-bmg:          [SKIP][137] ([Intel XE#2321]) -> [SKIP][138] ([Intel XE#6703]) +1 other test skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-8/igt@kms_cursor_crc@cursor-random-512x170.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-bmg:          [SKIP][139] ([Intel XE#6703]) -> [SKIP][140] ([Intel XE#2321])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@kms_cursor_crc@cursor-random-512x512.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-4/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-256x85:
    - shard-bmg:          [SKIP][141] ([Intel XE#6557] / [Intel XE#6703]) -> [SKIP][142] ([Intel XE#2320])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-8/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
    - shard-bmg:          [SKIP][143] ([Intel XE#2291]) -> [SKIP][144] ([Intel XE#6703]) +1 other test skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-bmg:          [SKIP][145] ([Intel XE#6703]) -> [SKIP][146] ([Intel XE#2291]) +1 other test skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-bmg:          [SKIP][147] ([Intel XE#6703]) -> [SKIP][148] ([Intel XE#4354]) +1 other test skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@kms_dp_link_training@uhbr-sst.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-4/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-bmg:          [SKIP][149] ([Intel XE#4331]) -> [SKIP][150] ([Intel XE#6703])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-8/igt@kms_dp_linktrain_fallback@dsc-fallback.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-bmg:          [SKIP][151] ([Intel XE#2244]) -> [SKIP][152] ([Intel XE#6703]) +1 other test skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-4/igt@kms_dsc@dsc-with-output-formats.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
    - shard-bmg:          [SKIP][153] ([Intel XE#4422]) -> [SKIP][154] ([Intel XE#6703])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-8/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-bmg:          [SKIP][155] ([Intel XE#6703]) -> [SKIP][156] ([Intel XE#776])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@kms_fbcon_fbt@psr-suspend.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-8/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-4x:
    - shard-bmg:          [SKIP][157] ([Intel XE#6703]) -> [SKIP][158] ([Intel XE#1138])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@kms_feature_discovery@display-4x.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-4/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@psr1:
    - shard-bmg:          [SKIP][159] ([Intel XE#6703]) -> [SKIP][160] ([Intel XE#2374]) +1 other test skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@kms_feature_discovery@psr1.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-1/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-bmg:          [SKIP][161] ([Intel XE#2316]) -> [SKIP][162] ([Intel XE#6703])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-4/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-bmg:          [SKIP][163] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][164] ([Intel XE#6703]) +2 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-bmg:          [SKIP][165] ([Intel XE#6557] / [Intel XE#6703]) -> [SKIP][166] ([Intel XE#2293] / [Intel XE#2380])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
    - shard-bmg:          [SKIP][167] ([Intel XE#6703]) -> [SKIP][168] ([Intel XE#2293] / [Intel XE#2380]) +2 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][169] ([Intel XE#6557] / [Intel XE#6703]) -> [SKIP][170] ([Intel XE#2311])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][171] ([Intel XE#6703]) -> [SKIP][172] ([Intel XE#2312]) +8 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][173] ([Intel XE#2312]) -> [SKIP][174] ([Intel XE#2311]) +5 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render:
    - shard-bmg:          [SKIP][175] ([Intel XE#2311]) -> [SKIP][176] ([Intel XE#6703]) +19 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
    - shard-bmg:          [SKIP][177] ([Intel XE#6703]) -> [SKIP][178] ([Intel XE#2311]) +14 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][179] ([Intel XE#6703]) -> [SKIP][180] ([Intel XE#4141]) +9 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][181] ([Intel XE#2312]) -> [SKIP][182] ([Intel XE#4141])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][183] ([Intel XE#4141]) -> [SKIP][184] ([Intel XE#2312]) +2 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][185] ([Intel XE#4141]) -> [SKIP][186] ([Intel XE#6703]) +7 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-bmg:          [SKIP][187] ([Intel XE#6703]) -> [SKIP][188] ([Intel XE#2352])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff:
    - shard-bmg:          [SKIP][189] ([Intel XE#2311]) -> [SKIP][190] ([Intel XE#2312]) +7 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][191] ([Intel XE#2312]) -> [SKIP][192] ([Intel XE#6703]) +7 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][193] ([Intel XE#2313]) -> [SKIP][194] ([Intel XE#2312]) +7 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:
    - shard-bmg:          [SKIP][195] ([Intel XE#6703]) -> [SKIP][196] ([Intel XE#2313]) +19 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][197] ([Intel XE#2313]) -> [SKIP][198] ([Intel XE#6557] / [Intel XE#6703])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff:
    - shard-bmg:          [SKIP][199] ([Intel XE#2313]) -> [SKIP][200] ([Intel XE#6703]) +19 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][201] ([Intel XE#2312]) -> [SKIP][202] ([Intel XE#2313]) +5 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-blt.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-bmg:          [SKIP][203] ([Intel XE#6703]) -> [SKIP][204] ([Intel XE#4298])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@kms_joiner@basic-max-non-joiner.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-4/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          [SKIP][205] ([Intel XE#6911]) -> [SKIP][206] ([Intel XE#6703]) +1 other test skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-8/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-bmg:          [SKIP][207] ([Intel XE#6703]) -> [SKIP][208] ([Intel XE#2393])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@kms_plane_lowres@tiling-y.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-8/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-bmg:          [SKIP][209] ([Intel XE#2393]) -> [SKIP][210] ([Intel XE#6703])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-8/igt@kms_plane_lowres@tiling-yf.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          [SKIP][211] ([Intel XE#4596]) -> [SKIP][212] ([Intel XE#5021])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-yf.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
    - shard-bmg:          [SKIP][213] ([Intel XE#6703]) -> [SKIP][214] ([Intel XE#6886]) +1 other test skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          [SKIP][215] ([Intel XE#6703]) -> [SKIP][216] ([Intel XE#2938])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@kms_pm_backlight@brightness-with-dpms.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-8/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-bmg:          [SKIP][217] ([Intel XE#870]) -> [SKIP][218] ([Intel XE#6703])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-8/igt@kms_pm_backlight@fade-with-dpms.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-bmg:          [SKIP][219] ([Intel XE#2391]) -> [SKIP][220] ([Intel XE#6703])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-8/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-bmg:          [SKIP][221] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836]) -> [SKIP][222] ([Intel XE#6693]) +1 other test skip
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-8/igt@kms_pm_rpm@dpms-lpsp.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          [SKIP][223] ([Intel XE#1439] / [Intel XE#836]) -> [SKIP][224] ([Intel XE#6693])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-4/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-bmg:          [SKIP][225] ([Intel XE#6693]) -> [SKIP][226] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:
    - shard-bmg:          [SKIP][227] ([Intel XE#1406] / [Intel XE#6703]) -> [SKIP][228] ([Intel XE#1406] / [Intel XE#1489]) +5 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-1/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-bmg:          [SKIP][229] ([Intel XE#1406] / [Intel XE#1489]) -> [SKIP][230] ([Intel XE#1406] / [Intel XE#6703]) +5 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-4/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-bmg:          [SKIP][231] ([Intel XE#1406] / [Intel XE#2387]) -> [SKIP][232] ([Intel XE#1406] / [Intel XE#6703])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-8/igt@kms_psr2_su@page_flip-xrgb8888.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-bmg:          [SKIP][233] ([Intel XE#1406] / [Intel XE#6703]) -> [SKIP][234] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +9 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@kms_psr@psr-primary-page-flip.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-8/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr@psr2-primary-page-flip:
    - shard-bmg:          [SKIP][235] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) -> [SKIP][236] ([Intel XE#1406] / [Intel XE#6703]) +5 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-8/igt@kms_psr@psr2-primary-page-flip.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_psr@psr2-primary-page-flip.html

  * igt@kms_psr@psr2-primary-render:
    - shard-bmg:          [SKIP][237] ([Intel XE#1406] / [Intel XE#2234]) -> [SKIP][238] ([Intel XE#1406] / [Intel XE#6703])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-4/igt@kms_psr@psr2-primary-render.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_psr@psr2-primary-render.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          [SKIP][239] ([Intel XE#1406] / [Intel XE#2414]) -> [SKIP][240] ([Intel XE#1406] / [Intel XE#6703])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-8/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-bmg:          [SKIP][241] ([Intel XE#6703]) -> [SKIP][242] ([Intel XE#3414] / [Intel XE#3904]) +1 other test skip
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@kms_rotation_crc@bad-pixel-format.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-4/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-bmg:          [SKIP][243] ([Intel XE#3414] / [Intel XE#3904]) -> [SKIP][244] ([Intel XE#6703]) +1 other test skip
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-8/igt@kms_rotation_crc@bad-tiling.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-bmg:          [SKIP][245] ([Intel XE#1435]) -> [SKIP][246] ([Intel XE#6703])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_sharpness_filter@filter-scaler-downscale:
    - shard-bmg:          [SKIP][247] ([Intel XE#6703]) -> [SKIP][248] ([Intel XE#6503]) +2 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@kms_sharpness_filter@filter-scaler-downscale.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-4/igt@kms_sharpness_filter@filter-scaler-downscale.html

  * igt@kms_sharpness_filter@invalid-filter-with-plane:
    - shard-bmg:          [SKIP][249] ([Intel XE#6503]) -> [SKIP][250] ([Intel XE#6703]) +1 other test skip
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-8/igt@kms_sharpness_filter@invalid-filter-with-plane.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_sharpness_filter@invalid-filter-with-plane.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-bmg:          [SKIP][251] ([Intel XE#1499]) -> [SKIP][252] ([Intel XE#6703]) +1 other test skip
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-8/igt@kms_vrr@seamless-rr-switch-drrs.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-bmg:          [SKIP][253] ([Intel XE#6703]) -> [SKIP][254] ([Intel XE#6599])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@xe_compute@ccs-mode-basic.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-4/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_eudebug@basic-vm-access-userptr:
    - shard-bmg:          [SKIP][255] ([Intel XE#6703]) -> [SKIP][256] ([Intel XE#4837]) +4 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@xe_eudebug@basic-vm-access-userptr.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-8/igt@xe_eudebug@basic-vm-access-userptr.html

  * igt@xe_eudebug@basic-vm-bind-vm-destroy:
    - shard-bmg:          [SKIP][257] ([Intel XE#4837]) -> [SKIP][258] ([Intel XE#6703]) +3 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-8/igt@xe_eudebug@basic-vm-bind-vm-destroy.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@xe_eudebug@basic-vm-bind-vm-destroy.html

  * igt@xe_eudebug_online@pagefault-read-stress:
    - shard-bmg:          [SKIP][259] ([Intel XE#6665] / [Intel XE#6681]) -> [SKIP][260] ([Intel XE#6703])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-8/igt@xe_eudebug_online@pagefault-read-stress.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@xe_eudebug_online@pagefault-read-stress.html

  * igt@xe_eudebug_online@single-step:
    - shard-bmg:          [SKIP][261] ([Intel XE#6703]) -> [SKIP][262] ([Intel XE#4837] / [Intel XE#6665]) +4 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@xe_eudebug_online@single-step.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-4/igt@xe_eudebug_online@single-step.html

  * igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram:
    - shard-bmg:          [SKIP][263] ([Intel XE#4837] / [Intel XE#6665]) -> [SKIP][264] ([Intel XE#6703]) +2 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-8/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram.html

  * igt@xe_eudebug_sriov@deny-sriov:
    - shard-bmg:          [SKIP][265] ([Intel XE#5793]) -> [SKIP][266] ([Intel XE#6703])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-4/igt@xe_eudebug_sriov@deny-sriov.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@xe_eudebug_sriov@deny-sriov.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][267] ([Intel XE#6321]) -> [SKIP][268] ([Intel XE#6703])
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-8/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:
    - shard-bmg:          [SKIP][269] ([Intel XE#6703]) -> [SKIP][270] ([Intel XE#2322]) +5 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-bmg:          [SKIP][271] ([Intel XE#2322]) -> [SKIP][272] ([Intel XE#6703]) +5 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-8/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate:
    - shard-bmg:          [SKIP][273] ([Intel XE#6874]) -> [SKIP][274] ([Intel XE#6703]) +21 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-8/igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate.html

  * igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem:
    - shard-bmg:          [SKIP][275] ([Intel XE#6703]) -> [SKIP][276] ([Intel XE#6874]) +19 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-4/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem.html

  * igt@xe_exec_system_allocator@many-64k-mmap-huge-nomemset:
    - shard-bmg:          [SKIP][277] ([Intel XE#6703]) -> [SKIP][278] ([Intel XE#5007])
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@xe_exec_system_allocator@many-64k-mmap-huge-nomemset.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-4/igt@xe_exec_system_allocator@many-64k-mmap-huge-nomemset.html

  * igt@xe_exec_system_allocator@once-large-mmap-huge:
    - shard-bmg:          [SKIP][279] ([Intel XE#4943]) -> [SKIP][280] ([Intel XE#6703]) +16 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-8/igt@xe_exec_system_allocator@once-large-mmap-huge.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@xe_exec_system_allocator@once-large-mmap-huge.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge:
    - shard-bmg:          [SKIP][281] ([Intel XE#6703]) -> [SKIP][282] ([Intel XE#4943]) +16 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge.html

  * igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:
    - shard-bmg:          [SKIP][283] ([Intel XE#6703]) -> [SKIP][284] ([Intel XE#6281])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-8/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-bmg:          [SKIP][285] ([Intel XE#6703]) -> [SKIP][286] ([Intel XE#2236])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@xe_pat@pat-index-xelpg.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-1/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@d3hot-i2c:
    - shard-bmg:          [SKIP][287] ([Intel XE#6703]) -> [SKIP][288] ([Intel XE#5742])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@xe_pm@d3hot-i2c.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-8/igt@xe_pm@d3hot-i2c.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-bmg:          [SKIP][289] ([Intel XE#2284]) -> [SKIP][290] ([Intel XE#6703]) +1 other test skip
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-4/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:
    - shard-bmg:          [SKIP][291] ([Intel XE#4733]) -> [SKIP][292] ([Intel XE#6703]) +1 other test skip
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-4/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html

  * igt@xe_pxp@pxp-stale-queue-post-suspend:
    - shard-bmg:          [SKIP][293] ([Intel XE#6703]) -> [SKIP][294] ([Intel XE#4733]) +2 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@xe_pxp@pxp-stale-queue-post-suspend.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-1/igt@xe_pxp@pxp-stale-queue-post-suspend.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-bmg:          [SKIP][295] ([Intel XE#944]) -> [SKIP][296] ([Intel XE#6703]) +2 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-4/igt@xe_query@multigpu-query-mem-usage.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-bmg:          [SKIP][297] ([Intel XE#6703]) -> [SKIP][298] ([Intel XE#944])
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@xe_query@multigpu-query-uc-fw-version-huc.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-8/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4674]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4674
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
  [Intel XE#5742]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742
  [Intel XE#5786]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5786
  [Intel XE#5793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5793
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#6251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251
  [Intel XE#6281]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557
  [Intel XE#6599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599
  [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
  [Intel XE#6681]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6681
  [Intel XE#6693]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693
  [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
  [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
  [Intel XE#6766]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6766
  [Intel XE#6779]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6779
  [Intel XE#6815]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6815
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901
  [Intel XE#6910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6910
  [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
  [Intel XE#6913]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6913
  [Intel XE#6914]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6914
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4 -> xe-pw-159247v1

  IGT_8674: f38f4d8e9c65aff45ac807e646d06e38bc3193a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4: c25fd3953a459143758264a6c4dab32107bb48c4
  xe-pw-159247v1: 159247v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/index.html

--===============2027755273025362784==
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
<tr><td><b>Series:</b></td><td>Attempt to fixup reset, wedge, unload corner cases</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/159247/">https://patchwork.freedesktop.org/series/159247/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4_FULL -&gt; xe-pw-159247v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-159247v1_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-159247v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-159247v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-10/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-8/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-159247v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_getversion@all-cards:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-4/igt@core_getversion@all-cards.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@core_getversion@all-cards.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6914">Intel XE#6914</a>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-8/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@core_hotunplug@unbind-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6779">Intel XE#6779</a>)</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-8/igt@core_setmaster@master-drop-set-user.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@core_setmaster@master-drop-set-user.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4674">Intel XE#4674</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-10/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-10/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-10/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-10/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-10/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-10/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-1/igt@kms_content_protection@srm@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-10/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-10/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-1/igt@kms_display_modes@extended-mode-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-4/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302">Intel XE#4302</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-10/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-2/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-9/igt@kms_flip@flip-vs-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-2/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-4/igt@kms_flip@wf_vblank-ts-check.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_flip@wf_vblank-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +429 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-10/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901">Intel XE#6901</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-none.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-10/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020">Intel XE#5020</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-10/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-10/igt@kms_psr@psr2-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-tap:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-10/igt@kms_sharpness_filter@filter-tap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@multigpu-basic-client:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-10/igt@xe_eudebug@multigpu-basic-client.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@pagefault-read:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-10/igt@xe_eudebug_online@pagefault-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-mmap:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-10/igt@xe_exec_basic@multigpu-once-null-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-10/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-10/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-lnl-4/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-lnl-3/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625">Intel XE#5625</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-8/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-4/igt@xe_module_load@reload-no-display.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@xe_module_load@reload-no-display.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6913">Intel XE#6913</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_decode0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-lnl-1/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_decode0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-lnl-7/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_decode0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251">Intel XE#6251</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-10/igt@xe_query@multigpu-query-invalid-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug-lateclose:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@core_hotunplug@hotreplug-lateclose.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6779">Intel XE#6779</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-8/igt@core_hotunplug@hotreplug-lateclose.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-root:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@core_setmaster@master-drop-set-root.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6910">Intel XE#6910</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-1/igt@core_setmaster@master-drop-set-root.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@device_reset@unbind-reset-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6815">Intel XE#6815</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-8/igt@device_reset@unbind-reset-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@fbdev@nullptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-4/igt@fbdev@nullptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6766">Intel XE#6766</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-10/igt@kms_atomic_transition@plane-all-modeset-transition.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-right-edge:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-2/igt@kms_cursor_edge_walk@256x256-right-edge.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-3/igt@kms_cursor_edge_walk@256x256-right-edge.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-4/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-8/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@disable-crc-after-crtc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@kms_pipe_crc_basic@disable-crc-after-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-1/igt@kms_pipe_crc_basic@disable-crc-after-crtc.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693">Intel XE#6693</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-8/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-1/igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race.html">PASS</a> +426 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-malloc-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-7/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5786">Intel XE#5786</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-9/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@xe_module_load@reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6913">Intel XE#6913</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-1/igt@xe_module_load@reload.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-1/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-8/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-4/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-8/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328">Intel XE#2328</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-8/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-4/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-1/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-4/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-8/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-8/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-8/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-8/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-4/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-4/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-8/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-4/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-4/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-1/igt@kms_content_protection@srm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-8/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707">Intel XE#6707</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-max-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-8/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-4/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-256x85:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-8/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-4/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-8/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331">Intel XE#4331</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-4/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-8/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-8/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-4/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-1/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374">Intel XE#2374</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-4/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-4/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298">Intel XE#4298</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-8/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911">Intel XE#6911</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-8/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-8/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393">Intel XE#2393</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-8/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-8/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-8/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391">Intel XE#2391</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-8/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693">Intel XE#6693</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-4/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693">Intel XE#6693</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693">Intel XE#6693</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-1/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-4/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-8/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-8/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-page-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-8/igt@kms_psr@psr2-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_psr@psr2-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-4/igt@kms_psr@psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_psr@psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-8/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-4/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-8/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-scaler-downscale:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@kms_sharpness_filter@filter-scaler-downscale.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-4/igt@kms_sharpness_filter@filter-scaler-downscale.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-plane:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-8/igt@kms_sharpness_filter@invalid-filter-with-plane.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_sharpness_filter@invalid-filter-with-plane.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-8/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@xe_compute@ccs-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-4/igt@xe_compute@ccs-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599">Intel XE#6599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@xe_eudebug@basic-vm-access-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-8/igt@xe_eudebug@basic-vm-access-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-vm-destroy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-8/igt@xe_eudebug@basic-vm-bind-vm-destroy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@xe_eudebug@basic-vm-bind-vm-destroy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@pagefault-read-stress:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-8/igt@xe_eudebug_online@pagefault-read-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6681">Intel XE#6681</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@xe_eudebug_online@pagefault-read-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@xe_eudebug_online@single-step.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-4/igt@xe_eudebug_online@single-step.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-8/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-sriov:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-4/igt@xe_eudebug_sriov@deny-sriov.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5793">Intel XE#5793</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@xe_eudebug_sriov@deny-sriov.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-8/igt@xe_evict@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@xe_evict@evict-beng-mixed-many-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-8/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-8/igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-4/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-huge-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@xe_exec_system_allocator@many-64k-mmap-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-4/igt@xe_exec_system_allocator@many-64k-mmap-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007">Intel XE#5007</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-mmap-huge:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-8/igt@xe_exec_system_allocator@once-large-mmap-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@xe_exec_system_allocator@once-large-mmap-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-8/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281">Intel XE#6281</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-i2c:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@xe_pm@d3hot-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-8/igt@xe_pm@d3hot-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742">Intel XE#5742</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-4/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-4/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-queue-post-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@xe_pxp@pxp-stale-queue-post-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-1/igt@xe_pxp@pxp-stale-queue-post-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-4/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-5/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4/shard-bmg-5/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159247v1/shard-bmg-8/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4 -&gt; xe-pw-159247v1</li>
</ul>
<p>IGT_8674: f38f4d8e9c65aff45ac807e646d06e38bc3193a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4269-c25fd3953a459143758264a6c4dab32107bb48c4: c25fd3953a459143758264a6c4dab32107bb48c4<br />
  xe-pw-159247v1: 159247v1</p>

</body>
</html>

--===============2027755273025362784==--
