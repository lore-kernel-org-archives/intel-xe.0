Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5AD1CDB479
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jun 2026 00:30:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CE5310E155;
	Thu, 25 Jun 2026 00:30:54 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53CA310E128;
 Thu, 25 Jun 2026 00:30:53 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2024596813944648944=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/xe/guc=3A_distinguish_?=
 =?utf-8?q?wedged_from_recoverable_cancellation_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sk Anirban" <sk.anirban@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 25 Jun 2026 00:30:53 -0000
Message-ID: <178234745332.114457.8281936067096920810@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260624194618.2793571-4-sk.anirban@intel.com>
In-Reply-To: <20260624194618.2793571-4-sk.anirban@intel.com>
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

--===============2024596813944648944==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/guc: distinguish wedged from recoverable cancellation (rev2)
URL   : https://patchwork.freedesktop.org/series/168780/
State : failure

== Summary ==

CI Bug Log - changes from xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7_FULL -> xe-pw-168780v2_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-168780v2_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-168780v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-168780v2_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_bw@connected-linear-tiling-2-displays-target-3840x2160p:
    - shard-bmg:          [PASS][1] -> [INCOMPLETE][2] +9 other tests incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-target-3840x2160p.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-target-3840x2160p.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling@pipe-a-default-mode:
    - shard-lnl:          [PASS][3] -> [INCOMPLETE][4] +1 other test incomplete
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling@pipe-a-default-mode.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling@pipe-a-default-mode.html

  * igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-a-plane-0:
    - shard-bmg:          NOTRUN -> [TIMEOUT][5] +1 other test timeout
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-10/igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-a-plane-0.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format:
    - shard-bmg:          [PASS][6] -> [CRASH][7] +1 other test crash
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-4/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-4/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format.html

  * igt@xe_drm_fdinfo@utilization-single-full-load-while-active:
    - shard-bmg:          NOTRUN -> [CRASH][8]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-6/igt@xe_drm_fdinfo@utilization-single-full-load-while-active.html

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][9] +4 other tests incomplete
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-9/igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_system_allocator@many-large-execqueues-free:
    - shard-bmg:          NOTRUN -> [SKIP][10] +22 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-1/igt@xe_exec_system_allocator@many-large-execqueues-free.html

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-remap-ro-dontunmap-eocheck:
    - shard-bmg:          NOTRUN -> [FAIL][11] +1 other test fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-4/igt@xe_exec_system_allocator@process-many-execqueues-mmap-remap-ro-dontunmap-eocheck.html

  * igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-race-nomemset:
    - shard-lnl:          NOTRUN -> [INCOMPLETE][12] +7 other tests incomplete
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-lnl-7/igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-race-nomemset.html

  * igt@xe_exec_system_allocator@process-many-large-mmap-new-race-nomemset:
    - shard-bmg:          [PASS][13] -> [FAIL][14] +6 other tests fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-4/igt@xe_exec_system_allocator@process-many-large-mmap-new-race-nomemset.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-6/igt@xe_exec_system_allocator@process-many-large-mmap-new-race-nomemset.html

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-madvise:
    - shard-lnl:          [PASS][15] -> [TIMEOUT][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-lnl-2/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-madvise.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-lnl-5/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-madvise.html

  * igt@xe_exec_system_allocator@threads-many-stride-free-nomemset:
    - shard-bmg:          [PASS][17] -> [SKIP][18] +124 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-1/igt@xe_exec_system_allocator@threads-many-stride-free-nomemset.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-stride-free-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-prefetch-madvise:
    - shard-bmg:          [PASS][19] -> [TIMEOUT][20] +12 other tests timeout
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-prefetch-madvise.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-prefetch-madvise.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-madvise:
    - shard-lnl:          NOTRUN -> [TIMEOUT][21]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-lnl-7/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-madvise.html

  * igt@xe_sriov_scheduling@nonpreempt-engine-resets-normal-priority@numvfs-random-gt0-rcs0:
    - shard-bmg:          [PASS][22] -> [ABORT][23]
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-3/igt@xe_sriov_scheduling@nonpreempt-engine-resets-normal-priority@numvfs-random-gt0-rcs0.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-7/igt@xe_sriov_scheduling@nonpreempt-engine-resets-normal-priority@numvfs-random-gt0-rcs0.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-bmg:          [SKIP][24] -> [TIMEOUT][25] +2 other tests timeout
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-9/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          [INCOMPLETE][26] ([Intel XE#5643]) -> [TIMEOUT][27]
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-bmg:          [SKIP][28] ([Intel XE#2327]) -> [SKIP][29]
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-7/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-1/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-bmg:          [TIMEOUT][30] -> [SKIP][31] +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-7/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
    - shard-bmg:          [SKIP][32] ([Intel XE#1124]) -> [SKIP][33] +2 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-1/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-2/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-1-displays-target-2560x1440p:
    - shard-bmg:          [TIMEOUT][34] -> [INCOMPLETE][35]
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-4/igt@kms_bw@connected-linear-tiling-1-displays-target-2560x1440p.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-4/igt@kms_bw@connected-linear-tiling-1-displays-target-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p:
    - shard-bmg:          [SKIP][36] -> [INCOMPLETE][37] +2 other tests incomplete
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-9/igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-2/igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-target-3840x2160p:
    - shard-bmg:          [SKIP][38] ([Intel XE#367]) -> [INCOMPLETE][39] +3 other tests incomplete
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-9/igt@kms_bw@linear-tiling-2-displays-target-3840x2160p.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-5/igt@kms_bw@linear-tiling-2-displays-target-3840x2160p.html

  * igt@kms_bw@linear-tiling-3-displays-target-2160x1440p:
    - shard-bmg:          [SKIP][40] ([Intel XE#367]) -> [SKIP][41] +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-7/igt@kms_bw@linear-tiling-3-displays-target-2160x1440p.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-1/igt@kms_bw@linear-tiling-3-displays-target-2160x1440p.html

  * igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:
    - shard-bmg:          [SKIP][42] ([Intel XE#2887]) -> [SKIP][43] +2 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-1/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-2/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4:
    - shard-bmg:          [SKIP][44] ([Intel XE#7358]) -> [SKIP][45]
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-1/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-2/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html

  * igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:
    - shard-bmg:          [SKIP][46] ([Intel XE#2252]) -> [SKIP][47]
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-1/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-2/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          [FAIL][48] ([Intel XE#6707] / [Intel XE#7439]) -> [SKIP][49]
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-1/igt@kms_content_protection@uevent.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-2/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-bmg:          [SKIP][50] ([Intel XE#2321] / [Intel XE#7355]) -> [SKIP][51]
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-1/igt@kms_cursor_crc@cursor-random-512x170.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-2/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size:
    - shard-bmg:          [INCOMPLETE][52] ([Intel XE#8151]) -> [TIMEOUT][53]
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-6/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-7/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-bmg:          [SKIP][54] ([Intel XE#4422] / [Intel XE#7442]) -> [SKIP][55]
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-1/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-2/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
    - shard-bmg:          [SKIP][56] ([Intel XE#7178] / [Intel XE#7351]) -> [SKIP][57]
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html

  * igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-blt:
    - shard-bmg:          [SKIP][58] ([Intel XE#7061]) -> [SKIP][59]
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-7/igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-blt.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-1/igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrshdr-modesetfrombusy:
    - shard-bmg:          [SKIP][60] ([Intel XE#2311]) -> [SKIP][61] +11 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-1/igt@kms_frontbuffer_tracking@drrshdr-modesetfrombusy.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-2/igt@kms_frontbuffer_tracking@drrshdr-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][62] ([Intel XE#4141]) -> [SKIP][63] +2 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][64] ([Intel XE#2313]) -> [SKIP][65] +11 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-render:
    - shard-bmg:          [SKIP][66] ([Intel XE#7061] / [Intel XE#7356]) -> [SKIP][67]
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-render.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-render.html

  * igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping:
    - shard-bmg:          [CRASH][68] -> [TIMEOUT][69]
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-8/igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-10/igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping:
    - shard-bmg:          [SKIP][70] ([Intel XE#7283]) -> [SKIP][71] +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-1/igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-2/igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:
    - shard-bmg:          [SKIP][72] ([Intel XE#2763] / [Intel XE#6886]) -> [CRASH][73] +1 other test crash
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-c:
    - shard-bmg:          [SKIP][74] ([Intel XE#2763] / [Intel XE#6886]) -> [INCOMPLETE][75] +1 other test incomplete
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-c.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-c.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
    - shard-bmg:          [INCOMPLETE][76] -> [TIMEOUT][77] +1 other test timeout
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
    - shard-lnl:          [TIMEOUT][78] -> [INCOMPLETE][79] +1 other test incomplete
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
    - shard-bmg:          [SKIP][80] ([Intel XE#1489]) -> [SKIP][81] +1 other test skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-1/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-2/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-bmg:          [SKIP][82] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][83]
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-1/igt@kms_psr@fbc-psr2-primary-render.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-2/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_sharpness_filter@invalid-filter-with-plane:
    - shard-bmg:          [SKIP][84] ([Intel XE#6503]) -> [SKIP][85]
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-1/igt@kms_sharpness_filter@invalid-filter-with-plane.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-2/igt@kms_sharpness_filter@invalid-filter-with-plane.html

  * igt@xe_eudebug_online@breakpoint-many-sessions-single-tile:
    - shard-bmg:          [SKIP][86] ([Intel XE#7636]) -> [SKIP][87]
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-1/igt@xe_eudebug_online@breakpoint-many-sessions-single-tile.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-2/igt@xe_eudebug_online@breakpoint-many-sessions-single-tile.html

  * igt@xe_evict@evict-small-external-multi-queue-cm:
    - shard-bmg:          [SKIP][88] ([Intel XE#8370]) -> [SKIP][89] +1 other test skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-7/igt@xe_evict@evict-small-external-multi-queue-cm.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-1/igt@xe_evict@evict-small-external-multi-queue-cm.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind:
    - shard-bmg:          [SKIP][90] ([Intel XE#2322] / [Intel XE#7372]) -> [INCOMPLETE][91]
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-9/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:
    - shard-bmg:          [SKIP][92] ([Intel XE#2322] / [Intel XE#7372]) -> [TIMEOUT][93]
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:
    - shard-bmg:          [SKIP][94] ([Intel XE#2322] / [Intel XE#7372]) -> [SKIP][95] +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-7/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-prefetch:
    - shard-bmg:          [SKIP][96] ([Intel XE#8374]) -> [INCOMPLETE][97]
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-3/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-prefetch.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-9/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-prefetch.html

  * igt@xe_exec_fault_mode@many-multi-queue-prefetch:
    - shard-bmg:          [SKIP][98] ([Intel XE#8374]) -> [SKIP][99]
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-1/igt@xe_exec_fault_mode@many-multi-queue-prefetch.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-2/igt@xe_exec_fault_mode@many-multi-queue-prefetch.html

  * igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-basic:
    - shard-bmg:          [SKIP][100] ([Intel XE#8364]) -> [SKIP][101] +4 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-1/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-basic.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-2/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-basic.html

  * igt@xe_exec_reset@multi-queue-close-execqueues:
    - shard-bmg:          [SKIP][102] ([Intel XE#8369]) -> [SKIP][103]
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-1/igt@xe_exec_reset@multi-queue-close-execqueues.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-2/igt@xe_exec_reset@multi-queue-close-execqueues.html

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-prefetch:
    - shard-bmg:          [FAIL][104] -> [SKIP][105]
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-7/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-prefetch.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-1/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-prefetch.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate-race:
    - shard-bmg:          [INCOMPLETE][106] ([Intel XE#8366]) -> [CRASH][107]
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate-race.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-4/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-multi-queue-rebind:
    - shard-bmg:          [SKIP][108] ([Intel XE#8378]) -> [SKIP][109]
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-1/igt@xe_exec_threads@threads-multi-queue-rebind.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-rebind.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_add_hw_engine_class_defaults:
    - shard-bmg:          [CRASH][110] -> [INCOMPLETE][111]
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_add_hw_engine_class_defaults.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_add_hw_engine_class_defaults.html

  * igt@xe_sriov_scheduling@nonpreempt-engine-resets-normal-priority:
    - shard-bmg:          [TIMEOUT][112] -> [ABORT][113]
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-3/igt@xe_sriov_scheduling@nonpreempt-engine-resets-normal-priority.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-7/igt@xe_sriov_scheduling@nonpreempt-engine-resets-normal-priority.html

  * igt@xe_vm@mmap-style-bind-either-side-partial-split-page-hammer:
    - shard-lnl:          [INCOMPLETE][114] -> [TIMEOUT][115]
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-lnl-6/igt@xe_vm@mmap-style-bind-either-side-partial-split-page-hammer.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-lnl-5/igt@xe_vm@mmap-style-bind-either-side-partial-split-page-hammer.html

  
Known issues
------------

  Here are the changes found in xe-pw-168780v2_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][116] ([Intel XE#1407]) +1 other test skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-lnl-7/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-bmg:          [PASS][117] -> [INCOMPLETE][118] ([Intel XE#5643])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-9/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-lnl:          NOTRUN -> [INCOMPLETE][119] ([Intel XE#5643])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][120] ([Intel XE#2327])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-1/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][121] ([Intel XE#1124]) +1 other test skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][122] ([Intel XE#1124]) +1 other test skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-lnl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs:
    - shard-lnl:          NOTRUN -> [ABORT][123] ([Intel XE#8007])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-lnl-4/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][124] ([Intel XE#2887]) +2 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-4/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][125] ([Intel XE#8150])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-bmg:          NOTRUN -> [SKIP][126] ([Intel XE#2252])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-6/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4:
    - shard-bmg:          NOTRUN -> [SKIP][127] ([Intel XE#7358])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-4/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4.html

  * igt@kms_content_protection@content-type-change:
    - shard-bmg:          NOTRUN -> [SKIP][128] ([Intel XE#7642])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-4/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@legacy-hdcp14@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][129] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-2/igt@kms_content_protection@legacy-hdcp14@pipe-a-dp-2.html

  * igt@kms_content_protection@lic-type-1:
    - shard-lnl:          NOTRUN -> [SKIP][130] ([Intel XE#7642])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-lnl-7/igt@kms_content_protection@lic-type-1.html

  * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
    - shard-lnl:          NOTRUN -> [SKIP][131] ([Intel XE#1424])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-lnl-7/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][132] -> [INCOMPLETE][133] ([Intel XE#8151])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-9/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-5/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-lnl:          NOTRUN -> [SKIP][134] ([Intel XE#4354] / [Intel XE#7386])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-lnl-7/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-bmg:          NOTRUN -> [SKIP][135] ([Intel XE#4354] / [Intel XE#5870])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-6/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dsc@dsc-with-bpc-formats-ultrajoiner:
    - shard-lnl:          NOTRUN -> [SKIP][136] ([Intel XE#8265])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-lnl-7/igt@kms_dsc@dsc-with-bpc-formats-ultrajoiner.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-lnl:          NOTRUN -> [SKIP][137] ([Intel XE#1421])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-lnl-7/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset@ab-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][138] ([Intel XE#8155]) +1 other test incomplete
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-1/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset@ab-dp2-hdmi-a3.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x:
    - shard-bmg:          NOTRUN -> [SKIP][139] ([Intel XE#7179])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][140] ([Intel XE#7178] / [Intel XE#7351])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][141] ([Intel XE#6312])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][142] ([Intel XE#7061] / [Intel XE#7356])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-shrfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][143] ([Intel XE#2311]) +17 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][144] ([Intel XE#4141]) +3 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][145] ([Intel XE#656] / [Intel XE#7905]) +5 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][146] ([Intel XE#7061]) +2 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbchdr-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][147] ([Intel XE#7399])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbchdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][148] ([Intel XE#7061] / [Intel XE#7356])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-rte:
    - shard-lnl:          NOTRUN -> [SKIP][149] ([Intel XE#7865]) +3 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-rte.html

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][150] ([Intel XE#7905]) +2 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-lnl-7/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][151] ([Intel XE#2313]) +14 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-6/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][152] -> [SKIP][153] ([Intel XE#1503])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-6/igt@kms_hdr@invalid-hdr.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-10/igt@kms_hdr@invalid-hdr.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-bmg:          NOTRUN -> [SKIP][154] ([Intel XE#4329] / [Intel XE#6912] / [Intel XE#7375])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-1/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][155] ([Intel XE#1035])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-1/igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier:
    - shard-bmg:          NOTRUN -> [SKIP][156] ([Intel XE#7283])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-4/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier.html

  * igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5:
    - shard-bmg:          NOTRUN -> [SKIP][157] ([Intel XE#8303]) +1 other test skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-2/igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][158] ([Intel XE#2393])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-6/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-b:
    - shard-bmg:          NOTRUN -> [SKIP][159] ([Intel XE#2763] / [Intel XE#6886]) +2 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-b.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-bmg:          NOTRUN -> [SKIP][160] ([Intel XE#1489]) +2 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-6/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][161] ([Intel XE#2387] / [Intel XE#7429])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-4/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@pr-sprite-render:
    - shard-bmg:          NOTRUN -> [SKIP][162] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-4/igt@kms_psr@pr-sprite-render.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-lnl:          NOTRUN -> [SKIP][163] ([Intel XE#8361])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-lnl-7/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-lnl:          NOTRUN -> [SKIP][164] ([Intel XE#1127] / [Intel XE#5813])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-lnl-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram:
    - shard-bmg:          NOTRUN -> [SKIP][165] ([Intel XE#7636]) +2 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-1/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram.html

  * igt@xe_exec_balancer@many-virtual-userptr-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][166] ([Intel XE#7482]) +2 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-lnl-7/igt@xe_exec_balancer@many-virtual-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][167] ([Intel XE#1392])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-lnl-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][168] ([Intel XE#2322] / [Intel XE#7372])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-4/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm:
    - shard-bmg:          NOTRUN -> [SKIP][169] ([Intel XE#8374]) +4 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-4/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm.html

  * igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][170] ([Intel XE#8374])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-lnl-7/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate.html

  * igt@xe_exec_multi_queue@many-queues-preempt-mode-priority-smem:
    - shard-bmg:          NOTRUN -> [SKIP][171] ([Intel XE#8364]) +9 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-6/igt@xe_exec_multi_queue@many-queues-preempt-mode-priority-smem.html

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-dyn-priority-smem:
    - shard-lnl:          NOTRUN -> [SKIP][172] ([Intel XE#8364]) +1 other test skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-lnl-7/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-dyn-priority-smem.html

  * igt@xe_exec_reset@cm-multi-queue-close-fd:
    - shard-lnl:          NOTRUN -> [SKIP][173] ([Intel XE#8369])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-lnl-7/igt@xe_exec_reset@cm-multi-queue-close-fd.html

  * igt@xe_exec_reset@cm-multi-queue-gt-reset:
    - shard-bmg:          NOTRUN -> [SKIP][174] ([Intel XE#8369])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-1/igt@xe_exec_reset@cm-multi-queue-gt-reset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-busy-nomemset:
    - shard-bmg:          [PASS][175] -> [INCOMPLETE][176] ([Intel XE#7928] / [Intel XE#8159])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-6/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-busy-nomemset.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-10/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-busy-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-remap-ro:
    - shard-bmg:          [PASS][177] -> [INCOMPLETE][178] ([Intel XE#8159]) +28 other tests incomplete
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-3/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-remap-ro.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-9/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-remap-ro.html

  * igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][179] ([Intel XE#8378]) +2 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-6/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind.html

  * igt@xe_pm@s3-vm-bind-prefetch:
    - shard-lnl:          NOTRUN -> [SKIP][180] ([Intel XE#584] / [Intel XE#7369]) +1 other test skip
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-lnl-7/igt@xe_pm@s3-vm-bind-prefetch.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-rpm:
    - shard-bmg:          NOTRUN -> [SKIP][181] ([Intel XE#4733] / [Intel XE#7417])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-1/igt@xe_pxp@pxp-stale-bo-bind-post-rpm.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-lnl:          NOTRUN -> [SKIP][182] ([Intel XE#944])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-lnl-7/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-bmg:          NOTRUN -> [SKIP][183] ([Intel XE#944])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-1/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_survivability@runtime-survivability:
    - shard-bmg:          [PASS][184] -> [DMESG-WARN][185] ([Intel XE#6627] / [Intel XE#7419])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-8/igt@xe_survivability@runtime-survivability.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-10/igt@xe_survivability@runtime-survivability.html

  
#### Possible fixes ####

  * igt@fbdev@write:
    - shard-bmg:          [SKIP][186] ([Intel XE#2134]) -> [PASS][187]
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-2/igt@fbdev@write.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-3/igt@fbdev@write.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-bmg:          [INCOMPLETE][188] ([Intel XE#5643]) -> [PASS][189] +1 other test pass
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          [CRASH][190] -> [PASS][191]
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-5/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-1/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [TIMEOUT][192] -> [PASS][193] +9 other tests pass
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-10/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-mmap-wc.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-shrfb-draw-render:
    - shard-bmg:          [INCOMPLETE][194] ([Intel XE#8368]) -> [PASS][195]
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-5/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-shrfb-draw-render.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation:
    - shard-bmg:          [INCOMPLETE][196] -> [PASS][197] +12 other tests pass
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-7/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation.html

  * igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-rebind:
    - shard-bmg:          [SKIP][198] -> [PASS][199] +170 other tests pass
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-9/igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-rebind.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-2/igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-rebind.html

  * igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-race:
    - shard-bmg:          [FAIL][200] -> [PASS][201] +5 other tests pass
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-4/igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-race.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-6/igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-race.html

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-free-race-nomemset:
    - shard-bmg:          [INCOMPLETE][202] ([Intel XE#7928] / [Intel XE#8159]) -> [PASS][203]
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-9/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-free-race-nomemset.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-free-race-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-prefetch:
    - shard-bmg:          [INCOMPLETE][204] ([Intel XE#8159]) -> [PASS][205] +31 other tests pass
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-10/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-prefetch.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-4/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-prefetch.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-free-madvise:
    - shard-lnl:          [TIMEOUT][206] -> [PASS][207] +1 other test pass
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-lnl-6/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-free-madvise.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-lnl-1/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-free-madvise.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][208], [PASS][209], [PASS][210], [PASS][211], [PASS][212], [PASS][213], [PASS][214], [PASS][215], [PASS][216], [PASS][217], [PASS][218], [PASS][219], [SKIP][220], [PASS][221], [PASS][222], [PASS][223], [PASS][224], [PASS][225], [PASS][226], [PASS][227], [PASS][228], [PASS][229], [PASS][230], [PASS][231], [PASS][232], [PASS][233]) ([Intel XE#2457] / [Intel XE#7405]) -> ([PASS][234], [PASS][235], [PASS][236], [PASS][237], [PASS][238], [PASS][239], [PASS][240], [PASS][241], [PASS][242], [PASS][243], [PASS][244], [PASS][245], [PASS][246], [PASS][247], [PASS][248], [PASS][249], [PASS][250], [PASS][251], [PASS][252], [PASS][253], [PASS][254], [PASS][255], [PASS][256], [PASS][257], [PASS][258])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-9/igt@xe_module_load@load.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-7/igt@xe_module_load@load.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-1/igt@xe_module_load@load.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-5/igt@xe_module_load@load.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-9/igt@xe_module_load@load.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-10/igt@xe_module_load@load.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-10/igt@xe_module_load@load.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-5/igt@xe_module_load@load.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-8/igt@xe_module_load@load.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-8/igt@xe_module_load@load.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-5/igt@xe_module_load@load.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-3/igt@xe_module_load@load.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-1/igt@xe_module_load@load.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-7/igt@xe_module_load@load.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-8/igt@xe_module_load@load.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-1/igt@xe_module_load@load.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-1/igt@xe_module_load@load.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-10/igt@xe_module_load@load.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-3/igt@xe_module_load@load.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-6/igt@xe_module_load@load.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-6/igt@xe_module_load@load.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-9/igt@xe_module_load@load.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-2/igt@xe_module_load@load.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-2/igt@xe_module_load@load.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-4/igt@xe_module_load@load.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-4/igt@xe_module_load@load.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-6/igt@xe_module_load@load.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-5/igt@xe_module_load@load.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-5/igt@xe_module_load@load.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-4/igt@xe_module_load@load.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-4/igt@xe_module_load@load.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-4/igt@xe_module_load@load.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-8/igt@xe_module_load@load.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-5/igt@xe_module_load@load.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-6/igt@xe_module_load@load.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-3/igt@xe_module_load@load.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-3/igt@xe_module_load@load.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-3/igt@xe_module_load@load.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-1/igt@xe_module_load@load.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-1/igt@xe_module_load@load.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-7/igt@xe_module_load@load.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-7/igt@xe_module_load@load.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-9/igt@xe_module_load@load.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-9/igt@xe_module_load@load.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-2/igt@xe_module_load@load.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-7/igt@xe_module_load@load.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-2/igt@xe_module_load@load.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-10/igt@xe_module_load@load.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-10/igt@xe_module_load@load.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-1/igt@xe_module_load@load.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-8/igt@xe_module_load@load.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-lnl:          [ABORT][259] ([Intel XE#8007]) -> [PASS][260]
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-lnl-7/igt@xe_wedged@wedged-mode-toggle.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-lnl-4/igt@xe_wedged@wedged-mode-toggle.html

  
#### Warnings ####

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-bmg:          [INCOMPLETE][261] ([Intel XE#8174]) -> [SKIP][262] ([Intel XE#2370])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-bmg:          [SKIP][263] -> [INCOMPLETE][264] ([Intel XE#5643])
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-270:
    - shard-bmg:          [SKIP][265] -> [SKIP][266] ([Intel XE#1124]) +2 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-2/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-3/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-lnl:          [SKIP][267] ([Intel XE#1124]) -> [INCOMPLETE][268] ([Intel XE#5643])
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-lnl-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-lnl-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          [INCOMPLETE][269] ([Intel XE#5643]) -> [SKIP][270] ([Intel XE#1124])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-lnl-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-lnl-3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-lnl:          [TIMEOUT][271] -> [INCOMPLETE][272] ([Intel XE#5643])
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-lnl-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-lnl-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-bmg:          [INCOMPLETE][273] ([Intel XE#5643]) -> [SKIP][274] ([Intel XE#1124]) +1 other test skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-10/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p:
    - shard-bmg:          [CRASH][275] -> [SKIP][276] ([Intel XE#7679])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-1/igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p.html

  * igt@kms_bw@linear-tiling-1-displays-target-2560x1440p:
    - shard-bmg:          [INCOMPLETE][277] -> [SKIP][278] ([Intel XE#367])
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-1/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-4/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-bmg:          [SKIP][279] -> [SKIP][280] ([Intel XE#2887]) +5 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-2/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-3/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          [SKIP][281] -> [SKIP][282] ([Intel XE#3432])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-bmg:          [SKIP][283] -> [SKIP][284] ([Intel XE#2252]) +2 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-2/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-3/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:
    - shard-bmg:          [SKIP][285] -> [SKIP][286] ([Intel XE#6974])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-9/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-2/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html

  * igt@kms_content_protection@legacy-hdcp14:
    - shard-bmg:          [SKIP][287] -> [FAIL][288] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-9/igt@kms_content_protection@legacy-hdcp14.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-2/igt@kms_content_protection@legacy-hdcp14.html

  * igt@kms_content_protection@type1:
    - shard-bmg:          [SKIP][289] -> [SKIP][290] ([Intel XE#7642])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-2/igt@kms_content_protection@type1.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-3/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-random-256x85:
    - shard-bmg:          [SKIP][291] -> [SKIP][292] ([Intel XE#2320])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-9/igt@kms_cursor_crc@cursor-random-256x85.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-2/igt@kms_cursor_crc@cursor-random-256x85.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-bmg:          [SKIP][293] -> [SKIP][294] ([Intel XE#2321] / [Intel XE#7355])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-2/igt@kms_cursor_crc@cursor-random-512x512.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-3/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-bmg:          [SKIP][295] -> [SKIP][296] ([Intel XE#8265])
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-2/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-3/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-bmg:          [SKIP][297] -> [SKIP][298] ([Intel XE#7178] / [Intel XE#7349])
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
    - shard-bmg:          [SKIP][299] -> [SKIP][300] ([Intel XE#7178] / [Intel XE#7351]) +1 other test skip
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][301] -> [SKIP][302] ([Intel XE#2311]) +15 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-2/igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-spr-indfb-draw-blt.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-3/igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][303] -> [SKIP][304] ([Intel XE#4141]) +1 other test skip
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render:
    - shard-bmg:          [SKIP][305] -> [SKIP][306] ([Intel XE#7061] / [Intel XE#7356]) +2 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-bmg:          [SKIP][307] -> [SKIP][308] ([Intel XE#2352] / [Intel XE#7399])
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [INCOMPLETE][309] ([Intel XE#8368]) -> [SKIP][310] ([Intel XE#2311])
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-render.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][311] ([Intel XE#2311]) -> [INCOMPLETE][312] ([Intel XE#8368]) +1 other test incomplete
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-draw-render.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-blt:
    - shard-bmg:          [SKIP][313] -> [SKIP][314] ([Intel XE#7061]) +1 other test skip
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-blt.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [TIMEOUT][315] -> [INCOMPLETE][316] ([Intel XE#8368])
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-2/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-render.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [INCOMPLETE][317] ([Intel XE#8368]) -> [SKIP][318] ([Intel XE#2313]) +1 other test skip
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-cur-indfb-draw-blt.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][319] -> [SKIP][320] ([Intel XE#2313]) +21 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-9/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-render.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-2/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping:
    - shard-bmg:          [SKIP][321] ([Intel XE#7283]) -> [INCOMPLETE][322] ([Intel XE#1035]) +1 other test incomplete
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-10/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-8/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:
    - shard-bmg:          [INCOMPLETE][323] ([Intel XE#1035]) -> [SKIP][324] ([Intel XE#7283]) +1 other test skip
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-5/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-8/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          [SKIP][325] -> [SKIP][326] ([Intel XE#5020] / [Intel XE#7348])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-2/igt@kms_plane_multiple@tiling-yf.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-3/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-bmg:          [CRASH][327] -> [SKIP][328] ([Intel XE#2763] / [Intel XE#6886])
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a:
    - shard-bmg:          [INCOMPLETE][329] -> [SKIP][330] ([Intel XE#2763] / [Intel XE#6886])
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a.html

  * igt@kms_pm_dc@dc5-pageflip-negative:
    - shard-bmg:          [SKIP][331] -> [SKIP][332] ([Intel XE#6927])
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-2/igt@kms_pm_dc@dc5-pageflip-negative.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-3/igt@kms_pm_dc@dc5-pageflip-negative.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-bmg:          [SKIP][333] -> [SKIP][334] ([Intel XE#1489]) +1 other test skip
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-9/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-2/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-bmg:          [SKIP][335] -> [SKIP][336] ([Intel XE#2387] / [Intel XE#7429])
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-9/igt@kms_psr2_su@page_flip-nv12.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-2/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@psr-basic:
    - shard-bmg:          [SKIP][337] -> [SKIP][338] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-9/igt@kms_psr@psr-basic.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-2/igt@kms_psr@psr-basic.html

  * igt@kms_sharpness_filter@filter-tap:
    - shard-bmg:          [SKIP][339] -> [SKIP][340] ([Intel XE#6503])
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-9/igt@kms_sharpness_filter@filter-tap.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-2/igt@kms_sharpness_filter@filter-tap.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][341] ([Intel XE#1729] / [Intel XE#7424]) -> [SKIP][342] ([Intel XE#2426] / [Intel XE#5848])
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html

  * igt@xe_eudebug_online@stopped-thread:
    - shard-bmg:          [SKIP][343] -> [SKIP][344] ([Intel XE#7636]) +4 other tests skip
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-9/igt@xe_eudebug_online@stopped-thread.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-2/igt@xe_eudebug_online@stopped-thread.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:
    - shard-bmg:          [INCOMPLETE][345] -> [SKIP][346] ([Intel XE#2322] / [Intel XE#7372]) +2 other tests skip
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind:
    - shard-bmg:          [SKIP][347] -> [SKIP][348] ([Intel XE#2322] / [Intel XE#7372]) +2 other tests skip
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-9/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-rebind-prefetch:
    - shard-bmg:          [INCOMPLETE][349] -> [SKIP][350] ([Intel XE#8374])
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-9/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-rebind-prefetch.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-3/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-rebind-prefetch.html

  * igt@xe_exec_fault_mode@many-multi-queue-rebind-prefetch:
    - shard-bmg:          [SKIP][351] -> [SKIP][352] ([Intel XE#8374])
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-2/igt@xe_exec_fault_mode@many-multi-queue-rebind-prefetch.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-3/igt@xe_exec_fault_mode@many-multi-queue-rebind-prefetch.html

  * igt@xe_exec_multi_queue@one-queue-priority-smem:
    - shard-bmg:          [SKIP][353] -> [SKIP][354] ([Intel XE#8364]) +6 other tests skip
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-2/igt@xe_exec_multi_queue@one-queue-priority-smem.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-3/igt@xe_exec_multi_queue@one-queue-priority-smem.html

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-shared-remap-dontunmap-eocheck:
    - shard-bmg:          [FAIL][355] -> [INCOMPLETE][356] ([Intel XE#8159])
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-6/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-shared-remap-dontunmap-eocheck.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-10/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-shared-remap-dontunmap-eocheck.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-new-huge-nomemset:
    - shard-bmg:          [SKIP][357] -> [INCOMPLETE][358] ([Intel XE#8159])
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-9/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-new-huge-nomemset.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-new-huge-nomemset.html

  * igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr:
    - shard-bmg:          [SKIP][359] -> [SKIP][360] ([Intel XE#8378]) +2 other tests skip
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-9/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr.html

  * igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr-invalidate:
    - shard-bmg:          [SKIP][361] ([Intel XE#8378]) -> [INCOMPLETE][362] ([Intel XE#8366])
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-6/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr-invalidate.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr-invalidate.html

  * igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr-invalidate-race:
    - shard-bmg:          [INCOMPLETE][363] ([Intel XE#8366]) -> [SKIP][364] ([Intel XE#8378])
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr-invalidate-race.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-8/igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr-invalidate-race.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-bmg:          [SKIP][365] -> [SKIP][366] ([Intel XE#2284] / [Intel XE#7370])
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-2/igt@xe_pm@d3cold-multiple-execs.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-3/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pxp@display-black-pxp-fb:
    - shard-bmg:          [SKIP][367] -> [SKIP][368] ([Intel XE#4733] / [Intel XE#7417])
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-2/igt@xe_pxp@display-black-pxp-fb.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-3/igt@xe_pxp@display-black-pxp-fb.html

  
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5643]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5643
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5870
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6627]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6627
  [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912
  [Intel XE#6927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6927
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348
  [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7369
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7375
  [Intel XE#7386]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7386
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7419]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7419
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
  [Intel XE#7439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439
  [Intel XE#7442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#7928]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7928
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
  [Intel XE#8151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8151
  [Intel XE#8155]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8155
  [Intel XE#8159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159
  [Intel XE#8174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8174
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8303]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303
  [Intel XE#8361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8361
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8366
  [Intel XE#8368]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8368
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7 -> xe-pw-168780v2

  IGT_8985: d5fe8732b8547454c38fdd220b55f6f0cc841a3b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7: c04e038b8787434bf489ea6de4ab2e2d936083c7
  xe-pw-168780v2: 168780v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/index.html

--===============2024596813944648944==
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
<tr><td><b>Series:</b></td><td>drm/xe/guc: distinguish wedged from recovera=
ble cancellation (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/168780/">https://patchwork.freedesktop.org/series/168780/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-168780v2/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-168780v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5298-c04e038b8787434bf489ea6de4ab2e2d9=
36083c7_FULL -&gt; xe-pw-168780v2_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-168780v2_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-168780v2_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1687=
80v2_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-6/igt@kms_bw@c=
onnected-linear-tiling-2-displays-target-3840x2160p.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg=
-7/igt@kms_bw@connected-linear-tiling-2-displays-target-3840x2160p.html">IN=
COMPLETE</a> +9 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-lnl-3/igt@kms_flip=
_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling@pipe-a-default-mode=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-168780v2/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16b=
pp-linear-upscaling@pipe-a-default-mode.html">INCOMPLETE</a> +1 other test =
incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-a-plane=
-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168780v2/shard-bmg-10/igt@kms_plane@pixel-format-x-til=
ed-modifier-source-clamping@pipe-a-plane-0.html">TIMEOUT</a> +1 other test =
timeout</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-4/igt@kms_plan=
e_scaling@plane-upscale-factor-0-25-with-pixel-format.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-b=
mg-4/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format.html=
">CRASH</a> +1 other test crash</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@utilization-single-full-load-while-active:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168780v2/shard-bmg-6/igt@xe_drm_fdinfo@utilization-sin=
gle-full-load-while-active.html">CRASH</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalida=
te:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168780v2/shard-bmg-9/igt@xe_exec_basic@many-execqueues=
-many-vm-bindexecqueue-userptr-invalidate.html">INCOMPLETE</a> +4 other tes=
ts incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-free:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168780v2/shard-bmg-1/igt@xe_exec_system_allocator@many=
-large-execqueues-free.html">SKIP</a> +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-remap-ro-dontu=
nmap-eocheck:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168780v2/shard-bmg-4/igt@xe_exec_system_allocator@proc=
ess-many-execqueues-mmap-remap-ro-dontunmap-eocheck.html">FAIL</a> +1 other=
 test fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-race-n=
omemset:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168780v2/shard-lnl-7/igt@xe_exec_system_allocator@proc=
ess-many-large-execqueues-malloc-race-nomemset.html">INCOMPLETE</a> +7 othe=
r tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-new-race-nomemset:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-4/igt@xe_exec_=
system_allocator@process-many-large-mmap-new-race-nomemset.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/sh=
ard-bmg-6/igt@xe_exec_system_allocator@process-many-large-mmap-new-race-nom=
emset.html">FAIL</a> +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-madvise:</=
p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-lnl-2/igt@xe_exec_=
system_allocator@threads-many-execqueues-mmap-new-madvise.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/sha=
rd-lnl-5/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-madv=
ise.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-free-nomemset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-1/igt@xe_exec_=
system_allocator@threads-many-stride-free-nomemset.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-=
2/igt@xe_exec_system_allocator@threads-many-stride-free-nomemset.html">SKIP=
</a> +124 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mal=
loc-prefetch-madvise:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-1/igt@xe_exec_=
system_allocator@threads-shared-vm-many-large-execqueues-malloc-prefetch-ma=
dvise.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-168780v2/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared=
-vm-many-large-execqueues-malloc-prefetch-madvise.html">TIMEOUT</a> +12 oth=
er tests timeout</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-madvis=
e:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168780v2/shard-lnl-7/igt@xe_exec_system_allocator@thre=
ads-shared-vm-many-stride-malloc-madvise.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@nonpreempt-engine-resets-normal-priority@numvfs-=
random-gt0-rcs0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-3/igt@xe_sriov=
_scheduling@nonpreempt-engine-resets-normal-priority@numvfs-random-gt0-rcs0=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-168780v2/shard-bmg-7/igt@xe_sriov_scheduling@nonpreempt-engine-resets=
-normal-priority@numvfs-random-gt0-rcs0.html">ABORT</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-9/igt@kms_big_=
fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/sh=
ard-bmg-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async=
-flip.html">TIMEOUT</a> +2 other tests timeout</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-lnl-3/igt@kms_big_=
fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">INCOMPLETE</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5643">Intel XE#56=
43</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-16=
8780v2/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hf=
lip.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-7/igt@kms_big_=
fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-1/igt@kms=
_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-7/igt@kms_big_=
fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">TIMEOUT</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-=
1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a=
> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-1/igt@kms_big_=
fb@yf-tiled-8bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-2/igt@kms_b=
ig_fb@yf-tiled-8bpp-rotate-0.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-4/igt@kms_bw@c=
onnected-linear-tiling-1-displays-target-2560x1440p.html">TIMEOUT</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-=
bmg-4/igt@kms_bw@connected-linear-tiling-1-displays-target-2560x1440p.html"=
>INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-9/igt@kms_bw@c=
onnected-linear-tiling-3-displays-target-1920x1080p.html">SKIP</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg=
-2/igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p.html">IN=
COMPLETE</a> +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-9/igt@kms_bw@l=
inear-tiling-2-displays-target-3840x2160p.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-b=
mg-5/igt@kms_bw@linear-tiling-2-displays-target-3840x2160p.html">INCOMPLETE=
</a> +3 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-target-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-7/igt@kms_bw@l=
inear-tiling-3-displays-target-2160x1440p.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-b=
mg-1/igt@kms_bw@linear-tiling-3-displays-target-2160x1440p.html">SKIP</a> +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-1/igt@kms_ccs@=
bad-aux-stride-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-2/igt@kms=
_ccs@bad-aux-stride-yf-tiled-ccs.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-1/igt@kms_cham=
elium_color_pipeline@plane-lut1d-post-ctm3x4.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/sh=
ard-bmg-2/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html">SK=
IP</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-1/igt@kms_cham=
elium_hpd@dp-hpd-with-enabled-mode.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-2/=
igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-1/igt@kms_cont=
ent_protection@uevent.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/6707">Intel XE#6707</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7439">Intel XE#7439</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-2=
/igt@kms_content_protection@uevent.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-1/igt@kms_curs=
or_crc@cursor-random-512x170.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shar=
d-bmg-2/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varyin=
g-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-6/igt@kms_curs=
or_legacy@short-flip-before-cursor-atomic-transitions-varying-size.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/8151">Intel XE#8151</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-168780v2/shard-bmg-7/igt@kms_cursor_legacy@short-flip-befo=
re-cursor-atomic-transitions-varying-size.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-1/igt@kms_fbc_=
dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442">Intel =
XE#7442</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-168780v2/shard-bmg-2/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-=
tests.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling=
:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-1/igt@kms_flip=
_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Inte=
l XE#7178</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/7351">Intel XE#7351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-168780v2/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-=
ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@drrshdr-argb161616f-draw-blt.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/s=
hard-bmg-1/igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-blt.html">=
SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-modesetfrombusy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@drrshdr-modesetfrombusy.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-=
bmg-2/igt@kms_frontbuffer_tracking@drrshdr-modesetfrombusy.html">SKIP</a> +=
11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1687=
80v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-dra=
w-blt.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#=
2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
168780v2/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb=
-draw-mmap-wc.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@psr-abgr161616f-draw-render.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel =
XE#7356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-168780v2/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-r=
ender.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-8/igt@kms_plan=
e@pixel-format-x-tiled-modifier-source-clamping.html">CRASH</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-10=
/igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping.html">TIMEOUT<=
/a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-1/igt@kms_plan=
e@pixel-format-yf-tiled-modifier-source-clamping.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v=
2/shard-bmg-2/igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping.=
html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-8/igt@kms_plan=
e_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel =
XE#2763</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/6886">Intel XE#6886</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-168780v2/shard-bmg-3/igt@kms_plane_scaling@planes-upscale-=
20x20-downscale-factor-0-5@pipe-b.html">CRASH</a> +1 other test crash</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-c:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-8/igt@kms_plan=
e_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-c.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel =
XE#2763</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/6886">Intel XE#6886</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-168780v2/shard-bmg-3/igt@kms_plane_scaling@planes-upscale-=
20x20-downscale-factor-0-5@pipe-c.html">INCOMPLETE</a> +1 other test incomp=
lete</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-6/igt@kms_plan=
e_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">INCOMPLETE=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-16878=
0v2/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-=
factor-0-75.html">TIMEOUT</a> +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-lnl-7/igt@kms_psr2=
_sf@fbc-psr2-overlay-plane-update-continuous-sf.html">TIMEOUT</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-lnl-=
7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html">INCOMPL=
ETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-1/igt@kms_psr2=
_sf@pr-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-b=
mg-2/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html">SKIP</a> +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-1/igt@kms_psr@=
fbc-psr2-primary-render.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg=
-2/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-plane:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-1/igt@kms_shar=
pness_filter@invalid-filter-with-plane.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bm=
g-2/igt@kms_sharpness_filter@invalid-filter-with-plane.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@breakpoint-many-sessions-single-tile:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-1/igt@xe_eudeb=
ug_online@breakpoint-many-sessions-single-tile.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/=
shard-bmg-2/igt@xe_eudebug_online@breakpoint-many-sessions-single-tile.html=
">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-multi-queue-cm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-7/igt@xe_evict=
@evict-small-external-multi-queue-cm.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/8370">Intel XE#8370</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-=
1/igt@xe_evict@evict-small-external-multi-queue-cm.html">SKIP</a> +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-3/igt@xe_exec_=
basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel=
 XE#2322</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/7372">Intel XE#7372</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-168780v2/shard-bmg-9/igt@xe_exec_basic@multigpu-many-exec=
queues-many-vm-bindexecqueue-rebind.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-4/igt@xe_exec_=
basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-rac=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2322">Intel XE#2322</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/7372">Intel XE#7372</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-6/igt@xe_exec_basic@m=
ultigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html"=
>TIMEOUT</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-7/igt@xe_exec_=
basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#=
2322</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7=
372">Intel XE#7372</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-168780v2/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-binde=
xecqueue-userptr-invalidate.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-pr=
efetch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-3/igt@xe_exec_=
fault_mode@many-execqueues-multi-queue-userptr-invalidate-prefetch.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374=
">Intel XE#8374</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-168780v2/shard-bmg-9/igt@xe_exec_fault_mode@many-execqueues-mult=
i-queue-userptr-invalidate-prefetch.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-prefetch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-1/igt@xe_exec_=
fault_mode@many-multi-queue-prefetch.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-=
2/igt@xe_exec_fault_mode@many-multi-queue-prefetch.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-1/igt@xe_exec_=
multi_queue@many-execs-preempt-mode-fault-basic.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2=
/shard-bmg-2/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-basic.ht=
ml">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-close-execqueues:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-1/igt@xe_exec_=
reset@multi-queue-close-execqueues.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-2/=
igt@xe_exec_reset@multi-queue-close-execqueues.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-prefetch=
:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-7/igt@xe_exec_=
system_allocator@process-many-large-execqueues-mmap-prefetch.html">FAIL</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/=
shard-bmg-1/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap=
-prefetch.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalida=
te-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-10/igt@xe_exec=
_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate-race.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/8366">Intel XE#8366</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-168780v2/shard-bmg-4/igt@xe_exec_threads@threads-multi-q=
ueue-mixed-shared-vm-userptr-invalidate-race.html">CRASH</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-1/igt@xe_exec_=
threads@threads-multi-queue-rebind.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-2/=
igt@xe_exec_threads@threads-multi-queue-rebind.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_add_hw_engine_clas=
s_defaults:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-7/igt@xe_fault=
_injection@inject-fault-probe-function-xe_add_hw_engine_class_defaults.html=
">CRASH</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-168780v2/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-x=
e_add_hw_engine_class_defaults.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@nonpreempt-engine-resets-normal-priority:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-3/igt@xe_sriov=
_scheduling@nonpreempt-engine-resets-normal-priority.html">TIMEOUT</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard=
-bmg-7/igt@xe_sriov_scheduling@nonpreempt-engine-resets-normal-priority.htm=
l">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@mmap-style-bind-either-side-partial-split-page-hammer:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-lnl-6/igt@xe_vm@mm=
ap-style-bind-either-side-partial-split-page-hammer.html">INCOMPLETE</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/sha=
rd-lnl-5/igt@xe_vm@mmap-style-bind-either-side-partial-split-page-hammer.ht=
ml">TIMEOUT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-168780v2_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168780v2/shard-lnl-7/igt@kms_big_fb@4-tiled-8bpp-rotat=
e-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1407">Intel XE#1407</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-3/igt@kms_big_=
fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shar=
d-bmg-9/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-fli=
p.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/5643">Intel XE#5643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168780v2/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-str=
ide-64bpp-rotate-180-async-flip.html">INCOMPLETE</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/5643">Intel XE#5643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168780v2/shard-bmg-1/igt@kms_big_fb@linear-16bpp-rotat=
e-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168780v2/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-str=
ide-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168780v2/shard-lnl-7/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168780v2/shard-lnl-4/igt@kms_ccs@bad-aux-stride-4-tile=
d-mtl-mc-ccs.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168780v2/shard-bmg-4/igt@kms_ccs@crc-primary-basic-4-t=
iled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168780v2/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-y=
-tiled-gen12-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168780v2/shard-bmg-6/igt@kms_chamelium_audio@dp-audio.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168780v2/shard-bmg-4/igt@kms_chamelium_color_pipeline@=
plane-lut1d-ctm3x4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168780v2/shard-bmg-4/igt@kms_content_protection@conten=
t-type-change.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy-hdcp14@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168780v2/shard-bmg-2/igt@kms_content_protection@legacy=
-hdcp14@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168780v2/shard-lnl-7/igt@kms_content_protection@lic-ty=
pe-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-128x42:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168780v2/shard-lnl-7/igt@kms_cursor_crc@cursor-rapid-m=
ovement-128x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-9/igt@kms_curs=
or_legacy@cursor-vs-flip-atomic-transitions-varying-size.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shar=
d-bmg-5/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-siz=
e.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/8151">Intel XE#8151</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168780v2/shard-lnl-7/igt@kms_dp_link_training@uhbr-mst=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4354">Intel XE#4354</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7386">Intel XE#7386</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168780v2/shard-bmg-6/igt@kms_dp_link_training@uhbr-sst=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4354">Intel XE#4354</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/5870">Intel XE#5870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats-ultrajoiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168780v2/shard-lnl-7/igt@kms_dsc@dsc-with-bpc-formats-=
ultrajoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168780v2/shard-lnl-7/igt@kms_flip@2x-dpms-vs-vblank-ra=
ce.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset@ab-dp2-hdmi-a3=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168780v2/shard-bmg-1/igt@kms_flip@2x-single-buffer-fli=
p-vs-dpms-off-vs-modeset@ab-dp2-hdmi-a3.html">INCOMPLETE</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/8155">Intel XE#8155</a>) =
+1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168780v2/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bp=
p-linear-to-32bpp-linear-reflect-x.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7179">Intel XE#7179</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168780v2/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bp=
p-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-mmap-wc:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168780v2/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs=
-1p-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168780v2/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs=
-argb161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168780v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs=
hdr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +17 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168780v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-=
2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +3 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168780v2/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-=
2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>)=
 +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168780v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbch=
dr-argb161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +2 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168780v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbch=
dr-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168780v2/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcp=
sr-abgr161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-rte:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168780v2/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcp=
srhdr-1p-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/7865">Intel XE#7865</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168780v2/shard-lnl-7/igt@kms_frontbuffer_tracking@hdr-=
2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168780v2/shard-bmg-6/igt@kms_frontbuffer_tracking@psrh=
dr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +14 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-6/igt@kms_hdr@=
invalid-hdr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-168780v2/shard-bmg-10/igt@kms_hdr@invalid-hdr.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">In=
tel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168780v2/shard-bmg-1/igt@kms_pipe_stress@stress-xrgb88=
88-ytiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4329">Intel XE#4329</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/6912">Intel XE#6912</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7375">Intel XE#7375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168780v2/shard-bmg-1/igt@kms_plane@pixel-format-4-tile=
d-modifier-source-clamping.html">INCOMPLETE</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168780v2/shard-bmg-4/igt@kms_plane@pixel-format-4-tile=
d-mtl-rc-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168780v2/shard-bmg-2/igt@kms_plane@pixel-format-x-tile=
d-modifier@pipe-b-plane-5.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/8303">Intel XE#8303</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168780v2/shard-bmg-6/igt@kms_plane_lowres@tiling-y.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pi=
pe-b:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168780v2/shard-bmg-6/igt@kms_plane_scaling@planes-upsc=
ale-factor-0-25-downscale-factor-0-5@pipe-b.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel X=
E#6886</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168780v2/shard-bmg-6/igt@kms_psr2_sf@psr2-primary-plan=
e-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168780v2/shard-bmg-4/igt@kms_psr2_su@page_flip-xrgb888=
8.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2387">Intel XE#2387</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/7429">Intel XE#7429</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168780v2/shard-bmg-4/igt@kms_psr@pr-sprite-render.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168780v2/shard-lnl-7/igt@kms_psr_stress_test@invalidat=
e-primary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/8361">Intel XE#8361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168780v2/shard-lnl-7/igt@kms_rotation_crc@primary-yf-t=
iled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168780v2/shard-bmg-1/igt@xe_eudebug_online@writes-cach=
ing-vram-bb-vram-target-vram.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) +2 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-virtual-userptr-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168780v2/shard-lnl-7/igt@xe_exec_balancer@many-virtual=
-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/7482">Intel XE#7482</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168780v2/shard-lnl-7/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168780v2/shard-bmg-4/igt@xe_exec_basic@multigpu-once-b=
indexecqueue-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-im=
m:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168780v2/shard-bmg-4/igt@xe_exec_fault_mode@many-execq=
ueues-multi-queue-userptr-invalidate-imm.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +4 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168780v2/shard-lnl-7/igt@xe_exec_fault_mode@once-multi=
-queue-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-preempt-mode-priority-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168780v2/shard-bmg-6/igt@xe_exec_multi_queue@many-queu=
es-preempt-mode-priority-smem.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +9 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-dyn-priority-smem:=
</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168780v2/shard-lnl-7/igt@xe_exec_multi_queue@two-queue=
s-preempt-mode-fault-dyn-priority-smem.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +1 othe=
r test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-multi-queue-close-fd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168780v2/shard-lnl-7/igt@xe_exec_reset@cm-multi-queue-=
close-fd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/8369">Intel XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-multi-queue-gt-reset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168780v2/shard-bmg-1/igt@xe_exec_reset@cm-multi-queue-=
gt-reset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/8369">Intel XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-bu=
sy-nomemset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-6/igt@xe_exec_=
system_allocator@threads-shared-vm-many-execqueues-malloc-busy-nomemset.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-168780v2/shard-bmg-10/igt@xe_exec_system_allocator@threads-shared-vm-many=
-execqueues-malloc-busy-nomemset.html">INCOMPLETE</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7928">Intel XE#7928</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159">Intel XE#815=
9</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mma=
p-remap-ro:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-3/igt@xe_exec_=
system_allocator@threads-shared-vm-many-large-execqueues-mmap-remap-ro.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-168780v2/shard-bmg-9/igt@xe_exec_system_allocator@threads-shared-vm-many-l=
arge-execqueues-mmap-remap-ro.html">INCOMPLETE</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/8159">Intel XE#8159</a>) +28 other =
tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168780v2/shard-bmg-6/igt@xe_exec_threads@threads-multi=
-queue-cm-fd-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +2 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-prefetch:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168780v2/shard-lnl-7/igt@xe_pm@s3-vm-bind-prefetch.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/584">Intel XE#584</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/7369">Intel XE#7369</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-rpm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168780v2/shard-bmg-1/igt@xe_pxp@pxp-stale-bo-bind-post=
-rpm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4733">Intel XE#4733</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7417">Intel XE#7417</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168780v2/shard-lnl-7/igt@xe_query@multigpu-query-inval=
id-uc-fw-version-mbz.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168780v2/shard-bmg-1/igt@xe_query@multigpu-query-mem-u=
sage.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_survivability@runtime-survivability:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-8/igt@xe_survi=
vability@runtime-survivability.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-10/igt@xe_survivabil=
ity@runtime-survivability.html">DMESG-WARN</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/6627">Intel XE#6627</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7419">Intel XE#7419</a>)<=
/li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-2/igt@fbdev@wr=
ite.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2134">Intel XE#2134</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-168780v2/shard-bmg-3/igt@fbdev@write.html">PASS</a><=
/li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-5/igt@kms_big_=
fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5643">Intel XE#5643=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1687=
80v2/shard-bmg-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.=
html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-5/igt@kms_flip=
@flip-vs-dpms-off-vs-modeset-interruptible.html">CRASH</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-1/igt@k=
ms_flip@flip-vs-dpms-off-vs-modeset-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-10/igt@kms_fro=
ntbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-mmap-wc.html">TIMEOUT</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v=
2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-dra=
w-mmap-wc.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-shrfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbchdr-2p-scndscrn-pri-shrfb-draw-render.html">INCOMPLETE<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8368">I=
ntel XE#8368</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-168780v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscr=
n-pri-shrfb-draw-render.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-6/igt@kms_plan=
e_scaling@plane-downscale-factor-0-75-with-rotation.html">INCOMPLETE</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/sha=
rd-bmg-7/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation.ht=
ml">PASS</a> +12 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-9/igt@xe_exec_=
balancer@many-execqueues-cm-virtual-userptr-rebind.html">SKIP</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-=
2/igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-rebind.html">PASS=
</a> +170 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-race:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-4/igt@xe_exec_=
system_allocator@process-many-large-execqueues-malloc-race.html">FAIL</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/sh=
ard-bmg-6/igt@xe_exec_system_allocator@process-many-large-execqueues-malloc=
-race.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-free-rac=
e-nomemset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-9/igt@xe_exec_=
system_allocator@threads-many-large-execqueues-mmap-free-race-nomemset.html=
">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/7928">Intel XE#7928</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/8159">Intel XE#8159</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-5/igt@xe_exec_system_=
allocator@threads-many-large-execqueues-mmap-free-race-nomemset.html">PASS<=
/a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mal=
loc-prefetch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-10/igt@xe_exec=
_system_allocator@threads-shared-vm-many-large-execqueues-malloc-prefetch.h=
tml">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/8159">Intel XE#8159</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-168780v2/shard-bmg-4/igt@xe_exec_system_allocator@t=
hreads-shared-vm-many-large-execqueues-malloc-prefetch.html">PASS</a> +31 o=
ther tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-free-madvise:</=
p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-lnl-6/igt@xe_exec_=
system_allocator@threads-shared-vm-many-mmap-free-madvise.html">TIMEOUT</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/=
shard-lnl-1/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-free-m=
advise.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-9/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-7/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-1/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-5=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-b=
mg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/sha=
rd-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c=
7/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d93=
6083c7/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e=
2d936083c7/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4=
ab2e2d936083c7/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489e=
a6de4ab2e2d936083c7/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf=
489ea6de4ab2e2d936083c7/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b87874=
34bf489ea6de4ab2e2d936083c7/shard-bmg-1/igt@xe_module_load@load.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8=
787434bf489ea6de4ab2e2d936083c7/shard-bmg-7/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e0=
38b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-8/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5298-c=
04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-1/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-52=
98-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-1/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-10/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-3/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-6/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-6/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-=
9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-=
bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/sh=
ard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c=
7/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936=
083c7/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405">Intel XE=
#7405</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-168780v2/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-5/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-168780v2/shard-bmg-5/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shar=
d-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-4/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-168780v2/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-8/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-168780v2/shard-bmg-5/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shar=
d-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-3/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-168780v2/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-3/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-168780v2/shard-bmg-1/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shar=
d-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-7/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-168780v2/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-9/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-168780v2/shard-bmg-9/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shar=
d-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-7/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-168780v2/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-10/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-168780v2/shard-bmg-10/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/sh=
ard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-8/igt@xe_module_load@l=
oad.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-lnl-7/igt@xe_wedge=
d@wedged-mode-toggle.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-lnl-4/igt@xe_wedged=
@wedged-mode-toggle.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-1/igt@kms_atom=
ic_transition@plane-all-modeset-transition-internal-panels.html">INCOMPLETE=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8174">=
Intel XE#8174</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-168780v2/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-t=
ransition-internal-panels.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-2/igt@kms_big_=
fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-3/i=
gt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">INCOMPLETE=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5643">=
Intel XE#5643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-2/igt@kms_big_=
fb@y-tiled-32bpp-rotate-270.html">SKIP</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-3/igt@kms_big_fb@y-tile=
d-32bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-lnl-3/igt@kms_big_=
fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#112=
4</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168=
780v2/shard-lnl-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-asy=
nc-flip.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/5643">Intel XE#5643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</=
p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-lnl-5/igt@kms_big_=
fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">INCOMPLETE<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5643">I=
ntel XE#5643</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-168780v2/shard-lnl-3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-ro=
tate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:=
</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-lnl-4/igt@kms_big_=
fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">TIMEOUT</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v=
2/shard-lnl-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-=
async-flip.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/5643">Intel XE#5643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-6/igt@kms_big_=
fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">INCOMPLETE<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5643">I=
ntel XE#5643</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-168780v2/shard-bmg-10/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-r=
otate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-5/igt@kms_bw@c=
onnected-linear-tiling-4-displays-target-1920x1080p.html">CRASH</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bm=
g-1/igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/767=
9">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-1/igt@kms_bw@l=
inear-tiling-1-displays-target-2560x1440p.html">INCOMPLETE</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-4/i=
gt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-2/igt@kms_ccs@=
bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-3/igt@kms_ccs@b=
ad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +5 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-9/igt@kms_ccs@=
crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-2/igt@k=
ms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-2/igt@kms_cham=
elium_hpd@hdmi-hpd-storm-disable.html">SKIP</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-3/igt@kms_chameliu=
m_hpd@hdmi-hpd-storm-disable.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +2 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-9/igt@kms_cont=
ent_protection@dp-mst-lic-type-0-hdcp14.html">SKIP</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-2/igt@kms_c=
ontent_protection@dp-mst-lic-type-0-hdcp14.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy-hdcp14:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-9/igt@kms_cont=
ent_protection@legacy-hdcp14.html">SKIP</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-2/igt@kms_content_prot=
ection@legacy-hdcp14.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-2/igt@kms_cont=
ent_protection@type1.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-3/igt@kms_content_protection@t=
ype1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-9/igt@kms_curs=
or_crc@cursor-random-256x85.html">SKIP</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-2/igt@kms_cursor_crc@cu=
rsor-random-256x85.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-2/igt@kms_curs=
or_crc@cursor-random-512x512.html">SKIP</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-3/igt@kms_cursor_crc@c=
ursor-random-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-2/igt@kms_dsc@=
dsc-fractional-bpp-with-bpc.html">SKIP</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-3/igt@kms_dsc@dsc-fract=
ional-bpp-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-9/igt@kms_flip=
_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2=
/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rccc=
s-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7178">Intel XE#7178</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7349">Intel XE#7349</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-2/igt@kms_flip=
_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html">SKIP</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-b=
mg-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7178">Intel XE#7178</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7351">Intel XE#7351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@drrshdr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard=
-bmg-3/igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-spr-indfb-draw-blt.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2311">Intel XE#2311</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-3=
/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">In=
tel XE#4141</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbc-argb161616f-draw-render.html">SKIP</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-3/ig=
t@kms_frontbuffer_tracking@fbc-argb161616f-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7=
061</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/73=
56">Intel XE#7356</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-3/igt@kms_frontbu=
ffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-rende=
r:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-render.html">INCOMPL=
ETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/836=
8">Intel XE#8368</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-168780v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p=
-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-draw-rende=
r:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-10/igt@kms_fro=
ntbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-draw-render.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">In=
tel XE#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-168780v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scnd=
scrn-cur-indfb-draw-render.html">INCOMPLETE</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/8368">Intel XE#8368</a>) +1 other test=
 incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbcdrrshdr-argb161616f-draw-blt.html">SKIP</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-3/=
igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-blt.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Inte=
l XE#7061</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-render.html">TIMEOUT</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/=
shard-bmg-3/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-=
render.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/8368">Intel XE#8368</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-cur-indfb-draw-blt:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbcpsrhdr-2p-scndscrn-cur-indfb-draw-blt.html">INCOMPLETE<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8368">I=
ntel XE#8368</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-168780v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scnd=
scrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-9/igt@kms_fron=
tbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/sha=
rd-bmg-2/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-ren=
der.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2313">Intel XE#2313</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clampin=
g:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-10/igt@kms_pla=
ne@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">In=
tel XE#7283</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-168780v2/shard-bmg-8/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-c=
c-modifier-source-clamping.html">INCOMPLETE</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a>) +1 other test=
 incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-5/igt@kms_plan=
e@pixel-format-yf-tiled-ccs-modifier-source-clamping.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel =
XE#1035</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-168780v2/shard-bmg-8/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-so=
urce-clamping.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7283">Intel XE#7283</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-2/igt@kms_plan=
e_multiple@tiling-yf.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-3/igt@kms_plane_multiple@tilin=
g-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/5020">Intel XE#5020</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7348">Intel XE#7348</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-4/igt@kms_plan=
e_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html">CRASH</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/sh=
ard-bmg-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor=
-0-5.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2763">Intel XE#2763</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/6886">Intel XE#6886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pi=
pe-a:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-4/igt@kms_plan=
e_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a.html">INCO=
MPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-168780v2/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-down=
scale-factor-0-5@pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-pageflip-negative:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-2/igt@kms_pm_d=
c@dc5-pageflip-negative.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-3/igt@kms_pm_dc@dc5-pagefli=
p-negative.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6927">Intel XE#6927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-9/igt@kms_psr2=
_sf@pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-2/igt@kms_p=
sr2_sf@pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-9/igt@kms_psr2=
_su@page_flip-nv12.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-168780v2/shard-bmg-2/igt@kms_psr2_su@page_flip-nv12=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2387">Intel XE#2387</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7429">Intel XE#7429</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-9/igt@kms_psr@=
psr-basic.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-168780v2/shard-bmg-2/igt@kms_psr@psr-basic.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel X=
E#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-tap:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-9/igt@kms_shar=
pness_filter@filter-tap.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-2/igt@kms_sharpness_filter@=
filter-tap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-5/igt@kms_tile=
d_display@basic-test-pattern.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shar=
d-bmg-8/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">In=
tel XE#5848</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@stopped-thread:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-9/igt@xe_eudeb=
ug_online@stopped-thread.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-2/igt@xe_eudebug_online@st=
opped-thread.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/7636">Intel XE#7636</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-5/igt@xe_exec_=
basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html">INCOMPLETE</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/=
shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-m=
map.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2322">Intel XE#2322</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-9/igt@xe_exec_=
basic@multigpu-many-execqueues-many-vm-rebind.html">SKIP</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-2/ig=
t@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#=
2322</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7=
372">Intel XE#7372</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-rebind-prefet=
ch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-9/igt@xe_exec_=
fault_mode@many-execqueues-multi-queue-userptr-rebind-prefetch.html">INCOMP=
LETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
68780v2/shard-bmg-3/igt@xe_exec_fault_mode@many-execqueues-multi-queue-user=
ptr-rebind-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/8374">Intel XE#8374</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-rebind-prefetch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-2/igt@xe_exec_=
fault_mode@many-multi-queue-rebind-prefetch.html">SKIP</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-3/igt@x=
e_exec_fault_mode@many-multi-queue-rebind-prefetch.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-priority-smem:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-2/igt@xe_exec_=
multi_queue@one-queue-priority-smem.html">SKIP</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-3/igt@xe_exec_m=
ulti_queue@one-queue-priority-smem.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +6 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-shared-r=
emap-dontunmap-eocheck:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-6/igt@xe_exec_=
system_allocator@process-many-large-execqueues-mmap-shared-remap-dontunmap-=
eocheck.html">FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-168780v2/shard-bmg-10/igt@xe_exec_system_allocator@process-man=
y-large-execqueues-mmap-shared-remap-dontunmap-eocheck.html">INCOMPLETE</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159">Inte=
l XE#8159</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mma=
p-new-huge-nomemset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-9/igt@xe_exec_=
system_allocator@threads-shared-vm-many-large-execqueues-mmap-new-huge-nome=
mset.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-168780v2/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-=
vm-many-large-execqueues-mmap-new-huge-nomemset.html">INCOMPLETE</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159">Intel XE#81=
59</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-9/igt@xe_exec_=
threads@threads-multi-queue-cm-fd-userptr.html">SKIP</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-2/igt@xe_=
exec_threads@threads-multi-queue-cm-fd-userptr.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>)=
 +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr-invalidate:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-6/igt@xe_exec_=
threads@threads-multi-queue-cm-shared-vm-userptr-invalidate.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel=
 XE#8378</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-168780v2/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-cm-shared=
-vm-userptr-invalidate.html">INCOMPLETE</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/8366">Intel XE#8366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr-invalidate-rac=
e:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-10/igt@xe_exec=
_threads@threads-multi-queue-shared-vm-userptr-invalidate-race.html">INCOMP=
LETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/83=
66">Intel XE#8366</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-168780v2/shard-bmg-8/igt@xe_exec_threads@threads-multi-queue-s=
hared-vm-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-2/igt@xe_pm@d3=
cold-multiple-execs.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-3/igt@xe_pm@d3cold-multiple-exe=
cs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-black-pxp-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7/shard-bmg-2/igt@xe_pxp@d=
isplay-black-pxp-fb.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-168780v2/shard-bmg-3/igt@xe_pxp@display-black-pxp-=
fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4733">Intel XE#4733</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7417">Intel XE#7417</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7 -&gt; xe-pw-168=
780v2</li>
</ul>
<p>IGT_8985: d5fe8732b8547454c38fdd220b55f6f0cc841a3b @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-5298-c04e038b8787434bf489ea6de4ab2e2d936083c7: c04e038b8787434bf489ea6=
de4ab2e2d936083c7<br />
  xe-pw-168780v2: 168780v2</p>

</body>
</html>

--===============2024596813944648944==--
