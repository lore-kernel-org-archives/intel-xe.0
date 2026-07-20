Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CB7EC44515
	for <intel-xe@archiver.kernel.org>; Mon, 20 Jul 2026 14:50:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 413F310E1D5;
	Mon, 20 Jul 2026 14:50:33 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 963E010E1B2;
 Mon, 20 Jul 2026 14:50:32 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8827668009781848833=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_Add_drm=5Fras_netlink_erro?=
 =?utf-8?q?r_event_support_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tauro, Riana" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 20 Jul 2026 14:50:32 -0000
Message-ID: <178455903260.207655.9974793913354645515@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260720082208.2648279-5-riana.tauro@intel.com>
In-Reply-To: <20260720082208.2648279-5-riana.tauro@intel.com>
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

--===============8827668009781848833==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add drm_ras netlink error event support (rev5)
URL   : https://patchwork.freedesktop.org/series/166765/
State : success

== Summary ==

CI Bug Log - changes from xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1_FULL -> xe-pw-166765v5_FULL
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

  Here are the changes found in xe-pw-166765v5_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unplug-rescan:
    - shard-bmg:          [PASS][1] -> [ABORT][2] ([Intel XE#8007]) +2 other tests abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-8/igt@core_hotunplug@unplug-rescan.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/shard-bmg-6/igt@core_hotunplug@unplug-rescan.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#2327])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/shard-bmg-9/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][4] ([Intel XE#1124])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/shard-lnl-8/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#1124])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/shard-bmg-9/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_bw@linear-tiling-4-displays-target-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#367])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/shard-bmg-2/igt@kms_bw@linear-tiling-4-displays-target-2160x1440p.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2887]) +2 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/shard-bmg-9/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2252]) +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/shard-bmg-9/igt@kms_chamelium_edid@hdmi-edid-read.html

  * igt@kms_cursor_crc@cursor-random-256x85:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2320]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/shard-bmg-9/igt@kms_cursor_crc@cursor-random-256x85.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#4354] / [Intel XE#5870])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/shard-lnl-8/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dsc@dsc-fractional-bpp-bigjoiner:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#8265])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/shard-bmg-9/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [PASS][12] -> [FAIL][13] ([Intel XE#301] / [Intel XE#3149]) +1 other test fail
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2311]) +7 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/shard-bmg-9/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#4141])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#656] / [Intel XE#7905])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2350] / [Intel XE#7503])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/shard-bmg-2/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2313]) +8 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/shard-bmg-9/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][19] -> [SKIP][20] ([Intel XE#1503])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-2/igt@kms_hdr@invalid-hdr.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/shard-bmg-9/igt@kms_hdr@invalid-hdr.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2505] / [Intel XE#7447])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/shard-bmg-9/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#1489])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/shard-bmg-9/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr@psr2-primary-render:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2234])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/shard-bmg-9/igt@kms_psr@psr2-primary-render.html

  * igt@kms_sharpness_filter@invalid-filter-with-scaler:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#6503])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/shard-bmg-9/igt@kms_sharpness_filter@invalid-filter-with-scaler.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2322] / [Intel XE#7372]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/shard-bmg-9/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#8374])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/shard-bmg-9/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-rebind.html

  * igt@xe_exec_multi_queue@few-execs-close-fd:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#8364]) +4 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/shard-bmg-9/igt@xe_exec_multi_queue@few-execs-close-fd.html

  * igt@xe_exec_reset@multi-queue-close-execqueues:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#8369])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/shard-bmg-9/igt@xe_exec_reset@multi-queue-close-execqueues.html

  * igt@xe_exec_threads@threads-multi-queue-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#8378])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/shard-bmg-9/igt@xe_exec_threads@threads-multi-queue-userptr-invalidate.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][30], [PASS][31], [PASS][32], [PASS][33], [PASS][34], [PASS][35], [PASS][36], [PASS][37], [PASS][38], [PASS][39], [PASS][40], [PASS][41], [PASS][42], [PASS][43], [PASS][44], [PASS][45], [PASS][46], [PASS][47], [PASS][48], [PASS][49], [PASS][50], [PASS][51], [PASS][52], [PASS][53], [PASS][54]) -> ([PASS][55], [PASS][56], [PASS][57], [PASS][58], [PASS][59], [PASS][60], [PASS][61], [PASS][62], [PASS][63], [PASS][64], [PASS][65], [PASS][66], [PASS][67], [PASS][68], [PASS][69], [PASS][70], [PASS][71], [PASS][72], [SKIP][73], [PASS][74], [PASS][75], [PASS][76], [PASS][77], [PASS][78], [PASS][79], [PASS][80]) ([Intel XE#2457] / [Intel XE#7405])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-4/igt@xe_module_load@load.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-4/igt@xe_module_load@load.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-8/igt@xe_module_load@load.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-8/igt@xe_module_load@load.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-8/igt@xe_module_load@load.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-10/igt@xe_module_load@load.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-10/igt@xe_module_load@load.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-1/igt@xe_module_load@load.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-1/igt@xe_module_load@load.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-7/igt@xe_module_load@load.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-7/igt@xe_module_load@load.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-9/igt@xe_module_load@load.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-9/igt@xe_module_load@load.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-9/igt@xe_module_load@load.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-2/igt@xe_module_load@load.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-2/igt@xe_module_load@load.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-6/igt@xe_module_load@load.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-6/igt@xe_module_load@load.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-6/igt@xe_module_load@load.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-3/igt@xe_module_load@load.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-3/igt@xe_module_load@load.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-3/igt@xe_module_load@load.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-5/igt@xe_module_load@load.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-5/igt@xe_module_load@load.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-5/igt@xe_module_load@load.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/shard-bmg-3/igt@xe_module_load@load.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/shard-bmg-8/igt@xe_module_load@load.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/shard-bmg-10/igt@xe_module_load@load.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/shard-bmg-10/igt@xe_module_load@load.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/shard-bmg-10/igt@xe_module_load@load.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/shard-bmg-8/igt@xe_module_load@load.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/shard-bmg-8/igt@xe_module_load@load.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/shard-bmg-3/igt@xe_module_load@load.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/shard-bmg-7/igt@xe_module_load@load.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/shard-bmg-7/igt@xe_module_load@load.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/shard-bmg-9/igt@xe_module_load@load.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/shard-bmg-9/igt@xe_module_load@load.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/shard-bmg-1/igt@xe_module_load@load.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/shard-bmg-1/igt@xe_module_load@load.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/shard-bmg-5/igt@xe_module_load@load.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/shard-bmg-7/igt@xe_module_load@load.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/shard-bmg-7/igt@xe_module_load@load.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/shard-bmg-5/igt@xe_module_load@load.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/shard-bmg-9/igt@xe_module_load@load.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/shard-bmg-4/igt@xe_module_load@load.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/shard-bmg-2/igt@xe_module_load@load.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/shard-bmg-2/igt@xe_module_load@load.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/shard-bmg-4/igt@xe_module_load@load.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/shard-bmg-3/igt@xe_module_load@load.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/shard-bmg-6/igt@xe_module_load@load.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/shard-bmg-6/igt@xe_module_load@load.html

  * igt@xe_multigpu_svm@mgpu-latency-copy-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#6964])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/shard-bmg-9/igt@xe_multigpu_svm@mgpu-latency-copy-prefetch.html

  * igt@xe_page_reclaim@binds-large-split:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#7793])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/shard-bmg-9/igt@xe_page_reclaim@binds-large-split.html

  * igt@xe_pat@xa-app-transient-media-on:
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#7590])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/shard-bmg-9/igt@xe_pat@xa-app-transient-media-on.html

  * igt@xe_pxp@pxp-termination-key-update-post-termination-irq:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#4733] / [Intel XE#7417])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/shard-bmg-9/igt@xe_pxp@pxp-termination-key-update-post-termination-irq.html

  
#### Possible fixes ####

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [INCOMPLETE][85] ([Intel XE#7084] / [Intel XE#8150]) -> [PASS][86] +1 other test pass
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-bmg:          [FAIL][87] ([Intel XE#7571]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][89] ([Intel XE#301]) -> [PASS][90] +1 other test pass
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@plain-flip-ts-check@c-edp1:
    - shard-lnl:          [FAIL][91] ([Intel XE#3149] / [Intel XE#6266]) -> [PASS][92] +1 other test pass
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-lnl-8/igt@kms_flip@plain-flip-ts-check@c-edp1.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/shard-lnl-2/igt@kms_flip@plain-flip-ts-check@c-edp1.html

  * igt@kms_rotation_crc@primary-x-tiled-reflect-x-180:
    - shard-bmg:          [DMESG-FAIL][93] ([Intel XE#8300]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-9/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/shard-bmg-9/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][95] ([Intel XE#6321] / [Intel XE#8355]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-5/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/shard-bmg-7/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_exec_system_allocator@process-many-large-free-nomemset:
    - shard-bmg:          [ABORT][97] ([Intel XE#8300]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-9/igt@xe_exec_system_allocator@process-many-large-free-nomemset.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/shard-bmg-9/igt@xe_exec_system_allocator@process-many-large-free-nomemset.html

  * igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_copy0:
    - shard-lnl:          [FAIL][99] ([Intel XE#8555]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-lnl-3/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_copy0.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/shard-lnl-4/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_copy0.html

  * igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_render0:
    - shard-lnl:          [FAIL][101] -> [PASS][102] +1 other test pass
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-lnl-3/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_render0.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/shard-lnl-4/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_render0.html

  
#### Warnings ####

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][103] ([Intel XE#3544]) -> [SKIP][104] ([Intel XE#3374] / [Intel XE#3544])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][105] ([Intel XE#2426] / [Intel XE#5848]) -> [FAIL][106] ([Intel XE#1729] / [Intel XE#7424])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5870
  [Intel XE#6266]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7447
  [Intel XE#7503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7503
  [Intel XE#7571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8300]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8300
  [Intel XE#8355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8555]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8555


Build changes
-------------

  * Linux: xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1 -> xe-pw-166765v5

  IGT_9014: 6d3784ab505ea6a7917b191c0e060d5b4b0c2be7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1: ef0406c67dd07054a91c04981283f0c2c6d7cbf1
  xe-pw-166765v5: 166765v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/index.html

--===============8827668009781848833==
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
<tr><td><b>Series:</b></td><td>Add drm_ras netlink error event support (rev=
5)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/166765/">https://patchwork.freedesktop.org/series/166765/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-166765v5/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-166765v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5436-ef0406c67dd07054a91c04981283f0c2c=
6d7cbf1_FULL -&gt; xe-pw-166765v5_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-166765v5_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unplug-rescan:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-8/igt@core_hot=
unplug@unplug-rescan.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-166765v5/shard-bmg-6/igt@core_hotunplug@unplug-re=
scan.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/8007">Intel XE#8007</a>) +2 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166765v5/shard-bmg-9/igt@kms_big_fb@linear-64bpp-rotat=
e-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166765v5/shard-lnl-8/igt@kms_big_fb@yf-tiled-16bpp-rot=
ate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166765v5/shard-bmg-9/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-target-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166765v5/shard-bmg-2/igt@kms_bw@linear-tiling-4-displa=
ys-target-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166765v5/shard-bmg-9/igt@kms_ccs@missing-ccs-buffer-y-=
tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-read:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166765v5/shard-bmg-9/igt@kms_chamelium_edid@hdmi-edid-=
read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166765v5/shard-bmg-9/igt@kms_cursor_crc@cursor-random-=
256x85.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166765v5/shard-lnl-8/igt@kms_dp_link_training@uhbr-sst=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4354">Intel XE#4354</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/5870">Intel XE#5870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-bigjoiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166765v5/shard-bmg-9/igt@kms_dsc@dsc-fractional-bpp-bi=
gjoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-lnl-8/igt@kms_flip=
@flip-vs-expired-vblank@c-edp1.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/shard-lnl-2/igt@kms_flip@flip-=
vs-expired-vblank@c-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) +1 other =
test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-pri-indfb-draw-render:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166765v5/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs=
hdr-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +7 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166765v5/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-=
1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166765v5/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166765v5/shard-bmg-2/igt@kms_frontbuffer_tracking@plan=
e-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2350">Intel XE#2350</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7503">Intel XE#7503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166765v5/shard-bmg-9/igt@kms_frontbuffer_tracking@psrh=
dr-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +8 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-2/igt@kms_hdr@=
invalid-hdr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-166765v5/shard-bmg-9/igt@kms_hdr@invalid-hdr.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Int=
el XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166765v5/shard-bmg-9/igt@kms_pm_dc@deep-pkgc.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505"=
>Intel XE#2505</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7447">Intel XE#7447</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166765v5/shard-bmg-9/igt@kms_psr2_sf@psr2-overlay-plan=
e-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166765v5/shard-bmg-9/igt@kms_psr@psr2-primary-render.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2234">Intel XE#2234</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaler:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166765v5/shard-bmg-9/igt@kms_sharpness_filter@invalid-=
filter-with-scaler.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166765v5/shard-bmg-9/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-null-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>=
) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166765v5/shard-bmg-9/igt@xe_exec_fault_mode@many-execq=
ueues-multi-queue-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-close-fd:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166765v5/shard-bmg-9/igt@xe_exec_multi_queue@few-execs=
-close-fd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/8364">Intel XE#8364</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-close-execqueues:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166765v5/shard-bmg-9/igt@xe_exec_reset@multi-queue-clo=
se-execqueues.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/8369">Intel XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166765v5/shard-bmg-9/igt@xe_exec_threads@threads-multi=
-queue-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-4/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-4/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-8/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-8=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-b=
mg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/sha=
rd-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf=
1/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6=
d7cbf1/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0=
c2c6d7cbf1/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c049812=
83f0c2c6d7cbf1/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c0=
4981283f0c2c6d7cbf1/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a=
91c04981283f0c2c6d7cbf1/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07=
054a91c04981283f0c2c6d7cbf1/shard-bmg-9/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67=
dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-9/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef040=
6c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-2/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-e=
f0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-2/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-54=
36-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-6/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-6/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-6/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-3/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-3/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-3=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-b=
mg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/sha=
rd-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1=
/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>) -&gt; (<a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/shard-bmg-3/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-166765v5/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/shard-b=
mg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-166765v5/shard-bmg-10/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-166765v5/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/shard-bmg-8/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-166765v5/shard-bmg-8/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/shar=
d-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-166765v5/shard-bmg-7/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-166765v5/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/shard-bmg-9/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-166765v5/shard-bmg-9/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/shar=
d-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-166765v5/shard-bmg-1/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-166765v5/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/shard-bmg-7/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-166765v5/shard-bmg-7/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/shar=
d-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-166765v5/shard-bmg-9/igt@xe_module_load@loa=
d.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-166765v5/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/shard-bmg-2/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-166765v5/shard-bmg-2/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/shar=
d-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-166765v5/shard-bmg-3/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-166765v5/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/shard-bmg-6/igt@xe_=
module_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2457">Intel XE#2457</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7405">Intel XE#7405</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-latency-copy-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166765v5/shard-bmg-9/igt@xe_multigpu_svm@mgpu-latency-=
copy-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@binds-large-split:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166765v5/shard-bmg-9/igt@xe_page_reclaim@binds-large-s=
plit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@xa-app-transient-media-on:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166765v5/shard-bmg-9/igt@xe_pat@xa-app-transient-media=
-on.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-termination-irq:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166765v5/shard-bmg-9/igt@xe_pxp@pxp-termination-key-up=
date-post-termination-irq.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-4/igt@kms_ccs@=
crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#=
8150</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
166765v5/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">=
PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-6/igt@kms_curs=
or_legacy@flip-vs-cursor-toggle.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7571">Intel XE#7571</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/shard-bmg-6/ig=
t@kms_cursor_legacy@flip-vs-cursor-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-lnl-7/igt@kms_flip=
@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/shard-lnl-2=
/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> +1 other =
test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-lnl-8/igt@kms_flip=
@plain-flip-ts-check@c-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/6266">Intel XE#6266</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/shard=
-lnl-2/igt@kms_flip@plain-flip-ts-check@c-edp1.html">PASS</a> +1 other test=
 pass</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-x-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-9/igt@kms_rota=
tion_crc@primary-x-tiled-reflect-x-180.html">DMESG-FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/8300">Intel XE#8300</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/sh=
ard-bmg-9/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html">PASS</a>=
</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-5/igt@xe_evict=
@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355">Intel XE=
#8355</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-166765v5/shard-bmg-7/igt@xe_evict@evict-beng-mixed-many-threads-small.html=
">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-free-nomemset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-9/igt@xe_exec_=
system_allocator@process-many-large-free-nomemset.html">ABORT</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8300">Intel XE#8300=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1667=
65v5/shard-bmg-9/igt@xe_exec_system_allocator@process-many-large-free-nomem=
set.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_copy0:=
</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-lnl-3/igt@xe_pmu@e=
ngine-activity-accuracy-50@engine-drm_xe_engine_class_copy0.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8555">Intel=
 XE#8555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-166765v5/shard-lnl-4/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_=
xe_engine_class_copy0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_render=
0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-lnl-3/igt@xe_pmu@e=
ngine-activity-accuracy-50@engine-drm_xe_engine_class_render0.html">FAIL</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5=
/shard-lnl-4/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_cl=
ass_render0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-1/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/shard-bmg-7/igt@kms_hdr@bri=
ghtness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-7/igt@kms_tile=
d_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v5/shar=
d-bmg-3/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">In=
tel XE#7424</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1 -&gt; xe-pw-166=
765v5</li>
</ul>
<p>IGT_9014: 6d3784ab505ea6a7917b191c0e060d5b4b0c2be7 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1: ef0406c67dd07054a91c049=
81283f0c2c6d7cbf1<br />
  xe-pw-166765v5: 166765v5</p>

</body>
</html>

--===============8827668009781848833==--
