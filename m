Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD921C43458
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jul 2026 03:39:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98B3510E1F7;
	Thu, 16 Jul 2026 03:39:59 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A50710E1F7;
 Thu, 16 Jul 2026 03:39:58 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6655843278309008571=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/xe=3A_Use_IBC_v3_on_PT?=
 =?utf-8?q?L_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 16 Jul 2026 03:39:58 -0000
Message-ID: <178417319842.195369.7750689515597566509@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260715235824.116991-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20260715235824.116991-1-vinay.belgaumkar@intel.com>
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

--===============6655843278309008571==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Use IBC v3 on PTL (rev4)
URL   : https://patchwork.freedesktop.org/series/169654/
State : success

== Summary ==

CI Bug Log - changes from xe-5415-30d669bb45c300a1f1fc0f6201e14ad8679ef03c_FULL -> xe-pw-169654v4_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-169654v4_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][1] ([Intel XE#1124]) +3 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-bmg-10/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][2] ([Intel XE#2887]) +1 other test skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-bmg-10/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#2325] / [Intel XE#7358])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-bmg-5/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#2252]) +3 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-bmg-5/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html

  * igt@kms_content_protection@dp-mst-type-1-suspend-resume:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#6974])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-bmg-5/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html

  * igt@kms_cursor_crc@cursor-rapid-movement-256x85:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#2320])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-bmg-10/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html

  * igt@kms_dsc@dsc-fractional-bpp-ultrajoiner:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#8265])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-bmg-5/igt@kms_dsc@dsc-fractional-bpp-ultrajoiner.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [PASS][8] -> [FAIL][9] ([Intel XE#301] / [Intel XE#3149])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5415-30d669bb45c300a1f1fc0f6201e14ad8679ef03c/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#7178] / [Intel XE#7349])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#7178] / [Intel XE#7351])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-bmg-10/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#4141]) +3 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2311]) +16 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#7061] / [Intel XE#7356])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2352] / [Intel XE#7399])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2313]) +18 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#7061]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-bmg-10/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-render.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#6911] / [Intel XE#7466])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-bmg-10/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_panel_fitting@legacy:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2486])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-bmg-5/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#7283])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-bmg-10/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#8303]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-bmg-5/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#5021] / [Intel XE#7377])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-bmg-10/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#1489]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr@fbc-psr2-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2234] / [Intel XE#2850]) +3 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-bmg-10/igt@kms_psr@fbc-psr2-suspend.html

  * igt@kms_sharpness_filter@filter-toggle:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#6503])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-bmg-5/igt@kms_sharpness_filter@filter-toggle.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#1499])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-bmg-5/igt@kms_vrr@flip-basic-fastset.html

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2322] / [Intel XE#7372]) +3 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-bmg-5/igt@xe_exec_basic@multigpu-once-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#8374]) +2 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-bmg-5/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate.html

  * igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#8364]) +9 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-bmg-5/igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-userptr-invalidate.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-race:
    - shard-bmg:          NOTRUN -> [ABORT][30] ([Intel XE#8007])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-race.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#8378]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-rebind.html

  * igt@xe_pat@pat-index-xelp:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2245] / [Intel XE#7590])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-bmg-5/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2284] / [Intel XE#7370])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-bmg-5/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_query@multigpu-query-invalid-query:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#944])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-bmg-5/igt@xe_query@multigpu-query-invalid-query.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [FAIL][35] ([Intel XE#7571]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5415-30d669bb45c300a1f1fc0f6201e14ad8679ef03c/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
    - shard-bmg:          [INCOMPLETE][37] ([Intel XE#6819] / [Intel XE#8155]) -> [PASS][38] +1 other test pass
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5415-30d669bb45c300a1f1fc0f6201e14ad8679ef03c/shard-bmg-3/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-bmg-5/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [FAIL][39] ([Intel XE#301]) -> [PASS][40] +2 other tests pass
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5415-30d669bb45c300a1f1fc0f6201e14ad8679ef03c/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][41] ([Intel XE#1503]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5415-30d669bb45c300a1f1fc0f6201e14ad8679ef03c/shard-bmg-3/igt@kms_hdr@invalid-hdr.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-bmg-2/igt@kms_hdr@invalid-hdr.html

  * igt@xe_exec_fault_mode@atomic-many:
    - shard-bmg:          [FAIL][43] ([Intel XE#8578]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5415-30d669bb45c300a1f1fc0f6201e14ad8679ef03c/shard-bmg-5/igt@xe_exec_fault_mode@atomic-many.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-bmg-10/igt@xe_exec_fault_mode@atomic-many.html

  * igt@xe_exec_system_allocator@processes-evict-malloc:
    - shard-bmg:          [INCOMPLETE][45] ([Intel XE#8159]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5415-30d669bb45c300a1f1fc0f6201e14ad8679ef03c/shard-bmg-9/igt@xe_exec_system_allocator@processes-evict-malloc.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-bmg-8/igt@xe_exec_system_allocator@processes-evict-malloc.html

  * igt@xe_fault_injection@vm-bind-fail-xe_sync_entry_parse:
    - shard-bmg:          [ABORT][47] ([Intel XE#8007]) -> [PASS][48] +1 other test pass
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5415-30d669bb45c300a1f1fc0f6201e14ad8679ef03c/shard-bmg-7/igt@xe_fault_injection@vm-bind-fail-xe_sync_entry_parse.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-bmg-10/igt@xe_fault_injection@vm-bind-fail-xe_sync_entry_parse.html

  
#### Warnings ####

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-lnl:          [FAIL][49] ([Intel XE#301]) -> [FAIL][50] ([Intel XE#301] / [Intel XE#3149])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5415-30d669bb45c300a1f1fc0f6201e14ad8679ef03c/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][51] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][52] ([Intel XE#3544])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5415-30d669bb45c300a1f1fc0f6201e14ad8679ef03c/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][53] ([Intel XE#2509] / [Intel XE#7437]) -> [SKIP][54] ([Intel XE#2426] / [Intel XE#5848])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5415-30d669bb45c300a1f1fc0f6201e14ad8679ef03c/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6819]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6819
  [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7377]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7377
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7466
  [Intel XE#7571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8155]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8155
  [Intel XE#8159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8303]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8578]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8578
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-5415-30d669bb45c300a1f1fc0f6201e14ad8679ef03c -> xe-pw-169654v4

  IGT_9007: 9007
  xe-5415-30d669bb45c300a1f1fc0f6201e14ad8679ef03c: 30d669bb45c300a1f1fc0f6201e14ad8679ef03c
  xe-pw-169654v4: 169654v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/index.html

--===============6655843278309008571==
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
<tr><td><b>Series:</b></td><td>drm/xe: Use IBC v3 on PTL (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/169654/">https://patchwork.freedesktop.org/series/169654/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5415-30d669bb45c300a1f1fc0f6201e14ad8679ef03c_FULL -&gt; xe-pw-169654v4_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-169654v4_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-bmg-10/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-bmg-10/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-bmg-5/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-bmg-5/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1-suspend-resume:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-bmg-5/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-256x85:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-bmg-10/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-ultrajoiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-bmg-5/igt@kms_dsc@dsc-fractional-bpp-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5415-30d669bb45c300a1f1fc0f6201e14ad8679ef03c/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349">Intel XE#7349</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-bmg-10/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-bmg-10/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-bmg-10/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911">Intel XE#6911</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7466">Intel XE#7466</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-bmg-5/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486">Intel XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-bmg-10/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-bmg-5/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303">Intel XE#8303</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-bmg-10/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE#5021</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7377">Intel XE#7377</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-bmg-10/igt@kms_psr@fbc-psr2-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-toggle:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-bmg-5/igt@kms_sharpness_filter@filter-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-bmg-5/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-bmg-5/igt@xe_exec_basic@multigpu-once-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-bmg-5/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-bmg-5/igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-race.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-bmg-5/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-bmg-5/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-query:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-bmg-5/igt@xe_query@multigpu-query-invalid-query.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5415-30d669bb45c300a1f1fc0f6201e14ad8679ef03c/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571">Intel XE#7571</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5415-30d669bb45c300a1f1fc0f6201e14ad8679ef03c/shard-bmg-3/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6819">Intel XE#6819</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8155">Intel XE#8155</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-bmg-5/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5415-30d669bb45c300a1f1fc0f6201e14ad8679ef03c/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5415-30d669bb45c300a1f1fc0f6201e14ad8679ef03c/shard-bmg-3/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-bmg-2/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@atomic-many:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5415-30d669bb45c300a1f1fc0f6201e14ad8679ef03c/shard-bmg-5/igt@xe_exec_fault_mode@atomic-many.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8578">Intel XE#8578</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-bmg-10/igt@xe_exec_fault_mode@atomic-many.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@processes-evict-malloc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5415-30d669bb45c300a1f1fc0f6201e14ad8679ef03c/shard-bmg-9/igt@xe_exec_system_allocator@processes-evict-malloc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159">Intel XE#8159</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-bmg-8/igt@xe_exec_system_allocator@processes-evict-malloc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_sync_entry_parse:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5415-30d669bb45c300a1f1fc0f6201e14ad8679ef03c/shard-bmg-7/igt@xe_fault_injection@vm-bind-fail-xe_sync_entry_parse.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-bmg-10/igt@xe_fault_injection@vm-bind-fail-xe_sync_entry_parse.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5415-30d669bb45c300a1f1fc0f6201e14ad8679ef03c/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5415-30d669bb45c300a1f1fc0f6201e14ad8679ef03c/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5415-30d669bb45c300a1f1fc0f6201e14ad8679ef03c/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437">Intel XE#7437</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v4/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5415-30d669bb45c300a1f1fc0f6201e14ad8679ef03c -&gt; xe-pw-169654v4</li>
</ul>
<p>IGT_9007: 9007<br />
  xe-5415-30d669bb45c300a1f1fc0f6201e14ad8679ef03c: 30d669bb45c300a1f1fc0f6201e14ad8679ef03c<br />
  xe-pw-169654v4: 169654v4</p>

</body>
</html>

--===============6655843278309008571==--
