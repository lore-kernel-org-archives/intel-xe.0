Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9CA5D778AF
	for <intel-xe@archiver.kernel.org>; Fri, 23 Jan 2026 20:17:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE37410E2E7;
	Fri, 23 Jan 2026 20:17:03 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 030B210E0BC;
 Fri, 23 Jan 2026 20:17:03 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7792852815079905922=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Remove_device_private_page?=
 =?utf-8?q?s_from_physical_address_space_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jordan Niethe" <jniethe@nvidia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 23 Jan 2026 20:17:03 -0000
Message-ID: <176919942301.189177.725763808026720195@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260123062309.23090-1-jniethe@nvidia.com>
In-Reply-To: <20260123062309.23090-1-jniethe@nvidia.com>
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

--===============7792852815079905922==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Remove device private pages from physical address space (rev5)
URL   : https://patchwork.freedesktop.org/series/159738/
State : failure

== Summary ==

CI Bug Log - changes from xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff_FULL -> xe-pw-159738v5_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-159738v5_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-159738v5_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-159738v5_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-bmg:          [PASS][1] -> [ABORT][2] +17 other tests abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-large.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_evict@evict-small-multi-vm-cm:
    - shard-bmg:          NOTRUN -> [ABORT][3] +2 other tests abort
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/shard-bmg-9/igt@xe_evict@evict-small-multi-vm-cm.html

  * igt@xe_pmu@engine-activity-accuracy-50:
    - shard-bmg:          [PASS][4] -> [FAIL][5] +1 other test fail
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-1/igt@xe_pmu@engine-activity-accuracy-50.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/shard-bmg-8/igt@xe_pmu@engine-activity-accuracy-50.html

  
#### Warnings ####

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][6] ([Intel XE#6321]) -> [ABORT][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-4/igt@xe_evict@evict-mixed-many-threads-small.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/shard-bmg-9/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict@evict-small-external-multi-queue:
    - shard-bmg:          [SKIP][8] ([Intel XE#7140]) -> [ABORT][9]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-8/igt@xe_evict@evict-small-external-multi-queue.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/shard-bmg-7/igt@xe_evict@evict-small-external-multi-queue.html

  
Known issues
------------

  Here are the changes found in xe-pw-159738v5_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2233])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/shard-bmg-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#1124])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/shard-bmg-9/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#607])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#367])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/shard-bmg-7/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2887])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/shard-bmg-9/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2252]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/shard-bmg-9/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2390] / [Intel XE#6974])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/shard-bmg-9/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2321])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/shard-bmg-9/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_flip@flip-vs-suspend@a-dp2:
    - shard-bmg:          [PASS][18] -> [INCOMPLETE][19] ([Intel XE#2049] / [Intel XE#2597] / [Intel XE#5545] / [Intel XE#6766]) +1 other test incomplete
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-4/igt@kms_flip@flip-vs-suspend@a-dp2.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/shard-bmg-2/igt@kms_flip@flip-vs-suspend@a-dp2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2293] / [Intel XE#2380]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/shard-bmg-9/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2293]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/shard-bmg-9/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2311]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#4141]) +4 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2313]) +2 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#1503])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/shard-bmg-9/igt@kms_hdr@invalid-hdr.html

  * igt@kms_psr@fbc-pr-primary-blt:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/shard-bmg-9/igt@kms_psr@fbc-pr-primary-blt.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2330])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/shard-bmg-9/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][28] -> [FAIL][29] ([Intel XE#4459]) +1 other test fail
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/shard-lnl-7/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@xe_eudebug@vm-bind-clear:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#4837]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/shard-bmg-9/igt@xe_eudebug@vm-bind-clear.html

  * igt@xe_eudebug_online@single-step-one:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#4837] / [Intel XE#6665])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/shard-bmg-8/igt@xe_eudebug_online@single-step-one.html

  * igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-imm:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#7136]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/shard-bmg-8/igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-imm.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#6874]) +6 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/shard-bmg-9/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-userptr.html

  * igt@xe_exec_system_allocator@threads-many-large-mmap-free-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#4943]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/shard-bmg-9/igt@xe_exec_system_allocator@threads-many-large-mmap-free-huge-nomemset.html

  * igt@xe_multigpu_svm@mgpu-atomic-op-basic:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#6964])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/shard-bmg-9/igt@xe_multigpu_svm@mgpu-atomic-op-basic.html

  * igt@xe_peer2peer@write:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2427] / [Intel XE#6953])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/shard-bmg-9/igt@xe_peer2peer@write.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#579])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/shard-bmg-9/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pxp@display-black-pxp-fb:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#4733])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/shard-bmg-8/igt@xe_pxp@display-black-pxp-fb.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-bmg:          [FAIL][39] ([Intel XE#5299]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/shard-bmg-10/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-bmg:          [ABORT][41] ([Intel XE#5175]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-4.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_multiple@2x-tiling-4@pipe-c-hdmi-a-3-pipe-a-dp-2:
    - shard-bmg:          [ABORT][43] ([Intel XE#5545]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-4@pipe-c-hdmi-a-3-pipe-a-dp-2.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-4@pipe-c-hdmi-a-3-pipe-a-dp-2.html

  * igt@kms_plane_multiple@tiling-none:
    - shard-bmg:          [INCOMPLETE][45] ([Intel XE#5175]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-2/igt@kms_plane_multiple@tiling-none.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/shard-bmg-7/igt@kms_plane_multiple@tiling-none.html

  * igt@kms_plane_multiple@tiling-none@pipe-d-hdmi-a-3:
    - shard-bmg:          [INCOMPLETE][47] -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-2/igt@kms_plane_multiple@tiling-none@pipe-d-hdmi-a-3.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/shard-bmg-7/igt@kms_plane_multiple@tiling-none@pipe-d-hdmi-a-3.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][49], [PASS][50], [PASS][51], [PASS][52], [PASS][53], [PASS][54], [PASS][55], [PASS][56], [SKIP][57], [PASS][58], [PASS][59], [PASS][60], [PASS][61], [PASS][62], [PASS][63], [PASS][64], [PASS][65], [PASS][66], [PASS][67], [PASS][68], [PASS][69], [PASS][70], [PASS][71], [PASS][72], [PASS][73], [PASS][74]) ([Intel XE#2457]) -> ([PASS][75], [PASS][76], [PASS][77], [PASS][78], [PASS][79], [PASS][80], [PASS][81], [PASS][82], [PASS][83], [PASS][84], [PASS][85], [PASS][86], [PASS][87], [PASS][88], [PASS][89], [PASS][90], [PASS][91], [PASS][92], [PASS][93], [PASS][94], [PASS][95], [PASS][96], [PASS][97], [PASS][98], [PASS][99])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-1/igt@xe_module_load@load.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-2/igt@xe_module_load@load.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-3/igt@xe_module_load@load.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-7/igt@xe_module_load@load.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-7/igt@xe_module_load@load.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-10/igt@xe_module_load@load.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-10/igt@xe_module_load@load.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-1/igt@xe_module_load@load.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-10/igt@xe_module_load@load.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-2/igt@xe_module_load@load.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-10/igt@xe_module_load@load.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-8/igt@xe_module_load@load.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-1/igt@xe_module_load@load.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-3/igt@xe_module_load@load.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-3/igt@xe_module_load@load.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-4/igt@xe_module_load@load.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-4/igt@xe_module_load@load.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-8/igt@xe_module_load@load.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-2/igt@xe_module_load@load.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-8/igt@xe_module_load@load.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-8/igt@xe_module_load@load.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-1/igt@xe_module_load@load.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-9/igt@xe_module_load@load.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-9/igt@xe_module_load@load.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-9/igt@xe_module_load@load.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-4/igt@xe_module_load@load.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/shard-bmg-2/igt@xe_module_load@load.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/shard-bmg-10/igt@xe_module_load@load.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/shard-bmg-10/igt@xe_module_load@load.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/shard-bmg-8/igt@xe_module_load@load.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/shard-bmg-8/igt@xe_module_load@load.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/shard-bmg-8/igt@xe_module_load@load.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/shard-bmg-9/igt@xe_module_load@load.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/shard-bmg-9/igt@xe_module_load@load.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/shard-bmg-4/igt@xe_module_load@load.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/shard-bmg-4/igt@xe_module_load@load.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/shard-bmg-4/igt@xe_module_load@load.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/shard-bmg-3/igt@xe_module_load@load.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/shard-bmg-3/igt@xe_module_load@load.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/shard-bmg-10/igt@xe_module_load@load.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/shard-bmg-8/igt@xe_module_load@load.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/shard-bmg-9/igt@xe_module_load@load.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/shard-bmg-7/igt@xe_module_load@load.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/shard-bmg-7/igt@xe_module_load@load.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/shard-bmg-7/igt@xe_module_load@load.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/shard-bmg-1/igt@xe_module_load@load.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/shard-bmg-1/igt@xe_module_load@load.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/shard-bmg-2/igt@xe_module_load@load.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/shard-bmg-2/igt@xe_module_load@load.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/shard-bmg-2/igt@xe_module_load@load.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/shard-bmg-7/igt@xe_module_load@load.html

  * igt@xe_pmu@engine-activity-accuracy-50:
    - shard-lnl:          [FAIL][100] ([Intel XE#7072]) -> [PASS][101] +1 other test pass
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-lnl-2/igt@xe_pmu@engine-activity-accuracy-50.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/shard-lnl-7/igt@xe_pmu@engine-activity-accuracy-50.html

  
#### Warnings ####

  * igt@xe_exec_system_allocator@process-many-malloc-prefetch:
    - shard-lnl:          [DMESG-WARN][102] ([Intel XE#4537] / [Intel XE#7063]) -> [DMESG-WARN][103] ([Intel XE#7063])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-lnl-4/igt@xe_exec_system_allocator@process-many-malloc-prefetch.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/shard-lnl-8/igt@xe_exec_system_allocator@process-many-malloc-prefetch.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4537]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4537
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5175]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5175
  [Intel XE#5299]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
  [Intel XE#6766]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6766
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#6953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7063]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7063
  [Intel XE#7072]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7072
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7140]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140


Build changes
-------------

  * Linux: xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff -> xe-pw-159738v5

  IGT_8715: 8715
  xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff: 4a255b429d80f8b0800bdef43ba3175b771e77ff
  xe-pw-159738v5: 159738v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/index.html

--===============7792852815079905922==
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
<tr><td><b>Series:</b></td><td>Remove device private pages from physical ad=
dress space (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/159738/">https://patchwork.freedesktop.org/series/159738/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-159738v5/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-159738v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4441-4a255b429d80f8b0800bdef43ba3175b7=
71e77ff_FULL -&gt; xe-pw-159738v5_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-159738v5_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-159738v5_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1597=
38v5_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-1/igt@xe_evict=
@evict-mixed-many-threads-large.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/shard-bmg-2/igt@xe_evict@evic=
t-mixed-many-threads-large.html">ABORT</a> +17 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-vm-cm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159738v5/shard-bmg-9/igt@xe_evict@evict-small-multi-vm=
-cm.html">ABORT</a> +2 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-50:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-1/igt@xe_pmu@e=
ngine-activity-accuracy-50.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-159738v5/shard-bmg-8/igt@xe_pmu@engine-acti=
vity-accuracy-50.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-4/igt@xe_evict=
@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/shard-bmg=
-9/igt@xe_evict@evict-mixed-many-threads-small.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-multi-queue:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-8/igt@xe_evict=
@evict-small-external-multi-queue.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7140">Intel XE#7140</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/shard-bmg-7/i=
gt@xe_evict@evict-small-external-multi-queue.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-159738v5_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159738v5/shard-bmg-8/igt@kms_addfb_basic@addfb25-y-til=
ed-small-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2233">Intel XE#2233</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159738v5/shard-bmg-9/igt@kms_big_fb@y-tiled-16bpp-rota=
te-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159738v5/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb-siz=
e-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159738v5/shard-bmg-7/igt@kms_bw@linear-tiling-4-displa=
ys-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159738v5/shard-bmg-9/igt@kms_ccs@missing-ccs-buffer-4-=
tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159738v5/shard-bmg-9/igt@kms_chamelium_hpd@dp-hpd-for-=
each-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159738v5/shard-bmg-9/igt@kms_content_protection@dp-mst=
-lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2390">Intel XE#2390</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159738v5/shard-bmg-9/igt@kms_cursor_crc@cursor-random-=
512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-4/igt@kms_flip=
@flip-vs-suspend@a-dp2.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-159738v5/shard-bmg-2/igt@kms_flip@flip-vs-suspe=
nd@a-dp2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6766">Intel XE=
#6766</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159738v5/shard-bmg-9/igt@kms_flip_scaled_crc@flip-32bp=
p-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159738v5/shard-bmg-9/igt@kms_flip_scaled_crc@flip-32bp=
p-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#=
2293</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159738v5/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs=
-rgb565-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159738v5/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-=
1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +4 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159738v5/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +2 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159738v5/shard-bmg-9/igt@kms_hdr@invalid-hdr.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503"=
>Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159738v5/shard-bmg-9/igt@kms_psr@fbc-pr-primary-blt.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159738v5/shard-bmg-9/igt@kms_rotation_crc@primary-y-ti=
led-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2330">Intel XE#2330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-lnl-5/igt@kms_vrr@=
cmrr@pipe-a-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-159738v5/shard-lnl-7/igt@kms_vrr@cmrr@pipe-a-edp-1.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4459">Intel XE#4459</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@vm-bind-clear:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159738v5/shard-bmg-9/igt@xe_eudebug@vm-bind-clear.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4837">Intel XE#4837</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step-one:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159738v5/shard-bmg-8/igt@xe_eudebug_online@single-step=
-one.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4837">Intel XE#4837</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/6665">Intel XE#6665</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159738v5/shard-bmg-8/igt@xe_exec_fault_mode@many-multi=
-queue-userptr-invalidate-race-imm.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159738v5/shard-bmg-9/igt@xe_exec_multi_queue@few-execs=
-preempt-mode-fault-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +6 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-free-huge-nomemset:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159738v5/shard-bmg-9/igt@xe_exec_system_allocator@thre=
ads-many-large-mmap-free-huge-nomemset.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +1 othe=
r test skip</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-atomic-op-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159738v5/shard-bmg-9/igt@xe_multigpu_svm@mgpu-atomic-o=
p-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159738v5/shard-bmg-9/igt@xe_peer2peer@write.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">=
Intel XE#2427</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/6953">Intel XE#6953</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159738v5/shard-bmg-9/igt@xe_pm@vram-d3cold-threshold.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-black-pxp-fb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159738v5/shard-bmg-8/igt@xe_pxp@display-black-pxp-fb.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4733">Intel XE#4733</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-8/igt@kms_curs=
or_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/5299">Intel XE#5299</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/sha=
rd-bmg-10/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PAS=
S</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-2/igt@kms_plan=
e_multiple@2x-tiling-4.html">ABORT</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/5175">Intel XE#5175</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/shard-bmg-8/igt@kms_pla=
ne_multiple@2x-tiling-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4@pipe-c-hdmi-a-3-pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-2/igt@kms_plan=
e_multiple@2x-tiling-4@pipe-c-hdmi-a-3-pipe-a-dp-2.html">ABORT</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1597=
38v5/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-4@pipe-c-hdmi-a-3-pipe-a-=
dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-none:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-2/igt@kms_plan=
e_multiple@tiling-none.html">INCOMPLETE</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/5175">Intel XE#5175</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/shard-bmg-7/igt@km=
s_plane_multiple@tiling-none.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-none@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-2/igt@kms_plan=
e_multiple@tiling-none@pipe-d-hdmi-a-3.html">INCOMPLETE</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/shard-bmg-7/ig=
t@kms_plane_multiple@tiling-none@pipe-d-hdmi-a-3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-1/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-2/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-3/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-7=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-b=
mg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/sha=
rd-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77f=
f/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b77=
1e77ff/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba317=
5b771e77ff/shard-bmg-10/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43=
ba3175b771e77ff/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bd=
ef43ba3175b771e77ff/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0=
800bdef43ba3175b771e77ff/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80=
f8b0800bdef43ba3175b771e77ff/shard-bmg-1/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b42=
9d80f8b0800bdef43ba3175b771e77ff/shard-bmg-3/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a25=
5b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-3/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-=
4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-4/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4=
441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-4/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-8/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-2/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-8/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-8/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-=
1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-=
bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/sh=
ard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77f=
f/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771=
e77ff/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a>) -&g=
t; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/sha=
rd-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-159738v5/shard-bmg-10/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-159738v5/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/shard-bmg-8/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-159738v5/shard-bmg-8/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5=
/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/shard-bmg-9/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-159738v5/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/shard-bmg-4/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-159738v5/shard-bmg-4/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5=
/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/shard-bmg-3/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-159738v5/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/shard-bmg-10/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-159738v5/shard-bmg-8/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v=
5/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/shard-bmg-7/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-159738v5/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/shard-bmg-7/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-159738v5/shard-bmg-1/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v=
5/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/shard-bmg-2/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-159738v5/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/shard-bmg-2/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-159738v5/shard-bmg-7/igt@xe_module_load@load.html">P=
ASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-50:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-lnl-2/igt@xe_pmu@e=
ngine-activity-accuracy-50.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7072">Intel XE#7072</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v5/shard-lnl-7/igt@xe_p=
mu@engine-activity-accuracy-50.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_exec_system_allocator@process-many-malloc-prefetch:<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-lnl-4/igt@xe_exec_=
system_allocator@process-many-malloc-prefetch.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4537">Intel XE#4537=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7063"=
>Intel XE#7063</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-159738v5/shard-lnl-8/igt@xe_exec_system_allocator@process-many-ma=
lloc-prefetch.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/7063">Intel XE#7063</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff -&gt; xe-pw-159=
738v5</li>
</ul>
<p>IGT_8715: 8715<br />
  xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff: 4a255b429d80f8b0800bdef=
43ba3175b771e77ff<br />
  xe-pw-159738v5: 159738v5</p>

</body>
</html>

--===============7792852815079905922==--
