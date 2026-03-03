Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3153BEC047E
	for <intel-xe@archiver.kernel.org>; Tue,  3 Mar 2026 09:53:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA53910E0A5;
	Tue,  3 Mar 2026 09:53:22 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2011610E0A5;
 Tue,  3 Mar 2026 09:53:22 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1760165924120044838=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/xe/multi=5Fqueue=3A_Fi?=
 =?utf-8?q?x_error_path_skipping_group_xa_cleanup?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 03 Mar 2026 09:53:22 -0000
Message-ID: <177253160210.309150.12704755168754831879@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260302212447.208218-1-shuicheng.lin@intel.com>
In-Reply-To: <20260302212447.208218-1-shuicheng.lin@intel.com>
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

--===============1760165924120044838==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/multi_queue: Fix error path skipping group xa cleanup
URL   : https://patchwork.freedesktop.org/series/162455/
State : success

== Summary ==

CI Bug Log - changes from xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc_FULL -> xe-pw-162455v1_FULL
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

  Here are the changes found in xe-pw-162455v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [SKIP][1] ([Intel XE#1124])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/shard-lnl-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
    - shard-lnl:          NOTRUN -> [SKIP][2] ([Intel XE#367] / [Intel XE#7354])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/shard-lnl-1/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][3] ([Intel XE#2887]) +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/shard-lnl-1/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-lnl:          NOTRUN -> [SKIP][4] ([Intel XE#306] / [Intel XE#7358])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/shard-lnl-1/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_frames@dp-crc-multiple:
    - shard-lnl:          NOTRUN -> [SKIP][5] ([Intel XE#373])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/shard-lnl-1/igt@kms_chamelium_frames@dp-crc-multiple.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-lnl:          NOTRUN -> [SKIP][6] ([Intel XE#1424])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/shard-lnl-1/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-lnl:          NOTRUN -> [SKIP][7] ([Intel XE#2321] / [Intel XE#7355])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/shard-lnl-1/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][8] ([Intel XE#309] / [Intel XE#7343])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/shard-lnl-1/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#1421])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/shard-lnl-1/igt@kms_flip@2x-flip-vs-modeset.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-plflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#6312] / [Intel XE#651])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#7061] / [Intel XE#7356]) +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#656]) +5 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping:
    - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#7283])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/shard-lnl-1/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#3307])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/shard-lnl-1/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#1499])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/shard-lnl-1/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@xe_eudebug@basic-vm-bind-extended-discovery:
    - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#4837])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/shard-lnl-1/igt@xe_eudebug@basic-vm-bind-extended-discovery.html

  * igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-vram:
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#4837] / [Intel XE#6665])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/shard-lnl-1/igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-vram.html

  * igt@xe_evict@evict-threads-large:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#6540] / [Intel XE#688]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/shard-lnl-1/igt@xe_evict@evict-threads-large.html

  * igt@xe_exec_balancer@no-exec-parallel-basic:
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#7482]) +2 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/shard-lnl-1/igt@xe_exec_balancer@no-exec-parallel-basic.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#1392])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/shard-lnl-1/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr.html

  * igt@xe_exec_fault_mode@once-multi-queue-invalid-fault:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#7136]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/shard-lnl-1/igt@xe_exec_fault_mode@once-multi-queue-invalid-fault.html

  * igt@xe_exec_multi_queue@one-queue-close-fd-smem:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#6874]) +4 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/shard-lnl-1/igt@xe_exec_multi_queue@one-queue-close-fd-smem.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-single-vma:
    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#6196])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/shard-lnl-1/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-single-vma.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#2833])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/shard-lnl-1/igt@xe_live_ktest@xe_eudebug.html

  * igt@xe_peer2peer@write:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#1061] / [Intel XE#7326] / [Intel XE#7353])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/shard-lnl-1/igt@xe_peer2peer@write.html

  * igt@xe_sriov_flr@flr-twice:
    - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#4273])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/shard-lnl-1/igt@xe_sriov_flr@flr-twice.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1:
    - shard-lnl:          [FAIL][27] ([Intel XE#3718] / [Intel XE#7265]) -> [PASS][28] +1 other test pass
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc/shard-lnl-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/shard-lnl-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1.html

  
#### Warnings ####

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-lnl:          [SKIP][29] ([Intel XE#7059] / [Intel XE#7415]) -> [SKIP][30] ([Intel XE#7059] / [Intel XE#7085]) +3 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc/shard-lnl-5/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/shard-lnl-2/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_cdclk@mode-transition@pipe-b-edp-1:
    - shard-lnl:          [SKIP][31] ([Intel XE#4417] / [Intel XE#7407]) -> [SKIP][32] ([Intel XE#4417] / [Intel XE#5447]) +3 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc/shard-lnl-2/igt@kms_cdclk@mode-transition@pipe-b-edp-1.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/shard-lnl-5/igt@kms_cdclk@mode-transition@pipe-b-edp-1.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-lnl:          [SKIP][33] ([Intel XE#323] / [Intel XE#7412]) -> [SKIP][34] ([Intel XE#323] / [Intel XE#6035]) +2 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc/shard-lnl-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/shard-lnl-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-lnl:          [SKIP][35] ([Intel XE#4354] / [Intel XE#7410]) -> [SKIP][36] ([Intel XE#4354] / [Intel XE#5882])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc/shard-lnl-7/igt@kms_dp_link_training@non-uhbr-mst.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/shard-lnl-1/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-lnl:          [SKIP][37] ([Intel XE#4331] / [Intel XE#7418]) -> [SKIP][38] ([Intel XE#4331] / [Intel XE#7227])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc/shard-lnl-1/igt@kms_dp_linktrain_fallback@dsc-fallback.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/shard-lnl-7/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x:
    - shard-lnl:          [SKIP][39] ([Intel XE#7179] / [Intel XE#7411]) -> [SKIP][40] ([Intel XE#7179]) +3 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x.html

  * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5:
    - shard-lnl:          [SKIP][41] ([Intel XE#7130] / [Intel XE#7409]) -> [SKIP][42] ([Intel XE#7130]) +5 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc/shard-lnl-1/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/shard-lnl-8/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-lnl:          [SKIP][43] ([Intel XE#362] / [Intel XE#7420]) -> [SKIP][44] ([Intel XE#362] / [Intel XE#5848]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc/shard-lnl-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/shard-lnl-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][45], [SKIP][46], [PASS][47], [PASS][48], [PASS][49], [PASS][50], [PASS][51], [PASS][52], [PASS][53], [PASS][54], [PASS][55], [PASS][56], [PASS][57], [PASS][58], [PASS][59], [PASS][60], [PASS][61], [PASS][62], [PASS][63], [PASS][64], [PASS][65], [PASS][66], [PASS][67], [PASS][68], [PASS][69], [PASS][70]) ([Intel XE#2457] / [Intel XE#7405]) -> ([DMESG-WARN][71], [DMESG-WARN][72], [DMESG-WARN][73], [DMESG-WARN][74], [DMESG-WARN][75], [DMESG-WARN][76], [DMESG-WARN][77], [DMESG-WARN][78], [DMESG-WARN][79], [DMESG-WARN][80], [DMESG-WARN][81], [DMESG-WARN][82], [DMESG-WARN][83], [DMESG-WARN][84], [DMESG-WARN][85], [DMESG-WARN][86], [DMESG-WARN][87], [DMESG-WARN][88], [DMESG-WARN][89], [DMESG-WARN][90], [DMESG-WARN][91], [DMESG-WARN][92], [DMESG-WARN][93], [DMESG-WARN][94], [DMESG-WARN][95]) ([Intel XE#7433])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc/shard-bmg-9/igt@xe_module_load@load.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc/shard-bmg-8/igt@xe_module_load@load.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc/shard-bmg-1/igt@xe_module_load@load.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc/shard-bmg-5/igt@xe_module_load@load.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc/shard-bmg-4/igt@xe_module_load@load.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc/shard-bmg-6/igt@xe_module_load@load.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc/shard-bmg-8/igt@xe_module_load@load.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc/shard-bmg-8/igt@xe_module_load@load.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc/shard-bmg-8/igt@xe_module_load@load.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc/shard-bmg-4/igt@xe_module_load@load.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc/shard-bmg-5/igt@xe_module_load@load.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc/shard-bmg-9/igt@xe_module_load@load.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc/shard-bmg-9/igt@xe_module_load@load.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc/shard-bmg-7/igt@xe_module_load@load.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc/shard-bmg-7/igt@xe_module_load@load.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc/shard-bmg-6/igt@xe_module_load@load.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc/shard-bmg-6/igt@xe_module_load@load.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc/shard-bmg-3/igt@xe_module_load@load.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc/shard-bmg-2/igt@xe_module_load@load.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc/shard-bmg-3/igt@xe_module_load@load.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc/shard-bmg-1/igt@xe_module_load@load.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc/shard-bmg-1/igt@xe_module_load@load.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc/shard-bmg-3/igt@xe_module_load@load.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc/shard-bmg-2/igt@xe_module_load@load.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc/shard-bmg-2/igt@xe_module_load@load.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc/shard-bmg-2/igt@xe_module_load@load.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/shard-bmg-5/igt@xe_module_load@load.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/shard-bmg-6/igt@xe_module_load@load.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/shard-bmg-6/igt@xe_module_load@load.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/shard-bmg-6/igt@xe_module_load@load.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/shard-bmg-2/igt@xe_module_load@load.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/shard-bmg-2/igt@xe_module_load@load.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/shard-bmg-2/igt@xe_module_load@load.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/shard-bmg-2/igt@xe_module_load@load.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/shard-bmg-2/igt@xe_module_load@load.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/shard-bmg-9/igt@xe_module_load@load.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/shard-bmg-9/igt@xe_module_load@load.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/shard-bmg-9/igt@xe_module_load@load.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/shard-bmg-9/igt@xe_module_load@load.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/shard-bmg-9/igt@xe_module_load@load.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/shard-bmg-7/igt@xe_module_load@load.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/shard-bmg-1/igt@xe_module_load@load.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/shard-bmg-1/igt@xe_module_load@load.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/shard-bmg-8/igt@xe_module_load@load.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/shard-bmg-8/igt@xe_module_load@load.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/shard-bmg-4/igt@xe_module_load@load.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/shard-bmg-4/igt@xe_module_load@load.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/shard-bmg-4/igt@xe_module_load@load.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/shard-bmg-5/igt@xe_module_load@load.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/shard-bmg-5/igt@xe_module_load@load.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/shard-bmg-5/igt@xe_module_load@load.html

  
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#5447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5447
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5882
  [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
  [Intel XE#6196]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6196
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
  [Intel XE#7130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7130
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
  [Intel XE#7227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7227
  [Intel XE#7265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7265
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7326]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7353]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353
  [Intel XE#7354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7354
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
  [Intel XE#7407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7407
  [Intel XE#7409]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7409
  [Intel XE#7410]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7410
  [Intel XE#7411]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7411
  [Intel XE#7412]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7412
  [Intel XE#7415]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7415
  [Intel XE#7418]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7418
  [Intel XE#7420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7420
  [Intel XE#7433]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7433
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482


Build changes
-------------

  * Linux: xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc -> xe-pw-162455v1

  IGT_8776: 8776
  xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc: df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc
  xe-pw-162455v1: 162455v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/index.html

--===============1760165924120044838==
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
<tr><td><b>Series:</b></td><td>drm/xe/multi_queue: Fix error path skipping =
group xa cleanup</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/162455/">https://patchwork.freedesktop.org/series/162455/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-162455v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-162455v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887=
bc672bc_FULL -&gt; xe-pw-162455v1_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-162455v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162455v1/shard-lnl-1/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-64bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162455v1/shard-lnl-1/igt@kms_bw@linear-tiling-2-displa=
ys-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7354">Intel XE#7354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162455v1/shard-lnl-1/igt@kms_ccs@bad-rotation-90-y-til=
ed-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162455v1/shard-lnl-1/igt@kms_chamelium_color@ctm-green=
-to-red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/306">Intel XE#306</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-multiple:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162455v1/shard-lnl-1/igt@kms_chamelium_frames@dp-crc-m=
ultiple.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162455v1/shard-lnl-1/igt@kms_cursor_crc@cursor-onscree=
n-256x85.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162455v1/shard-lnl-1/igt@kms_cursor_crc@cursor-rapid-m=
ovement-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162455v1/shard-lnl-1/igt@kms_cursor_legacy@cursorb-vs-=
flipa-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/309">Intel XE#309</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162455v1/shard-lnl-1/igt@kms_flip@2x-flip-vs-modeset.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162455v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcd=
rrs-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162455v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcd=
rrs-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162455v1/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-=
2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +5 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162455v1/shard-lnl-1/igt@kms_plane@pixel-format-4-tile=
d-mtl-rc-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162455v1/shard-lnl-1/igt@kms_plane_scaling@intel-max-s=
rc-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3307">Intel XE#3307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162455v1/shard-lnl-1/igt@kms_vrr@seamless-rr-switch-dr=
rs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-extended-discovery:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162455v1/shard-lnl-1/igt@xe_eudebug@basic-vm-bind-exte=
nded-discovery.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162455v1/shard-lnl-1/igt@xe_eudebug_online@writes-cach=
ing-sram-bb-sram-target-vram.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162455v1/shard-lnl-1/igt@xe_evict@evict-threads-large.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/6540">Intel XE#6540</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-parallel-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162455v1/shard-lnl-1/igt@xe_exec_balancer@no-exec-para=
llel-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7482">Intel XE#7482</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162455v1/shard-lnl-1/igt@xe_exec_basic@multigpu-no-exe=
c-bindexecqueue-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-invalid-fault:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162455v1/shard-lnl-1/igt@xe_exec_fault_mode@once-multi=
-queue-invalid-fault.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-close-fd-smem:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162455v1/shard-lnl-1/igt@xe_exec_multi_queue@one-queue=
-close-fd-smem.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/6874">Intel XE#6874</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-single-vm=
a:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162455v1/shard-lnl-1/igt@xe_exec_system_allocator@pat-=
index-madvise-pat-idx-uc-comp-single-vma.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/6196">Intel XE#6196</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162455v1/shard-lnl-1/igt@xe_live_ktest@xe_eudebug.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2833">Intel XE#2833</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162455v1/shard-lnl-1/igt@xe_peer2peer@write.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">=
Intel XE#1061</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/7326">Intel XE#7326</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7353">Intel XE#7353</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-twice:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162455v1/shard-lnl-1/igt@xe_sriov_flr@flr-twice.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/42=
73">Intel XE#4273</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1:<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc/shard-lnl-6/igt@kms_asyn=
c_flips@alternate-sync-async-flip@pipe-a-edp-1.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7265">Inte=
l XE#7265</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-162455v1/shard-lnl-6/igt@kms_async_flips@alternate-sync-async-flip@pip=
e-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc/shard-lnl-5/igt@kms_big_=
fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7059">Intel XE#7059</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7415">Inte=
l XE#7415</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-162455v1/shard-lnl-2/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-=
180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7059">Intel XE#7059</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>) +3 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc/shard-lnl-2/igt@kms_cdcl=
k@mode-transition@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4417">Intel XE#4417</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7407">Intel XE#7407</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/sh=
ard-lnl-5/igt@kms_cdclk@mode-transition@pipe-b-edp-1.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417">Intel XE#441=
7</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5447=
">Intel XE#5447</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc/shard-lnl-3/igt@kms_curs=
or_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/323">Intel XE#323</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/7412">Intel XE#7412</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-162455v1/shard-lnl-5/igt@kms_cursor_legacy@shor=
t-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE=
#323</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6=
035">Intel XE#6035</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc/shard-lnl-7/igt@kms_dp_l=
ink_training@non-uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7410">Intel XE#7410</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/shard-l=
nl-1/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5882">Intel XE=
#5882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc/shard-lnl-1/igt@kms_dp_l=
inktrain_fallback@dsc-fallback.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4331">Intel XE#4331</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7418">Intel XE#7418</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/sh=
ard-lnl-7/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331">Intel XE#433=
1</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7227=
">Intel XE#7227</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflec=
t-x:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc/shard-lnl-4/igt@kms_flip=
_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179">I=
ntel XE#7179</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/7411">Intel XE#7411</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-162455v1/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32b=
pp-yuv-linear-to-32bpp-yuv-linear-reflect-x.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7179">Intel XE#7179</a>) +3=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc/shard-lnl-1/igt@kms_plan=
e@pixel-format-4-tiled-modifier@pipe-a-plane-5.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7130">Intel XE#7130</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7409">Inte=
l XE#7409</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-162455v1/shard-lnl-8/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-=
a-plane-5.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7130">Intel XE#7130</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc/shard-lnl-7/igt@kms_tile=
d_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7420">Intel XE#=
7420</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
162455v1/shard-lnl-7/igt@kms_tiled_display@basic-test-pattern-with-chameliu=
m.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/362">Intel XE#362</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/5848">Intel XE#5848</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc/shard-bmg-9/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc/shard-bmg-8/igt@xe_=
module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc/shard-bmg-1/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc/shard-bmg-5=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc/shard-b=
mg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc/sha=
rd-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc=
/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc6=
72bc/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce88=
7bc672bc/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-4644-df73f8b4c9fc3c0a2668cf84f7e6=
ce887bc672bc/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4644-df73f8b4c9fc3c0a2668cf84=
f7e6ce887bc672bc/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4644-df73f8b4c9fc3c0a2668=
cf84f7e6ce887bc672bc/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4644-df73f8b4c9fc3c0a=
2668cf84f7e6ce887bc672bc/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4644-df73f8b4c9fc=
3c0a2668cf84f7e6ce887bc672bc/shard-bmg-7/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4644-df73f8b4=
c9fc3c0a2668cf84f7e6ce887bc672bc/shard-bmg-7/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4644-df73=
f8b4c9fc3c0a2668cf84f7e6ce887bc672bc/shard-bmg-6/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4644-=
df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc/shard-bmg-6/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4=
644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc/shard-bmg-3/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc/shard-bmg-2/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc/shard-bmg-3/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc/shard-bmg-1/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc/shard-bmg-1/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc/shard-bmg-=
3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc/shard-=
bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc/sh=
ard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672b=
c/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405">Intel XE#740=
5</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-16=
2455v1/shard-bmg-5/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/shard-bmg-6/igt@x=
e_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-162455v1/shard-bmg-6/igt@xe_module_load@load.html"=
>DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-162455v1/shard-bmg-6/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/shard-bmg-2/ig=
t@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-162455v1/shard-bmg-2/igt@xe_module_load@load.ht=
ml">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-162455v1/shard-bmg-2/igt@xe_module_load@load.html">DMESG-WARN</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/shard-bmg-2=
/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-162455v1/shard-bmg-2/igt@xe_module_load@load=
.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-162455v1/shard-bmg-9/igt@xe_module_load@load.html">DMESG-WARN</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/shard-bm=
g-9/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/shard-bmg-9/igt@xe_module_load@l=
oad.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-162455v1/shard-bmg-9/igt@xe_module_load@load.html">DMESG-WARN</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/shard=
-bmg-9/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/shard-bmg-7/igt@xe_module_loa=
d@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-162455v1/shard-bmg-1/igt@xe_module_load@load.html">DMESG-WARN<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/sh=
ard-bmg-1/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/shard-bmg-8/igt@xe_module_=
load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-162455v1/shard-bmg-8/igt@xe_module_load@load.html">DMESG-WA=
RN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1=
/shard-bmg-4/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/shard-bmg-4/igt@xe_modu=
le_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-162455v1/shard-bmg-4/igt@xe_module_load@load.html">DMESG=
-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-16245=
5v1/shard-bmg-5/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162455v1/shard-bmg-5/igt@xe_m=
odule_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-162455v1/shard-bmg-5/igt@xe_module_load@load.html">DM=
ESG-WARN</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/7433">Intel XE#7433</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc -&gt; xe-pw-162=
455v1</li>
</ul>
<p>IGT_8776: 8776<br />
  xe-4644-df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc: df73f8b4c9fc3c0a2668cf8=
4f7e6ce887bc672bc<br />
  xe-pw-162455v1: 162455v1</p>

</body>
</html>

--===============1760165924120044838==--
