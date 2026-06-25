Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C575BCDB466
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jun 2026 04:58:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FD1E10E173;
	Thu, 25 Jun 2026 04:58:34 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECC1410E173;
 Thu, 25 Jun 2026 04:58:32 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7267680445607966420=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/xe=3A_balance_exec_que?=
 =?utf-8?q?ue_suspend/resume?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Niranjana Vishwanathapura" <niranjana.vishwanathapura@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 25 Jun 2026 04:58:32 -0000
Message-ID: <178236351295.115009.17874045480815816565@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260625025348.1620469-7-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20260625025348.1620469-7-niranjana.vishwanathapura@intel.com>
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

--===============7267680445607966420==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: balance exec queue suspend/resume
URL   : https://patchwork.freedesktop.org/series/169125/
State : failure

== Summary ==

CI Bug Log - changes from xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973_FULL -> xe-pw-169125v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-169125v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-169125v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-169125v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          [PASS][1] -> [TIMEOUT][2] +7 other tests timeout
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-1-displays-target-1920x1080p:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][3] +2 other tests incomplete
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-2/igt@kms_bw@connected-linear-tiling-1-displays-target-1920x1080p.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-bmg:          NOTRUN -> [TIMEOUT][4] +12 other tests timeout
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][5] +166 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping:
    - shard-bmg:          NOTRUN -> [CRASH][6]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-2/igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-a-plane-3:
    - shard-bmg:          NOTRUN -> [WARN][7]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-2/igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-a-plane-3.html

  * igt@xe_exec_basic@many-bindexecqueue-rebind:
    - shard-bmg:          [PASS][8] -> [SKIP][9] +86 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-4/igt@xe_exec_basic@many-bindexecqueue-rebind.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-5/igt@xe_exec_basic@many-bindexecqueue-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm:
    - shard-bmg:          [PASS][10] -> [INCOMPLETE][11] +5 other tests incomplete
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-7/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-9/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm.html

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-remap-dontunmap:
    - shard-bmg:          NOTRUN -> [FAIL][12]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-2/igt@xe_exec_system_allocator@process-many-execqueues-mmap-remap-dontunmap.html

  * igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-prefetch:
    - shard-bmg:          [PASS][13] -> [FAIL][14] +3 other tests fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-10/igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-prefetch.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-1/igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-prefetch.html

  * igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-race-nomemset:
    - shard-lnl:          NOTRUN -> [INCOMPLETE][15] +10 other tests incomplete
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-2/igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-race-nomemset.html

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-madvise:
    - shard-lnl:          [PASS][16] -> [TIMEOUT][17] +1 other test timeout
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-lnl-3/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-madvise.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-6/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-madvise.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-madvise:
    - shard-lnl:          NOTRUN -> [TIMEOUT][18]
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-2/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-madvise.html

  * igt@xe_pmu@engine-activity-accuracy-90:
    - shard-lnl:          [PASS][19] -> [FAIL][20] +3 other tests fail
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-lnl-3/igt@xe_pmu@engine-activity-accuracy-90.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-1/igt@xe_pmu@engine-activity-accuracy-90.html

  
#### Warnings ####

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-bmg:          [INCOMPLETE][21] ([Intel XE#8174]) -> [SKIP][22]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-3/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-7/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-bmg:          [SKIP][23] ([Intel XE#2327]) -> [SKIP][24] +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-4/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-5/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-bmg:          [TIMEOUT][25] -> [SKIP][26] +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
    - shard-lnl:          [INCOMPLETE][27] ([Intel XE#5643]) -> [TIMEOUT][28] +1 other test timeout
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-bmg:          [SKIP][29] ([Intel XE#1124]) -> [SKIP][30]
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_bw@linear-tiling-2-displays-target-3840x2160p:
    - shard-bmg:          [TIMEOUT][31] -> [INCOMPLETE][32]
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-2/igt@kms_bw@linear-tiling-2-displays-target-3840x2160p.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-3/igt@kms_bw@linear-tiling-2-displays-target-3840x2160p.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:
    - shard-bmg:          [SKIP][33] ([Intel XE#2887]) -> [SKIP][34] +2 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-4/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d:
    - shard-bmg:          [SKIP][35] ([Intel XE#7358]) -> [SKIP][36]
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-3/igt@kms_chamelium_color_pipeline@plane-lut1d.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-7/igt@kms_chamelium_color_pipeline@plane-lut1d.html

  * igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:
    - shard-bmg:          [SKIP][37] ([Intel XE#2252]) -> [SKIP][38]
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-3/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-7/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html

  * igt@kms_content_protection@suspend-resume:
    - shard-bmg:          [FAIL][39] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) -> [SKIP][40]
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-4/igt@kms_content_protection@suspend-resume.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-5/igt@kms_content_protection@suspend-resume.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-bmg:          [SKIP][41] ([Intel XE#2321] / [Intel XE#7355]) -> [SKIP][42]
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-4/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-32x32:
    - shard-bmg:          [SKIP][43] ([Intel XE#2320]) -> [SKIP][44]
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-32x32.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-32x32.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:
    - shard-bmg:          [TIMEOUT][45] ([Intel XE#7935]) -> [TIMEOUT][46]
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-2/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-3/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-bmg:          [SKIP][47] ([Intel XE#4354] / [Intel XE#5882]) -> [SKIP][48]
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-4/igt@kms_dp_link_training@non-uhbr-mst.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-5/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-bmg:          [SKIP][49] ([Intel XE#7178] / [Intel XE#7349]) -> [INCOMPLETE][50]
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-bmg:          [SKIP][51] ([Intel XE#7178] / [Intel XE#7351]) -> [INCOMPLETE][52]
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - shard-bmg:          [INCOMPLETE][53] -> [SKIP][54]
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][55] ([Intel XE#4141]) -> [SKIP][56] +2 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][57] ([Intel XE#2311]) -> [SKIP][58] +9 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-shrfb-draw-render:
    - shard-bmg:          [INCOMPLETE][59] ([Intel XE#8368]) -> [TIMEOUT][60] +1 other test timeout
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-2/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-shrfb-draw-render.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][61] ([Intel XE#2313]) -> [SKIP][62] +8 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc:
    - shard-bmg:          [SKIP][63] ([Intel XE#7061] / [Intel XE#7356]) -> [SKIP][64] +2 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-bmg:          [SKIP][65] ([Intel XE#2486]) -> [SKIP][66]
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-3/igt@kms_panel_fitting@atomic-fastset.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-7/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane@pixel-format-linear-modifier-source-clamping:
    - shard-bmg:          [INCOMPLETE][67] ([Intel XE#1035]) -> [TIMEOUT][68]
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-7/igt@kms_plane@pixel-format-linear-modifier-source-clamping.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-9/igt@kms_plane@pixel-format-linear-modifier-source-clamping.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75:
    - shard-bmg:          [SKIP][69] ([Intel XE#2763] / [Intel XE#6886]) -> [SKIP][70]
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-3/igt@kms_plane_scaling@planes-downscale-factor-0-75.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-7/igt@kms_plane_scaling@planes-downscale-factor-0-75.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-bmg:          [SKIP][71] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836]) -> [SKIP][72]
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-4/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
    - shard-lnl:          [TIMEOUT][73] -> [INCOMPLETE][74] +1 other test incomplete
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:
    - shard-bmg:          [SKIP][75] ([Intel XE#1489]) -> [SKIP][76]
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr@pr-cursor-plane-move:
    - shard-bmg:          [SKIP][77] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][78] +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-3/igt@kms_psr@pr-cursor-plane-move.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-7/igt@kms_psr@pr-cursor-plane-move.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][79] ([Intel XE#1729] / [Intel XE#7424]) -> [SKIP][80]
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html

  * igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram:
    - shard-bmg:          [SKIP][81] ([Intel XE#7636]) -> [SKIP][82] +1 other test skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-4/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-5/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:
    - shard-bmg:          [SKIP][83] ([Intel XE#2322] / [Intel XE#7372]) -> [INCOMPLETE][84]
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind:
    - shard-bmg:          [SKIP][85] ([Intel XE#2322] / [Intel XE#7372]) -> [CRASH][86]
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-prefetch:
    - shard-bmg:          [SKIP][87] ([Intel XE#8374]) -> [SKIP][88] +2 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-4/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-prefetch.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-5/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-prefetch.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate:
    - shard-bmg:          [SKIP][89] ([Intel XE#8364]) -> [SKIP][90] +8 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-3/igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-7/igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate.html

  * igt@xe_exec_system_allocator@process-many-execqueues-malloc-mlock-nomemset:
    - shard-bmg:          [CRASH][91] -> [FAIL][92]
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-1/igt@xe_exec_system_allocator@process-many-execqueues-malloc-mlock-nomemset.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-8/igt@xe_exec_system_allocator@process-many-execqueues-malloc-mlock-nomemset.html

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-huge-nomemset:
    - shard-bmg:          [INCOMPLETE][93] ([Intel XE#8159]) -> [FAIL][94]
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-4/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-huge-nomemset.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-4/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-huge-nomemset.html

  * igt@xe_exec_threads@threads-multi-queue-userptr-invalidate-race:
    - shard-bmg:          [SKIP][95] ([Intel XE#8378]) -> [SKIP][96]
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-4/igt@xe_exec_threads@threads-multi-queue-userptr-invalidate-race.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-userptr-invalidate-race.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_device_probe_early:
    - shard-bmg:          [CRASH][97] -> [INCOMPLETE][98]
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-xe_device_probe_early.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_device_probe_early.html

  * igt@xe_media_fill@media-fill:
    - shard-bmg:          [SKIP][99] ([Intel XE#2459] / [Intel XE#2596] / [Intel XE#7321] / [Intel XE#7453]) -> [SKIP][100]
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-4/igt@xe_media_fill@media-fill.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-5/igt@xe_media_fill@media-fill.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-bmg:          [SKIP][101] ([Intel XE#2284] / [Intel XE#7370]) -> [SKIP][102]
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-4/igt@xe_pm@d3cold-mmap-vram.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-5/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_query@multigpu-query-pxp-status:
    - shard-bmg:          [SKIP][103] ([Intel XE#944]) -> [SKIP][104]
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-3/igt@xe_query@multigpu-query-pxp-status.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-7/igt@xe_query@multigpu-query-pxp-status.html

  
Known issues
------------

  Here are the changes found in xe-pw-169125v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@pan:
    - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#2134])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-7/igt@fbdev@pan.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#2233])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][107] ([Intel XE#8174])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][108] ([Intel XE#1407]) +1 other test skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-2/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-lnl:          NOTRUN -> [INCOMPLETE][109] ([Intel XE#5643])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][110] ([Intel XE#2327]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-2/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#7059] / [Intel XE#7085])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-1/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][112] ([Intel XE#1124]) +8 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-5/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][113] ([Intel XE#1124]) +1 other test skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_bw@linear-tiling-3-displays-target-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#367]) +1 other test skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-1/igt@kms_bw@linear-tiling-3-displays-target-3840x2160p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs:
    - shard-lnl:          NOTRUN -> [ABORT][115] ([Intel XE#8007])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-8/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][116] ([Intel XE#8150])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][117] ([Intel XE#2652]) +17 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][118] ([Intel XE#2887]) +9 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [INCOMPLETE][119] ([Intel XE#8437])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-2/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-bmg:          NOTRUN -> [SKIP][120] ([Intel XE#2724] / [Intel XE#7449])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-2/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d:
    - shard-bmg:          NOTRUN -> [SKIP][121] ([Intel XE#7358])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-2/igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d:
    - shard-lnl:          NOTRUN -> [SKIP][122] ([Intel XE#7358])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-3/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][123] ([Intel XE#2252]) +5 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-2/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][124] ([Intel XE#3304] / [Intel XE#7374]) +1 other test fail
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-1/igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2.html

  * igt@kms_content_protection@lic-type-1:
    - shard-lnl:          NOTRUN -> [SKIP][125] ([Intel XE#7642])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-2/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@mei-interface:
    - shard-bmg:          NOTRUN -> [SKIP][126] ([Intel XE#7642])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-2/igt@kms_content_protection@mei-interface.html

  * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
    - shard-lnl:          NOTRUN -> [SKIP][127] ([Intel XE#1424])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-2/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-bmg:          NOTRUN -> [SKIP][128] ([Intel XE#2320]) +1 other test skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-2/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][129] ([Intel XE#2321] / [Intel XE#7355]) +1 other test skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][130] ([Intel XE#8151])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-2/igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][131] ([Intel XE#4210] / [Intel XE#7467])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-2/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][132] ([Intel XE#1508]) +1 other test skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-1/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-lnl:          NOTRUN -> [SKIP][133] ([Intel XE#4354] / [Intel XE#7386])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-2/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dsc@dsc-basic-bigjoiner:
    - shard-bmg:          NOTRUN -> [SKIP][134] ([Intel XE#8265]) +1 other test skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-2/igt@kms_dsc@dsc-basic-bigjoiner.html

  * igt@kms_dsc@dsc-with-bpc-formats-ultrajoiner:
    - shard-lnl:          NOTRUN -> [SKIP][135] ([Intel XE#8265])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-2/igt@kms_dsc@dsc-with-bpc-formats-ultrajoiner.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-lnl:          NOTRUN -> [SKIP][136] ([Intel XE#1421])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-2/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [PASS][137] -> [FAIL][138] ([Intel XE#301] / [Intel XE#3149])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][139] ([Intel XE#7178] / [Intel XE#7351])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x:
    - shard-bmg:          NOTRUN -> [SKIP][140] ([Intel XE#7179])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][141] ([Intel XE#6312]) +1 other test skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][142] ([Intel XE#7061]) +1 other test skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][143] ([Intel XE#4141]) +8 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][144] ([Intel XE#656] / [Intel XE#7905]) +7 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][145] ([Intel XE#8368])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][146] ([Intel XE#2311]) +37 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-indfb-plflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][147] ([Intel XE#7905]) +4 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-3/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [PASS][148] -> [INCOMPLETE][149] ([Intel XE#8368])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-4/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-draw-render.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbchdr-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][150] ([Intel XE#7399])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbchdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][151] ([Intel XE#2313]) +38 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][152] ([Intel XE#7061] / [Intel XE#7356])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][153] ([Intel XE#7061] / [Intel XE#7356]) +2 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-rte:
    - shard-lnl:          NOTRUN -> [SKIP][154] ([Intel XE#7865]) +4 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-rte.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][155] ([Intel XE#4298] / [Intel XE#5873])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-5/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier:
    - shard-bmg:          NOTRUN -> [SKIP][156] ([Intel XE#7283]) +2 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-2/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][157] ([Intel XE#1035])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-2/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][158] ([Intel XE#2393])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-9/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][159] ([Intel XE#5021] / [Intel XE#7377])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][160] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836]) +1 other test skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-2/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][161] ([Intel XE#1489]) +4 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-1/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-bmg:          NOTRUN -> [SKIP][162] ([Intel XE#2234] / [Intel XE#2850]) +8 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-5/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-lnl:          NOTRUN -> [SKIP][163] ([Intel XE#8361])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-bmg:          NOTRUN -> [SKIP][164] ([Intel XE#3904] / [Intel XE#7342])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-4/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-lnl:          NOTRUN -> [SKIP][165] ([Intel XE#1127] / [Intel XE#5813])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:
    - shard-bmg:          NOTRUN -> [SKIP][166] ([Intel XE#6503])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-5/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-bmg:          NOTRUN -> [SKIP][167] ([Intel XE#2450] / [Intel XE#5857])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-5/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vblank@query-forked-busy-hang:
    - shard-bmg:          [PASS][168] -> [INCOMPLETE][169] ([Intel XE#6819] / [Intel XE#8327]) +1 other test incomplete
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-1/igt@kms_vblank@query-forked-busy-hang.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-3/igt@kms_vblank@query-forked-busy-hang.html

  * igt@kms_vrr@max-min:
    - shard-bmg:          NOTRUN -> [SKIP][170] ([Intel XE#1499]) +1 other test skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-2/igt@kms_vrr@max-min.html

  * igt@xe_eudebug@basic-exec-queues:
    - shard-bmg:          NOTRUN -> [SKIP][171] ([Intel XE#7636]) +8 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-1/igt@xe_eudebug@basic-exec-queues.html

  * igt@xe_evict@evict-cm-threads-small:
    - shard-lnl:          NOTRUN -> [SKIP][172] ([Intel XE#6540] / [Intel XE#688])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-3/igt@xe_evict@evict-cm-threads-small.html

  * igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_copy-instance-0-tile-0-vram0-memory:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][173] ([Intel XE#8437]) +3 other tests incomplete
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-2/igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_copy-instance-0-tile-0-vram0-memory.html

  * igt@xe_exec_balancer@many-virtual-userptr-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][174] ([Intel XE#7482]) +2 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-2/igt@xe_exec_balancer@many-virtual-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:
    - shard-bmg:          NOTRUN -> [SKIP][175] ([Intel XE#2322] / [Intel XE#7372]) +3 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][176] ([Intel XE#1392])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html

  * igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][177] ([Intel XE#8374]) +9 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-1/igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind-prefetch.html

  * igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][178] ([Intel XE#8374])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-2/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate.html

  * igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-priority:
    - shard-lnl:          NOTRUN -> [SKIP][179] ([Intel XE#8364]) +2 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-3/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-priority.html

  * igt@xe_exec_multi_queue@two-queues-priority:
    - shard-bmg:          NOTRUN -> [SKIP][180] ([Intel XE#8364]) +19 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-2/igt@xe_exec_multi_queue@two-queues-priority.html

  * igt@xe_exec_reset@cm-multi-queue-close-fd:
    - shard-lnl:          NOTRUN -> [SKIP][181] ([Intel XE#8369])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-2/igt@xe_exec_reset@cm-multi-queue-close-fd.html

  * igt@xe_exec_reset@long-spin-reuse-many-preempt-threads:
    - shard-bmg:          [PASS][182] -> [FAIL][183] ([Intel XE#7850])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-1/igt@xe_exec_reset@long-spin-reuse-many-preempt-threads.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-8/igt@xe_exec_reset@long-spin-reuse-many-preempt-threads.html

  * igt@xe_exec_reset@multi-queue-long-spin-reuse-many-queue-switch:
    - shard-bmg:          NOTRUN -> [SKIP][184] ([Intel XE#8369])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-2/igt@xe_exec_reset@multi-queue-long-spin-reuse-many-queue-switch.html

  * igt@xe_exec_system_allocator@pat-index-madvise-max-pat-index-multi-vma:
    - shard-bmg:          [PASS][185] -> [INCOMPLETE][186] ([Intel XE#8159]) +17 other tests incomplete
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-2/igt@xe_exec_system_allocator@pat-index-madvise-max-pat-index-multi-vma.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-4/igt@xe_exec_system_allocator@pat-index-madvise-max-pat-index-multi-vma.html

  * igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate-race:
    - shard-bmg:          [PASS][187] -> [INCOMPLETE][188] ([Intel XE#8366])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-7/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate-race.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-9/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-multi-queue-cm-fd-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][189] ([Intel XE#8378]) +4 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-cm-fd-rebind.html

  * igt@xe_gpgpu_fill@offset-4x4:
    - shard-bmg:          NOTRUN -> [SKIP][190] ([Intel XE#7954])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-5/igt@xe_gpgpu_fill@offset-4x4.html

  * igt@xe_mmap@pci-membarrier:
    - shard-lnl:          NOTRUN -> [SKIP][191] ([Intel XE#5100] / [Intel XE#7322] / [Intel XE#7408])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-3/igt@xe_mmap@pci-membarrier.html

  * igt@xe_multigpu_svm@mgpu-atomic-op-basic:
    - shard-bmg:          NOTRUN -> [SKIP][192] ([Intel XE#6964]) +4 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-1/igt@xe_multigpu_svm@mgpu-atomic-op-basic.html

  * igt@xe_page_reclaim@basic-mixed:
    - shard-bmg:          NOTRUN -> [SKIP][193] ([Intel XE#7793]) +1 other test skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-2/igt@xe_page_reclaim@basic-mixed.html

  * igt@xe_pat@pat-sw-hw-suspend:
    - shard-bmg:          NOTRUN -> [FAIL][194] ([Intel XE#7695]) +1 other test fail
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-1/igt@xe_pat@pat-sw-hw-suspend.html

  * igt@xe_pat@xa-app-transient-media-on:
    - shard-bmg:          NOTRUN -> [SKIP][195] ([Intel XE#7590])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-2/igt@xe_pat@xa-app-transient-media-on.html

  * igt@xe_peer2peer@read:
    - shard-bmg:          NOTRUN -> [SKIP][196] ([Intel XE#2427] / [Intel XE#6953] / [Intel XE#7326] / [Intel XE#7353])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-5/igt@xe_peer2peer@read.html

  * igt@xe_peer2peer@write:
    - shard-bmg:          NOTRUN -> [SKIP][197] ([Intel XE#6953] / [Intel XE#7326] / [Intel XE#7353])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-5/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-mocs:
    - shard-bmg:          NOTRUN -> [SKIP][198] ([Intel XE#2284] / [Intel XE#7370])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-1/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-lnl:          NOTRUN -> [SKIP][199] ([Intel XE#2284] / [Intel XE#366] / [Intel XE#7370])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-3/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s3-vm-bind-prefetch:
    - shard-lnl:          NOTRUN -> [SKIP][200] ([Intel XE#584] / [Intel XE#7369]) +1 other test skip
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-2/igt@xe_pm@s3-vm-bind-prefetch.html

  * igt@xe_prefetch_fault@prefetch-fault-svm:
    - shard-bmg:          NOTRUN -> [SKIP][201] ([Intel XE#7599])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-1/igt@xe_prefetch_fault@prefetch-fault-svm.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:
    - shard-bmg:          NOTRUN -> [SKIP][202] ([Intel XE#4733] / [Intel XE#7417])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-2/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html

  * igt@xe_query@multigpu-query-invalid-size:
    - shard-bmg:          NOTRUN -> [SKIP][203] ([Intel XE#944]) +2 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-2/igt@xe_query@multigpu-query-invalid-size.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-lnl:          NOTRUN -> [SKIP][204] ([Intel XE#944])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-2/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  
#### Possible fixes ####

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-bmg:          [INCOMPLETE][205] ([Intel XE#8150]) -> [PASS][206]
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-9/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-bmg:          [CRASH][207] -> [PASS][208]
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-2/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-8/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [FAIL][209] ([Intel XE#301]) -> [PASS][210]
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@a-dp2:
    - shard-bmg:          [INCOMPLETE][211] ([Intel XE#8155]) -> [PASS][212] +2 other tests pass
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-10/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@a-dp2.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-1/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@a-dp2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          [TIMEOUT][213] -> [PASS][214] +7 other tests pass
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-10/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][215] ([Intel XE#1503]) -> [PASS][216]
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-5/igt@kms_hdr@invalid-hdr.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-7/igt@kms_hdr@invalid-hdr.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][217] ([Intel XE#6321] / [Intel XE#8355]) -> [PASS][218]
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-5/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-7/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate:
    - shard-bmg:          [INCOMPLETE][219] -> [PASS][220] +8 other tests pass
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-10/igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-1/igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-free-huge-nomemset:
    - shard-bmg:          [FAIL][221] -> [PASS][222] +6 other tests pass
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-1/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-free-huge-nomemset.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-8/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-free-huge-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-nomemset:
    - shard-bmg:          [INCOMPLETE][223] ([Intel XE#8159]) -> [PASS][224] +17 other tests pass
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-10/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-nomemset.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-8/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-madvise:
    - shard-lnl:          [TIMEOUT][225] -> [PASS][226]
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-lnl-5/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-madvise.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-7/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-madvise.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-lnl:          [ABORT][227] ([Intel XE#8007]) -> [PASS][228]
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-lnl-6/igt@xe_wedged@wedged-mode-toggle.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-8/igt@xe_wedged@wedged-mode-toggle.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-bmg:          [TIMEOUT][229] -> [INCOMPLETE][230] ([Intel XE#5643]) +1 other test incomplete
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-10/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-lnl:          [TIMEOUT][231] -> [SKIP][232] ([Intel XE#3658] / [Intel XE#7360])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-lnl:          [TIMEOUT][233] -> [INCOMPLETE][234] ([Intel XE#5643])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-lnl-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          [TIMEOUT][235] -> [SKIP][236] ([Intel XE#1124])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-lnl-7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-lnl:          [SKIP][237] ([Intel XE#1124]) -> [INCOMPLETE][238] ([Intel XE#5643])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-lnl-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p:
    - shard-bmg:          [INCOMPLETE][239] -> [SKIP][240] ([Intel XE#7679]) +1 other test skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-7/igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-9/igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-target-2560x1440p:
    - shard-bmg:          [INCOMPLETE][241] -> [SKIP][242] ([Intel XE#367])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-4/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-bmg:          [INCOMPLETE][243] ([Intel XE#8151]) -> [SKIP][244] ([Intel XE#2286] / [Intel XE#6035])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size:
    - shard-bmg:          [TIMEOUT][245] -> [INCOMPLETE][246] ([Intel XE#8151])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-5/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-10/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-lnl:          [FAIL][247] ([Intel XE#301]) -> [FAIL][248] ([Intel XE#301] / [Intel XE#3149])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-bmg:          [INCOMPLETE][249] ([Intel XE#8437]) -> [SKIP][250] ([Intel XE#7178] / [Intel XE#7351])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [INCOMPLETE][251] ([Intel XE#8368]) -> [SKIP][252] ([Intel XE#2311])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-draw-render.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][253] ([Intel XE#2311]) -> [INCOMPLETE][254] ([Intel XE#8368])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-draw-render.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [TIMEOUT][255] -> [INCOMPLETE][256] ([Intel XE#8368])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-7/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-render.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-blt:
    - shard-bmg:          [TIMEOUT][257] -> [SKIP][258] ([Intel XE#2313])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-blt.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][259] ([Intel XE#3544]) -> [SKIP][260] ([Intel XE#3374] / [Intel XE#3544])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping:
    - shard-bmg:          [SKIP][261] ([Intel XE#7283]) -> [INCOMPLETE][262] ([Intel XE#1035])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-5/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-7/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-bmg:          [INCOMPLETE][263] -> [SKIP][264] ([Intel XE#2322] / [Intel XE#7372]) +1 other test skip
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-10/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_system_allocator@process-many-stride-mmap-shared-remap-dontunmap-eocheck:
    - shard-bmg:          [FAIL][265] -> [INCOMPLETE][266] ([Intel XE#8159])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-5/igt@xe_exec_system_allocator@process-many-stride-mmap-shared-remap-dontunmap-eocheck.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-10/igt@xe_exec_system_allocator@process-many-stride-mmap-shared-remap-dontunmap-eocheck.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-file-mlock:
    - shard-bmg:          [INCOMPLETE][267] ([Intel XE#8159]) -> [INCOMPLETE][268] ([Intel XE#8159] / [Intel XE#8437]) +2 other tests incomplete
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-9/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-file-mlock.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-10/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-file-mlock.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind:
    - shard-bmg:          [INCOMPLETE][269] ([Intel XE#8366]) -> [SKIP][270] ([Intel XE#8378]) +2 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-1/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind.html

  
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
  [Intel XE#2459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4210]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4210
  [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5100]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100
  [Intel XE#5643]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5643
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#5857]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5857
  [Intel XE#5873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5873
  [Intel XE#5882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5882
  [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6819]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6819
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7321
  [Intel XE#7322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7322
  [Intel XE#7326]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7353]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7360
  [Intel XE#7369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7369
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7377]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7377
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7386]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7386
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7408
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7449]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449
  [Intel XE#7453]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7453
  [Intel XE#7467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7467
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599
  [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7850
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#7935]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935
  [Intel XE#7954]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7954
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
  [Intel XE#8151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8151
  [Intel XE#8155]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8155
  [Intel XE#8159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159
  [Intel XE#8174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8174
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8327
  [Intel XE#8355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#8361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8361
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8366
  [Intel XE#8368]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8368
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8437
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973 -> xe-pw-169125v1

  IGT_8985: d5fe8732b8547454c38fdd220b55f6f0cc841a3b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973: adbc617250e16fb2db4a4c777b89440927cb8973
  xe-pw-169125v1: 169125v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/index.html

--===============7267680445607966420==
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
<tr><td><b>Series:</b></td><td>drm/xe: balance exec queue suspend/resume</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/169125/">https://patchwork.freedesktop.org/series/169125/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973_FULL -&gt; xe-pw-169125v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-169125v1_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-169125v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-169125v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">TIMEOUT</a> +7 other tests timeout</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-2/igt@kms_bw@connected-linear-tiling-1-displays-target-1920x1080p.html">INCOMPLETE</a> +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html">TIMEOUT</a> +12 other tests timeout</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> +166 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-2/igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping.html">CRASH</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-a-plane-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-2/igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-a-plane-3.html">WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-4/igt@xe_exec_basic@many-bindexecqueue-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-5/igt@xe_exec_basic@many-bindexecqueue-rebind.html">SKIP</a> +86 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-7/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-9/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm.html">INCOMPLETE</a> +5 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-remap-dontunmap:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-2/igt@xe_exec_system_allocator@process-many-execqueues-mmap-remap-dontunmap.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-10/igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-1/igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-prefetch.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-race-nomemset:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-2/igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-race-nomemset.html">INCOMPLETE</a> +10 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-madvise:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-lnl-3/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-madvise.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-6/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-madvise.html">TIMEOUT</a> +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-madvise:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-2/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-madvise.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-90:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-lnl-3/igt@xe_pmu@engine-activity-accuracy-90.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-1/igt@xe_pmu@engine-activity-accuracy-90.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-3/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8174">Intel XE#8174</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-7/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-4/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-5/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> +1 other test skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5643">Intel XE#5643</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">TIMEOUT</a> +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-2/igt@kms_bw@linear-tiling-2-displays-target-3840x2160p.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-3/igt@kms_bw@linear-tiling-2-displays-target-3840x2160p.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-4/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-3/igt@kms_chamelium_color_pipeline@plane-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-7/igt@kms_chamelium_color_pipeline@plane-lut1d.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-3/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-7/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@suspend-resume:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-4/igt@kms_content_protection@suspend-resume.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-5/igt@kms_content_protection@suspend-resume.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-4/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x32:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-32x32.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-2/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935">Intel XE#7935</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-3/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-4/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5882">Intel XE#5882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-5/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349">Intel XE#7349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-2/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-shrfb-draw-render.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8368">Intel XE#8368</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-shrfb-draw-render.html">TIMEOUT</a> +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-3/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486">Intel XE#2486</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-7/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-7/igt@kms_plane@pixel-format-linear-modifier-source-clamping.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-9/igt@kms_plane@pixel-format-linear-modifier-source-clamping.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-3/igt@kms_plane_scaling@planes-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-7/igt@kms_plane_scaling@planes-downscale-factor-0-75.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-4/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-plane-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-3/igt@kms_psr@pr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-7/igt@kms_psr@pr-cursor-plane-move.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-4/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-5/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind.html">CRASH</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-4/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-5/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-prefetch.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-3/igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-7/igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate.html">SKIP</a> +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-malloc-mlock-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-1/igt@xe_exec_system_allocator@process-many-execqueues-malloc-mlock-nomemset.html">CRASH</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-8/igt@xe_exec_system_allocator@process-many-execqueues-malloc-mlock-nomemset.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-huge-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-4/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-huge-nomemset.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159">Intel XE#8159</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-4/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-huge-nomemset.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-4/igt@xe_exec_threads@threads-multi-queue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-userptr-invalidate-race.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_device_probe_early:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-xe_device_probe_early.html">CRASH</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_device_probe_early.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-4/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459">Intel XE#2459</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596">Intel XE#2596</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7321">Intel XE#7321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7453">Intel XE#7453</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-5/igt@xe_media_fill@media-fill.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-4/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-5/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-pxp-status:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-3/igt@xe_query@multigpu-query-pxp-status.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-7/igt@xe_query@multigpu-query-pxp-status.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-169125v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@pan:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-7/igt@fbdev@pan.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233">Intel XE#2233</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8174">Intel XE#8174</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-2/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5643">Intel XE#5643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-2/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-1/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059">Intel XE#7059</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-5/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-1/igt@kms_bw@linear-tiling-3-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-8/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-2/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8437">Intel XE#8437</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-2/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449">Intel XE#7449</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-2/igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-3/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-2/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-1/igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-2/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-2/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-128x42:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-2/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-2/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-2/igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8151">Intel XE#8151</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-2/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4210">Intel XE#4210</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7467">Intel XE#7467</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-1/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-2/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7386">Intel XE#7386</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic-bigjoiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-2/igt@kms_dsc@dsc-basic-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats-ultrajoiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-2/igt@kms_dsc@dsc-with-bpc-formats-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-2/igt@kms_flip@2x-dpms-vs-vblank-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179">Intel XE#7179</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8368">Intel XE#8368</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +37 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-3/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-4/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-draw-render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-draw-render.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8368">Intel XE#8368</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbchdr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +38 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-rte:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-5/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298">Intel XE#4298</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5873">Intel XE#5873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-2/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-2/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-9/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE#5021</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7377">Intel XE#7377</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-2/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-1/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-5/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8361">Intel XE#8361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-4/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-5/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-5/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450">Intel XE#2450</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5857">Intel XE#5857</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-busy-hang:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-1/igt@kms_vblank@query-forked-busy-hang.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-3/igt@kms_vblank@query-forked-busy-hang.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6819">Intel XE#6819</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8327">Intel XE#8327</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-2/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-exec-queues:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-1/igt@xe_eudebug@basic-exec-queues.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-small:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-3/igt@xe_evict@evict-cm-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540">Intel XE#6540</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_copy-instance-0-tile-0-vram0-memory:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-2/igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_copy-instance-0-tile-0-vram0-memory.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8437">Intel XE#8437</a>) +3 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-virtual-userptr-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-2/igt@xe_exec_balancer@many-virtual-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-1/igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-2/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-priority:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-3/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-priority:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-2/igt@xe_exec_multi_queue@two-queues-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-multi-queue-close-fd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-2/igt@xe_exec_reset@cm-multi-queue-close-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@long-spin-reuse-many-preempt-threads:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-1/igt@xe_exec_reset@long-spin-reuse-many-preempt-threads.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-8/igt@xe_exec_reset@long-spin-reuse-many-preempt-threads.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7850">Intel XE#7850</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-long-spin-reuse-many-queue-switch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-2/igt@xe_exec_reset@multi-queue-long-spin-reuse-many-queue-switch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-max-pat-index-multi-vma:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-2/igt@xe_exec_system_allocator@pat-index-madvise-max-pat-index-multi-vma.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-4/igt@xe_exec_system_allocator@pat-index-madvise-max-pat-index-multi-vma.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159">Intel XE#8159</a>) +17 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-7/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-9/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate-race.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8366">Intel XE#8366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-fd-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-cm-fd-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_gpgpu_fill@offset-4x4:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-5/igt@xe_gpgpu_fill@offset-4x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7954">Intel XE#7954</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-3/igt@xe_mmap@pci-membarrier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100">Intel XE#5100</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7322">Intel XE#7322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7408">Intel XE#7408</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-atomic-op-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-1/igt@xe_multigpu_svm@mgpu-atomic-op-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@basic-mixed:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-2/igt@xe_page_reclaim@basic-mixed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-sw-hw-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-1/igt@xe_pat@pat-sw-hw-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695">Intel XE#7695</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pat@xa-app-transient-media-on:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-2/igt@xe_pat@xa-app-transient-media-on.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-5/igt@xe_peer2peer@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">Intel XE#2427</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953">Intel XE#6953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326">Intel XE#7326</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353">Intel XE#7353</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-5/igt@xe_peer2peer@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953">Intel XE#6953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326">Intel XE#7326</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353">Intel XE#7353</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-1/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-3/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-prefetch:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-2/igt@xe_pm@s3-vm-bind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#584</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7369">Intel XE#7369</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_prefetch_fault@prefetch-fault-svm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-1/igt@xe_prefetch_fault@prefetch-fault-svm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599">Intel XE#7599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-2/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-2/igt@xe_query@multigpu-query-invalid-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-2/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-9/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-2/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html">CRASH</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-8/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-10/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@a-dp2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8155">Intel XE#8155</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-1/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@a-dp2.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-10/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-5/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-7/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-5/igt@xe_evict@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355">Intel XE#8355</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-7/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-10/igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-1/igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-free-huge-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-1/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-free-huge-nomemset.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-8/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-free-huge-nomemset.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-10/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-nomemset.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159">Intel XE#8159</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-8/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-nomemset.html">PASS</a> +17 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-madvise:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-lnl-5/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-madvise.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-7/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-madvise.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-lnl-6/igt@xe_wedged@wedged-mode-toggle.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-8/igt@xe_wedged@wedged-mode-toggle.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-10/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5643">Intel XE#5643</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658">Intel XE#3658</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7360">Intel XE#7360</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-lnl-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5643">Intel XE#5643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-lnl-7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-lnl-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5643">Intel XE#5643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-7/igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-9/igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-4/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8151">Intel XE#8151</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035">Intel XE#6035</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-5/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-10/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8151">Intel XE#8151</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8437">Intel XE#8437</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-draw-render.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8368">Intel XE#8368</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-draw-render.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8368">Intel XE#8368</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-7/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-render.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-render.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8368">Intel XE#8368</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-blt.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-5/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-7/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-10/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-shared-remap-dontunmap-eocheck:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-5/igt@xe_exec_system_allocator@process-many-stride-mmap-shared-remap-dontunmap-eocheck.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-10/igt@xe_exec_system_allocator@process-many-stride-mmap-shared-remap-dontunmap-eocheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159">Intel XE#8159</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-file-mlock:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-9/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-file-mlock.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159">Intel XE#8159</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-10/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-file-mlock.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159">Intel XE#8159</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8437">Intel XE#8437</a>) +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8366">Intel XE#8366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v1/shard-bmg-1/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973 -&gt; xe-pw-169125v1</li>
</ul>
<p>IGT_8985: d5fe8732b8547454c38fdd220b55f6f0cc841a3b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973: adbc617250e16fb2db4a4c777b89440927cb8973<br />
  xe-pw-169125v1: 169125v1</p>

</body>
</html>

--===============7267680445607966420==--
