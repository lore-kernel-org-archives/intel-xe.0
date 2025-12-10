Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02C30D3E780
	for <intel-xe@archiver.kernel.org>; Wed, 10 Dec 2025 22:08:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA64510E677;
	Wed, 10 Dec 2025 22:08:29 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4E4910E289;
 Wed, 10 Dec 2025 22:08:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0411209988321112442=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe/xe=5Fguc=5Fct=3A_Pr?=
 =?utf-8?q?event_compiler_read/write_optimization_breaks?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 10 Dec 2025 22:08:28 -0000
Message-ID: <176540450886.75555.9815456510238944865@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251209212535.159493-2-jonathan.cavitt@intel.com>
In-Reply-To: <20251209212535.159493-2-jonathan.cavitt@intel.com>
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

--===============0411209988321112442==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/xe_guc_ct: Prevent compiler read/write optimization breaks
URL   : https://patchwork.freedesktop.org/series/158723/
State : failure

== Summary ==

CI Bug Log - changes from xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985_FULL -> xe-pw-158723v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-158723v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-158723v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-158723v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@2x-flip-vs-panning-interruptible@ab-dp2-hdmi-a3:
    - shard-bmg:          [PASS][1] -> [FAIL][2] +4 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-1/igt@kms_flip@2x-flip-vs-panning-interruptible@ab-dp2-hdmi-a3.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning-interruptible@ab-dp2-hdmi-a3.html

  * igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind:
    - shard-bmg:          [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-1/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v1/shard-bmg-6/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html

  
Known issues
------------

  Here are the changes found in xe-pw-158723v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2887])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v1/shard-bmg-5/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [PASS][6] -> [FAIL][7] ([Intel XE#3321]) +1 other test fail
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible@bc-dp2-hdmi-a3:
    - shard-bmg:          [PASS][8] -> [FAIL][9] ([Intel XE#3650]) +3 other tests fail
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-1/igt@kms_flip@2x-flip-vs-panning-interruptible@bc-dp2-hdmi-a3.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning-interruptible@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible@cd-dp2-hdmi-a3:
    - shard-bmg:          [PASS][10] -> [FAIL][11] ([Intel XE#3149] / [Intel XE#3650]) +1 other test fail
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-1/igt@kms_flip@2x-flip-vs-panning-interruptible@cd-dp2-hdmi-a3.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning-interruptible@cd-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [PASS][12] -> [FAIL][13] ([Intel XE#301] / [Intel XE#3149]) +1 other test fail
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2293])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#4141])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2313])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_psr@fbc-psr-sprite-plane-move:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v1/shard-bmg-5/igt@kms_psr@fbc-psr-sprite-plane-move.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2322])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v1/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unplug-rescan:
    - shard-bmg:          [SKIP][19] -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-2/igt@core_hotunplug@unplug-rescan.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v1/shard-bmg-8/igt@core_hotunplug@unplug-rescan.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-bmg:          [SKIP][21] ([Intel XE#367]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v1/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_cursor_crc@cursor-sliding-256x256:
    - shard-bmg:          [FAIL][23] ([Intel XE#6747]) -> [PASS][24] +1 other test pass
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-256x256.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v1/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding-256x256.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [INCOMPLETE][25] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][26] +1 other test pass
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v1/shard-bmg-5/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@xe_exec_system_allocator@many-large-malloc:
    - shard-bmg:          [SKIP][27] ([Intel XE#6557] / [Intel XE#6703]) -> [PASS][28] +9 other tests pass
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-2/igt@xe_exec_system_allocator@many-large-malloc.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v1/shard-bmg-8/igt@xe_exec_system_allocator@many-large-malloc.html

  * igt@xe_exec_system_allocator@twice-mmap-free-nomemset:
    - shard-bmg:          [SKIP][29] ([Intel XE#6703]) -> [PASS][30] +74 other tests pass
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-2/igt@xe_exec_system_allocator@twice-mmap-free-nomemset.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v1/shard-bmg-8/igt@xe_exec_system_allocator@twice-mmap-free-nomemset.html

  * igt@xe_pmu@engine-activity-accuracy-90:
    - shard-lnl:          [FAIL][31] ([Intel XE#6251]) -> [PASS][32] +2 other tests pass
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-lnl-1/igt@xe_pmu@engine-activity-accuracy-90.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v1/shard-lnl-2/igt@xe_pmu@engine-activity-accuracy-90.html

  
#### Warnings ####

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-bmg:          [SKIP][33] ([Intel XE#6703]) -> [SKIP][34] ([Intel XE#2370])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v1/shard-bmg-8/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          [SKIP][35] ([Intel XE#6703]) -> [SKIP][36] ([Intel XE#1124])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v1/shard-bmg-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
    - shard-bmg:          [SKIP][37] ([Intel XE#6703]) -> [SKIP][38] ([Intel XE#367])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v1/shard-bmg-8/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          [SKIP][39] ([Intel XE#6703]) -> [SKIP][40] ([Intel XE#2887]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-2/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v1/shard-bmg-8/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_chamelium_color@degamma:
    - shard-bmg:          [SKIP][41] ([Intel XE#6703]) -> [SKIP][42] ([Intel XE#2325])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-2/igt@kms_chamelium_color@degamma.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v1/shard-bmg-8/igt@kms_chamelium_color@degamma.html

  * igt@kms_content_protection@dp-mst-suspend-resume:
    - shard-bmg:          [SKIP][43] ([Intel XE#6703]) -> [SKIP][44] ([Intel XE#6743])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-2/igt@kms_content_protection@dp-mst-suspend-resume.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v1/shard-bmg-8/igt@kms_content_protection@dp-mst-suspend-resume.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-bmg:          [FAIL][45] ([Intel XE#6793]) -> [SKIP][46] ([Intel XE#4354])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-6/igt@kms_dp_link_training@uhbr-sst.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v1/shard-bmg-1/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
    - shard-bmg:          [SKIP][47] ([Intel XE#6703]) -> [SKIP][48] ([Intel XE#2293] / [Intel XE#2380])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-bmg:          [SKIP][49] ([Intel XE#6703]) -> [SKIP][50] ([Intel XE#2311])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move:
    - shard-bmg:          [SKIP][51] ([Intel XE#6703]) -> [SKIP][52] ([Intel XE#4141])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][53] ([Intel XE#6703]) -> [SKIP][54] ([Intel XE#2313]) +3 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v1/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][55] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][56] ([Intel XE#3544])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v1/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          [SKIP][57] ([Intel XE#1406] / [Intel XE#6703]) -> [SKIP][58] ([Intel XE#1406] / [Intel XE#1489])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-2/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v1/shard-bmg-8/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][59] ([Intel XE#1729]) -> [SKIP][60] ([Intel XE#2426])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v1/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][61] ([Intel XE#2509]) -> [SKIP][62] ([Intel XE#2426])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v1/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_eudebug_online@interrupt-all-set-breakpoint-faultable:
    - shard-bmg:          [SKIP][63] ([Intel XE#6703]) -> [SKIP][64] ([Intel XE#4837] / [Intel XE#6665])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-2/igt@xe_eudebug_online@interrupt-all-set-breakpoint-faultable.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v1/shard-bmg-8/igt@xe_eudebug_online@interrupt-all-set-breakpoint-faultable.html

  * igt@xe_eudebug_sriov@deny-sriov:
    - shard-bmg:          [SKIP][65] ([Intel XE#6703]) -> [SKIP][66] ([Intel XE#5793])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-2/igt@xe_eudebug_sriov@deny-sriov.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v1/shard-bmg-8/igt@xe_eudebug_sriov@deny-sriov.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:
    - shard-bmg:          [SKIP][67] ([Intel XE#6703]) -> [SKIP][68] ([Intel XE#2322]) +1 other test skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v1/shard-bmg-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html

  * igt@xe_exec_system_allocator@threads-many-mmap-free-huge-nomemset:
    - shard-bmg:          [SKIP][69] ([Intel XE#6703]) -> [SKIP][70] ([Intel XE#4943]) +5 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-mmap-free-huge-nomemset.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v1/shard-bmg-8/igt@xe_exec_system_allocator@threads-many-mmap-free-huge-nomemset.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-bmg:          [SKIP][71] ([Intel XE#6703]) -> [SKIP][72] ([Intel XE#579])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-2/igt@xe_pm@vram-d3cold-threshold.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v1/shard-bmg-8/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pxp@pxp-stale-queue-post-termination-irq:
    - shard-bmg:          [SKIP][73] ([Intel XE#6703]) -> [SKIP][74] ([Intel XE#4733])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-2/igt@xe_pxp@pxp-stale-queue-post-termination-irq.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v1/shard-bmg-8/igt@xe_pxp@pxp-stale-queue-post-termination-irq.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3650
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#5793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5793
  [Intel XE#6251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251
  [Intel XE#6557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557
  [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
  [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
  [Intel XE#6743]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6743
  [Intel XE#6747]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6747
  [Intel XE#6793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6793


Build changes
-------------

  * Linux: xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985 -> xe-pw-158723v1

  IGT_8662: 9410b6926f317e8bf824502394e09ee8753ff65e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985: 2a9deeb5c3fd4dddbed361f10b26ce567072a985
  xe-pw-158723v1: 158723v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v1/index.html

--===============0411209988321112442==
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
<tr><td><b>Series:</b></td><td>drm/xe/xe_guc_ct: Prevent compiler read/write optimization breaks</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/158723/">https://patchwork.freedesktop.org/series/158723/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985_FULL -&gt; xe-pw-158723v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-158723v1_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-158723v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-158723v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-1/igt@kms_flip@2x-flip-vs-panning-interruptible@ab-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning-interruptible@ab-dp2-hdmi-a3.html">FAIL</a> +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-1/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v1/shard-bmg-6/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-158723v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v1/shard-bmg-5/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-1/igt@kms_flip@2x-flip-vs-panning-interruptible@bc-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning-interruptible@bc-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3650">Intel XE#3650</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-1/igt@kms_flip@2x-flip-vs-panning-interruptible@cd-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning-interruptible@cd-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3650">Intel XE#3650</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-plane-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v1/shard-bmg-5/igt@kms_psr@fbc-psr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v1/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unplug-rescan:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-2/igt@core_hotunplug@unplug-rescan.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v1/shard-bmg-8/igt@core_hotunplug@unplug-rescan.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v1/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x256:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-256x256.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6747">Intel XE#6747</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v1/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding-256x256.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v1/shard-bmg-5/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-malloc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-2/igt@xe_exec_system_allocator@many-large-malloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v1/shard-bmg-8/igt@xe_exec_system_allocator@many-large-malloc.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-free-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-2/igt@xe_exec_system_allocator@twice-mmap-free-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v1/shard-bmg-8/igt@xe_exec_system_allocator@twice-mmap-free-nomemset.html">PASS</a> +74 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-90:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-lnl-1/igt@xe_pmu@engine-activity-accuracy-90.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251">Intel XE#6251</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v1/shard-lnl-2/igt@xe_pmu@engine-activity-accuracy-90.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v1/shard-bmg-8/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v1/shard-bmg-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v1/shard-bmg-8/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-2/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v1/shard-bmg-8/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-2/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v1/shard-bmg-8/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-suspend-resume:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-2/igt@kms_content_protection@dp-mst-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v1/shard-bmg-8/igt@kms_content_protection@dp-mst-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6743">Intel XE#6743</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-6/igt@kms_dp_link_training@uhbr-sst.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6793">Intel XE#6793</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v1/shard-bmg-1/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v1/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v1/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-2/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v1/shard-bmg-8/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v1/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v1/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-all-set-breakpoint-faultable:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-2/igt@xe_eudebug_online@interrupt-all-set-breakpoint-faultable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v1/shard-bmg-8/igt@xe_eudebug_online@interrupt-all-set-breakpoint-faultable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-sriov:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-2/igt@xe_eudebug_sriov@deny-sriov.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v1/shard-bmg-8/igt@xe_eudebug_sriov@deny-sriov.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5793">Intel XE#5793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v1/shard-bmg-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-free-huge-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-mmap-free-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v1/shard-bmg-8/igt@xe_exec_system_allocator@threads-many-mmap-free-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-2/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v1/shard-bmg-8/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-queue-post-termination-irq:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-2/igt@xe_pxp@pxp-stale-queue-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v1/shard-bmg-8/igt@xe_pxp@pxp-stale-queue-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985 -&gt; xe-pw-158723v1</li>
</ul>
<p>IGT_8662: 9410b6926f317e8bf824502394e09ee8753ff65e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985: 2a9deeb5c3fd4dddbed361f10b26ce567072a985<br />
  xe-pw-158723v1: 158723v1</p>

</body>
</html>

--===============0411209988321112442==--
