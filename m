Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72D20F9D0C8
	for <intel-xe@archiver.kernel.org>; Tue, 14 Apr 2026 12:24:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 358F110E5D7;
	Tue, 14 Apr 2026 12:24:56 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 216C610E5D7;
 Tue, 14 Apr 2026 12:24:54 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7164529147433114472=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm=3A_Ensure_ioctls_are_d?=
 =?utf-8?q?rained_before_device_unplug?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 14 Apr 2026 12:24:54 -0000
Message-ID: <177616949411.461014.13710823065491741611@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260414091552.6153-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20260414091552.6153-1-thomas.hellstrom@linux.intel.com>
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

--===============7164529147433114472==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm: Ensure ioctls are drained before device unplug
URL   : https://patchwork.freedesktop.org/series/164845/
State : failure

== Summary ==

CI Bug Log - changes from xe-4898-bf1886f46aceb23fda764e3b0f2bd483048e9265_FULL -> xe-pw-164845v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-164845v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-164845v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-164845v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@2x-plain-flip:
    - shard-bmg:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4898-bf1886f46aceb23fda764e3b0f2bd483048e9265/shard-bmg-3/igt@kms_flip@2x-plain-flip.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-bmg-6/igt@kms_flip@2x-plain-flip.html

  * igt@kms_plane_lowres@tiling-4@pipe-b-dp-2:
    - shard-bmg:          [PASS][3] -> [SKIP][4] +3 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4898-bf1886f46aceb23fda764e3b0f2bd483048e9265/shard-bmg-3/igt@kms_plane_lowres@tiling-4@pipe-b-dp-2.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-bmg-6/igt@kms_plane_lowres@tiling-4@pipe-b-dp-2.html

  * igt@kms_sharpness_filter@invalid-plane-with-filter@pipe-a-edp-1-invalid-plane-with-filter:
    - shard-lnl:          [PASS][5] -> [DMESG-WARN][6] +1 other test dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4898-bf1886f46aceb23fda764e3b0f2bd483048e9265/shard-lnl-5/igt@kms_sharpness_filter@invalid-plane-with-filter@pipe-a-edp-1-invalid-plane-with-filter.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-lnl-6/igt@kms_sharpness_filter@invalid-plane-with-filter@pipe-a-edp-1-invalid-plane-with-filter.html

  
Known issues
------------

  Here are the changes found in xe-pw-164845v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2327])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-bmg-5/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2328] / [Intel XE#7367])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#1124]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-bmg-5/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#367] / [Intel XE#7354])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-bmg-5/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#3432])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2887]) +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-bmg-5/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2325] / [Intel XE#7358])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-bmg-5/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2252]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-bmg-5/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][15] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +1 other test fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-bmg-5/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2320])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-128x42.html

  * igt@kms_cursor_crc@cursor-random-64x64:
    - shard-bmg:          [PASS][17] -> [SKIP][18] ([Intel XE#2320])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4898-bf1886f46aceb23fda764e3b0f2bd483048e9265/shard-bmg-3/igt@kms_cursor_crc@cursor-random-64x64.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-bmg-6/igt@kms_cursor_crc@cursor-random-64x64.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2321] / [Intel XE#7355]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-bmg:          [PASS][20] -> [SKIP][21] ([Intel XE#2291])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4898-bf1886f46aceb23fda764e3b0f2bd483048e9265/shard-bmg-3/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-bmg-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][22] -> [FAIL][23] ([Intel XE#7571])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4898-bf1886f46aceb23fda764e3b0f2bd483048e9265/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_feature_discovery@display-4x:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#1138] / [Intel XE#7344])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-bmg-5/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [PASS][25] -> [FAIL][26] ([Intel XE#301]) +1 other test fail
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4898-bf1886f46aceb23fda764e3b0f2bd483048e9265/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#7178] / [Intel XE#7349])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#4141]) +3 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2311]) +4 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2313]) +4 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-b-plane-5:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#7130]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-bmg-5/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-b-plane-5.html

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#7283])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-bmg-5/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping.html

  * igt@kms_psr@pr-primary-page-flip:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2234] / [Intel XE#2850])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-bmg-5/igt@kms_psr@pr-primary-page-flip.html

  * igt@kms_sharpness_filter@invalid-filter-with-scaler:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#6503])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-bmg-5/igt@kms_sharpness_filter@invalid-filter-with-scaler.html

  * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
    - shard-lnl:          [PASS][35] -> [FAIL][36] ([Intel XE#2142]) +1 other test fail
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4898-bf1886f46aceb23fda764e3b0f2bd483048e9265/shard-lnl-7/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-lnl-8/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html

  * igt@xe_eudebug_online@pagefault-one-of-many:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#7636]) +2 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-bmg-5/igt@xe_eudebug_online@pagefault-one-of-many.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2322] / [Intel XE#7372])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-bmg-5/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#7136]) +2 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-bmg-5/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-prefetch.html

  * igt@xe_exec_multi_queue@many-queues-close-fd:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#6874]) +3 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-bmg-5/igt@xe_exec_multi_queue@many-queues-close-fd.html

  * igt@xe_exec_system_allocator@process-many-malloc-prefetch:
    - shard-bmg:          [PASS][41] -> [DMESG-WARN][42] ([Intel XE#7725]) +2 other tests dmesg-warn
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4898-bf1886f46aceb23fda764e3b0f2bd483048e9265/shard-bmg-3/igt@xe_exec_system_allocator@process-many-malloc-prefetch.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-bmg-6/igt@xe_exec_system_allocator@process-many-malloc-prefetch.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#7138])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind.html

  * igt@xe_multigpu_svm@mgpu-concurrent-access-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#6964])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-bmg-5/igt@xe_multigpu_svm@mgpu-concurrent-access-prefetch.html

  * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
    - shard-bmg:          [PASS][45] -> [INCOMPLETE][46] ([Intel XE#2594])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4898-bf1886f46aceb23fda764e3b0f2bd483048e9265/shard-bmg-7/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-bmg-9/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html

  
#### Possible fixes ####

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-bmg:          [ABORT][47] ([Intel XE#5545] / [Intel XE#6652]) -> [PASS][48] +1 other test pass
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4898-bf1886f46aceb23fda764e3b0f2bd483048e9265/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][49] ([Intel XE#1503]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4898-bf1886f46aceb23fda764e3b0f2bd483048e9265/shard-bmg-10/igt@kms_hdr@invalid-hdr.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-bmg-5/igt@kms_hdr@invalid-hdr.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][51] ([Intel XE#2311]) -> [SKIP][52] ([Intel XE#2312])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4898-bf1886f46aceb23fda764e3b0f2bd483048e9265/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-move.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][53] ([Intel XE#2313]) -> [SKIP][54] ([Intel XE#2312])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4898-bf1886f46aceb23fda764e3b0f2bd483048e9265/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][55] ([Intel XE#2426] / [Intel XE#5848]) -> [SKIP][56] ([Intel XE#2509] / [Intel XE#7437])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4898-bf1886f46aceb23fda764e3b0f2bd483048e9265/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][57], [PASS][58], [PASS][59], [PASS][60], [PASS][61], [PASS][62], [PASS][63], [PASS][64], [PASS][65], [PASS][66], [PASS][67], [PASS][68], [PASS][69], [PASS][70], [PASS][71], [PASS][72], [SKIP][73], [PASS][74], [PASS][75], [PASS][76], [PASS][77], [PASS][78], [PASS][79], [PASS][80], [PASS][81], [PASS][82]) ([Intel XE#2457] / [Intel XE#7405]) -> ([PASS][83], [PASS][84], [PASS][85], [PASS][86], [PASS][87], [PASS][88], [PASS][89], [DMESG-WARN][90], [DMESG-WARN][91], [DMESG-WARN][92], [PASS][93], [PASS][94], [PASS][95], [PASS][96], [PASS][97], [PASS][98], [PASS][99], [SKIP][100], [PASS][101], [PASS][102], [PASS][103], [PASS][104], [PASS][105], [PASS][106], [PASS][107], [PASS][108]) ([Intel XE#2457] / [Intel XE#7405] / [Intel XE#7725])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4898-bf1886f46aceb23fda764e3b0f2bd483048e9265/shard-bmg-5/igt@xe_module_load@load.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4898-bf1886f46aceb23fda764e3b0f2bd483048e9265/shard-bmg-1/igt@xe_module_load@load.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4898-bf1886f46aceb23fda764e3b0f2bd483048e9265/shard-bmg-8/igt@xe_module_load@load.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4898-bf1886f46aceb23fda764e3b0f2bd483048e9265/shard-bmg-1/igt@xe_module_load@load.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4898-bf1886f46aceb23fda764e3b0f2bd483048e9265/shard-bmg-2/igt@xe_module_load@load.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4898-bf1886f46aceb23fda764e3b0f2bd483048e9265/shard-bmg-7/igt@xe_module_load@load.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4898-bf1886f46aceb23fda764e3b0f2bd483048e9265/shard-bmg-8/igt@xe_module_load@load.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4898-bf1886f46aceb23fda764e3b0f2bd483048e9265/shard-bmg-3/igt@xe_module_load@load.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4898-bf1886f46aceb23fda764e3b0f2bd483048e9265/shard-bmg-2/igt@xe_module_load@load.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4898-bf1886f46aceb23fda764e3b0f2bd483048e9265/shard-bmg-10/igt@xe_module_load@load.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4898-bf1886f46aceb23fda764e3b0f2bd483048e9265/shard-bmg-9/igt@xe_module_load@load.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4898-bf1886f46aceb23fda764e3b0f2bd483048e9265/shard-bmg-2/igt@xe_module_load@load.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4898-bf1886f46aceb23fda764e3b0f2bd483048e9265/shard-bmg-2/igt@xe_module_load@load.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4898-bf1886f46aceb23fda764e3b0f2bd483048e9265/shard-bmg-9/igt@xe_module_load@load.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4898-bf1886f46aceb23fda764e3b0f2bd483048e9265/shard-bmg-1/igt@xe_module_load@load.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4898-bf1886f46aceb23fda764e3b0f2bd483048e9265/shard-bmg-8/igt@xe_module_load@load.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4898-bf1886f46aceb23fda764e3b0f2bd483048e9265/shard-bmg-7/igt@xe_module_load@load.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4898-bf1886f46aceb23fda764e3b0f2bd483048e9265/shard-bmg-5/igt@xe_module_load@load.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4898-bf1886f46aceb23fda764e3b0f2bd483048e9265/shard-bmg-7/igt@xe_module_load@load.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4898-bf1886f46aceb23fda764e3b0f2bd483048e9265/shard-bmg-3/igt@xe_module_load@load.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4898-bf1886f46aceb23fda764e3b0f2bd483048e9265/shard-bmg-6/igt@xe_module_load@load.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4898-bf1886f46aceb23fda764e3b0f2bd483048e9265/shard-bmg-10/igt@xe_module_load@load.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4898-bf1886f46aceb23fda764e3b0f2bd483048e9265/shard-bmg-10/igt@xe_module_load@load.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4898-bf1886f46aceb23fda764e3b0f2bd483048e9265/shard-bmg-3/igt@xe_module_load@load.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4898-bf1886f46aceb23fda764e3b0f2bd483048e9265/shard-bmg-5/igt@xe_module_load@load.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4898-bf1886f46aceb23fda764e3b0f2bd483048e9265/shard-bmg-6/igt@xe_module_load@load.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-bmg-6/igt@xe_module_load@load.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-bmg-1/igt@xe_module_load@load.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-bmg-10/igt@xe_module_load@load.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-bmg-1/igt@xe_module_load@load.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-bmg-1/igt@xe_module_load@load.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-bmg-3/igt@xe_module_load@load.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-bmg-5/igt@xe_module_load@load.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-bmg-6/igt@xe_module_load@load.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-bmg-6/igt@xe_module_load@load.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-bmg-6/igt@xe_module_load@load.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-bmg-8/igt@xe_module_load@load.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-bmg-10/igt@xe_module_load@load.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-bmg-8/igt@xe_module_load@load.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-bmg-10/igt@xe_module_load@load.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-bmg-3/igt@xe_module_load@load.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-bmg-3/igt@xe_module_load@load.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-bmg-9/igt@xe_module_load@load.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-bmg-9/igt@xe_module_load@load.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-bmg-5/igt@xe_module_load@load.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-bmg-5/igt@xe_module_load@load.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-bmg-2/igt@xe_module_load@load.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-bmg-7/igt@xe_module_load@load.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-bmg-2/igt@xe_module_load@load.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-bmg-2/igt@xe_module_load@load.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-bmg-7/igt@xe_module_load@load.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-bmg-9/igt@xe_module_load@load.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#7130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7130
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7344]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7344
  [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
  [Intel XE#7354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7354
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571
  [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
  [Intel XE#7725]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7725


Build changes
-------------

  * Linux: xe-4898-bf1886f46aceb23fda764e3b0f2bd483048e9265 -> xe-pw-164845v1

  IGT_8855: 3c05ee1076cee44a2bc3c176ec21e651f6eca600 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4898-bf1886f46aceb23fda764e3b0f2bd483048e9265: bf1886f46aceb23fda764e3b0f2bd483048e9265
  xe-pw-164845v1: 164845v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/index.html

--===============7164529147433114472==
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
<tr><td><b>Series:</b></td><td>drm: Ensure ioctls are drained before device=
 unplug</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/164845/">https://patchwork.freedesktop.org/series/164845/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-164845v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-164845v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4898-bf1886f46aceb23fda764e3b0f2bd4830=
48e9265_FULL -&gt; xe-pw-164845v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-164845v1_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-164845v1_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1648=
45v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4898-bf1886f46aceb23fda764e3b0f2bd483048e9265/shard-bmg-3/igt@kms_flip=
@2x-plain-flip.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-164845v1/shard-bmg-6/igt@kms_flip@2x-plain-flip.html">D=
MESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4898-bf1886f46aceb23fda764e3b0f2bd483048e9265/shard-bmg-3/igt@kms_plan=
e_lowres@tiling-4@pipe-b-dp-2.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-bmg-6/igt@kms_plane_lowre=
s@tiling-4@pipe-b-dp-2.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-plane-with-filter@pipe-a-edp-1-invalid-=
plane-with-filter:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4898-bf1886f46aceb23fda764e3b0f2bd483048e9265/shard-lnl-5/igt@kms_shar=
pness_filter@invalid-plane-with-filter@pipe-a-edp-1-invalid-plane-with-filt=
er.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-164845v1/shard-lnl-6/igt@kms_sharpness_filter@invalid-plane-with-fi=
lter@pipe-a-edp-1-invalid-plane-with-filter.html">DMESG-WARN</a> +1 other t=
est dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-164845v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164845v1/shard-bmg-5/igt@kms_big_fb@linear-16bpp-rotat=
e-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164845v1/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2328">Intel XE#2328</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7367">Intel XE#7367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164845v1/shard-bmg-5/igt@kms_big_fb@yf-tiled-16bpp-rot=
ate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164845v1/shard-bmg-5/igt@kms_bw@linear-tiling-2-displa=
ys-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7354">Intel XE#7354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164845v1/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4=
-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164845v1/shard-bmg-5/igt@kms_ccs@random-ccs-data-y-til=
ed-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164845v1/shard-bmg-5/igt@kms_chamelium_color@ctm-blue-=
to-red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2325">Intel XE#2325</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164845v1/shard-bmg-5/igt@kms_chamelium_hpd@hdmi-hpd-st=
orm-disable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164845v1/shard-bmg-5/igt@kms_content_protection@lic-ty=
pe-0@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +=
1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164845v1/shard-bmg-5/igt@kms_cursor_crc@cursor-onscree=
n-128x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-64x64:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4898-bf1886f46aceb23fda764e3b0f2bd483048e9265/shard-bmg-3/igt@kms_curs=
or_crc@cursor-random-64x64.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-bmg-6/igt@kms_cursor_crc@cur=
sor-random-64x64.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164845v1/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding=
-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2321">Intel XE#2321</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4898-bf1886f46aceb23fda764e3b0f2bd483048e9265/shard-bmg-3/igt@kms_curs=
or_legacy@2x-cursor-vs-flip-atomic.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-bmg-6/igt@kms_cursor=
_legacy@2x-cursor-vs-flip-atomic.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4898-bf1886f46aceb23fda764e3b0f2bd483048e9265/shard-bmg-6/igt@kms_curs=
or_legacy@flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-bmg-3/igt@kms_cursor_le=
gacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7571">Intel XE#7571</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164845v1/shard-bmg-5/igt@kms_feature_discovery@display=
-4x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1138">Intel XE#1138</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7344">Intel XE#7344</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4898-bf1886f46aceb23fda764e3b0f2bd483048e9265/shard-lnl-8/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-lnl-2/ig=
t@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#30=
1</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164845v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bp=
p-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349">Intel XE=
#7349</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164845v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-=
1p-offscreen-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +3 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164845v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +4 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164845v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-=
1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +4 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-b-plane-5:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164845v1/shard-bmg-5/igt@kms_plane@pixel-format-4-tile=
d-bmg-ccs-modifier@pipe-b-plane-5.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7130">Intel XE#7130</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164845v1/shard-bmg-5/igt@kms_plane@pixel-format-yf-til=
ed-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-page-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164845v1/shard-bmg-5/igt@kms_psr@pr-primary-page-flip.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2850">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaler:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164845v1/shard-bmg-5/igt@kms_sharpness_filter@invalid-=
filter-with-scaler.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4898-bf1886f46aceb23fda764e3b0f2bd483048e9265/shard-lnl-7/igt@kms_vrr@=
seamless-rr-switch-virtual@pipe-a-edp-1.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-lnl-8/igt@kms_v=
rr@seamless-rr-switch-virtual@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2142">Intel XE#2142</a>) +1 =
other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@pagefault-one-of-many:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164845v1/shard-bmg-5/igt@xe_eudebug_online@pagefault-o=
ne-of-many.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7636">Intel XE#7636</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164845v1/shard-bmg-5/igt@xe_exec_basic@multigpu-once-b=
asic-defer-mmap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-pr=
efetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164845v1/shard-bmg-5/igt@xe_exec_fault_mode@many-execq=
ueues-multi-queue-userptr-invalidate-prefetch.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) =
+2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-close-fd:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164845v1/shard-bmg-5/igt@xe_exec_multi_queue@many-queu=
es-close-fd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/6874">Intel XE#6874</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-malloc-prefetch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4898-bf1886f46aceb23fda764e3b0f2bd483048e9265/shard-bmg-3/igt@xe_exec_=
system_allocator@process-many-malloc-prefetch.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-bmg-6/ig=
t@xe_exec_system_allocator@process-many-malloc-prefetch.html">DMESG-WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7725">Int=
el XE#7725</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164845v1/shard-bmg-5/igt@xe_exec_threads@threads-multi=
-queue-mixed-shared-vm-userptr-rebind.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-concurrent-access-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164845v1/shard-bmg-5/igt@xe_multigpu_svm@mgpu-concurre=
nt-access-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4898-bf1886f46aceb23fda764e3b0f2bd483048e9265/shard-bmg-7/igt@xe_sriov=
_auto_provisioning@resources-released-on-vfs-disabling.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-=
bmg-9/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.ht=
ml">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2594">Intel XE#2594</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4898-bf1886f46aceb23fda764e3b0f2bd483048e9265/shard-bmg-2/igt@kms_flip=
@flip-vs-expired-vblank.html">ABORT</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/5545">Intel XE#5545</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/6652">Intel XE#6652</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-bm=
g-5/igt@kms_flip@flip-vs-expired-vblank.html">PASS</a> +1 other test pass</=
li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4898-bf1886f46aceb23fda764e3b0f2bd483048e9265/shard-bmg-10/igt@kms_hdr=
@invalid-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-bmg-5/igt@kms_hdr@invalid-hd=
r.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4898-bf1886f46aceb23fda764e3b0f2bd483048e9265/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v=
1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-move.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4898-bf1886f46aceb23fda764e3b0f2bd483048e9265/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2=
313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
64845v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4898-bf1886f46aceb23fda764e3b0f2bd483048e9265/shard-bmg-5/igt@kms_tile=
d_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel X=
E#5848</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-164845v1/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern-with-chame=
lium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2509">Intel XE#2509</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7437">Intel XE#7437</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-4898-bf1886f46aceb23fda764e3b0f2bd483048e9265/shard-bmg-5/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-4898-bf1886f46aceb23fda764e3b0f2bd483048e9265/shard-bmg-1/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-4898-bf1886f46aceb23fda764e3b0f2bd483048e9265/shard-bmg-8/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-4898-bf1886f46aceb23fda764e3b0f2bd483048e9265/shard-bmg-1=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-4898-bf1886f46aceb23fda764e3b0f2bd483048e9265/shard-b=
mg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-4898-bf1886f46aceb23fda764e3b0f2bd483048e9265/sha=
rd-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-4898-bf1886f46aceb23fda764e3b0f2bd483048e9265=
/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-4898-bf1886f46aceb23fda764e3b0f2bd483048e=
9265/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-4898-bf1886f46aceb23fda764e3b0f2bd483=
048e9265/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-4898-bf1886f46aceb23fda764e3b0f2b=
d483048e9265/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4898-bf1886f46aceb23fda764=
e3b0f2bd483048e9265/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4898-bf1886f46aceb23fd=
a764e3b0f2bd483048e9265/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4898-bf1886f46aceb=
23fda764e3b0f2bd483048e9265/shard-bmg-2/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4898-bf1886f46=
aceb23fda764e3b0f2bd483048e9265/shard-bmg-9/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4898-bf188=
6f46aceb23fda764e3b0f2bd483048e9265/shard-bmg-1/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4898-b=
f1886f46aceb23fda764e3b0f2bd483048e9265/shard-bmg-8/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-48=
98-bf1886f46aceb23fda764e3b0f2bd483048e9265/shard-bmg-7/igt@xe_module_load@=
load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-4898-bf1886f46aceb23fda764e3b0f2bd483048e9265/shard-bmg-5/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-4898-bf1886f46aceb23fda764e3b0f2bd483048e9265/shard-bmg-7/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-4898-bf1886f46aceb23fda764e3b0f2bd483048e9265/shard-bmg-3/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-4898-bf1886f46aceb23fda764e3b0f2bd483048e9265/shard-bmg-6/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-4898-bf1886f46aceb23fda764e3b0f2bd483048e9265/shard-bmg-1=
0/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-4898-bf1886f46aceb23fda764e3b0f2bd483048e9265/shard-=
bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-4898-bf1886f46aceb23fda764e3b0f2bd483048e9265/s=
hard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-4898-bf1886f46aceb23fda764e3b0f2bd483048e92=
65/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-4898-bf1886f46aceb23fda764e3b0f2bd48304=
8e9265/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405">Intel X=
E#7405</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-164845v1/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-bmg-1/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-164845v1/shard-bmg-10/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/sh=
ard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-bmg-1/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-164845v1/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-bmg-5/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-164845v1/shard-bmg-6/igt@xe_module_load@load.html">DMESG=
-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-16484=
5v1/shard-bmg-6/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-bmg-6/igt@xe_m=
odule_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-164845v1/shard-bmg-8/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1=
/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-bmg-8/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-164845v1/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-bmg-3/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-164845v1/shard-bmg-3/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845=
v1/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-bmg-9/igt@xe_module_l=
oad@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-164845v1/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-bmg-5/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-164845v1/shard-bmg-2/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845=
v1/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-bmg-2/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-164845v1/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164845v1/shard-bmg-7/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-164845v1/shard-bmg-9/igt@xe_module_load@load.html">=
PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
457">Intel XE#2457</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/7405">Intel XE#7405</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7725">Intel XE#7725</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4898-bf1886f46aceb23fda764e3b0f2bd483048e9265 -&gt; xe-pw-164=
845v1</li>
</ul>
<p>IGT_8855: 3c05ee1076cee44a2bc3c176ec21e651f6eca600 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-4898-bf1886f46aceb23fda764e3b0f2bd483048e9265: bf1886f46aceb23fda764e3=
b0f2bd483048e9265<br />
  xe-pw-164845v1: 164845v1</p>

</body>
</html>

--===============7164529147433114472==--
