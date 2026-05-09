Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97084CD3447
	for <intel-xe@archiver.kernel.org>; Sat,  9 May 2026 07:06:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F22BF10E257;
	Sat,  9 May 2026 07:06:14 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 095C610E257;
 Sat,  9 May 2026 07:06:14 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1609488656668564803=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/i915/dmc=3A_fix_assert?=
 =?utf-8?q?=5Fdmc=5Floaded_WARN_during_async_firmware_load_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "James Xiong" <james.xiong@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 09 May 2026 07:06:14 -0000
Message-ID: <177831037402.54472.11389304326991617824@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260508181329.666762-1-james.xiong@intel.com>
In-Reply-To: <20260508181329.666762-1-james.xiong@intel.com>
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

--===============1609488656668564803==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/dmc: fix assert_dmc_loaded WARN during async firmware load (rev2)
URL   : https://patchwork.freedesktop.org/series/166156/
State : success

== Summary ==

CI Bug Log - changes from xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd_FULL -> xe-pw-166156v2_FULL
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

  Here are the changes found in xe-pw-166156v2_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_bw@connected-linear-tiling-1-displays-target-1920x1080p:
    - shard-bmg:          [PASS][1] -> [SKIP][2] ([Intel XE#7679])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-9/igt@kms_bw@connected-linear-tiling-1-displays-target-1920x1080p.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-bmg-3/igt@kms_bw@connected-linear-tiling-1-displays-target-1920x1080p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#2652]) +3 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-bmg-2/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-lnl:          NOTRUN -> [SKIP][4] ([Intel XE#373])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-lnl-7/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-bmg:          [PASS][5] -> [SKIP][6] ([Intel XE#2291] / [Intel XE#7343])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [PASS][7] -> [SKIP][8] ([Intel XE#2316]) +6 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-8/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [PASS][9] -> [FAIL][10] ([Intel XE#301]) +2 other tests fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [PASS][11] -> [FAIL][12] ([Intel XE#301] / [Intel XE#3149]) +1 other test fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#7178] / [Intel XE#7349])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#6312] / [Intel XE#651])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#7905]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-lnl-7/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [PASS][16] -> [SKIP][17] ([Intel XE#7865]) +8 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-9/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-fullscreen.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-bmg-3/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@hdr-2p-rte:
    - shard-bmg:          [PASS][18] -> [SKIP][19] ([Intel XE#7905]) +9 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-8/igt@kms_frontbuffer_tracking@hdr-2p-rte.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-bmg-3/igt@kms_frontbuffer_tracking@hdr-2p-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#656] / [Intel XE#7905]) +2 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][21] -> [SKIP][22] ([Intel XE#1503])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-7/igt@kms_hdr@invalid-hdr.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-bmg-10/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb16161616f:
    - shard-bmg:          [PASS][23] -> [SKIP][24] ([Intel XE#7922]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-7/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb16161616f.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-bmg-10/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb16161616f.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-bmg:          [PASS][25] -> [SKIP][26] ([Intel XE#1503] / [Intel XE#7915])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-9/igt@kms_hdr@static-toggle-dpms.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-bmg-3/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f:
    - shard-bmg:          [PASS][27] -> [SKIP][28] ([Intel XE#7915]) +3 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-6/igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-bmg-1/igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#6901])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-lnl-7/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping:
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#7283])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-lnl-7/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping.html

  * igt@kms_psr@pr-dpms:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#1406])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-lnl-7/igt@kms_psr@pr-dpms.html

  * igt@kms_vrr@negative-basic:
    - shard-bmg:          [PASS][32] -> [SKIP][33] ([Intel XE#1499])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-8/igt@kms_vrr@negative-basic.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-bmg-3/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
    - shard-lnl:          [PASS][34] -> [FAIL][35] ([Intel XE#2142]) +1 other test fail
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-lnl-3/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-lnl-3/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html

  * igt@xe_eudebug_online@pagefault-write-stress:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#7636])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-lnl-7/igt@xe_eudebug_online@pagefault-write-stress.html

  * igt@xe_evict@evict-beng-large-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#6540] / [Intel XE#688])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-lnl-7/igt@xe_evict@evict-beng-large-multi-vm.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [PASS][38] -> [INCOMPLETE][39] ([Intel XE#6321])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_balancer@once-virtual-basic:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#7482]) +2 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-lnl-7/igt@xe_exec_balancer@once-virtual-basic.html

  * igt@xe_exec_fault_mode@once-multi-queue:
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#7136])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-lnl-7/igt@xe_exec_fault_mode@once-multi-queue.html

  * igt@xe_exec_multi_queue@two-queues-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#6874]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-lnl-7/igt@xe_exec_multi_queue@two-queues-userptr.html

  * igt@xe_multigpu_svm@mgpu-concurrent-access-prefetch:
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#6964])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-lnl-7/igt@xe_multigpu_svm@mgpu-concurrent-access-prefetch.html

  * igt@xe_pat@xa-app-transient-media-off:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#7590] / [Intel XE#7772])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-lnl-7/igt@xe_pat@xa-app-transient-media-off.html

  * igt@xe_sriov_vfio@region-info:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#7724])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-lnl-7/igt@xe_sriov_vfio@region-info.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-bmg:          [SKIP][46] ([Intel XE#2291]) -> [PASS][47] +1 other test pass
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-bmg-2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-bmg:          [SKIP][48] ([Intel XE#2291] / [Intel XE#7343]) -> [PASS][49] +1 other test pass
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [SKIP][50] ([Intel XE#2316]) -> [PASS][51] +4 other tests pass
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-3/igt@kms_flip@2x-nonexisting-fb.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][52] ([Intel XE#7905]) -> [PASS][53] +5 other tests pass
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-3/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-blt.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][54] ([Intel XE#7865]) -> [PASS][55] +8 other tests pass
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-3/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-render.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-bmg-2/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-render.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][56], [PASS][57], [PASS][58], [PASS][59], [PASS][60], [PASS][61], [PASS][62], [PASS][63], [SKIP][64], [PASS][65], [PASS][66], [PASS][67], [PASS][68], [PASS][69], [PASS][70], [PASS][71], [PASS][72], [PASS][73], [PASS][74], [PASS][75], [PASS][76], [PASS][77], [PASS][78], [PASS][79], [PASS][80], [PASS][81]) ([Intel XE#2457] / [Intel XE#7405]) -> ([PASS][82], [PASS][83], [PASS][84], [PASS][85], [PASS][86], [PASS][87], [PASS][88], [PASS][89], [PASS][90], [PASS][91], [PASS][92], [PASS][93], [PASS][94], [PASS][95], [PASS][96], [PASS][97], [PASS][98], [PASS][99], [PASS][100], [PASS][101], [PASS][102], [PASS][103], [PASS][104])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-6/igt@xe_module_load@load.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-4/igt@xe_module_load@load.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-6/igt@xe_module_load@load.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-10/igt@xe_module_load@load.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-3/igt@xe_module_load@load.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-3/igt@xe_module_load@load.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-10/igt@xe_module_load@load.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-3/igt@xe_module_load@load.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-9/igt@xe_module_load@load.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-4/igt@xe_module_load@load.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-5/igt@xe_module_load@load.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-7/igt@xe_module_load@load.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-8/igt@xe_module_load@load.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-5/igt@xe_module_load@load.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-6/igt@xe_module_load@load.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-7/igt@xe_module_load@load.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-7/igt@xe_module_load@load.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-2/igt@xe_module_load@load.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-2/igt@xe_module_load@load.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-10/igt@xe_module_load@load.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-9/igt@xe_module_load@load.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-9/igt@xe_module_load@load.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-9/igt@xe_module_load@load.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-8/igt@xe_module_load@load.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-1/igt@xe_module_load@load.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-1/igt@xe_module_load@load.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-bmg-3/igt@xe_module_load@load.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-bmg-8/igt@xe_module_load@load.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-bmg-7/igt@xe_module_load@load.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-bmg-2/igt@xe_module_load@load.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-bmg-3/igt@xe_module_load@load.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-bmg-3/igt@xe_module_load@load.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-bmg-3/igt@xe_module_load@load.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-bmg-5/igt@xe_module_load@load.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-bmg-5/igt@xe_module_load@load.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-bmg-4/igt@xe_module_load@load.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-bmg-4/igt@xe_module_load@load.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-bmg-10/igt@xe_module_load@load.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-bmg-1/igt@xe_module_load@load.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-bmg-6/igt@xe_module_load@load.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-bmg-1/igt@xe_module_load@load.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-bmg-9/igt@xe_module_load@load.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-bmg-4/igt@xe_module_load@load.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-bmg-6/igt@xe_module_load@load.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-bmg-6/igt@xe_module_load@load.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-bmg-10/igt@xe_module_load@load.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-bmg-1/igt@xe_module_load@load.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-bmg-2/igt@xe_module_load@load.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-bmg-9/igt@xe_module_load@load.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-lnl:          [ABORT][105] ([Intel XE#7914]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-lnl-7/igt@xe_wedged@wedged-mode-toggle.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-lnl-7/igt@xe_wedged@wedged-mode-toggle.html

  
#### Warnings ####

  * igt@kms_content_protection@legacy-hdcp14:
    - shard-bmg:          [FAIL][107] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) -> [SKIP][108] ([Intel XE#7642])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-5/igt@kms_content_protection@legacy-hdcp14.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-bmg-3/igt@kms_content_protection@legacy-hdcp14.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][109] ([Intel XE#2312] / [Intel XE#7905]) -> [SKIP][110] ([Intel XE#2311]) +7 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][111] ([Intel XE#2311]) -> [SKIP][112] ([Intel XE#2312] / [Intel XE#7905]) +9 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-spr-indfb-move:
    - shard-bmg:          [SKIP][113] ([Intel XE#2311]) -> [SKIP][114] ([Intel XE#7905]) +10 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-9/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-spr-indfb-move.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-bmg-3/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][115] ([Intel XE#4141]) -> [SKIP][116] ([Intel XE#2312] / [Intel XE#7905]) +8 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][117] ([Intel XE#2312] / [Intel XE#7905]) -> [SKIP][118] ([Intel XE#4141]) +2 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][119] ([Intel XE#7905]) -> [SKIP][120] ([Intel XE#2311]) +8 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-shrfb-pgflip-blt.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][121] ([Intel XE#2313]) -> [SKIP][122] ([Intel XE#2312] / [Intel XE#7905]) +12 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][123] ([Intel XE#7905]) -> [SKIP][124] ([Intel XE#2313]) +7 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-indfb-pgflip-blt.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][125] ([Intel XE#2312] / [Intel XE#7905]) -> [SKIP][126] ([Intel XE#2313]) +6 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][127] ([Intel XE#2313]) -> [SKIP][128] ([Intel XE#7905]) +12 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-8/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-bmg-3/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][129] ([Intel XE#3544] / [Intel XE#7915] / [Intel XE#7916]) -> [SKIP][130] ([Intel XE#3544] / [Intel XE#7916])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb2101010:
    - shard-bmg:          [SKIP][131] ([Intel XE#7915]) -> [SKIP][132] ([Intel XE#7916]) +1 other test skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-1/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb2101010.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-bmg-5/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb2101010.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-bmg:          [SKIP][133] ([Intel XE#3904] / [Intel XE#7342]) -> [SKIP][134] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342]) +1 other test skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-bmg-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-bmg:          [SKIP][135] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342]) -> [SKIP][136] ([Intel XE#3904] / [Intel XE#7342])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-3/igt@kms_rotation_crc@sprite-rotation-270.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-bmg-6/igt@kms_rotation_crc@sprite-rotation-270.html

  
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7724
  [Intel XE#7772]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7772
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#7914]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7914
  [Intel XE#7915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915
  [Intel XE#7916]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7916
  [Intel XE#7922]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7922


Build changes
-------------

  * Linux: xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd -> xe-pw-166156v2

  IGT_8900: 529869b7d0fba64ed67819111079ff269bc8159a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd: 77eab7037c06504f1d405c099a263cfe1ff84dcd
  xe-pw-166156v2: 166156v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/index.html

--===============1609488656668564803==
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
<tr><td><b>Series:</b></td><td>drm/i915/dmc: fix assert_dmc_loaded WARN dur=
ing async firmware load (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/166156/">https://patchwork.freedesktop.org/series/166156/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-166156v2/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-166156v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5028-77eab7037c06504f1d405c099a263cfe1=
ff84dcd_FULL -&gt; xe-pw-166156v2_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-166156v2_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-9/igt@kms_bw@c=
onnected-linear-tiling-1-displays-target-1920x1080p.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-bmg=
-3/igt@kms_bw@connected-linear-tiling-1-displays-target-1920x1080p.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679=
">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166156v2/shard-bmg-2/igt@kms_ccs@bad-rotation-90-4-til=
ed-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166156v2/shard-lnl-7/igt@kms_chamelium_hpd@hdmi-hpd-fo=
r-each-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-5/igt@kms_curs=
or_legacy@cursorb-vs-flipb-varying-size.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-bmg-3/igt@kms_c=
ursor_legacy@cursorb-vs-flipb-varying-size.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE=
#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-8/igt@kms_flip=
@2x-plain-flip-fb-recreate-interruptible.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-bmg-3/igt@kms_=
flip@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +=
6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-lnl-4/igt@kms_flip=
@flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-lnl-1/igt@kms_fli=
p@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +2 other =
tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-lnl-5/igt@kms_flip=
@flip-vs-expired-vblank@c-edp1.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-lnl-8/igt@kms_flip@flip-=
vs-expired-vblank@c-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) +1 other =
test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166156v2/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bp=
p-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349">Intel XE#7=
349</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166156v2/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs=
-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/6312">Intel XE#6312</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166156v2/shard-lnl-7/igt@kms_frontbuffer_tracking@fbch=
dr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-9/igt@kms_fron=
tbuffer_tracking@hdr-1p-primscrn-spr-indfb-fullscreen.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-b=
mg-3/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-fullscreen.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7865">Intel XE#7865</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-rte:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@hdr-2p-rte.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-bmg-3/igt@kms_frontbuffer_t=
racking@hdr-2p-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166156v2/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-=
2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) =
+2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-7/igt@kms_hdr@=
invalid-hdr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-166156v2/shard-bmg-10/igt@kms_hdr@invalid-hdr.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">In=
tel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb16161616f:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-7/igt@kms_hdr@=
invalid-hdr@pipe-a-hdmi-a-3-xrgb16161616f.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-bmg-10/igt@km=
s_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb16161616f.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/7922">Intel XE#7922</a>=
) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-9/igt@kms_hdr@=
static-toggle-dpms.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-166156v2/shard-bmg-3/igt@kms_hdr@static-toggle-dpms=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1503">Intel XE#1503</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7915">Intel XE#7915</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-6/igt@kms_hdr@=
static-toggle@pipe-a-hdmi-a-3-xrgb16161616f.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-bmg-1/igt@k=
ms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915=
</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166156v2/shard-lnl-7/igt@kms_joiner@basic-big-joiner.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/6901">Intel XE#6901</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamp=
ing:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166156v2/shard-lnl-7/igt@kms_plane@pixel-format-y-tile=
d-gen12-rc-ccs-cc-modifier-source-clamping.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-dpms:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166156v2/shard-lnl-7/igt@kms_psr@pr-dpms.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Int=
el XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-8/igt@kms_vrr@=
negative-basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-166156v2/shard-bmg-3/igt@kms_vrr@negative-basic.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/149=
9">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-lnl-3/igt@kms_vrr@=
seamless-rr-switch-virtual@pipe-a-edp-1.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-lnl-3/igt@kms_v=
rr@seamless-rr-switch-virtual@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2142">Intel XE#2142</a>) +1 =
other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@pagefault-write-stress:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166156v2/shard-lnl-7/igt@xe_eudebug_online@pagefault-w=
rite-stress.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7636">Intel XE#7636</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166156v2/shard-lnl-7/igt@xe_evict@evict-beng-large-mul=
ti-vm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/6540">Intel XE#6540</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-5/igt@xe_evict=
@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-bmg-2/igt@xe_evict@evic=
t-mixed-many-threads-small.html">INCOMPLETE</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-virtual-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166156v2/shard-lnl-7/igt@xe_exec_balancer@once-virtual=
-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/7482">Intel XE#7482</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166156v2/shard-lnl-7/igt@xe_exec_fault_mode@once-multi=
-queue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/7136">Intel XE#7136</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166156v2/shard-lnl-7/igt@xe_exec_multi_queue@two-queue=
s-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/6874">Intel XE#6874</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-concurrent-access-prefetch:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166156v2/shard-lnl-7/igt@xe_multigpu_svm@mgpu-concurre=
nt-access-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@xa-app-transient-media-off:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166156v2/shard-lnl-7/igt@xe_pat@xa-app-transient-media=
-off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7590">Intel XE#7590</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7772">Intel XE#7772</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_vfio@region-info:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166156v2/shard-lnl-7/igt@xe_sriov_vfio@region-info.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/7724">Intel XE#7724</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-3/igt@kms_curs=
or_legacy@2x-long-flip-vs-cursor-legacy.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-b=
mg-2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html">PASS</a> +1 =
other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-3/igt@kms_curs=
or_legacy@cursorb-vs-flipb-legacy.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2=
/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">PASS</a> +=
1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-3/igt@kms_flip=
@2x-nonexisting-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-bmg-6/igt@kms_flip@2x-=
nonexisting-fb.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7=
905</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
66156v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-ind=
fb-draw-blt.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#=
7865</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
166156v2/shard-bmg-2/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indf=
b-draw-render.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-6/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-4/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-6/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-1=
0/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-=
bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/sh=
ard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dc=
d/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1f=
f84dcd/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263c=
fe1ff84dcd/shard-bmg-9/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a=
263cfe1ff84dcd/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405=
c099a263cfe1ff84dcd/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1=
d405c099a263cfe1ff84dcd/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c065=
04f1d405c099a263cfe1ff84dcd/shard-bmg-8/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037=
c06504f1d405c099a263cfe1ff84dcd/shard-bmg-5/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab=
7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-6/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5028-7=
7eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-7/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-50=
28-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-7/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-2/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-2/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-10/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-9/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-=
9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-=
bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/sh=
ard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dc=
d/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-5028-77eab7037c06504f1d405c099a263cfe1ff=
84dcd/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405">Intel XE=
#7405</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-166156v2/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-bmg-8/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-166156v2/shard-bmg-7/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shar=
d-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-bmg-3/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-166156v2/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-bmg-3/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-166156v2/shard-bmg-5/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shar=
d-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-bmg-4/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-166156v2/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-bmg-10/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-166156v2/shard-bmg-1/igt@xe_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/sha=
rd-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-bmg-1/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-166156v2/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-bmg-4/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-166156v2/shard-bmg-6/igt@xe_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/sha=
rd-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-bmg-10/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-166156v2/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-bmg-2/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-166156v2/shard-bmg-9/igt@xe_module_load@load.html">PASS<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-lnl-7/igt@xe_wedge=
d@wedged-mode-toggle.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7914">Intel XE#7914</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2/shard-lnl-7/igt@xe_wedged=
@wedged-mode-toggle.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_content_protection@legacy-hdcp14:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-5/igt@kms_cont=
ent_protection@legacy-hdcp14.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE=
#7374</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-166156v2/shard-bmg-3/igt@kms_content_protection@legacy-hdcp14.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">In=
tel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel =
XE#7905</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-166156v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-mult=
idraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2311">Intel XE#2311</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1661=
56v2/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2312">Intel XE#2312</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-9/igt@kms_fron=
tbuffer_tracking@drrshdr-2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1661=
56v2/shard-bmg-3/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-spr-indfb=
-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/7905">Intel XE#7905</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-9/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4=
141</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
66156v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +8 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Int=
el XE#7905</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-166156v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur=
-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4141">Intel XE#4141</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbcdrrshdr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE=
#7905</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-166156v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-s=
hrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2311">Intel XE#2311</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1661=
56v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-=
onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2312">Intel XE#2312</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbcpsrhdr-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#=
7905</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
166156v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-ind=
fb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2313">Intel XE#2313</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905"=
>Intel XE#7905</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-166156v2/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn=
-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-spr-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@psrhdr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel =
XE#2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-166156v2/shard-bmg-3/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-spr=
-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-1/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3544">Intel XE#3544</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/7916">Intel XE#7916</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2=
/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7916">Intel =
XE#7916</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-1/igt@kms_hdr@=
brightness-with-hdr@pipe-a-hdmi-a-3-xrgb2101010.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166156v2=
/shard-bmg-5/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb2101010.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/7916">Intel XE#7916</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-5/igt@kms_rota=
tion_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#734=
2</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166=
156v2/shard-bmg-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/34=
14">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3904">Intel XE#3904</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd/shard-bmg-3/igt@kms_rota=
tion_crc@sprite-rotation-270.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE=
#7342</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-166156v2/shard-bmg-6/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">In=
tel XE#3904</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/7342">Intel XE#7342</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd -&gt; xe-pw-166=
156v2</li>
</ul>
<p>IGT_8900: 529869b7d0fba64ed67819111079ff269bc8159a @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-5028-77eab7037c06504f1d405c099a263cfe1ff84dcd: 77eab7037c06504f1d405c0=
99a263cfe1ff84dcd<br />
  xe-pw-166156v2: 166156v2</p>

</body>
</html>

--===============1609488656668564803==--
