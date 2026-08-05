Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21594C56201
	for <intel-xe@archiver.kernel.org>; Wed,  5 Aug 2026 10:49:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE59010E1DE;
	Wed,  5 Aug 2026 10:49:55 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEDA810EDE8;
 Wed,  5 Aug 2026 10:49:54 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7139591938345256498=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/i915=3A_HDMI/PCON_DSC_?=
 =?utf-8?q?prep_fixes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 05 Aug 2026 10:49:54 -0000
Message-ID: <178592699483.21461.2373804162201912542@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260805035027.3473398-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20260805035027.3473398-1-ankit.k.nautiyal@intel.com>
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

--===============7139591938345256498==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915: HDMI/PCON DSC prep fixes
URL   : https://patchwork.freedesktop.org/series/171622/
State : success

== Summary ==

CI Bug Log - changes from xe-5543-c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23_FULL -> xe-pw-171622v1_FULL
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

  Here are the changes found in xe-pw-171622v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][1] ([Intel XE#7679])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171622v1/shard-bmg-1/igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][2] ([Intel XE#2887])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171622v1/shard-bmg-1/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [PASS][3] -> [FAIL][4] ([Intel XE#301] / [Intel XE#3149]) +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5543-c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171622v1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2311])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171622v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-pri-indfb-multidraw:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#2313]) +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171622v1/shard-bmg-10/igt@kms_frontbuffer_tracking@psrhdr-2p-pri-indfb-multidraw.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          NOTRUN -> [FAIL][7] ([Intel XE#1729] / [Intel XE#7424])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171622v1/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotreplug-lateclose:
    - shard-bmg:          [SKIP][8] ([Intel XE#8749]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5543-c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23/shard-bmg-5/igt@core_hotunplug@hotreplug-lateclose.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171622v1/shard-bmg-3/igt@core_hotunplug@hotreplug-lateclose.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [INCOMPLETE][10] ([Intel XE#7084] / [Intel XE#8150]) -> [PASS][11] +1 other test pass
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5543-c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171622v1/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
    - shard-lnl:          [FAIL][12] ([Intel XE#301]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5543-c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171622v1/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html

  * igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:
    - shard-bmg:          [DMESG-WARN][14] ([Intel XE#7774]) -> [PASS][15] +1 other test pass
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5543-c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23/shard-bmg-5/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171622v1/shard-bmg-3/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html

  * igt@xe_exec_system_allocator@many-64k-malloc-prefetch-madvise:
    - shard-bmg:          [SKIP][16] ([Intel XE#8589]) -> [PASS][17] +54 other tests pass
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5543-c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23/shard-bmg-5/igt@xe_exec_system_allocator@many-64k-malloc-prefetch-madvise.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171622v1/shard-bmg-3/igt@xe_exec_system_allocator@many-64k-malloc-prefetch-madvise.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early:
    - shard-bmg:          [ABORT][18] ([Intel XE#8007]) -> [PASS][19]
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5543-c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171622v1/shard-bmg-10/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html

  
#### Warnings ####

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-bmg:          [SKIP][20] ([Intel XE#8589]) -> [SKIP][21] ([Intel XE#2327])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5543-c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23/shard-bmg-5/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171622v1/shard-bmg-3/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-180:
    - shard-bmg:          [FAIL][22] -> [SKIP][23] ([Intel XE#1124])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5543-c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23/shard-bmg-5/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171622v1/shard-bmg-3/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          [SKIP][24] ([Intel XE#8589]) -> [SKIP][25] ([Intel XE#2887]) +2 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5543-c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23/shard-bmg-5/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171622v1/shard-bmg-3/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_chamelium_hpd@dp-hpd-after-hibernate:
    - shard-bmg:          [SKIP][26] ([Intel XE#8589]) -> [SKIP][27] ([Intel XE#2252])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5543-c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23/shard-bmg-5/igt@kms_chamelium_hpd@dp-hpd-after-hibernate.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171622v1/shard-bmg-3/igt@kms_chamelium_hpd@dp-hpd-after-hibernate.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-lnl:          [SKIP][28] ([Intel XE#309] / [Intel XE#7343] / [Intel XE#7935]) -> [SKIP][29] ([Intel XE#309] / [Intel XE#7343])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5543-c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171622v1/shard-lnl-5/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_dsc@dsc-basic:
    - shard-bmg:          [SKIP][30] ([Intel XE#8589]) -> [SKIP][31] ([Intel XE#8265])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5543-c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23/shard-bmg-5/igt@kms_dsc@dsc-basic.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171622v1/shard-bmg-3/igt@kms_dsc@dsc-basic.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-bmg:          [SKIP][32] ([Intel XE#8589]) -> [SKIP][33] ([Intel XE#4156] / [Intel XE#7425])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5543-c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23/shard-bmg-5/igt@kms_fbcon_fbt@fbc.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171622v1/shard-bmg-3/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-rte:
    - shard-bmg:          [SKIP][34] ([Intel XE#8589]) -> [SKIP][35] ([Intel XE#4141]) +2 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5543-c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-rte.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171622v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][36] ([Intel XE#8589]) -> [SKIP][37] ([Intel XE#2311]) +4 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5543-c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-shrfb-plflip-blt.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171622v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-mmap-wc:
    - shard-bmg:          [SKIP][38] ([Intel XE#8589]) -> [SKIP][39] ([Intel XE#7061])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5543-c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-mmap-wc.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171622v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][40] ([Intel XE#8589]) -> [SKIP][41] ([Intel XE#2313]) +4 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5543-c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171622v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc:
    - shard-bmg:          [SKIP][42] ([Intel XE#8589]) -> [SKIP][43] ([Intel XE#7061] / [Intel XE#7356])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5543-c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171622v1/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][44] ([Intel XE#3544]) -> [SKIP][45] ([Intel XE#3374] / [Intel XE#3544])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5543-c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23/shard-bmg-10/igt@kms_hdr@brightness-with-hdr.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171622v1/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-bmg:          [SKIP][46] ([Intel XE#8589]) -> [SKIP][47] ([Intel XE#1489])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5543-c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171622v1/shard-bmg-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][48] ([Intel XE#2426] / [Intel XE#5848]) -> [SKIP][49] ([Intel XE#2509] / [Intel XE#7437])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5543-c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171622v1/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@lobf:
    - shard-bmg:          [SKIP][50] ([Intel XE#8589]) -> [SKIP][51] ([Intel XE#2168] / [Intel XE#7444])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5543-c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23/shard-bmg-5/igt@kms_vrr@lobf.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171622v1/shard-bmg-3/igt@kms_vrr@lobf.html

  * igt@xe_exec_multi_queue@few-execs-dyn-priority:
    - shard-bmg:          [SKIP][52] ([Intel XE#8589]) -> [SKIP][53] ([Intel XE#8364]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5543-c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23/shard-bmg-5/igt@xe_exec_multi_queue@few-execs-dyn-priority.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171622v1/shard-bmg-3/igt@xe_exec_multi_queue@few-execs-dyn-priority.html

  * igt@xe_pat@xa-app-transient-media-off:
    - shard-bmg:          [SKIP][54] ([Intel XE#8589]) -> [SKIP][55] ([Intel XE#7590])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5543-c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23/shard-bmg-5/igt@xe_pat@xa-app-transient-media-off.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171622v1/shard-bmg-3/igt@xe_pat@xa-app-transient-media-off.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7444]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7444
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7774]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774
  [Intel XE#7935]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8589]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589
  [Intel XE#8749]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8749


Build changes
-------------

  * Linux: xe-5543-c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23 -> xe-pw-171622v1

  IGT_9038: 9038
  xe-5543-c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23: c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23
  xe-pw-171622v1: 171622v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171622v1/index.html

--===============7139591938345256498==
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
<tr><td><b>Series:</b></td><td>drm/i915: HDMI/PCON DSC prep fixes</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/171622/">https://patchwork.freedesktop.org/series/171622/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171622v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171622v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5543-c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23_FULL -&gt; xe-pw-171622v1_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-171622v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171622v1/shard-bmg-1/igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171622v1/shard-bmg-1/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5543-c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171622v1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171622v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171622v1/shard-bmg-10/igt@kms_frontbuffer_tracking@psrhdr-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171622v1/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug-lateclose:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5543-c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23/shard-bmg-5/igt@core_hotunplug@hotreplug-lateclose.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8749">Intel XE#8749</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171622v1/shard-bmg-3/igt@core_hotunplug@hotreplug-lateclose.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5543-c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171622v1/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5543-c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171622v1/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5543-c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23/shard-bmg-5/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774">Intel XE#7774</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171622v1/shard-bmg-3/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-malloc-prefetch-madvise:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5543-c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23/shard-bmg-5/igt@xe_exec_system_allocator@many-64k-malloc-prefetch-madvise.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171622v1/shard-bmg-3/igt@xe_exec_system_allocator@many-64k-malloc-prefetch-madvise.html">PASS</a> +54 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5543-c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171622v1/shard-bmg-10/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5543-c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23/shard-bmg-5/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171622v1/shard-bmg-3/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5543-c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23/shard-bmg-5/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171622v1/shard-bmg-3/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5543-c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23/shard-bmg-5/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171622v1/shard-bmg-3/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-hibernate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5543-c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23/shard-bmg-5/igt@kms_chamelium_hpd@dp-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171622v1/shard-bmg-3/igt@kms_chamelium_hpd@dp-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5543-c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935">Intel XE#7935</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171622v1/shard-lnl-5/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5543-c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23/shard-bmg-5/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171622v1/shard-bmg-3/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5543-c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23/shard-bmg-5/igt@kms_fbcon_fbt@fbc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171622v1/shard-bmg-3/igt@kms_fbcon_fbt@fbc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156">Intel XE#4156</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425">Intel XE#7425</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-rte:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5543-c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171622v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5543-c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171622v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5543-c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171622v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5543-c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171622v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5543-c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171622v1/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5543-c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23/shard-bmg-10/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171622v1/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5543-c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171622v1/shard-bmg-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5543-c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171622v1/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437">Intel XE#7437</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5543-c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23/shard-bmg-5/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171622v1/shard-bmg-3/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7444">Intel XE#7444</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-dyn-priority:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5543-c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23/shard-bmg-5/igt@xe_exec_multi_queue@few-execs-dyn-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171622v1/shard-bmg-3/igt@xe_exec_multi_queue@few-execs-dyn-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@xa-app-transient-media-off:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5543-c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23/shard-bmg-5/igt@xe_pat@xa-app-transient-media-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171622v1/shard-bmg-3/igt@xe_pat@xa-app-transient-media-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5543-c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23 -&gt; xe-pw-171622v1</li>
</ul>
<p>IGT_9038: 9038<br />
  xe-5543-c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23: c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23<br />
  xe-pw-171622v1: 171622v1</p>

</body>
</html>

--===============7139591938345256498==--
