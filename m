Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E14B9C02192
	for <intel-xe@archiver.kernel.org>; Fri,  7 Feb 2025 07:27:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A1E510EA34;
	Fri,  7 Feb 2025 07:27:52 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 492A810EA34;
 Fri,  7 Feb 2025 07:27:51 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2530943787141564350=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Cleanup_error_handling_on_?=
 =?utf-8?q?probe_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 07 Feb 2025 07:27:51 -0000
Message-ID: <173891327128.2499079.9957121281158078308@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250206232333.2660325-1-lucas.demarchi@intel.com>
In-Reply-To: <20250206232333.2660325-1-lucas.demarchi@intel.com>
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

--===============2530943787141564350==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Cleanup error handling on probe (rev2)
URL   : https://patchwork.freedesktop.org/series/144211/
State : failure

== Summary ==

CI Bug Log - changes from xe-2613-f2401c718ce075408a723b147cac70aad2a8246f_full -> xe-pw-144211v2_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-144211v2_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-144211v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-144211v2_full:

### IGT changes ###

#### Possible regressions ####

  * igt@core_setmaster@master-drop-set-user:
    - shard-dg2-set2:     NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-464/igt@core_setmaster@master-drop-set-user.html

  * igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:
    - shard-bmg:          [PASS][2] -> [ABORT][3] +17 other tests abort
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early:
    - shard-adlp:         [PASS][4] -> [ABORT][5] +17 other tests abort
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-adlp-6/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-adlp-9/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html

  * igt@xe_module_load@many-reload:
    - shard-bmg:          [PASS][6] -> [INCOMPLETE][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-bmg-6/igt@xe_module_load@many-reload.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-bmg-8/igt@xe_module_load@many-reload.html

  * igt@xe_module_load@reload:
    - shard-dg2-set2:     [PASS][8] -> [ABORT][9] +7 other tests abort
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-466/igt@xe_module_load@reload.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-466/igt@xe_module_load@reload.html

  
#### Warnings ####

  * igt@core_hotunplug@hotunplug-rescan:
    - shard-adlp:         [ABORT][10] ([Intel XE#3914]) -> [ABORT][11]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-adlp-8/igt@core_hotunplug@hotunplug-rescan.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-adlp-4/igt@core_hotunplug@hotunplug-rescan.html

  * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create:
    - shard-dg2-set2:     [SKIP][12] ([Intel XE#4208]) -> [ABORT][13] +4 other tests abort
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-435/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html

  * igt@xe_module_load@many-reload:
    - shard-dg2-set2:     [FAIL][14] -> [ABORT][15]
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@xe_module_load@many-reload.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-464/igt@xe_module_load@many-reload.html

  
Known issues
------------

  Here are the changes found in xe-pw-144211v2_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@read:
    - shard-dg2-set2:     [PASS][16] -> [SKIP][17] ([Intel XE#2134])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-435/igt@fbdev@read.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-464/igt@fbdev@read.html

  * igt@kms_async_flips@test-time-stamp@pipe-d-hdmi-a-3:
    - shard-bmg:          [PASS][18] -> [DMESG-WARN][19] ([Intel XE#4172]) +9 other tests dmesg-warn
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-bmg-7/igt@kms_async_flips@test-time-stamp@pipe-d-hdmi-a-3.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-bmg-5/igt@kms_async_flips@test-time-stamp@pipe-d-hdmi-a-3.html

  * igt@kms_big_fb@x-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [PASS][20] -> [SKIP][21] ([Intel XE#2351] / [Intel XE#4208]) +4 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-466/igt@kms_big_fb@x-tiled-addfb-size-offset-overflow.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-464/igt@kms_big_fb@x-tiled-addfb-size-offset-overflow.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [PASS][22] -> [SKIP][23] ([Intel XE#2314] / [Intel XE#2894])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#455] / [Intel XE#787]) +7 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#787]) +55 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-bmg-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
    - shard-bmg:          [PASS][27] -> [SKIP][28] ([Intel XE#2291])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html

  * igt@kms_dp_aux_dev:
    - shard-bmg:          [PASS][29] -> [SKIP][30] ([Intel XE#3009])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-bmg-7/igt@kms_dp_aux_dev.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-bmg-6/igt@kms_dp_aux_dev.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-bmg:          [PASS][31] -> [SKIP][32] ([Intel XE#3070])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-bmg-5/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:
    - shard-bmg:          [PASS][33] -> [FAIL][34] ([Intel XE#3321]) +1 other test fail
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [PASS][35] -> [SKIP][36] ([Intel XE#2316]) +5 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-bmg-7/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@2x-plain-flip-fb-recreate@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][37] ([Intel XE#886])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-436/igt@kms_flip@2x-plain-flip-fb-recreate@ab-hdmi-a6-dp4.html

  * igt@kms_flip@plain-flip-fb-recreate@a-dp2:
    - shard-bmg:          [PASS][38] -> [FAIL][39] ([Intel XE#2882]) +1 other test fail
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-bmg-4/igt@kms_flip@plain-flip-fb-recreate@a-dp2.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-bmg-4/igt@kms_flip@plain-flip-fb-recreate@a-dp2.html

  * igt@kms_flip@plain-flip-ts-check@a-hdmi-a1:
    - shard-adlp:         [PASS][40] -> [FAIL][41] ([Intel XE#886]) +1 other test fail
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-adlp-2/igt@kms_flip@plain-flip-ts-check@a-hdmi-a1.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-adlp-2/igt@kms_flip@plain-flip-ts-check@a-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#455]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#651]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - shard-dg2-set2:     [PASS][44] -> [SKIP][45] ([Intel XE#4208] / [i915#2575]) +42 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-435/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-464/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a:
    - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#2763]) +2 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#2763] / [Intel XE#455])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html

  * igt@kms_psr@fbc-pr-no-drrs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#2351] / [Intel XE#4208]) +25 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-464/igt@kms_psr@fbc-pr-no-drrs.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#4208] / [i915#2575]) +67 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-464/igt@kms_vrr@flipline.html

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#1126])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0x3fff.html

  * igt@xe_exec_balancer@many-cm-virtual-userptr-invalidate:
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#4208]) +173 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-464/igt@xe_exec_balancer@many-cm-virtual-userptr-invalidate.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-race-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#288])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-435/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-race-imm.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-dg2-set2:     NOTRUN -> [FAIL][53] ([Intel XE#1999]) +2 other tests fail
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-464/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_module_load@load:
    - shard-dg2-set2:     ([PASS][54], [PASS][55], [PASS][56], [PASS][57], [PASS][58], [PASS][59], [PASS][60], [PASS][61], [PASS][62], [PASS][63], [PASS][64], [PASS][65], [PASS][66], [PASS][67], [PASS][68], [PASS][69], [PASS][70], [PASS][71], [PASS][72], [PASS][73], [PASS][74], [PASS][75], [PASS][76], [PASS][77], [PASS][78]) -> ([PASS][79], [PASS][80], [PASS][81], [PASS][82], [PASS][83], [PASS][84], [SKIP][85], [PASS][86], [PASS][87], [PASS][88], [PASS][89], [PASS][90], [PASS][91], [PASS][92], [PASS][93], [PASS][94], [PASS][95], [PASS][96], [PASS][97], [PASS][98], [PASS][99], [PASS][100], [PASS][101], [PASS][102], [PASS][103], [PASS][104]) ([Intel XE#378])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-435/igt@xe_module_load@load.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-436/igt@xe_module_load@load.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-436/igt@xe_module_load@load.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-436/igt@xe_module_load@load.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@xe_module_load@load.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@xe_module_load@load.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@xe_module_load@load.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@xe_module_load@load.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@xe_module_load@load.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@xe_module_load@load.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-466/igt@xe_module_load@load.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-466/igt@xe_module_load@load.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-466/igt@xe_module_load@load.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@xe_module_load@load.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-466/igt@xe_module_load@load.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-435/igt@xe_module_load@load.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@xe_module_load@load.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-435/igt@xe_module_load@load.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-435/igt@xe_module_load@load.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-435/igt@xe_module_load@load.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-466/igt@xe_module_load@load.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@xe_module_load@load.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@xe_module_load@load.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-436/igt@xe_module_load@load.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-436/igt@xe_module_load@load.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-435/igt@xe_module_load@load.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-435/igt@xe_module_load@load.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-435/igt@xe_module_load@load.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-466/igt@xe_module_load@load.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-466/igt@xe_module_load@load.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-435/igt@xe_module_load@load.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-464/igt@xe_module_load@load.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-435/igt@xe_module_load@load.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-464/igt@xe_module_load@load.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-464/igt@xe_module_load@load.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-464/igt@xe_module_load@load.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-464/igt@xe_module_load@load.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-435/igt@xe_module_load@load.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-464/igt@xe_module_load@load.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-464/igt@xe_module_load@load.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-436/igt@xe_module_load@load.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-436/igt@xe_module_load@load.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-436/igt@xe_module_load@load.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-436/igt@xe_module_load@load.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-464/igt@xe_module_load@load.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-436/igt@xe_module_load@load.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-436/igt@xe_module_load@load.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-464/igt@xe_module_load@load.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-436/igt@xe_module_load@load.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-466/igt@xe_module_load@load.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-466/igt@xe_module_load@load.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [SKIP][105] ([Intel XE#2284] / [Intel XE#366])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-435/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@d3hot-multiple-execs:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][106] ([Intel XE#1358])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-435/igt@xe_pm@d3hot-multiple-execs.html

  * igt@xe_query@query-uc-fw-version-huc:
    - shard-dg2-set2:     [PASS][107] -> [SKIP][108] ([Intel XE#4208]) +102 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-466/igt@xe_query@query-uc-fw-version-huc.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-464/igt@xe_query@query-uc-fw-version-huc.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-bmg:          [FAIL][109] ([Intel XE#3701] / [Intel XE#3718] / [Intel XE#827]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2:
    - shard-bmg:          [FAIL][111] ([Intel XE#3718] / [Intel XE#827]) -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][113] -> [PASS][114] +1 other test pass
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-466/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-6.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-435/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-6.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg2-set2:     [SKIP][115] ([Intel XE#4208]) -> [PASS][116] +114 other tests pass
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-436/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_cursor_crc@cursor-sliding-64x64:
    - shard-dg2-set2:     [SKIP][117] ([Intel XE#4208] / [i915#2575]) -> [PASS][118] +43 other tests pass
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@kms_cursor_crc@cursor-sliding-64x64.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-435/igt@kms_cursor_crc@cursor-sliding-64x64.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-bmg:          [SKIP][119] ([Intel XE#2291]) -> [PASS][120]
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-bmg-4/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-bmg-2/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-bmg:          [DMESG-WARN][121] ([Intel XE#877]) -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [SKIP][123] ([Intel XE#2425]) -> [PASS][124]
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-bmg-8/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-bmg:          [SKIP][125] ([Intel XE#2316]) -> [PASS][126]
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-bmg-6/igt@kms_flip@2x-absolute-wf_vblank.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-bmg-8/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][127] ([Intel XE#3321]) -> [PASS][128]
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][129] ([Intel XE#2351] / [Intel XE#4208]) -> [PASS][130] +3 other tests pass
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:
    - shard-lnl:          [FAIL][131] ([Intel XE#899]) -> [PASS][132]
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [FAIL][133] ([Intel XE#2159]) -> [PASS][134] +1 other test pass
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-lnl-7/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  
#### Warnings ####

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-dg2-set2:     [SKIP][135] ([Intel XE#4208] / [i915#2575]) -> [SKIP][136] ([Intel XE#455]) +4 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-436/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][137] ([Intel XE#4208]) -> [SKIP][138] ([Intel XE#316])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-435/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][139] ([Intel XE#316]) -> [SKIP][140] ([Intel XE#2351] / [Intel XE#4208]) +1 other test skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-435/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-464/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][141] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][142] ([Intel XE#607])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][143] ([Intel XE#4208]) -> [SKIP][144] ([Intel XE#610])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-dg2-set2:     [SKIP][145] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][146] ([Intel XE#1124]) +4 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][147] ([Intel XE#4208]) -> [SKIP][148] ([Intel XE#1124]) +3 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-435/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][149] ([Intel XE#1124]) -> [SKIP][150] ([Intel XE#4208]) +4 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-435/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-464/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][151] ([Intel XE#2191]) -> [SKIP][152] ([Intel XE#4208] / [i915#2575])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-435/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-464/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][153] ([Intel XE#4208] / [i915#2575]) -> [SKIP][154] ([Intel XE#367]) +1 other test skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-436/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][155] ([Intel XE#4208]) -> [SKIP][156] ([Intel XE#455] / [Intel XE#787]) +5 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-436/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][157] ([Intel XE#2907]) -> [SKIP][158] ([Intel XE#4208])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-466/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-464/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][159] ([Intel XE#4208]) -> [SKIP][160] ([Intel XE#2907])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][161] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][162] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][163] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][164] ([Intel XE#4208]) +7 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-dg2-set2:     [SKIP][165] ([Intel XE#4208] / [i915#2575]) -> [SKIP][166] ([Intel XE#306]) +2 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@kms_chamelium_color@ctm-green-to-red.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-436/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-dg2-set2:     [SKIP][167] ([Intel XE#306]) -> [SKIP][168] ([Intel XE#4208] / [i915#2575])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-466/igt@kms_chamelium_color@ctm-limited-range.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-464/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_frames@hdmi-cmp-planes-random:
    - shard-dg2-set2:     [SKIP][169] ([Intel XE#4208] / [i915#2575]) -> [SKIP][170] ([Intel XE#373]) +2 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-435/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2-set2:     [SKIP][171] ([Intel XE#373]) -> [SKIP][172] ([Intel XE#4208] / [i915#2575]) +3 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-464/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg2-set2:     [SKIP][173] ([Intel XE#4208] / [i915#2575]) -> [SKIP][174] ([Intel XE#307])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@kms_content_protection@dp-mst-lic-type-1.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-436/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@lic-type-0:
    - shard-bmg:          [FAIL][175] ([Intel XE#1178]) -> [SKIP][176] ([Intel XE#2341])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-bmg-7/igt@kms_content_protection@lic-type-0.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-bmg-6/igt@kms_content_protection@lic-type-0.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-dg2-set2:     [SKIP][177] ([Intel XE#4208] / [i915#2575]) -> [SKIP][178] ([Intel XE#308])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@kms_cursor_crc@cursor-offscreen-512x170.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-435/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2-set2:     [SKIP][179] ([Intel XE#4208] / [i915#2575]) -> [SKIP][180] ([Intel XE#323])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-435/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-dg2-set2:     [SKIP][181] ([Intel XE#323]) -> [SKIP][182] ([Intel XE#4208] / [i915#2575])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-435/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-464/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-dg2-set2:     [SKIP][183] ([Intel XE#455]) -> [SKIP][184] ([Intel XE#4208]) +3 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-435/igt@kms_dsc@dsc-with-bpc.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-464/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2-set2:     [SKIP][185] ([Intel XE#1137]) -> [SKIP][186] ([Intel XE#4208] / [i915#2575])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-435/igt@kms_feature_discovery@dp-mst.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-464/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-dg2-set2:     [SKIP][187] ([Intel XE#4208] / [i915#2575]) -> [FAIL][188] ([Intel XE#886])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-436/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
    - shard-dg2-set2:     [SKIP][189] ([Intel XE#4208]) -> [SKIP][190] ([Intel XE#455]) +1 other test skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][191] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][192] ([Intel XE#651]) +4 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-render.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][193] ([Intel XE#2312]) -> [SKIP][194] ([Intel XE#2311]) +6 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][195] ([Intel XE#2311]) -> [SKIP][196] ([Intel XE#2312]) +8 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][197] ([Intel XE#651]) -> [SKIP][198] ([Intel XE#4208]) +9 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
    - shard-adlp:         [FAIL][199] ([Intel XE#1861]) -> [DMESG-FAIL][200] ([Intel XE#1033])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][201] ([Intel XE#4141]) -> [SKIP][202] ([Intel XE#2312]) +4 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][203] ([Intel XE#2312]) -> [SKIP][204] ([Intel XE#4141]) +2 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][205] ([Intel XE#651]) -> [SKIP][206] ([Intel XE#2351] / [Intel XE#4208]) +3 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-render:
    - shard-dg2-set2:     [SKIP][207] ([Intel XE#4208]) -> [SKIP][208] ([Intel XE#651]) +14 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-render.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][209] ([Intel XE#4208]) -> [SKIP][210] ([Intel XE#653]) +8 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][211] ([Intel XE#2312]) -> [SKIP][212] ([Intel XE#2313]) +4 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][213] ([Intel XE#2313]) -> [SKIP][214] ([Intel XE#2312]) +11 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][215] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][216] ([Intel XE#653]) +4 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][217] ([Intel XE#653]) -> [SKIP][218] ([Intel XE#2351] / [Intel XE#4208]) +4 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-slowdraw:
    - shard-dg2-set2:     [SKIP][219] ([Intel XE#653]) -> [SKIP][220] ([Intel XE#4208]) +9 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-slowdraw.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-slowdraw.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-dg2-set2:     [SKIP][221] ([Intel XE#4208]) -> [SKIP][222] ([Intel XE#346])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@kms_joiner@basic-big-joiner.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-436/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-dg2-set2:     [SKIP][223] ([Intel XE#4208]) -> [SKIP][224] ([Intel XE#2925])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-436/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2-set2:     [SKIP][225] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][226] ([Intel XE#4208] / [i915#2575]) +2 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-464/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][227] ([Intel XE#4208] / [i915#2575]) -> [SKIP][228] ([Intel XE#2763] / [Intel XE#455])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     [SKIP][229] ([Intel XE#908]) -> [SKIP][230] ([Intel XE#2351] / [Intel XE#4208])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-435/igt@kms_pm_dc@dc6-dpms.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-464/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][231] ([Intel XE#4208]) -> [SKIP][232] ([Intel XE#1489]) +5 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-436/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
    - shard-dg2-set2:     [SKIP][233] ([Intel XE#1489]) -> [SKIP][234] ([Intel XE#4208]) +3 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-466/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-464/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg2-set2:     [SKIP][235] ([Intel XE#4208]) -> [SKIP][236] ([Intel XE#1122])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@kms_psr2_su@page_flip-p010.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-435/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr-sprite-render:
    - shard-dg2-set2:     [SKIP][237] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][238] ([Intel XE#4208]) +4 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-435/igt@kms_psr@fbc-psr-sprite-render.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-464/igt@kms_psr@fbc-psr-sprite-render.html

  * igt@kms_psr@fbc-psr2-suspend:
    - shard-dg2-set2:     [SKIP][239] ([Intel XE#4208]) -> [SKIP][240] ([Intel XE#2850] / [Intel XE#929]) +5 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@kms_psr@fbc-psr2-suspend.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-435/igt@kms_psr@fbc-psr2-suspend.html

  * igt@kms_psr@psr-sprite-blt:
    - shard-dg2-set2:     [SKIP][241] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][242] ([Intel XE#2850] / [Intel XE#929]) +4 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@kms_psr@psr-sprite-blt.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-435/igt@kms_psr@psr-sprite-blt.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][243] ([Intel XE#4208] / [i915#2575]) -> [SKIP][244] ([Intel XE#1127])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-dg2-set2:     [SKIP][245] ([Intel XE#3414]) -> [SKIP][246] ([Intel XE#4208] / [i915#2575])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][247] ([Intel XE#1127]) -> [SKIP][248] ([Intel XE#4208] / [i915#2575])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-464/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-dg2-set2:     [SKIP][249] ([Intel XE#4208] / [i915#2575]) -> [SKIP][250] ([Intel XE#3414]) +2 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-435/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - shard-dg2-set2:     [SKIP][251] ([Intel XE#455]) -> [SKIP][252] ([Intel XE#4208] / [i915#2575])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-435/igt@kms_scaling_modes@scaling-mode-none.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-464/igt@kms_scaling_modes@scaling-mode-none.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][253] ([Intel XE#2426]) -> [FAIL][254] ([Intel XE#1729])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][255] ([Intel XE#4208] / [i915#2575]) -> [SKIP][256] ([Intel XE#1500])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2-set2:     [SKIP][257] ([Intel XE#330]) -> [SKIP][258] ([Intel XE#4208] / [i915#2575])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-435/igt@kms_tv_load_detect@load-detect.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-464/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-dg2-set2:     [DMESG-WARN][259] ([Intel XE#1033]) -> [SKIP][260] ([Intel XE#4208] / [i915#2575])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-435/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-464/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@kms_vrr@cmrr:
    - shard-dg2-set2:     [SKIP][261] ([Intel XE#4208] / [i915#2575]) -> [SKIP][262] ([Intel XE#2168])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@kms_vrr@cmrr.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-436/igt@kms_vrr@cmrr.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2-set2:     [SKIP][263] ([Intel XE#756]) -> [SKIP][264] ([Intel XE#4208] / [i915#2575])
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-435/igt@kms_writeback@writeback-fb-id.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-464/igt@kms_writeback@writeback-fb-id.html

  * igt@xe_copy_basic@mem-copy-linear-0x3fff:
    - shard-dg2-set2:     [SKIP][265] ([Intel XE#1123]) -> [SKIP][266] ([Intel XE#4208])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-464/igt@xe_copy_basic@mem-copy-linear-0x3fff.html

  * igt@xe_eudebug@basic-client-th:
    - shard-dg2-set2:     [SKIP][267] ([Intel XE#2905]) -> [SKIP][268] ([Intel XE#4208]) +5 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-466/igt@xe_eudebug@basic-client-th.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-464/igt@xe_eudebug@basic-client-th.html

  * igt@xe_eudebug_online@interrupt-other-debuggable:
    - shard-dg2-set2:     [SKIP][269] ([Intel XE#4208]) -> [SKIP][270] ([Intel XE#2905]) +8 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@xe_eudebug_online@interrupt-other-debuggable.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-436/igt@xe_eudebug_online@interrupt-other-debuggable.html

  * igt@xe_evict@evict-beng-large-multi-vm:
    - shard-dg2-set2:     [SKIP][271] ([Intel XE#4208]) -> [INCOMPLETE][272] ([Intel XE#1473])
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@xe_evict@evict-beng-large-multi-vm.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-435/igt@xe_evict@evict-beng-large-multi-vm.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][273] ([Intel XE#288]) -> [SKIP][274] ([Intel XE#4208]) +13 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-466/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-464/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
    - shard-dg2-set2:     [SKIP][275] ([Intel XE#4208]) -> [SKIP][276] ([Intel XE#288]) +18 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-436/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html

  * igt@xe_exec_threads@threads-hang-fd-userptr-rebind:
    - shard-dg2-set2:     [SKIP][277] ([Intel XE#4208]) -> [DMESG-WARN][278] ([Intel XE#3876])
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-436/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html

  * igt@xe_media_fill@media-fill:
    - shard-dg2-set2:     [SKIP][279] ([Intel XE#560]) -> [SKIP][280] ([Intel XE#4208])
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-435/igt@xe_media_fill@media-fill.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-464/igt@xe_media_fill@media-fill.html

  * igt@xe_oa@invalid-remove-userspace-config:
    - shard-dg2-set2:     [SKIP][281] ([Intel XE#4208]) -> [SKIP][282] ([Intel XE#2541] / [Intel XE#3573]) +2 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@xe_oa@invalid-remove-userspace-config.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-435/igt@xe_oa@invalid-remove-userspace-config.html

  * igt@xe_oa@syncs-ufence-wait-cfg:
    - shard-dg2-set2:     [SKIP][283] ([Intel XE#2541] / [Intel XE#3573]) -> [SKIP][284] ([Intel XE#4208]) +3 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-435/igt@xe_oa@syncs-ufence-wait-cfg.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-464/igt@xe_oa@syncs-ufence-wait-cfg.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     [SKIP][285] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][286] ([Intel XE#4208])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-466/igt@xe_pm@d3cold-mmap-vram.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-464/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-dg2-set2:     [SKIP][287] ([Intel XE#4208]) -> [SKIP][288] ([Intel XE#2284] / [Intel XE#366])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@xe_pm@d3cold-multiple-execs.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-436/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@s2idle-vm-bind-userptr:
    - shard-dg2-set2:     [ABORT][289] ([Intel XE#1358] / [Intel XE#1794]) -> [SKIP][290] ([Intel XE#4208])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-466/igt@xe_pm@s2idle-vm-bind-userptr.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-464/igt@xe_pm@s2idle-vm-bind-userptr.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-dg2-set2:     [ABORT][291] ([Intel XE#1358]) -> [SKIP][292] ([Intel XE#4208]) +1 other test skip
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-466/igt@xe_pm@s4-multiple-execs.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-464/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-dg2-set2:     [ABORT][293] ([Intel XE#1033] / [Intel XE#1358]) -> [SKIP][294] ([Intel XE#4208])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-435/igt@xe_pm@s4-vm-bind-prefetch.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-464/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_sriov_auto_provisioning@exclusive-ranges:
    - shard-dg2-set2:     [SKIP][295] ([Intel XE#4208]) -> [SKIP][296] ([Intel XE#4130])
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@xe_sriov_auto_provisioning@exclusive-ranges.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-435/igt@xe_sriov_auto_provisioning@exclusive-ranges.html

  
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2425
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#3070]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3070
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3701
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3914]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3914
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4172]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172
  [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * Linux: xe-2613-f2401c718ce075408a723b147cac70aad2a8246f -> xe-pw-144211v2

  IGT_8224: c659b986ba648584d36b3cfece897bc84a33dcbb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2613-f2401c718ce075408a723b147cac70aad2a8246f: f2401c718ce075408a723b147cac70aad2a8246f
  xe-pw-144211v2: 144211v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/index.html

--===============2530943787141564350==
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
<tr><td><b>Series:</b></td><td>Cleanup error handling on probe (rev2)</td><=
/tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/144211/">https://patchwork.freedesktop.org/series/144211/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-144211v2/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-144211v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2613-f2401c718ce075408a723b147cac70aad=
2a8246f_full -&gt; xe-pw-144211v2_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-144211v2_full absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-144211v2_full, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1442=
11v2_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144211v2/shard-dg2-464/igt@core_setmaster@master-drop-=
set-user.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-bmg-4/igt@xe_fault=
_injection@inject-fault-probe-function-wait_for_lmem_ready.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/sh=
ard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_=
ready.html">ABORT</a> +17 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early:</=
p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-adlp-6/igt@xe_faul=
t_injection@inject-fault-probe-function-xe_tile_init_early.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/sh=
ard-adlp-9/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_=
early.html">ABORT</a> +17 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-bmg-6/igt@xe_modul=
e_load@many-reload.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-144211v2/shard-bmg-8/igt@xe_module_load@many-reload=
.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-466/igt@xe_mod=
ule_load@reload.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144211v2/shard-dg2-466/igt@xe_module_load@reload.html"=
>ABORT</a> +7 other tests abort</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunplug-rescan:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-adlp-8/igt@core_ho=
tunplug@hotunplug-rescan.html">ABORT</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/3914">Intel XE#3914</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-adlp-4/igt@core=
_hotunplug@hotunplug-rescan.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@xe_fau=
lt_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1442=
11v2/shard-dg2-435/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_cr=
eate.html">ABORT</a> +4 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@xe_mod=
ule_load@many-reload.html">FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-464/igt@xe_module_load@many-re=
load.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-144211v2_full that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-435/igt@fbdev@=
read.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-144211v2/shard-dg2-464/igt@fbdev@read.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-bmg-7/igt@kms_asyn=
c_flips@test-time-stamp@pipe-d-hdmi-a-3.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-bmg-5/igt@kms_a=
sync_flips@test-time-stamp@pipe-d-hdmi-a-3.html">DMESG-WARN</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a=
>) +9 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-466/igt@kms_bi=
g_fb@x-tiled-addfb-size-offset-overflow.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-464/igt@kms=
_big_fb@x-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE=
#4208</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-bmg-1/igt@kms_bw@c=
onnected-linear-tiling-2-displays-1920x1080p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-bmg-4/ig=
t@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2=
314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
94">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144211v2/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4=
-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144211v2/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4=
-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +55 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144211v2/shard-bmg-8/igt@kms_ccs@crc-primary-rotation-=
180-4-tiled-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-bmg-7/igt@kms_curs=
or_legacy@cursora-vs-flipb-atomic.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-bmg-6/igt@kms_cursor_=
legacy@cursora-vs-flipb-atomic.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-bmg-7/igt@kms_dp_a=
ux_dev.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-144211v2/shard-bmg-6/igt@kms_dp_aux_dev.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Intel XE#3009=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-bmg-5/igt@kms_dp_l=
inktrain_fallback@dp-fallback.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-bmg-6/igt@kms_dp_linktrai=
n_fallback@dp-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3070">Intel XE#3070</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-bmg-5/igt@kms_flip=
@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-bmg-2/igt@kms=
_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)=
 +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-bmg-7/igt@kms_flip=
@2x-plain-flip-fb-recreate.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-bmg-6/igt@kms_flip@2x-plain-=
flip-fb-recreate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2316">Intel XE#2316</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144211v2/shard-dg2-436/igt@kms_flip@2x-plain-flip-fb-r=
ecreate@ab-hdmi-a6-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/886">Intel XE#886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-bmg-4/igt@kms_flip=
@plain-flip-fb-recreate@a-dp2.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-bmg-4/igt@kms_flip@plain-=
flip-fb-recreate@a-dp2.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-adlp-2/igt@kms_fli=
p@plain-flip-ts-check@a-hdmi-a1.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-adlp-2/igt@kms_flip@pla=
in-flip-ts-check@a-hdmi-a1.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test fail</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling=
@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144211v2/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32=
bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel =
XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144211v2/shard-dg2-435/igt@kms_frontbuffer_tracking@dr=
rs-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-435/igt@kms_pi=
pe_crc_basic@nonblocking-crc-frame-sequence.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-464/igt=
@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2=
575">i915#2575</a>) +42 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@p=
ipe-a:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144211v2/shard-dg2-436/igt@kms_plane_scaling@planes-do=
wnscale-factor-0-25-upscale-factor-0-25@pipe-a.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>)=
 +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@p=
ipe-d:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144211v2/shard-dg2-436/igt@kms_plane_scaling@planes-do=
wnscale-factor-0-25-upscale-factor-0-25@pipe-d.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel=
 XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144211v2/shard-dg2-464/igt@kms_psr@fbc-pr-no-drrs.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4208">Intel XE#4208</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144211v2/shard-dg2-464/igt@kms_vrr@flipline.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">=
Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/2575">i915#2575</a>) +67 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144211v2/shard-dg2-435/igt@xe_copy_basic@mem-set-linea=
r-0x3fff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-cm-virtual-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144211v2/shard-dg2-464/igt@xe_exec_balancer@many-cm-vi=
rtual-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +173 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-race-imm:</=
p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144211v2/shard-dg2-435/igt@xe_exec_fault_mode@once-bin=
dexecqueue-userptr-invalidate-race-imm.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144211v2/shard-dg2-464/igt@xe_live_ktest@xe_mocs@xe_li=
ve_mocs_kernel_kunit.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1999">Intel XE#1999</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-435/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-436/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-4=
36/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard=
-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f=
/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2=
a8246f/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac=
70aad2a8246f/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723=
b147cac70aad2a8246f/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce0754=
08a723b147cac70aad2a8246f/shard-dg2-464/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718=
ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f24=
01c718ce075408a723b147cac70aad2a8246f/shard-dg2-466/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-26=
13-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-466/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-466/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-466=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-d=
g2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/s=
hard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8=
246f/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70=
aad2a8246f/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b14=
7cac70aad2a8246f/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a=
723b147cac70aad2a8246f/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce0=
75408a723b147cac70aad2a8246f/shard-dg2-464/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c=
718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-=
f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-436/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-436/igt@xe_module_=
load@load.html">PASS</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-144211v2/shard-dg2-435/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/sh=
ard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-435/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-144211v2/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-4=
66/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-435/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
44211v2/shard-dg2-464/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-435/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-144211v2/shard-dg2-464/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/s=
hard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-464/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-144211v2/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-=
435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-464/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
144211v2/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-436/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-144211v2/shard-dg2-436/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/=
shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-436/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-144211v2/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2=
-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-436/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-144211v2/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-436/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-144211v2/shard-dg2-466/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2=
/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144211v2/shard-dg2-435/igt@xe_pm@d3cold-basic-exec.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144211v2/shard-dg2-435/igt@xe_pm@d3hot-multiple-execs.=
html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@query-uc-fw-version-huc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-466/igt@xe_que=
ry@query-uc-fw-version-huc.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-464/igt@xe_query@query-u=
c-fw-version-huc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4208">Intel XE#4208</a>) +102 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-bmg-1/igt@kms_asyn=
c_flips@alternate-sync-async-flip-atomic.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3701">Intel XE#3701</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3=
718</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/82=
7">Intel XE#827</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-144211v2/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-fl=
ip-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-bmg-1/igt@kms_asyn=
c_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#371=
8</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/827"=
>Intel XE#827</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-144211v2/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip=
-atomic@pipe-a-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-466/igt@kms_as=
ync_flips@alternate-sync-async-flip@pipe-d-hdmi-a-6.html">INCOMPLETE</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/sha=
rd-dg2-435/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-6.ht=
ml">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@kms_bi=
g_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2=
/shard-dg2-436/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.ht=
ml">PASS</a> +114 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x64:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@kms_cu=
rsor_crc@cursor-sliding-64x64.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/sha=
rd-dg2-435/igt@kms_cursor_crc@cursor-sliding-64x64.html">PASS</a> +43 other=
 tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-bmg-4/igt@kms_curs=
or_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1442=
11v2/shard-bmg-2/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-ato=
mic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-bmg-8/igt@kms_curs=
or_legacy@cursorb-vs-flipa-toggle.html">DMESG-WARN</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-bmg=
-5/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-bmg-6/igt@kms_disp=
lay_modes@extended-mode-basic.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2425">Intel XE#2425</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-bmg-8/igt@k=
ms_display_modes@extended-mode-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-bmg-6/igt@kms_flip=
@2x-absolute-wf_vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-bmg-8/igt@kms_flip=
@2x-absolute-wf_vblank.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-bmg-5/igt@kms_flip=
@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard=
-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html">PASS</a>=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel X=
E#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-144211v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-=
primscrn-cur-indfb-draw-mmap-wc.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-lnl-8/igt@kms_univ=
ersal_plane@cursor-fb-leak@pipe-b-edp-1.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-lnl=
-7/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-lnl-7/igt@kms_vrr@=
cmrr@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2159">Intel XE#2159</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-lnl-5/igt@kms_vrr@cmrr@=
pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@kms_at=
omic_transition@plane-all-modeset-transition-fencing-internal-panels.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/42=
08">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-436/igt@kms_atomic_transition=
@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455=
</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@kms_bi=
g_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-435/igt@=
kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-435/igt@kms_bi=
g_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-464/igt@kms=
_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@kms_bi=
g_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#42=
08</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
4211v2/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@kms_bi=
g_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-436/=
igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@kms_bi=
g_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208"=
>Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-144211v2/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp=
-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@kms_bi=
g_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-435/=
igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-435/igt@kms_bi=
g_fb@yf-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-464/igt=
@kms_big_fb@yf-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +4 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-435/igt@kms_bw=
@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/=
shard-dg2-464/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@kms_bw=
@linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1442=
11v2/shard-dg2-436/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">=
Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@kms_cc=
s@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-436/=
igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787=
</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-466/igt@kms_cc=
s@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-464=
/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@kms_cc=
s@crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-4=
35/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@kms_cc=
s@crc-primary-basic-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#420=
8</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144=
211v2/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/45=
5">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-435/igt@kms_cc=
s@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE=
#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
144211v2/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-=
ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4208">Intel XE#4208</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@kms_ch=
amelium_color@ctm-green-to-red.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/sh=
ard-dg2-436/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306<=
/a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-466/igt@kms_ch=
amelium_color@ctm-limited-range.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-464/igt=
@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#257=
5</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-cmp-planes-random:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@kms_ch=
amelium_frames@hdmi-cmp-planes-random.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1442=
11v2/shard-dg2-435/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/373"=
>Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-466/igt@kms_ch=
amelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-=
464/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#420=
8</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
2575">i915#2575</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@kms_co=
ntent_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v=
2/shard-dg2-436/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel=
 XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-bmg-7/igt@kms_cont=
ent_protection@lic-type-0.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-bmg-6/igt@kms_c=
ontent_protection@lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@kms_cu=
rsor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2=
/shard-dg2-435/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel X=
E#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@kms_cu=
rsor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575=
">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-144211v2/shard-dg2-435/igt@kms_cursor_legacy@basic-busy-flip-before-=
cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-435/igt@kms_cu=
rsor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#32=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144=
211v2/shard-dg2-464/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-var=
ying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-435/igt@kms_ds=
c@dsc-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-464/igt@kms_dsc@dsc-with=
-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4208">Intel XE#4208</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-435/igt@kms_fe=
ature_discovery@dp-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1137">Intel XE#1137</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-464/igt@kms_fe=
ature_discovery@dp-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@kms_fl=
ip@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shar=
d-dg2-436/igt@kms_flip@2x-plain-flip-fb-recreate.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling=
:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@kms_fl=
ip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">In=
tel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-144211v2/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-3=
2bpp-ytilercccs-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-render.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel X=
E#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-144211v2/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-1p=
-offscren-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
144211v2/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indf=
b-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2311">Intel XE#2311</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1442=
11v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2312">Intel XE#2312</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-435/igt@kms_fr=
ontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211=
v2/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-on=
off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4208">Intel XE#4208</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-adlp-3/igt@kms_fro=
ntbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1442=
11v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip=
-blt.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1442=
11v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-dra=
w-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2312">Intel XE#2312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v=
2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4141">Intel XE#4141</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-435/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE=
#651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
144211v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr=
-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +3 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-rgb565-draw-render.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/s=
hard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-render.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/65=
1">Intel XE#651</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Inte=
l XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-144211v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn=
-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1442=
11v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-=
onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2313">Intel XE#2313</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#231=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144=
211v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msf=
lip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2312">Intel XE#2312</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE=
#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-144211v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2=
p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +4 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211=
v2/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-464/igt=
@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +9 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@kms_jo=
iner@basic-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-436/igt@kms_joi=
ner@basic-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@kms_jo=
iner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-d=
g2-436/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE=
#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-435/igt@kms_pl=
ane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2=
763</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/45=
5">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-144211v2/shard-dg2-464/igt@kms_plane_scaling@planes-downscale-fa=
ctor-0-25-unity-scaling.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@kms_pl=
ane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Inte=
l XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-144211v2/shard-dg2-436/igt@kms_plane_scaling@planes-down=
scale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-435/igt@kms_pm=
_dc@dc6-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/908">Intel XE#908</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-464/igt@kms_pm_dc@dc6-dpms=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@kms_ps=
r2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/s=
hard-dg2-436/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
89">Intel XE#1489</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-466/igt@kms_ps=
r2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1442=
11v2/shard-dg2-464/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous=
-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4208">Intel XE#4208</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@kms_ps=
r2_su@page_flip-p010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-435/igt@kms_psr2=
_su@page_flip-p010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-435/igt@kms_ps=
r@fbc-psr-sprite-render.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-4=
64/igt@kms_psr@fbc-psr-sprite-render.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +4 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@kms_ps=
r@fbc-psr2-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-435/igt@kms_psr@fb=
c-psr2-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +5 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@kms_ps=
r@psr-sprite-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-435/=
igt@kms_psr@psr-sprite-blt.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +4 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@kms_ro=
tation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2=
575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
44211v2/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-435/igt@kms_ro=
tation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-=
dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel =
XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-466/igt@kms_ro=
tation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard=
-dg2-464/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Inte=
l XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@kms_ro=
tation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#25=
75</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
4211v2/shard-dg2-435/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3414">Intel XE#3414</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-435/igt@kms_sc=
aling_modes@scaling-mode-none.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-464/igt@k=
ms_scaling_modes@scaling-mode-none.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-bmg-5/igt@kms_tile=
d_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-bmg-1/igt@km=
s_tiled_display@basic-test-pattern.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@kms_ti=
led_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i=
915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-144211v2/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern-with-ch=
amelium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1500">Intel XE#1500</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-435/igt@kms_tv=
_load_detect@load-detect.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/330">Intel XE#330</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-464/igt@kms_tv=
_load_detect@load-detect.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-435/igt@kms_vb=
lank@ts-continuation-dpms-suspend.html">DMESG-WARN</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-d=
g2-464/igt@kms_vblank@ts-continuation-dpms-suspend.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2=
575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@kms_vr=
r@cmrr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-436/igt@kms_vrr@=
cmrr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-435/igt@kms_wr=
iteback@writeback-fb-id.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-464/igt@kms_wri=
teback@writeback-fb-id.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-435/igt@xe_cop=
y_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-464/=
igt@xe_copy_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-client-th:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-466/igt@xe_eud=
ebug@basic-client-th.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-464/igt@xe_eudeb=
ug@basic-client-th.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-other-debuggable:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@xe_eud=
ebug_online@interrupt-other-debuggable.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg=
2-436/igt@xe_eudebug_online@interrupt-other-debuggable.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2=
905</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@xe_evi=
ct@evict-beng-large-multi-vm.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-435/igt@=
xe_evict@evict-beng-large-multi-vm.html">INCOMPLETE</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-466/igt@xe_exe=
c_fault_mode@many-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#2=
88</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
4211v2/shard-dg2-464/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-inva=
lidate-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4208">Intel XE#4208</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-invalid-userptr-fault:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@xe_exe=
c_fault_mode@once-invalid-userptr-fault.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-d=
g2-436/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#=
288</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@xe_exe=
c_threads@threads-hang-fd-userptr-rebind.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-=
dg2-436/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html">DMESG-WARN=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">=
Intel XE#3876</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-435/igt@xe_med=
ia_fill@media-fill.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/560">Intel XE#560</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-464/igt@xe_media_fil=
l@media-fill.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-remove-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@xe_oa@=
invalid-remove-userspace-config.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-435/=
igt@xe_oa@invalid-remove-userspace-config.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#=
3573</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-ufence-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-435/igt@xe_oa@=
syncs-ufence-wait-cfg.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-4=
64/igt@xe_oa@syncs-ufence-wait-cfg.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +3 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-466/igt@xe_pm@=
d3cold-mmap-vram.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-464/igt@=
xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@xe_pm@=
d3cold-multiple-execs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-436/igt@xe_pm@d=
3cold-multiple-execs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-466/igt@xe_pm@=
s2idle-vm-bind-userptr.html">ABORT</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2=
-464/igt@xe_pm@s2idle-vm-bind-userptr.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-466/igt@xe_pm@=
s4-multiple-execs.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1358">Intel XE#1358</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-464/igt@xe_pm@s4-m=
ultiple-execs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-435/igt@xe_pm@=
s4-vm-bind-prefetch.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2-46=
4/igt@xe_pm@s4-vm-bind-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@exclusive-ranges:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-464/igt@xe_sri=
ov_auto_provisioning@exclusive-ranges.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v2/shard-dg2=
-435/igt@xe_sriov_auto_provisioning@exclusive-ranges.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#413=
0</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2613-f2401c718ce075408a723b147cac70aad2a8246f -&gt; xe-pw-144=
211v2</li>
</ul>
<p>IGT_8224: c659b986ba648584d36b3cfece897bc84a33dcbb @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-2613-f2401c718ce075408a723b147cac70aad2a8246f: f2401c718ce075408a723b1=
47cac70aad2a8246f<br />
  xe-pw-144211v2: 144211v2</p>

</body>
</html>

--===============2530943787141564350==--
