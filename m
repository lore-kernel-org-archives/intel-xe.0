Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC81BEDEC12
	for <intel-xe@archiver.kernel.org>; Wed,  4 Mar 2026 06:36:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AC8C10E0A2;
	Wed,  4 Mar 2026 06:36:01 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D66310E0A2;
 Wed,  4 Mar 2026 06:36:00 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0394059291737579129=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/xe=3A_Don=27t_disable_?=
 =?utf-8?q?GuCRC_in_suspend_path?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 04 Mar 2026 06:36:00 -0000
Message-ID: <177260616028.313803.6470091041902569298@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260303181416.3880937-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20260303181416.3880937-1-vinay.belgaumkar@intel.com>
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

--===============0394059291737579129==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Don't disable GuCRC in suspend path
URL   : https://patchwork.freedesktop.org/series/162518/
State : failure

== Summary ==

CI Bug Log - changes from xe-4654-7f2495944abe599477bd1d891f6fbaf1d5dded3b_FULL -> xe-pw-162518v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-162518v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-162518v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-162518v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_atomic_transition@modeset-transition-fencing:
    - shard-bmg:          [PASS][1] -> [FAIL][2] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4654-7f2495944abe599477bd1d891f6fbaf1d5dded3b/shard-bmg-7/igt@kms_atomic_transition@modeset-transition-fencing.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-2/igt@kms_atomic_transition@modeset-transition-fencing.html

  
Known issues
------------

  Here are the changes found in xe-pw-162518v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@unused-handle:
    - shard-bmg:          [PASS][3] -> [SKIP][4] ([Intel XE#6703]) +39 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4654-7f2495944abe599477bd1d891f6fbaf1d5dded3b/shard-bmg-7/igt@kms_addfb_basic@unused-handle.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-2/igt@kms_addfb_basic@unused-handle.html

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-b-dp-2:
    - shard-bmg:          [PASS][5] -> [INCOMPLETE][6] ([Intel XE#4912]) +3 other tests incomplete
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4654-7f2495944abe599477bd1d891f6fbaf1d5dded3b/shard-bmg-1/igt@kms_async_flips@async-flip-suspend-resume@pipe-b-dp-2.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-1/igt@kms_async_flips@async-flip-suspend-resume@pipe-b-dp-2.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#607] / [Intel XE#7361])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-6/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#1124])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2887]) +2 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-8/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2652]) +20 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_chamelium_color@degamma:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2325] / [Intel XE#7358])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-6/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2252])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-8/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_content_protection@atomic-hdcp14@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][13] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-2/igt@kms_content_protection@atomic-hdcp14@pipe-a-dp-2.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-1:
    - shard-bmg:          NOTRUN -> [FAIL][14] ([Intel XE#3304] / [Intel XE#7374]) +1 other test fail
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-5/igt@kms_content_protection@lic-type-0@pipe-a-dp-1.html

  * igt@kms_content_protection@srm@pipe-a-dp-1:
    - shard-bmg:          NOTRUN -> [FAIL][15] ([Intel XE#3304])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-5/igt@kms_content_protection@srm@pipe-a-dp-1.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2320])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#1508])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-6/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#7178] / [Intel XE#7349])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#7178] / [Intel XE#7351])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2311]) +3 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#4141]) +2 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2313]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#1489]) +2 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-6/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-pr-primary-blt:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-6/igt@kms_psr@fbc-pr-primary-blt.html

  * igt@kms_sharpness_filter@invalid-plane-with-filter:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#6503])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-6/igt@kms_sharpness_filter@invalid-plane-with-filter.html

  * igt@xe_eudebug@vma-ufence:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#4837]) +2 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-6/igt@xe_eudebug@vma-ufence.html

  * igt@xe_eudebug_online@set-breakpoint-faultable:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#4837] / [Intel XE#6665]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-6/igt@xe_eudebug_online@set-breakpoint-faultable.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2322] / [Intel XE#7372])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-8/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-userptr-rebind-imm:
    - shard-bmg:          [PASS][29] -> [DMESG-FAIL][30] ([Intel XE#5213] / [Intel XE#5545] / [Intel XE#6652])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4654-7f2495944abe599477bd1d891f6fbaf1d5dded3b/shard-bmg-7/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-rebind-imm.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-2/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-rebind-imm.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-race-imm:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#7136]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-8/igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-race-imm.html

  * igt@xe_exec_multi_queue@two-queues-priority:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#6874]) +4 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-8/igt@xe_exec_multi_queue@two-queues-priority.html

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-madvise:
    - shard-bmg:          [PASS][33] -> [SKIP][34] ([Intel XE#6557] / [Intel XE#6703])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4654-7f2495944abe599477bd1d891f6fbaf1d5dded3b/shard-bmg-7/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-madvise.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-2/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-madvise.html

  * igt@xe_exec_threads@threads-multi-queue-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#7138]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-8/igt@xe_exec_threads@threads-multi-queue-rebind.html

  * igt@xe_multigpu_svm@mgpu-pagefault-basic:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#6964]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-8/igt@xe_multigpu_svm@mgpu-pagefault-basic.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2236])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-6/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_query@multigpu-query-oa-units:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#944])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-8/igt@xe_query@multigpu-query-oa-units.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-bmg:          NOTRUN -> [FAIL][39] ([Intel XE#5937])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-6/igt@xe_sriov_flr@flr-each-isolation.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1:
    - shard-lnl:          [FAIL][40] ([Intel XE#6054] / [Intel XE#7509]) -> [PASS][41] +3 other tests pass
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4654-7f2495944abe599477bd1d891f6fbaf1d5dded3b/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-lnl-6/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-0:
    - shard-bmg:          [ABORT][42] -> [PASS][43]
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4654-7f2495944abe599477bd1d891f6fbaf1d5dded3b/shard-bmg-6/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-6/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-bmg:          [SKIP][44] ([Intel XE#367] / [Intel XE#7354]) -> [PASS][45]
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4654-7f2495944abe599477bd1d891f6fbaf1d5dded3b/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-bmg:          [INCOMPLETE][46] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][47] +1 other test pass
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4654-7f2495944abe599477bd1d891f6fbaf1d5dded3b/shard-bmg-3/igt@kms_flip@flip-vs-suspend.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-8/igt@kms_flip@flip-vs-suspend.html

  
#### Warnings ####

  * igt@kms_ccs@crc-primary-basic-y-tiled-ccs:
    - shard-bmg:          [SKIP][48] ([Intel XE#2887]) -> [SKIP][49] ([Intel XE#6703])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4654-7f2495944abe599477bd1d891f6fbaf1d5dded3b/shard-bmg-7/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-2/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-bmg:          [SKIP][50] ([Intel XE#2320]) -> [SKIP][51] ([Intel XE#6703])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4654-7f2495944abe599477bd1d891f6fbaf1d5dded3b/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-128x42.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-bmg:          [SKIP][52] ([Intel XE#7178] / [Intel XE#7351]) -> [SKIP][53] ([Intel XE#6703])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4654-7f2495944abe599477bd1d891f6fbaf1d5dded3b/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][54] ([Intel XE#4141]) -> [SKIP][55] ([Intel XE#6703])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4654-7f2495944abe599477bd1d891f6fbaf1d5dded3b/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][56] ([Intel XE#2311]) -> [SKIP][57] ([Intel XE#6703])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4654-7f2495944abe599477bd1d891f6fbaf1d5dded3b/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-render.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt:
    - shard-bmg:          [SKIP][58] ([Intel XE#2313]) -> [SKIP][59] ([Intel XE#6703]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4654-7f2495944abe599477bd1d891f6fbaf1d5dded3b/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][60] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][61] ([Intel XE#3544])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4654-7f2495944abe599477bd1d891f6fbaf1d5dded3b/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
    - shard-lnl:          [SKIP][62] ([Intel XE#2893]) -> [SKIP][63] ([Intel XE#2893] / [Intel XE#7304])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4654-7f2495944abe599477bd1d891f6fbaf1d5dded3b/shard-lnl-4/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-lnl-6/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-b-edp-1:
    - shard-lnl:          [SKIP][64] ([Intel XE#4608]) -> [SKIP][65] ([Intel XE#4608] / [Intel XE#7304]) +11 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4654-7f2495944abe599477bd1d891f6fbaf1d5dded3b/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-b-edp-1.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-b-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-lnl:          [SKIP][66] ([Intel XE#2893] / [Intel XE#4608]) -> [SKIP][67] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304]) +11 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4654-7f2495944abe599477bd1d891f6fbaf1d5dded3b/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-bmg:          [SKIP][68] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342]) -> [SKIP][69] ([Intel XE#6703])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4654-7f2495944abe599477bd1d891f6fbaf1d5dded3b/shard-bmg-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][70] ([Intel XE#2509] / [Intel XE#7437]) -> [SKIP][71] ([Intel XE#2426] / [Intel XE#5848])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4654-7f2495944abe599477bd1d891f6fbaf1d5dded3b/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:
    - shard-bmg:          [SKIP][72] ([Intel XE#2322] / [Intel XE#7372]) -> [SKIP][73] ([Intel XE#6703])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4654-7f2495944abe599477bd1d891f6fbaf1d5dded3b/shard-bmg-7/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd:
    - shard-bmg:          [SKIP][74] ([Intel XE#6874]) -> [SKIP][75] ([Intel XE#6703]) +2 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4654-7f2495944abe599477bd1d891f6fbaf1d5dded3b/shard-bmg-7/igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-2/igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd.html

  * igt@xe_mmap@small-bar:
    - shard-bmg:          [SKIP][76] ([Intel XE#586] / [Intel XE#7323] / [Intel XE#7384]) -> [SKIP][77] ([Intel XE#6703])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4654-7f2495944abe599477bd1d891f6fbaf1d5dded3b/shard-bmg-7/igt@xe_mmap@small-bar.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-2/igt@xe_mmap@small-bar.html

  * igt@xe_pxp@regular-src-to-pxp-dest-rendercopy:
    - shard-bmg:          [SKIP][78] ([Intel XE#4733] / [Intel XE#7417]) -> [SKIP][79] ([Intel XE#6703])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4654-7f2495944abe599477bd1d891f6fbaf1d5dded3b/shard-bmg-7/igt@xe_pxp@regular-src-to-pxp-dest-rendercopy.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-2/igt@xe_pxp@regular-src-to-pxp-dest-rendercopy.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4912
  [Intel XE#5213]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5213
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#5937]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5937
  [Intel XE#6054]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6054
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557
  [Intel XE#6652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652
  [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
  [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7323
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7354
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7384]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7384
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7509
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-4654-7f2495944abe599477bd1d891f6fbaf1d5dded3b -> xe-pw-162518v1

  IGT_8777: a50285a68dbef0fe11140adef4016a756f57b324 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4654-7f2495944abe599477bd1d891f6fbaf1d5dded3b: 7f2495944abe599477bd1d891f6fbaf1d5dded3b
  xe-pw-162518v1: 162518v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/index.html

--===============0394059291737579129==
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
<tr><td><b>Series:</b></td><td>drm/xe: Don&#x27;t disable GuCRC in suspend path</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/162518/">https://patchwork.freedesktop.org/series/162518/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4654-7f2495944abe599477bd1d891f6fbaf1d5dded3b_FULL -&gt; xe-pw-162518v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-162518v1_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-162518v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-162518v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_atomic_transition@modeset-transition-fencing:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4654-7f2495944abe599477bd1d891f6fbaf1d5dded3b/shard-bmg-7/igt@kms_atomic_transition@modeset-transition-fencing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-2/igt@kms_atomic_transition@modeset-transition-fencing.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-162518v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@unused-handle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4654-7f2495944abe599477bd1d891f6fbaf1d5dded3b/shard-bmg-7/igt@kms_addfb_basic@unused-handle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-2/igt@kms_addfb_basic@unused-handle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4654-7f2495944abe599477bd1d891f6fbaf1d5dded3b/shard-bmg-1/igt@kms_async_flips@async-flip-suspend-resume@pipe-b-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-1/igt@kms_async_flips@async-flip-suspend-resume@pipe-b-dp-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4912">Intel XE#4912</a>) +3 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-6/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361">Intel XE#7361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-8/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-6/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-8/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-hdcp14@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-2/igt@kms_content_protection@atomic-hdcp14@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-5/igt@kms_content_protection@lic-type-0@pipe-a-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-5/igt@kms_content_protection@srm@pipe-a-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-6/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349">Intel XE#7349</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-6/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-6/igt@kms_psr@fbc-pr-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-plane-with-filter:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-6/igt@kms_sharpness_filter@invalid-plane-with-filter.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@vma-ufence:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-6/igt@xe_eudebug@vma-ufence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint-faultable:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-6/igt@xe_eudebug_online@set-breakpoint-faultable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-8/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-userptr-rebind-imm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4654-7f2495944abe599477bd1d891f6fbaf1d5dded3b/shard-bmg-7/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-rebind-imm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-2/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-rebind-imm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5213">Intel XE#5213</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652">Intel XE#6652</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-8/igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-race-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-priority:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-8/igt@xe_exec_multi_queue@two-queues-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-madvise:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4654-7f2495944abe599477bd1d891f6fbaf1d5dded3b/shard-bmg-7/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-madvise.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-2/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-madvise.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-8/igt@xe_exec_threads@threads-multi-queue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-pagefault-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-8/igt@xe_multigpu_svm@mgpu-pagefault-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-6/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-oa-units:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-8/igt@xe_query@multigpu-query-oa-units.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-6/igt@xe_sriov_flr@flr-each-isolation.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5937">Intel XE#5937</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4654-7f2495944abe599477bd1d891f6fbaf1d5dded3b/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6054">Intel XE#6054</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7509">Intel XE#7509</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-lnl-6/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4654-7f2495944abe599477bd1d891f6fbaf1d5dded3b/shard-bmg-6/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-6/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4654-7f2495944abe599477bd1d891f6fbaf1d5dded3b/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7354">Intel XE#7354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4654-7f2495944abe599477bd1d891f6fbaf1d5dded3b/shard-bmg-3/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-8/igt@kms_flip@flip-vs-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4654-7f2495944abe599477bd1d891f6fbaf1d5dded3b/shard-bmg-7/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-2/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4654-7f2495944abe599477bd1d891f6fbaf1d5dded3b/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4654-7f2495944abe599477bd1d891f6fbaf1d5dded3b/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4654-7f2495944abe599477bd1d891f6fbaf1d5dded3b/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4654-7f2495944abe599477bd1d891f6fbaf1d5dded3b/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4654-7f2495944abe599477bd1d891f6fbaf1d5dded3b/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4654-7f2495944abe599477bd1d891f6fbaf1d5dded3b/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4654-7f2495944abe599477bd1d891f6fbaf1d5dded3b/shard-lnl-4/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-lnl-6/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4654-7f2495944abe599477bd1d891f6fbaf1d5dded3b/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4654-7f2495944abe599477bd1d891f6fbaf1d5dded3b/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4654-7f2495944abe599477bd1d891f6fbaf1d5dded3b/shard-bmg-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4654-7f2495944abe599477bd1d891f6fbaf1d5dded3b/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437">Intel XE#7437</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4654-7f2495944abe599477bd1d891f6fbaf1d5dded3b/shard-bmg-7/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4654-7f2495944abe599477bd1d891f6fbaf1d5dded3b/shard-bmg-7/igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-2/igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4654-7f2495944abe599477bd1d891f6fbaf1d5dded3b/shard-bmg-7/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/586">Intel XE#586</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7323">Intel XE#7323</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7384">Intel XE#7384</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-2/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@regular-src-to-pxp-dest-rendercopy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4654-7f2495944abe599477bd1d891f6fbaf1d5dded3b/shard-bmg-7/igt@xe_pxp@regular-src-to-pxp-dest-rendercopy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162518v1/shard-bmg-2/igt@xe_pxp@regular-src-to-pxp-dest-rendercopy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4654-7f2495944abe599477bd1d891f6fbaf1d5dded3b -&gt; xe-pw-162518v1</li>
</ul>
<p>IGT_8777: a50285a68dbef0fe11140adef4016a756f57b324 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4654-7f2495944abe599477bd1d891f6fbaf1d5dded3b: 7f2495944abe599477bd1d891f6fbaf1d5dded3b<br />
  xe-pw-162518v1: 162518v1</p>

</body>
</html>

--===============0394059291737579129==--
