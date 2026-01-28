Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A785DD35687
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jan 2026 07:07:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F74110E10A;
	Wed, 28 Jan 2026 07:07:16 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F29010E10A;
 Wed, 28 Jan 2026 07:07:15 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4199581427868444095=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/i915/display=3A_Implem?=
 =?utf-8?q?ent_Wa=5F16024710867?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mitul Golani" <mitulkumar.ajitkumar.golani@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 28 Jan 2026 07:07:15 -0000
Message-ID: <176958403518.198693.6447316237717909286@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260127074644.991015-1-mitulkumar.ajitkumar.golani@intel.com>
In-Reply-To: <20260127074644.991015-1-mitulkumar.ajitkumar.golani@intel.com>
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

--===============4199581427868444095==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: Implement Wa_16024710867
URL   : https://patchwork.freedesktop.org/series/160685/
State : failure

== Summary ==

CI Bug Log - changes from xe-4450-81edc0e82197ad273a82b5da0a64c43d5c5a9a5d_FULL -> xe-pw-160685v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-160685v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-160685v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-160685v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2:
    - shard-bmg:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4450-81edc0e82197ad273a82b5da0a64c43d5c5a9a5d/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160685v1/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2.html

  
New tests
---------

  New tests have been introduced between xe-4450-81edc0e82197ad273a82b5da0a64c43d5c5a9a5d_FULL and xe-pw-160685v1_FULL:

### New IGT tests (1) ###

  * igt@kms_cursor_crc:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in xe-pw-160685v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#2233])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160685v1/shard-bmg-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#1124])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160685v1/shard-bmg-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_bw@linear-tiling-4-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#367])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160685v1/shard-bmg-8/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [PASS][6] -> [INCOMPLETE][7] ([Intel XE#7084])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4450-81edc0e82197ad273a82b5da0a64c43d5c5a9a5d/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160685v1/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][8] -> [DMESG-WARN][9] ([Intel XE#5354])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4450-81edc0e82197ad273a82b5da0a64c43d5c5a9a5d/shard-bmg-4/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160685v1/shard-bmg-2/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html

  * igt@kms_fbcon_fbt@psr:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#776])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160685v1/shard-bmg-8/igt@kms_fbcon_fbt@psr.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [PASS][11] -> [FAIL][12] ([Intel XE#301] / [Intel XE#3149]) +1 other test fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4450-81edc0e82197ad273a82b5da0a64c43d5c5a9a5d/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160685v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#4141]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160685v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-b:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#6886]) +3 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160685v1/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-b.html

  * igt@kms_setmode@basic:
    - shard-bmg:          [PASS][15] -> [FAIL][16] ([Intel XE#6361]) +1 other test fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4450-81edc0e82197ad273a82b5da0a64c43d5c5a9a5d/shard-bmg-8/igt@kms_setmode@basic.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160685v1/shard-bmg-3/igt@kms_setmode@basic.html

  * igt@kms_setmode@basic@pipe-a-edp-1:
    - shard-lnl:          [PASS][17] -> [FAIL][18] ([Intel XE#6361]) +1 other test fail
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4450-81edc0e82197ad273a82b5da0a64c43d5c5a9a5d/shard-lnl-5/igt@kms_setmode@basic@pipe-a-edp-1.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160685v1/shard-lnl-3/igt@kms_setmode@basic@pipe-a-edp-1.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][19] -> [FAIL][20] ([Intel XE#4459]) +1 other test fail
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4450-81edc0e82197ad273a82b5da0a64c43d5c5a9a5d/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160685v1/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@xe_eudebug_online@pagefault-one-of-many:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#6665])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160685v1/shard-bmg-8/igt@xe_eudebug_online@pagefault-one-of-many.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#7136])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160685v1/shard-bmg-8/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-prefetch.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-priority-smem:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#6874])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160685v1/shard-bmg-8/igt@xe_exec_multi_queue@few-execs-preempt-mode-priority-smem.html

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-free-huge:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#4943])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160685v1/shard-bmg-8/igt@xe_exec_system_allocator@many-large-execqueues-mmap-free-huge.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#4733])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160685v1/shard-bmg-8/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html

  
#### Possible fixes ####

  * igt@kms_atomic_transition@plane-all-transition@pipe-a-dp-2:
    - shard-bmg:          [DMESG-FAIL][26] ([Intel XE#5545]) -> [PASS][27] +2 other tests pass
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4450-81edc0e82197ad273a82b5da0a64c43d5c5a9a5d/shard-bmg-2/igt@kms_atomic_transition@plane-all-transition@pipe-a-dp-2.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160685v1/shard-bmg-7/igt@kms_atomic_transition@plane-all-transition@pipe-a-dp-2.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [FAIL][28] ([Intel XE#6715]) -> [PASS][29]
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4450-81edc0e82197ad273a82b5da0a64c43d5c5a9a5d/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160685v1/shard-bmg-10/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-bmg:          [DMESG-FAIL][30] ([Intel XE#5208]) -> [PASS][31]
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4450-81edc0e82197ad273a82b5da0a64c43d5c5a9a5d/shard-bmg-2/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160685v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][32] ([Intel XE#1503]) -> [PASS][33]
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4450-81edc0e82197ad273a82b5da0a64c43d5c5a9a5d/shard-bmg-4/igt@kms_hdr@invalid-hdr.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160685v1/shard-bmg-1/igt@kms_hdr@invalid-hdr.html

  * igt@kms_psr@psr-sprite-render@edp-1:
    - shard-lnl:          [DMESG-WARN][34] ([Intel XE#7063]) -> [PASS][35] +1 other test pass
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4450-81edc0e82197ad273a82b5da0a64c43d5c5a9a5d/shard-lnl-3/igt@kms_psr@psr-sprite-render@edp-1.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160685v1/shard-lnl-2/igt@kms_psr@psr-sprite-render@edp-1.html

  * igt@xe_exec_system_allocator@process-many-large-malloc-bo-unmap-nomemset:
    - shard-bmg:          [SKIP][36] ([Intel XE#6703]) -> [PASS][37] +27 other tests pass
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4450-81edc0e82197ad273a82b5da0a64c43d5c5a9a5d/shard-bmg-2/igt@xe_exec_system_allocator@process-many-large-malloc-bo-unmap-nomemset.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160685v1/shard-bmg-7/igt@xe_exec_system_allocator@process-many-large-malloc-bo-unmap-nomemset.html

  * igt@xe_sriov_vram@vf-access-beyond:
    - shard-bmg:          [FAIL][38] ([Intel XE#5937]) -> [PASS][39] +1 other test pass
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4450-81edc0e82197ad273a82b5da0a64c43d5c5a9a5d/shard-bmg-9/igt@xe_sriov_vram@vf-access-beyond.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160685v1/shard-bmg-9/igt@xe_sriov_vram@vf-access-beyond.html

  * igt@xe_vm@bind-array-many:
    - shard-bmg:          [SKIP][40] ([Intel XE#6557] / [Intel XE#6703]) -> [PASS][41]
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4450-81edc0e82197ad273a82b5da0a64c43d5c5a9a5d/shard-bmg-2/igt@xe_vm@bind-array-many.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160685v1/shard-bmg-7/igt@xe_vm@bind-array-many.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-bmg:          [SKIP][42] ([Intel XE#6703]) -> [SKIP][43] ([Intel XE#2327])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4450-81edc0e82197ad273a82b5da0a64c43d5c5a9a5d/shard-bmg-2/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160685v1/shard-bmg-1/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-bmg:          [SKIP][44] ([Intel XE#6703]) -> [SKIP][45] ([Intel XE#2314] / [Intel XE#2894])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4450-81edc0e82197ad273a82b5da0a64c43d5c5a9a5d/shard-bmg-2/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160685v1/shard-bmg-1/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs:
    - shard-bmg:          [SKIP][46] ([Intel XE#6703]) -> [SKIP][47] ([Intel XE#2887]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4450-81edc0e82197ad273a82b5da0a64c43d5c5a9a5d/shard-bmg-2/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160685v1/shard-bmg-1/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-bmg:          [SKIP][48] ([Intel XE#6703]) -> [SKIP][49] ([Intel XE#2321])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4450-81edc0e82197ad273a82b5da0a64c43d5c5a9a5d/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160685v1/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][50] ([Intel XE#6703]) -> [SKIP][51] ([Intel XE#2311]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4450-81edc0e82197ad273a82b5da0a64c43d5c5a9a5d/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160685v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][52] ([Intel XE#6703]) -> [SKIP][53] ([Intel XE#2313])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4450-81edc0e82197ad273a82b5da0a64c43d5c5a9a5d/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160685v1/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][54] ([Intel XE#3544]) -> [SKIP][55] ([Intel XE#3374] / [Intel XE#3544])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4450-81edc0e82197ad273a82b5da0a64c43d5c5a9a5d/shard-bmg-9/igt@kms_hdr@brightness-with-hdr.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160685v1/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-bmg:          [SKIP][56] ([Intel XE#6703]) -> [SKIP][57] ([Intel XE#6886])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4450-81edc0e82197ad273a82b5da0a64c43d5c5a9a5d/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160685v1/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf:
    - shard-bmg:          [SKIP][58] ([Intel XE#1406] / [Intel XE#6703]) -> [SKIP][59] ([Intel XE#1406] / [Intel XE#1489])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4450-81edc0e82197ad273a82b5da0a64c43d5c5a9a5d/shard-bmg-2/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160685v1/shard-bmg-1/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][60] ([Intel XE#2509]) -> [SKIP][61] ([Intel XE#2426])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4450-81edc0e82197ad273a82b5da0a64c43d5c5a9a5d/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160685v1/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:
    - shard-bmg:          [SKIP][62] ([Intel XE#6703]) -> [SKIP][63] ([Intel XE#2322])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4450-81edc0e82197ad273a82b5da0a64c43d5c5a9a5d/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160685v1/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind:
    - shard-bmg:          [SKIP][64] ([Intel XE#6703]) -> [SKIP][65] ([Intel XE#7136])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4450-81edc0e82197ad273a82b5da0a64c43d5c5a9a5d/shard-bmg-2/igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160685v1/shard-bmg-1/igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind.html

  * igt@xe_exec_multi_queue@one-queue-preempt-mode-close-fd-smem:
    - shard-bmg:          [SKIP][66] ([Intel XE#6703]) -> [SKIP][67] ([Intel XE#6874]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4450-81edc0e82197ad273a82b5da0a64c43d5c5a9a5d/shard-bmg-2/igt@xe_exec_multi_queue@one-queue-preempt-mode-close-fd-smem.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160685v1/shard-bmg-1/igt@xe_exec_multi_queue@one-queue-preempt-mode-close-fd-smem.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-huge-nomemset:
    - shard-bmg:          [SKIP][68] ([Intel XE#6703]) -> [SKIP][69] ([Intel XE#4943])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4450-81edc0e82197ad273a82b5da0a64c43d5c5a9a5d/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-huge-nomemset.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160685v1/shard-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-huge-nomemset.html

  * igt@xe_vm@munmap-style-unbind-many-front:
    - shard-lnl:          [DMESG-WARN][70] ([Intel XE#7063]) -> [DMESG-WARN][71] ([Intel XE#4537] / [Intel XE#7063]) +1 other test dmesg-warn
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4450-81edc0e82197ad273a82b5da0a64c43d5c5a9a5d/shard-lnl-3/igt@xe_vm@munmap-style-unbind-many-front.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160685v1/shard-lnl-2/igt@xe_vm@munmap-style-unbind-many-front.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4537]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4537
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
  [Intel XE#5354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5937]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5937
  [Intel XE#6361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361
  [Intel XE#6557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557
  [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
  [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
  [Intel XE#6715]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6715
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#7063]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7063
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776


Build changes
-------------

  * Linux: xe-4450-81edc0e82197ad273a82b5da0a64c43d5c5a9a5d -> xe-pw-160685v1

  IGT_8719: 399f1e1cd9d38f0d0ab2c55a9ade415cc8248959 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4450-81edc0e82197ad273a82b5da0a64c43d5c5a9a5d: 81edc0e82197ad273a82b5da0a64c43d5c5a9a5d
  xe-pw-160685v1: 160685v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160685v1/index.html

--===============4199581427868444095==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: Implement Wa_16024710867</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160685/">https://patchwork.freedesktop.org/series/160685/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160685v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160685v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4450-81edc0e82197ad273a82b5da0a64c43d5c5a9a5d_FULL -&gt; xe-pw-160685v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-160685v1_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-160685v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-160685v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4450-81edc0e82197ad273a82b5da0a64c43d5c5a9a5d/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160685v1/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-4450-81edc0e82197ad273a82b5da0a64c43d5c5a9a5d_FULL and xe-pw-160685v1_FULL:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_cursor_crc:<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-160685v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160685v1/shard-bmg-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233">Intel XE#2233</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160685v1/shard-bmg-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160685v1/shard-bmg-8/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4450-81edc0e82197ad273a82b5da0a64c43d5c5a9a5d/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160685v1/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4450-81edc0e82197ad273a82b5da0a64c43d5c5a9a5d/shard-bmg-4/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160685v1/shard-bmg-2/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354">Intel XE#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160685v1/shard-bmg-8/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4450-81edc0e82197ad273a82b5da0a64c43d5c5a9a5d/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160685v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160685v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-b:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160685v1/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4450-81edc0e82197ad273a82b5da0a64c43d5c5a9a5d/shard-bmg-8/igt@kms_setmode@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160685v1/shard-bmg-3/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361">Intel XE#6361</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4450-81edc0e82197ad273a82b5da0a64c43d5c5a9a5d/shard-lnl-5/igt@kms_setmode@basic@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160685v1/shard-lnl-3/igt@kms_setmode@basic@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361">Intel XE#6361</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4450-81edc0e82197ad273a82b5da0a64c43d5c5a9a5d/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160685v1/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459">Intel XE#4459</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@pagefault-one-of-many:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160685v1/shard-bmg-8/igt@xe_eudebug_online@pagefault-one-of-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160685v1/shard-bmg-8/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-priority-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160685v1/shard-bmg-8/igt@xe_exec_multi_queue@few-execs-preempt-mode-priority-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-free-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160685v1/shard-bmg-8/igt@xe_exec_system_allocator@many-large-execqueues-mmap-free-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160685v1/shard-bmg-8/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-transition@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4450-81edc0e82197ad273a82b5da0a64c43d5c5a9a5d/shard-bmg-2/igt@kms_atomic_transition@plane-all-transition@pipe-a-dp-2.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160685v1/shard-bmg-7/igt@kms_atomic_transition@plane-all-transition@pipe-a-dp-2.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4450-81edc0e82197ad273a82b5da0a64c43d5c5a9a5d/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6715">Intel XE#6715</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160685v1/shard-bmg-10/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4450-81edc0e82197ad273a82b5da0a64c43d5c5a9a5d/shard-bmg-2/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208">Intel XE#5208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160685v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4450-81edc0e82197ad273a82b5da0a64c43d5c5a9a5d/shard-bmg-4/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160685v1/shard-bmg-1/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-render@edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4450-81edc0e82197ad273a82b5da0a64c43d5c5a9a5d/shard-lnl-3/igt@kms_psr@psr-sprite-render@edp-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7063">Intel XE#7063</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160685v1/shard-lnl-2/igt@kms_psr@psr-sprite-render@edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-malloc-bo-unmap-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4450-81edc0e82197ad273a82b5da0a64c43d5c5a9a5d/shard-bmg-2/igt@xe_exec_system_allocator@process-many-large-malloc-bo-unmap-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160685v1/shard-bmg-7/igt@xe_exec_system_allocator@process-many-large-malloc-bo-unmap-nomemset.html">PASS</a> +27 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_vram@vf-access-beyond:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4450-81edc0e82197ad273a82b5da0a64c43d5c5a9a5d/shard-bmg-9/igt@xe_sriov_vram@vf-access-beyond.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5937">Intel XE#5937</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160685v1/shard-bmg-9/igt@xe_sriov_vram@vf-access-beyond.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_vm@bind-array-many:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4450-81edc0e82197ad273a82b5da0a64c43d5c5a9a5d/shard-bmg-2/igt@xe_vm@bind-array-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160685v1/shard-bmg-7/igt@xe_vm@bind-array-many.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4450-81edc0e82197ad273a82b5da0a64c43d5c5a9a5d/shard-bmg-2/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160685v1/shard-bmg-1/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4450-81edc0e82197ad273a82b5da0a64c43d5c5a9a5d/shard-bmg-2/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160685v1/shard-bmg-1/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4450-81edc0e82197ad273a82b5da0a64c43d5c5a9a5d/shard-bmg-2/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160685v1/shard-bmg-1/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4450-81edc0e82197ad273a82b5da0a64c43d5c5a9a5d/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160685v1/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4450-81edc0e82197ad273a82b5da0a64c43d5c5a9a5d/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160685v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4450-81edc0e82197ad273a82b5da0a64c43d5c5a9a5d/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160685v1/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4450-81edc0e82197ad273a82b5da0a64c43d5c5a9a5d/shard-bmg-9/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160685v1/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4450-81edc0e82197ad273a82b5da0a64c43d5c5a9a5d/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160685v1/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4450-81edc0e82197ad273a82b5da0a64c43d5c5a9a5d/shard-bmg-2/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160685v1/shard-bmg-1/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4450-81edc0e82197ad273a82b5da0a64c43d5c5a9a5d/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160685v1/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4450-81edc0e82197ad273a82b5da0a64c43d5c5a9a5d/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160685v1/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4450-81edc0e82197ad273a82b5da0a64c43d5c5a9a5d/shard-bmg-2/igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160685v1/shard-bmg-1/igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-preempt-mode-close-fd-smem:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4450-81edc0e82197ad273a82b5da0a64c43d5c5a9a5d/shard-bmg-2/igt@xe_exec_multi_queue@one-queue-preempt-mode-close-fd-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160685v1/shard-bmg-1/igt@xe_exec_multi_queue@one-queue-preempt-mode-close-fd-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-huge-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4450-81edc0e82197ad273a82b5da0a64c43d5c5a9a5d/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160685v1/shard-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-many-front:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4450-81edc0e82197ad273a82b5da0a64c43d5c5a9a5d/shard-lnl-3/igt@xe_vm@munmap-style-unbind-many-front.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7063">Intel XE#7063</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160685v1/shard-lnl-2/igt@xe_vm@munmap-style-unbind-many-front.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4537">Intel XE#4537</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7063">Intel XE#7063</a>) +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4450-81edc0e82197ad273a82b5da0a64c43d5c5a9a5d -&gt; xe-pw-160685v1</li>
</ul>
<p>IGT_8719: 399f1e1cd9d38f0d0ab2c55a9ade415cc8248959 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4450-81edc0e82197ad273a82b5da0a64c43d5c5a9a5d: 81edc0e82197ad273a82b5da0a64c43d5c5a9a5d<br />
  xe-pw-160685v1: 160685v1</p>

</body>
</html>

--===============4199581427868444095==--
