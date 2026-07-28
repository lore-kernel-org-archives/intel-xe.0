Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FE4BC54F4C
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jul 2026 12:30:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9F5D10E8C7;
	Tue, 28 Jul 2026 12:30:43 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7975910E58C;
 Tue, 28 Jul 2026 12:30:42 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4167178043094972418=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/pagemap=3A_Reset_migra?=
 =?utf-8?q?tion_page_count_on_eviction_retry?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arvind Yadav" <arvind.yadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 28 Jul 2026 12:30:42 -0000
Message-ID: <178524184248.230936.10016444652239217512@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260728090304.1264759-1-arvind.yadav@intel.com>
In-Reply-To: <20260728090304.1264759-1-arvind.yadav@intel.com>
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

--===============4167178043094972418==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/pagemap: Reset migration page count on eviction retry
URL   : https://patchwork.freedesktop.org/series/171165/
State : success

== Summary ==

CI Bug Log - changes from xe-5491-28e3f47d47a61b5e28e7566944479e9c9715d41d_FULL -> xe-pw-171165v1_FULL
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

  Here are the changes found in xe-pw-171165v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - shard-bmg:          [PASS][1] -> [ABORT][2] ([Intel XE#8007]) +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5491-28e3f47d47a61b5e28e7566944479e9c9715d41d/shard-bmg-9/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171165v1/shard-bmg-5/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#1124]) +4 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171165v1/shard-bmg-10/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#2887]) +5 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171165v1/shard-bmg-3/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2652]) +8 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171165v1/shard-bmg-10/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#7358])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171165v1/shard-bmg-8/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2252]) +4 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171165v1/shard-bmg-10/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_content_protection@suspend-resume:
    - shard-bmg:          NOTRUN -> [FAIL][8] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +3 other tests fail
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171165v1/shard-bmg-10/igt@kms_content_protection@suspend-resume.html

  * igt@kms_cursor_crc@cursor-offscreen-256x85:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2320]) +3 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171165v1/shard-bmg-8/igt@kms_cursor_crc@cursor-offscreen-256x85.html

  * igt@kms_dsc@dsc-with-bpc-bigjoiner:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#8265]) +3 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171165v1/shard-bmg-3/igt@kms_dsc@dsc-with-bpc-bigjoiner.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#4422] / [Intel XE#7442])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171165v1/shard-bmg-10/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#7178] / [Intel XE#7351]) +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171165v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#4141]) +3 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171165v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2311]) +20 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171165v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2352] / [Intel XE#7399])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171165v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#7061]) +1 other test skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171165v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2313]) +23 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171165v1/shard-bmg-10/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#4090] / [Intel XE#7443])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171165v1/shard-bmg-8/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#7283]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171165v1/shard-bmg-8/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171165v1/shard-bmg-10/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#1489]) +2 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171165v1/shard-bmg-10/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2234] / [Intel XE#2850]) +5 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171165v1/shard-bmg-10/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#3904] / [Intel XE#7342])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171165v1/shard-bmg-3/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#1435] / [Intel XE#8695])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171165v1/shard-bmg-8/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_sharpness_filter@invalid-filter-with-plane:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#6503])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171165v1/shard-bmg-10/igt@kms_sharpness_filter@invalid-filter-with-plane.html

  * igt@kms_vrr@flip-basic:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#1499])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171165v1/shard-bmg-8/igt@kms_vrr@flip-basic.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [PASS][27] -> [INCOMPLETE][28] ([Intel XE#6321] / [Intel XE#8355])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5491-28e3f47d47a61b5e28e7566944479e9c9715d41d/shard-bmg-6/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171165v1/shard-bmg-2/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2322] / [Intel XE#7372]) +5 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171165v1/shard-bmg-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@twice-multi-queue-imm:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#8374]) +3 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171165v1/shard-bmg-8/igt@xe_exec_fault_mode@twice-multi-queue-imm.html

  * igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#8364]) +6 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171165v1/shard-bmg-8/igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#8378]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171165v1/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][33], [PASS][34], [PASS][35], [PASS][36], [PASS][37], [PASS][38], [PASS][39], [PASS][40], [PASS][41], [PASS][42], [PASS][43], [PASS][44], [PASS][45], [PASS][46], [PASS][47], [PASS][48], [PASS][49], [PASS][50], [PASS][51], [PASS][52], [PASS][53], [PASS][54], [PASS][55], [PASS][56], [PASS][57]) -> ([PASS][58], [PASS][59], [PASS][60], [PASS][61], [PASS][62], [PASS][63], [PASS][64], [PASS][65], [PASS][66], [PASS][67], [PASS][68], [PASS][69], [PASS][70], [PASS][71], [PASS][72], [PASS][73], [SKIP][74], [DMESG-FAIL][75], [PASS][76], [PASS][77], [PASS][78], [PASS][79], [PASS][80], [PASS][81], [PASS][82], [PASS][83]) ([Intel XE#2457] / [Intel XE#7405] / [Intel XE#7774])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5491-28e3f47d47a61b5e28e7566944479e9c9715d41d/shard-bmg-6/igt@xe_module_load@load.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5491-28e3f47d47a61b5e28e7566944479e9c9715d41d/shard-bmg-5/igt@xe_module_load@load.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5491-28e3f47d47a61b5e28e7566944479e9c9715d41d/shard-bmg-4/igt@xe_module_load@load.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5491-28e3f47d47a61b5e28e7566944479e9c9715d41d/shard-bmg-5/igt@xe_module_load@load.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5491-28e3f47d47a61b5e28e7566944479e9c9715d41d/shard-bmg-5/igt@xe_module_load@load.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5491-28e3f47d47a61b5e28e7566944479e9c9715d41d/shard-bmg-9/igt@xe_module_load@load.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5491-28e3f47d47a61b5e28e7566944479e9c9715d41d/shard-bmg-9/igt@xe_module_load@load.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5491-28e3f47d47a61b5e28e7566944479e9c9715d41d/shard-bmg-9/igt@xe_module_load@load.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5491-28e3f47d47a61b5e28e7566944479e9c9715d41d/shard-bmg-3/igt@xe_module_load@load.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5491-28e3f47d47a61b5e28e7566944479e9c9715d41d/shard-bmg-3/igt@xe_module_load@load.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5491-28e3f47d47a61b5e28e7566944479e9c9715d41d/shard-bmg-3/igt@xe_module_load@load.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5491-28e3f47d47a61b5e28e7566944479e9c9715d41d/shard-bmg-6/igt@xe_module_load@load.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5491-28e3f47d47a61b5e28e7566944479e9c9715d41d/shard-bmg-8/igt@xe_module_load@load.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5491-28e3f47d47a61b5e28e7566944479e9c9715d41d/shard-bmg-8/igt@xe_module_load@load.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5491-28e3f47d47a61b5e28e7566944479e9c9715d41d/shard-bmg-2/igt@xe_module_load@load.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5491-28e3f47d47a61b5e28e7566944479e9c9715d41d/shard-bmg-8/igt@xe_module_load@load.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5491-28e3f47d47a61b5e28e7566944479e9c9715d41d/shard-bmg-10/igt@xe_module_load@load.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5491-28e3f47d47a61b5e28e7566944479e9c9715d41d/shard-bmg-10/igt@xe_module_load@load.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5491-28e3f47d47a61b5e28e7566944479e9c9715d41d/shard-bmg-10/igt@xe_module_load@load.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5491-28e3f47d47a61b5e28e7566944479e9c9715d41d/shard-bmg-7/igt@xe_module_load@load.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5491-28e3f47d47a61b5e28e7566944479e9c9715d41d/shard-bmg-10/igt@xe_module_load@load.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5491-28e3f47d47a61b5e28e7566944479e9c9715d41d/shard-bmg-2/igt@xe_module_load@load.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5491-28e3f47d47a61b5e28e7566944479e9c9715d41d/shard-bmg-2/igt@xe_module_load@load.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5491-28e3f47d47a61b5e28e7566944479e9c9715d41d/shard-bmg-4/igt@xe_module_load@load.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5491-28e3f47d47a61b5e28e7566944479e9c9715d41d/shard-bmg-4/igt@xe_module_load@load.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171165v1/shard-bmg-1/igt@xe_module_load@load.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171165v1/shard-bmg-2/igt@xe_module_load@load.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171165v1/shard-bmg-9/igt@xe_module_load@load.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171165v1/shard-bmg-3/igt@xe_module_load@load.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171165v1/shard-bmg-10/igt@xe_module_load@load.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171165v1/shard-bmg-4/igt@xe_module_load@load.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171165v1/shard-bmg-4/igt@xe_module_load@load.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171165v1/shard-bmg-8/igt@xe_module_load@load.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171165v1/shard-bmg-1/igt@xe_module_load@load.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171165v1/shard-bmg-2/igt@xe_module_load@load.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171165v1/shard-bmg-7/igt@xe_module_load@load.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171165v1/shard-bmg-7/igt@xe_module_load@load.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171165v1/shard-bmg-6/igt@xe_module_load@load.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171165v1/shard-bmg-10/igt@xe_module_load@load.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171165v1/shard-bmg-10/igt@xe_module_load@load.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171165v1/shard-bmg-4/igt@xe_module_load@load.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171165v1/shard-bmg-10/igt@xe_module_load@load.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171165v1/shard-bmg-5/igt@xe_module_load@load.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171165v1/shard-bmg-5/igt@xe_module_load@load.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171165v1/shard-bmg-8/igt@xe_module_load@load.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171165v1/shard-bmg-9/igt@xe_module_load@load.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171165v1/shard-bmg-9/igt@xe_module_load@load.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171165v1/shard-bmg-8/igt@xe_module_load@load.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171165v1/shard-bmg-3/igt@xe_module_load@load.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171165v1/shard-bmg-6/igt@xe_module_load@load.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171165v1/shard-bmg-5/igt@xe_module_load@load.html

  * igt@xe_multigpu_svm@mgpu-xgpu-access-basic:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#6964])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171165v1/shard-bmg-8/igt@xe_multigpu_svm@mgpu-xgpu-access-basic.html

  
#### Possible fixes ####

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [FAIL][85] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][86] +1 other test pass
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5491-28e3f47d47a61b5e28e7566944479e9c9715d41d/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171165v1/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@b-dp2:
    - shard-bmg:          [FAIL][87] ([Intel XE#5408] / [Intel XE#6266]) -> [PASS][88] +1 other test pass
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5491-28e3f47d47a61b5e28e7566944479e9c9715d41d/shard-bmg-7/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-dp2.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171165v1/shard-bmg-3/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-dp2.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:
    - shard-bmg:          [ABORT][89] ([Intel XE#8007]) -> [PASS][90] +1 other test pass
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5491-28e3f47d47a61b5e28e7566944479e9c9715d41d/shard-bmg-9/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171165v1/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html

  
#### Warnings ####

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][91] ([Intel XE#301] / [Intel XE#3149]) -> [FAIL][92] ([Intel XE#301]) +1 other test fail
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5491-28e3f47d47a61b5e28e7566944479e9c9715d41d/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171165v1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-bmg:          [SKIP][93] ([Intel XE#1435]) -> [SKIP][94] ([Intel XE#1435] / [Intel XE#8695])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5491-28e3f47d47a61b5e28e7566944479e9c9715d41d/shard-bmg-5/igt@kms_setmode@invalid-clone-exclusive-crtc.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171165v1/shard-bmg-6/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][95] ([Intel XE#1729] / [Intel XE#7424]) -> [SKIP][96] ([Intel XE#2426] / [Intel XE#5848])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5491-28e3f47d47a61b5e28e7566944479e9c9715d41d/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171165v1/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-bmg:          [ABORT][97] ([Intel XE#8007]) -> [DMESG-WARN][98] ([Intel XE#5545])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5491-28e3f47d47a61b5e28e7566944479e9c9715d41d/shard-bmg-7/igt@xe_wedged@wedged-at-any-timeout.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171165v1/shard-bmg-3/igt@xe_wedged@wedged-at-any-timeout.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4090]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#5408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#6266]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442
  [Intel XE#7443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7443
  [Intel XE#7774]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8695


Build changes
-------------

  * Linux: xe-5491-28e3f47d47a61b5e28e7566944479e9c9715d41d -> xe-pw-171165v1

  IGT_9027: 9027
  xe-5491-28e3f47d47a61b5e28e7566944479e9c9715d41d: 28e3f47d47a61b5e28e7566944479e9c9715d41d
  xe-pw-171165v1: 171165v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171165v1/index.html

--===============4167178043094972418==
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
<tr><td><b>Series:</b></td><td>drm/pagemap: Reset migration page count on e=
viction retry</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/171165/">https://patchwork.freedesktop.org/series/171165/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-171165v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-171165v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5491-28e3f47d47a61b5e28e7566944479e9c9=
715d41d_FULL -&gt; xe-pw-171165v1_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-171165v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5491-28e3f47d47a61b5e28e7566944479e9c9715d41d/shard-bmg-9/igt@core_hot=
unplug@unbind-rebind.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-171165v1/shard-bmg-5/igt@core_hotunplug@unbind-re=
bind.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/8007">Intel XE#8007</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171165v1/shard-bmg-10/igt@kms_big_fb@y-tiled-max-hw-st=
ride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171165v1/shard-bmg-3/igt@kms_ccs@bad-pixel-format-4-ti=
led-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2887">Intel XE#2887</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171165v1/shard-bmg-10/igt@kms_ccs@crc-primary-basic-4-=
tiled-lnl-ccs@pipe-b-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +8 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171165v1/shard-bmg-8/igt@kms_chamelium_color_pipeline@=
plane-lut1d-ctm3x4-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171165v1/shard-bmg-10/igt@kms_chamelium_hpd@common-hpd=
-after-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2252">Intel XE#2252</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@suspend-resume:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171165v1/shard-bmg-10/igt@kms_content_protection@suspe=
nd-resume.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1178">Intel XE#1178</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +3 other=
 tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-256x85:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171165v1/shard-bmg-8/igt@kms_cursor_crc@cursor-offscre=
en-256x85.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2320">Intel XE#2320</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-bigjoiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171165v1/shard-bmg-3/igt@kms_dsc@dsc-with-bpc-bigjoine=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/8265">Intel XE#8265</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171165v1/shard-bmg-10/igt@kms_fbc_dirty_rect@fbc-dirty=
-rectangle-different-formats.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7442">Intel XE#7442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171165v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>)=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171165v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc=
-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +3 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171165v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcd=
rrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +20 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171165v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcd=
rrs-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2352">Intel XE#2352</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171165v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc=
psrhdr-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171165v1/shard-bmg-10/igt@kms_frontbuffer_tracking@psr=
hdr-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +23 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171165v1/shard-bmg-8/igt@kms_joiner@switch-modeset-ult=
ra-joiner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4090">Intel XE#4090</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7443">Intel XE#7443</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171165v1/shard-bmg-8/igt@kms_plane@pixel-format-4-tile=
d-lnl-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171165v1/shard-bmg-10/igt@kms_pm_rpm@dpms-lpsp.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/143=
9">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3141">Intel XE#3141</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7383">Intel XE#7383</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171165v1/shard-bmg-10/igt@kms_psr2_sf@fbc-pr-cursor-pl=
ane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171165v1/shard-bmg-10/igt@kms_psr@fbc-psr2-cursor-plan=
e-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171165v1/shard-bmg-3/igt@kms_rotation_crc@primary-rota=
tion-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3904">Intel XE#3904</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171165v1/shard-bmg-8/igt@kms_setmode@basic-clone-singl=
e-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1435">Intel XE#1435</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/8695">Intel XE#8695</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-plane:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171165v1/shard-bmg-10/igt@kms_sharpness_filter@invalid=
-filter-with-plane.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171165v1/shard-bmg-8/igt@kms_vrr@flip-basic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">=
Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5491-28e3f47d47a61b5e28e7566944479e9c9715d41d/shard-bmg-6/igt@xe_evict=
@evict-beng-mixed-many-threads-small.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171165v1/shard-bmg-2/igt@xe_evict=
@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355">Intel XE=
#8355</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171165v1/shard-bmg-8/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372"=
>Intel XE#7372</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-imm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171165v1/shard-bmg-8/igt@xe_exec_fault_mode@twice-mult=
i-queue-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/8374">Intel XE#8374</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171165v1/shard-bmg-8/igt@xe_exec_multi_queue@many-queu=
es-preempt-mode-close-fd.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +6 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171165v1/shard-bmg-10/igt@xe_exec_threads@threads-mult=
i-queue-mixed-shared-vm-userptr-rebind.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +1 othe=
r test skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5491-28e3f47d47a61b5e28e7566944479e9c9715d41d/shard-bmg-6/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-5491-28e3f47d47a61b5e28e7566944479e9c9715d41d/shard-bmg-5/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-5491-28e3f47d47a61b5e28e7566944479e9c9715d41d/shard-bmg-4/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-5491-28e3f47d47a61b5e28e7566944479e9c9715d41d/shard-bmg-5=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-5491-28e3f47d47a61b5e28e7566944479e9c9715d41d/shard-b=
mg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-5491-28e3f47d47a61b5e28e7566944479e9c9715d41d/sha=
rd-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-5491-28e3f47d47a61b5e28e7566944479e9c9715d41d=
/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-5491-28e3f47d47a61b5e28e7566944479e9c9715=
d41d/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-5491-28e3f47d47a61b5e28e7566944479e9c=
9715d41d/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-5491-28e3f47d47a61b5e28e756694447=
9e9c9715d41d/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5491-28e3f47d47a61b5e28e75669=
44479e9c9715d41d/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5491-28e3f47d47a61b5e28e7=
566944479e9c9715d41d/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5491-28e3f47d47a61b5e=
28e7566944479e9c9715d41d/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5491-28e3f47d47a6=
1b5e28e7566944479e9c9715d41d/shard-bmg-8/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5491-28e3f47d=
47a61b5e28e7566944479e9c9715d41d/shard-bmg-2/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5491-28e3=
f47d47a61b5e28e7566944479e9c9715d41d/shard-bmg-8/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5491-=
28e3f47d47a61b5e28e7566944479e9c9715d41d/shard-bmg-10/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
5491-28e3f47d47a61b5e28e7566944479e9c9715d41d/shard-bmg-10/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5491-28e3f47d47a61b5e28e7566944479e9c9715d41d/shard-bmg-10/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-5491-28e3f47d47a61b5e28e7566944479e9c9715d41d/shard-bmg-7/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-5491-28e3f47d47a61b5e28e7566944479e9c9715d41d/shard-bmg-10/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-5491-28e3f47d47a61b5e28e7566944479e9c9715d41d/shard-bmg-=
2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-5491-28e3f47d47a61b5e28e7566944479e9c9715d41d/shard-=
bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-5491-28e3f47d47a61b5e28e7566944479e9c9715d41d/sh=
ard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-5491-28e3f47d47a61b5e28e7566944479e9c9715d41=
d/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>) -&gt; (<a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171165v1/shard-bmg-1/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-171165v1/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171165v1/shard-=
bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-171165v1/shard-bmg-3/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
171165v1/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171165v1/shard-bmg-4/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-171165v1/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171165v1/shard=
-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-171165v1/shard-bmg-1/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-171165v1/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171165v1/shard-bmg-7/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-171165v1/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171165v1/shard=
-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-171165v1/shard-bmg-10/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-171165v1/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171165v1/shard-bmg-4/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-171165v1/shard-bmg-10/igt@xe_module_load@load.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171165v1/sh=
ard-bmg-5/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171165v1/shard-bmg-5/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-171165v1/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171165v1/shard-bmg-9=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-171165v1/shard-bmg-9/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-17116=
5v1/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171165v1/shard-bmg-3/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-171165v1/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171165v1/shard-bmg-5=
/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7405">Intel XE#7405</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774">Intel XE#77=
74</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-xgpu-access-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171165v1/shard-bmg-8/igt@xe_multigpu_svm@mgpu-xgpu-acc=
ess-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5491-28e3f47d47a61b5e28e7566944479e9c9715d41d/shard-lnl-2/igt@kms_flip=
@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171165v1/shar=
d-lnl-3/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a> +1 other =
test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@b-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5491-28e3f47d47a61b5e28e7566944479e9c9715d41d/shard-bmg-7/igt@kms_flip=
@plain-flip-fb-recreate-interruptible@b-dp2.html">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/5408">Intel XE#5408</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266">Intel X=
E#6266</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-171165v1/shard-bmg-3/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-=
dp2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5491-28e3f47d47a61b5e28e7566944479e9c9715d41d/shard-bmg-9/igt@xe_fault=
_injection@inject-fault-probe-function-xe_guc_relay_init.html">ABORT</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel X=
E#8007</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-171165v1/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-x=
e_guc_relay_init.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5491-28e3f47d47a61b5e28e7566944479e9c9715d41d/shard-lnl-5/igt@kms_flip=
@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1711=
65v1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301"=
>Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5491-28e3f47d47a61b5e28e7566944479e9c9715d41d/shard-bmg-5/igt@kms_setm=
ode@invalid-clone-exclusive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171165v1/shard-bmg-6/ig=
t@kms_setmode@invalid-clone-exclusive-crtc.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8695">Intel XE=
#8695</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5491-28e3f47d47a61b5e28e7566944479e9c9715d41d/shard-bmg-5/igt@kms_tile=
d_display@basic-test-pattern.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171165v1/shar=
d-bmg-7/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">In=
tel XE#5848</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5491-28e3f47d47a61b5e28e7566944479e9c9715d41d/shard-bmg-7/igt@xe_wedge=
d@wedged-at-any-timeout.html">ABORT</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171165v1/shard-bmg-3/igt@xe_wed=
ged@wedged-at-any-timeout.html">DMESG-WARN</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5491-28e3f47d47a61b5e28e7566944479e9c9715d41d -&gt; xe-pw-171=
165v1</li>
</ul>
<p>IGT_9027: 9027<br />
  xe-5491-28e3f47d47a61b5e28e7566944479e9c9715d41d: 28e3f47d47a61b5e28e7566=
944479e9c9715d41d<br />
  xe-pw-171165v1: 171165v1</p>

</body>
</html>

--===============4167178043094972418==--
