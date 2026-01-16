Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1730AD48981
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jan 2026 11:41:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C223610E86F;
	Fri, 16 Jan 2026 11:41:19 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C647A10E86F;
 Fri, 16 Jan 2026 11:41:18 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4989305930498970908=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Fix_Cx0_Suspend_Resume_iss?=
 =?utf-8?q?ue_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 16 Jan 2026 11:41:18 -0000
Message-ID: <176856367880.161649.17208704778520569250@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260116085455.571766-1-suraj.kandpal@intel.com>
In-Reply-To: <20260116085455.571766-1-suraj.kandpal@intel.com>
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

--===============4989305930498970908==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fix Cx0 Suspend Resume issue (rev3)
URL   : https://patchwork.freedesktop.org/series/159539/
State : failure

== Summary ==

CI Bug Log - changes from xe-4393-d398f90fc4dec55932a257eba5392e91c9bc2205_FULL -> xe-pw-159539v3_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-159539v3_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-159539v3_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-159539v3_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@modeset-vs-vblank-race-interruptible@d-dp2:
    - shard-bmg:          [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4393-d398f90fc4dec55932a257eba5392e91c9bc2205/shard-bmg-9/igt@kms_flip@modeset-vs-vblank-race-interruptible@d-dp2.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-3/igt@kms_flip@modeset-vs-vblank-race-interruptible@d-dp2.html

  * igt@xe_waitfence@abstime:
    - shard-bmg:          [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4393-d398f90fc4dec55932a257eba5392e91c9bc2205/shard-bmg-1/igt@xe_waitfence@abstime.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-7/igt@xe_waitfence@abstime.html

  
Known issues
------------

  Here are the changes found in xe-pw-159539v3_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2327]) +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-1/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#1124]) +2 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-10/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#610]) +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-10/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#367])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-1/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2887]) +7 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-10/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#3432])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2252]) +5 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-1/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][12] ([Intel XE#1178] / [Intel XE#3304]) +1 other test fail
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-1/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2390] / [Intel XE#6974])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-1/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_cursor_crc@cursor-offscreen-256x85:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2320]) +2 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-10/igt@kms_cursor_crc@cursor-offscreen-256x85.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2321])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-10/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#1508])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#4422])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-10/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_feature_discovery@display-3x:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2373])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-1/igt@kms_feature_discovery@display-3x.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2293] / [Intel XE#2380]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-10/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2293]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-10/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#4141]) +7 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2311]) +13 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2313]) +17 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#7061]) +3 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc.html

  * igt@kms_hdr@static-swap:
    - shard-bmg:          NOTRUN -> [ABORT][25] ([Intel XE#6740]) +1 other test abort
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-9/igt@kms_hdr@static-swap.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2501])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#6886]) +4 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-10/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#1406] / [Intel XE#1489]) +3 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-psr-primary-render:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +6 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-1/igt@kms_psr@fbc-psr-primary-render.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#1406] / [Intel XE#2414])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-9/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#3414] / [Intel XE#3904])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-9/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#6503]) +2 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-1/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html

  * igt@testdisplay:
    - shard-bmg:          [PASS][34] -> [ABORT][35] ([Intel XE#6740] / [Intel XE#6976])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4393-d398f90fc4dec55932a257eba5392e91c9bc2205/shard-bmg-10/igt@testdisplay.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-1/igt@testdisplay.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#6599])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-9/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2504])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-1/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_eudebug@basic-vm-bind-extended:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#4837]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-1/igt@xe_eudebug@basic-vm-bind-extended.html

  * igt@xe_eudebug_online@pagefault-write:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#4837] / [Intel XE#6665]) +2 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-10/igt@xe_eudebug_online@pagefault-write.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2322]) +4 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-10/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_multi_queue@max-queues-preempt-mode-fault-dyn-priority:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#6874]) +15 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-1/igt@xe_exec_multi_queue@max-queues-preempt-mode-fault-dyn-priority.html

  * igt@xe_exec_system_allocator@many-64k-mmap-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#5007])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-1/igt@xe_exec_system_allocator@many-64k-mmap-huge-nomemset.html

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-huge:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#4943]) +12 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-10/igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-huge.html

  * igt@xe_multigpu_svm@mgpu-migration-basic:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#6964]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-10/igt@xe_multigpu_svm@mgpu-migration-basic.html

  * igt@xe_peer2peer@read:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2427] / [Intel XE#6953])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-1/igt@xe_peer2peer@read.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2284])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-1/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pxp@regular-src-to-pxp-dest-rendercopy:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#4733]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-1/igt@xe_pxp@regular-src-to-pxp-dest-rendercopy.html

  * igt@xe_query@multigpu-query-invalid-size:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#944]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-9/igt@xe_query@multigpu-query-invalid-size.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-bmg:          [FAIL][49] ([Intel XE#3718] / [Intel XE#6078]) -> [PASS][50] +1 other test pass
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4393-d398f90fc4dec55932a257eba5392e91c9bc2205/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-9/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1:
    - shard-lnl:          [FAIL][51] ([Intel XE#6054]) -> [PASS][52] +3 other tests pass
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4393-d398f90fc4dec55932a257eba5392e91c9bc2205/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [DMESG-WARN][53] ([Intel XE#5354]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4393-d398f90fc4dec55932a257eba5392e91c9bc2205/shard-bmg-9/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [FAIL][55] ([Intel XE#301]) -> [PASS][56] +3 other tests pass
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4393-d398f90fc4dec55932a257eba5392e91c9bc2205/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_hdr@static-toggle@pipe-a-dp-2:
    - shard-bmg:          [ABORT][57] ([Intel XE#6740]) -> [PASS][58] +1 other test pass
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4393-d398f90fc4dec55932a257eba5392e91c9bc2205/shard-bmg-9/igt@kms_hdr@static-toggle@pipe-a-dp-2.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-10/igt@kms_hdr@static-toggle@pipe-a-dp-2.html

  * {igt@xe_exec_basic@no-exec-bindexecqueue-userptr-invalidate@rcs0}:
    - shard-lnl:          [DMESG-WARN][59] ([Intel XE#7063]) -> [PASS][60] +1 other test pass
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4393-d398f90fc4dec55932a257eba5392e91c9bc2205/shard-lnl-3/igt@xe_exec_basic@no-exec-bindexecqueue-userptr-invalidate@rcs0.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-lnl-3/igt@xe_exec_basic@no-exec-bindexecqueue-userptr-invalidate@rcs0.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:
    - shard-lnl:          [FAIL][61] ([Intel XE#5625]) -> [PASS][62] +1 other test pass
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4393-d398f90fc4dec55932a257eba5392e91c9bc2205/shard-lnl-2/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-lnl-2/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html

  
#### Warnings ####

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][63] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][64] ([Intel XE#3544])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4393-d398f90fc4dec55932a257eba5392e91c9bc2205/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:
    - shard-lnl:          [DMESG-WARN][65] ([Intel XE#4537] / [Intel XE#7063]) -> [DMESG-WARN][66] ([Intel XE#7063])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4393-d398f90fc4dec55932a257eba5392e91c9bc2205/shard-lnl-3/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-lnl-3/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html

  * igt@xe_pat@pat-sanity:
    - shard-lnl:          [DMESG-WARN][67] ([Intel XE#7063]) -> [DMESG-WARN][68] ([Intel XE#4537] / [Intel XE#7063])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4393-d398f90fc4dec55932a257eba5392e91c9bc2205/shard-lnl-3/igt@xe_pat@pat-sanity.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-lnl-3/igt@xe_pat@pat-sanity.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4537]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4537
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007
  [Intel XE#5354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354
  [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
  [Intel XE#6054]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6054
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599
  [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
  [Intel XE#6740]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#6976]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6976
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7063]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7063
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-4393-d398f90fc4dec55932a257eba5392e91c9bc2205 -> xe-pw-159539v3

  IGT_8704: 8704
  xe-4393-d398f90fc4dec55932a257eba5392e91c9bc2205: d398f90fc4dec55932a257eba5392e91c9bc2205
  xe-pw-159539v3: 159539v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/index.html

--===============4989305930498970908==
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
<tr><td><b>Series:</b></td><td>Fix Cx0 Suspend Resume issue (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/159539/">https://patchwork.freedesktop.org/series/159539/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4393-d398f90fc4dec55932a257eba5392e91c9bc2205_FULL -&gt; xe-pw-159539v3_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-159539v3_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-159539v3_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-159539v3_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race-interruptible@d-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4393-d398f90fc4dec55932a257eba5392e91c9bc2205/shard-bmg-9/igt@kms_flip@modeset-vs-vblank-race-interruptible@d-dp2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-3/igt@kms_flip@modeset-vs-vblank-race-interruptible@d-dp2.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@abstime:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4393-d398f90fc4dec55932a257eba5392e91c9bc2205/shard-bmg-1/igt@xe_waitfence@abstime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-7/igt@xe_waitfence@abstime.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-159539v3_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-1/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-10/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-10/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-1/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-10/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-1/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-1/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-1/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-256x85:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-10/igt@kms_cursor_crc@cursor-offscreen-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-10/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-10/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-1/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373">Intel XE#2373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-10/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-10/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-9/igt@kms_hdr@static-swap.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740">Intel XE#6740</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501">Intel XE#2501</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-10/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-1/igt@kms_psr@fbc-psr-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-9/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-9/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-1/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4393-d398f90fc4dec55932a257eba5392e91c9bc2205/shard-bmg-10/igt@testdisplay.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-1/igt@testdisplay.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740">Intel XE#6740</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6976">Intel XE#6976</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-9/igt@xe_compute@ccs-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599">Intel XE#6599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-1/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504">Intel XE#2504</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-extended:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-1/igt@xe_eudebug@basic-vm-bind-extended.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@pagefault-write:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-10/igt@xe_eudebug_online@pagefault-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-10/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@max-queues-preempt-mode-fault-dyn-priority:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-1/igt@xe_exec_multi_queue@max-queues-preempt-mode-fault-dyn-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-1/igt@xe_exec_system_allocator@many-64k-mmap-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007">Intel XE#5007</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-10/igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-migration-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-10/igt@xe_multigpu_svm@mgpu-migration-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-1/igt@xe_peer2peer@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">Intel XE#2427</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953">Intel XE#6953</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-1/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@regular-src-to-pxp-dest-rendercopy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-1/igt@xe_pxp@regular-src-to-pxp-dest-rendercopy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-9/igt@xe_query@multigpu-query-invalid-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4393-d398f90fc4dec55932a257eba5392e91c9bc2205/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-9/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4393-d398f90fc4dec55932a257eba5392e91c9bc2205/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6054">Intel XE#6054</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4393-d398f90fc4dec55932a257eba5392e91c9bc2205/shard-bmg-9/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354">Intel XE#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4393-d398f90fc4dec55932a257eba5392e91c9bc2205/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4393-d398f90fc4dec55932a257eba5392e91c9bc2205/shard-bmg-9/igt@kms_hdr@static-toggle@pipe-a-dp-2.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740">Intel XE#6740</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-10/igt@kms_hdr@static-toggle@pipe-a-dp-2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_basic@no-exec-bindexecqueue-userptr-invalidate@rcs0}:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4393-d398f90fc4dec55932a257eba5392e91c9bc2205/shard-lnl-3/igt@xe_exec_basic@no-exec-bindexecqueue-userptr-invalidate@rcs0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7063">Intel XE#7063</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-lnl-3/igt@xe_exec_basic@no-exec-bindexecqueue-userptr-invalidate@rcs0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4393-d398f90fc4dec55932a257eba5392e91c9bc2205/shard-lnl-2/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625">Intel XE#5625</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-lnl-2/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4393-d398f90fc4dec55932a257eba5392e91c9bc2205/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4393-d398f90fc4dec55932a257eba5392e91c9bc2205/shard-lnl-3/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4537">Intel XE#4537</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7063">Intel XE#7063</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-lnl-3/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7063">Intel XE#7063</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-sanity:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4393-d398f90fc4dec55932a257eba5392e91c9bc2205/shard-lnl-3/igt@xe_pat@pat-sanity.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7063">Intel XE#7063</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159539v3/shard-lnl-3/igt@xe_pat@pat-sanity.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4537">Intel XE#4537</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7063">Intel XE#7063</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4393-d398f90fc4dec55932a257eba5392e91c9bc2205 -&gt; xe-pw-159539v3</li>
</ul>
<p>IGT_8704: 8704<br />
  xe-4393-d398f90fc4dec55932a257eba5392e91c9bc2205: d398f90fc4dec55932a257eba5392e91c9bc2205<br />
  xe-pw-159539v3: 159539v3</p>

</body>
</html>

--===============4989305930498970908==--
