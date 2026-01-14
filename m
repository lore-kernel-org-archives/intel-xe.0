Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD9B6D37E33
	for <intel-xe@archiver.kernel.org>; Wed, 14 Jan 2026 13:55:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D8F010E118;
	Wed, 14 Jan 2026 13:55:28 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7435D10E2AC;
 Wed, 14 Jan 2026 13:55:27 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2002284573288007542=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_VRAM_Self_Refresh_=28rev7?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 14 Jan 2026 13:55:27 -0000
Message-ID: <176839892747.153896.11140922292264168835@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260113164200.1151788-14-badal.nilawar@intel.com>
In-Reply-To: <20260113164200.1151788-14-badal.nilawar@intel.com>
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

--===============2002284573288007542==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: VRAM Self Refresh (rev7)
URL   : https://patchwork.freedesktop.org/series/145342/
State : failure

== Summary ==

CI Bug Log - changes from xe-4380-1580579412915ac76344699e53124b580060302d_FULL -> xe-pw-145342v7_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-145342v7_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-145342v7_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-145342v7_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_pm_rpm@system-suspend-idle:
    - shard-bmg:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4380-1580579412915ac76344699e53124b580060302d/shard-bmg-9/igt@kms_pm_rpm@system-suspend-idle.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145342v7/shard-bmg-8/igt@kms_pm_rpm@system-suspend-idle.html

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-vram01-511x511:
    - shard-bmg:          [PASS][3] -> [DMESG-FAIL][4] +16 other tests dmesg-fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4380-1580579412915ac76344699e53124b580060302d/shard-bmg-7/igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-vram01-511x511.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145342v7/shard-bmg-3/igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-vram01-511x511.html

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-vram01-286x286:
    - shard-bmg:          [PASS][5] -> [FAIL][6] +66 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4380-1580579412915ac76344699e53124b580060302d/shard-bmg-7/igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-vram01-286x286.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145342v7/shard-bmg-3/igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-vram01-286x286.html

  
#### Warnings ####

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][7], [PASS][8], [PASS][9], [SKIP][10], [PASS][11], [PASS][12], [PASS][13], [PASS][14], [PASS][15], [PASS][16], [PASS][17], [PASS][18], [PASS][19], [PASS][20], [PASS][21], [PASS][22], [PASS][23], [PASS][24], [PASS][25], [PASS][26], [PASS][27], [PASS][28], [PASS][29], [PASS][30], [PASS][31]) ([Intel XE#2457]) -> ([PASS][32], [PASS][33], [PASS][34], [PASS][35], [PASS][36], [PASS][37], [PASS][38], [PASS][39], [PASS][40], [PASS][41], [PASS][42], [PASS][43], [PASS][44], [ABORT][45], [PASS][46], [PASS][47], [ABORT][48], [PASS][49], [ABORT][50], [ABORT][51], [PASS][52], [PASS][53], [SKIP][54], [PASS][55], [PASS][56]) ([Intel XE#2457])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4380-1580579412915ac76344699e53124b580060302d/shard-bmg-1/igt@xe_module_load@load.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4380-1580579412915ac76344699e53124b580060302d/shard-bmg-8/igt@xe_module_load@load.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4380-1580579412915ac76344699e53124b580060302d/shard-bmg-8/igt@xe_module_load@load.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4380-1580579412915ac76344699e53124b580060302d/shard-bmg-8/igt@xe_module_load@load.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4380-1580579412915ac76344699e53124b580060302d/shard-bmg-10/igt@xe_module_load@load.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4380-1580579412915ac76344699e53124b580060302d/shard-bmg-10/igt@xe_module_load@load.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4380-1580579412915ac76344699e53124b580060302d/shard-bmg-8/igt@xe_module_load@load.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4380-1580579412915ac76344699e53124b580060302d/shard-bmg-3/igt@xe_module_load@load.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4380-1580579412915ac76344699e53124b580060302d/shard-bmg-2/igt@xe_module_load@load.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4380-1580579412915ac76344699e53124b580060302d/shard-bmg-2/igt@xe_module_load@load.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4380-1580579412915ac76344699e53124b580060302d/shard-bmg-10/igt@xe_module_load@load.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4380-1580579412915ac76344699e53124b580060302d/shard-bmg-9/igt@xe_module_load@load.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4380-1580579412915ac76344699e53124b580060302d/shard-bmg-9/igt@xe_module_load@load.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4380-1580579412915ac76344699e53124b580060302d/shard-bmg-9/igt@xe_module_load@load.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4380-1580579412915ac76344699e53124b580060302d/shard-bmg-1/igt@xe_module_load@load.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4380-1580579412915ac76344699e53124b580060302d/shard-bmg-3/igt@xe_module_load@load.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4380-1580579412915ac76344699e53124b580060302d/shard-bmg-3/igt@xe_module_load@load.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4380-1580579412915ac76344699e53124b580060302d/shard-bmg-1/igt@xe_module_load@load.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4380-1580579412915ac76344699e53124b580060302d/shard-bmg-7/igt@xe_module_load@load.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4380-1580579412915ac76344699e53124b580060302d/shard-bmg-7/igt@xe_module_load@load.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4380-1580579412915ac76344699e53124b580060302d/shard-bmg-7/igt@xe_module_load@load.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4380-1580579412915ac76344699e53124b580060302d/shard-bmg-7/igt@xe_module_load@load.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4380-1580579412915ac76344699e53124b580060302d/shard-bmg-6/igt@xe_module_load@load.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4380-1580579412915ac76344699e53124b580060302d/shard-bmg-6/igt@xe_module_load@load.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4380-1580579412915ac76344699e53124b580060302d/shard-bmg-6/igt@xe_module_load@load.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145342v7/shard-bmg-8/igt@xe_module_load@load.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145342v7/shard-bmg-2/igt@xe_module_load@load.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145342v7/shard-bmg-8/igt@xe_module_load@load.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145342v7/shard-bmg-7/igt@xe_module_load@load.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145342v7/shard-bmg-7/igt@xe_module_load@load.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145342v7/shard-bmg-2/igt@xe_module_load@load.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145342v7/shard-bmg-7/igt@xe_module_load@load.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145342v7/shard-bmg-9/igt@xe_module_load@load.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145342v7/shard-bmg-8/igt@xe_module_load@load.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145342v7/shard-bmg-6/igt@xe_module_load@load.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145342v7/shard-bmg-3/igt@xe_module_load@load.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145342v7/shard-bmg-1/igt@xe_module_load@load.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145342v7/shard-bmg-1/igt@xe_module_load@load.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145342v7/shard-bmg-4/igt@xe_module_load@load.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145342v7/shard-bmg-6/igt@xe_module_load@load.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145342v7/shard-bmg-10/igt@xe_module_load@load.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145342v7/shard-bmg-4/igt@xe_module_load@load.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145342v7/shard-bmg-6/igt@xe_module_load@load.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145342v7/shard-bmg-4/igt@xe_module_load@load.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145342v7/shard-bmg-4/igt@xe_module_load@load.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145342v7/shard-bmg-3/igt@xe_module_load@load.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145342v7/shard-bmg-10/igt@xe_module_load@load.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145342v7/shard-bmg-10/igt@xe_module_load@load.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145342v7/shard-bmg-1/igt@xe_module_load@load.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145342v7/shard-bmg-3/igt@xe_module_load@load.html

  
Known issues
------------

  Here are the changes found in xe-pw-145342v7_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2327])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145342v7/shard-bmg-6/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#367])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145342v7/shard-bmg-6/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#3432])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145342v7/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#2325])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145342v7/shard-bmg-6/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_edid@vga-edid-read:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#2252]) +1 other test skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145342v7/shard-bmg-6/igt@kms_chamelium_edid@vga-edid-read.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#2320])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145342v7/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#4141]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145342v7/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#2311])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145342v7/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#2313])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145342v7/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-bmg:          [PASS][66] -> [ABORT][67] ([Intel XE#6740]) +1 other test abort
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4380-1580579412915ac76344699e53124b580060302d/shard-bmg-10/igt@kms_hdr@bpc-switch-suspend.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145342v7/shard-bmg-3/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [ABORT][68] ([Intel XE#6740])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145342v7/shard-bmg-7/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#6886]) +4 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145342v7/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145342v7/shard-bmg-6/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_vrr@flip-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#1499])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145342v7/shard-bmg-6/igt@kms_vrr@flip-dpms.html

  * igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#4837] / [Intel XE#6665])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145342v7/shard-bmg-6/igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-priority:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#6874]) +2 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145342v7/shard-bmg-6/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-priority.html

  * igt@xe_exercise_blt@fast-copy-inc-dimension:
    - shard-bmg:          [PASS][74] -> [ABORT][75] ([Intel XE#3970]) +1 other test abort
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4380-1580579412915ac76344699e53124b580060302d/shard-bmg-7/igt@xe_exercise_blt@fast-copy-inc-dimension.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145342v7/shard-bmg-3/igt@xe_exercise_blt@fast-copy-inc-dimension.html

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-vram01-331x331:
    - shard-bmg:          [PASS][76] -> [DMESG-WARN][77] ([Intel XE#3970]) +57 other tests dmesg-warn
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4380-1580579412915ac76344699e53124b580060302d/shard-bmg-7/igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-vram01-331x331.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145342v7/shard-bmg-3/igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-vram01-331x331.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-bmg:          NOTRUN -> [ABORT][78] ([Intel XE#5466])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145342v7/shard-bmg-6/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  * igt@xe_query@multigpu-query-gt-list:
    - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#944])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145342v7/shard-bmg-6/igt@xe_query@multigpu-query-gt-list.html

  
#### Possible fixes ####

  * igt@kms_hdr@bpc-switch@pipe-a-dp-2:
    - shard-bmg:          [ABORT][80] ([Intel XE#6740]) -> [PASS][81] +1 other test pass
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4380-1580579412915ac76344699e53124b580060302d/shard-bmg-7/igt@kms_hdr@bpc-switch@pipe-a-dp-2.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145342v7/shard-bmg-6/igt@kms_hdr@bpc-switch@pipe-a-dp-2.html

  * igt@kms_vrr@flipline:
    - shard-lnl:          [FAIL][82] ([Intel XE#4227]) -> [PASS][83] +1 other test pass
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4380-1580579412915ac76344699e53124b580060302d/shard-lnl-3/igt@kms_vrr@flipline.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145342v7/shard-lnl-5/igt@kms_vrr@flipline.html

  
#### Warnings ####

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][84] ([Intel XE#1503]) -> [ABORT][85] ([Intel XE#6740])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4380-1580579412915ac76344699e53124b580060302d/shard-bmg-6/igt@kms_hdr@invalid-hdr.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145342v7/shard-bmg-7/igt@kms_hdr@invalid-hdr.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][86] ([Intel XE#2426]) -> [FAIL][87] ([Intel XE#1729])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4380-1580579412915ac76344699e53124b580060302d/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145342v7/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][88] ([Intel XE#2509]) -> [SKIP][89] ([Intel XE#2426])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4380-1580579412915ac76344699e53124b580060302d/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145342v7/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
  [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
  [Intel XE#6740]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-4380-1580579412915ac76344699e53124b580060302d -> xe-pw-145342v7

  IGT_8699: 0b67ab25f2eb58b296872c8c34474b79353727d5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4380-1580579412915ac76344699e53124b580060302d: 1580579412915ac76344699e53124b580060302d
  xe-pw-145342v7: 145342v7

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145342v7/index.html

--===============2002284573288007542==
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
<tr><td><b>Series:</b></td><td>VRAM Self Refresh (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/145342/">https://patchwork.freedesktop.org/series/145342/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-145342v7/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-145342v7/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4380-1580579412915ac76344699e53124b580=
060302d_FULL -&gt; xe-pw-145342v7_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-145342v7_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-145342v7_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1453=
42v7_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_pm_rpm@system-suspend-idle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4380-1580579412915ac76344699e53124b580060302d/shard-bmg-9/igt@kms_pm_r=
pm@system-suspend-idle.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-145342v7/shard-bmg-8/igt@kms_pm_rpm@system-susp=
end-idle.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-vram01-511x511=
:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4380-1580579412915ac76344699e53124b580060302d/shard-bmg-7/igt@xe_exerc=
ise_blt@fast-copy-inc-dimension@linear-vram01-vram01-511x511.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145342v7/=
shard-bmg-3/igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-vram0=
1-511x511.html">DMESG-FAIL</a> +16 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-vram01-286x286:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4380-1580579412915ac76344699e53124b580060302d/shard-bmg-7/igt@xe_exerc=
ise_blt@fast-copy-inc-dimension@tile4-vram01-vram01-286x286.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145342v7/s=
hard-bmg-3/igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-vram01-=
286x286.html">FAIL</a> +66 other tests fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-4380-1580579412915ac76344699e53124b580060302d/shard-bmg-1/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-4380-1580579412915ac76344699e53124b580060302d/shard-bmg-8/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-4380-1580579412915ac76344699e53124b580060302d/shard-bmg-8/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-4380-1580579412915ac76344699e53124b580060302d/shard-bmg-8=
/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-4380-1580579412915ac76344699e53124b580060302d/shard-b=
mg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-4380-1580579412915ac76344699e53124b580060302d/sh=
ard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-4380-1580579412915ac76344699e53124b58006030=
2d/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-4380-1580579412915ac76344699e53124b5800=
60302d/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-4380-1580579412915ac76344699e53124b=
580060302d/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-4380-1580579412915ac76344699e53=
124b580060302d/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4380-1580579412915ac763446=
99e53124b580060302d/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4380-1580579412915ac7=
6344699e53124b580060302d/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4380-158057941291=
5ac76344699e53124b580060302d/shard-bmg-9/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4380-15805794=
12915ac76344699e53124b580060302d/shard-bmg-9/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4380-1580=
579412915ac76344699e53124b580060302d/shard-bmg-1/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4380-=
1580579412915ac76344699e53124b580060302d/shard-bmg-3/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4=
380-1580579412915ac76344699e53124b580060302d/shard-bmg-3/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-4380-1580579412915ac76344699e53124b580060302d/shard-bmg-1/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-4380-1580579412915ac76344699e53124b580060302d/shard-bmg-7/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-4380-1580579412915ac76344699e53124b580060302d/shard-bmg-7/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-4380-1580579412915ac76344699e53124b580060302d/shard-bmg-7/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-4380-1580579412915ac76344699e53124b580060302d/shard-bmg-=
7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-4380-1580579412915ac76344699e53124b580060302d/shard-=
bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-4380-1580579412915ac76344699e53124b580060302d/sh=
ard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-4380-1580579412915ac76344699e53124b580060302=
d/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a>) -&gt; (=
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145342v7/shard-b=
mg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-145342v7/shard-bmg-2/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
45342v7/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145342v7/shard-bmg-7/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-145342v7/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145342v7/shard-b=
mg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-145342v7/shard-bmg-7/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
45342v7/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145342v7/shard-bmg-8/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-145342v7/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145342v7/shard-b=
mg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-145342v7/shard-bmg-1/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
45342v7/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145342v7/shard-bmg-4/igt@xe_mod=
ule_load@load.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-145342v7/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145342v7/shard-=
bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-145342v7/shard-bmg-4/igt@xe_module_load@load=
.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-145342v7/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145342v7/shard-bmg-4/igt@xe_=
module_load@load.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-145342v7/shard-bmg-4/igt@xe_module_load@load.html">ABORT<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145342v7/sh=
ard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-145342v7/shard-bmg-10/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-145342v7/shard-bmg-10/igt@xe_module_load@load.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145342v7/shard-bmg-1/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-145342v7/shard-bmg-3/igt@xe_module_load@load.html">PA=
SS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/245=
7">Intel XE#2457</a>)</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-145342v7_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145342v7/shard-bmg-6/igt@kms_big_fb@linear-32bpp-rotat=
e-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145342v7/shard-bmg-6/igt@kms_bw@linear-tiling-1-displa=
ys-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145342v7/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4=
-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145342v7/shard-bmg-6/igt@kms_chamelium_color@ctm-blue-=
to-red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@vga-edid-read:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145342v7/shard-bmg-6/igt@kms_chamelium_edid@vga-edid-r=
ead.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145342v7/shard-bmg-6/igt@kms_cursor_crc@cursor-offscre=
en-128x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145342v7/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-=
1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-render:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145342v7/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145342v7/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-=
1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4380-1580579412915ac76344699e53124b580060302d/shard-bmg-10/igt@kms_hdr=
@bpc-switch-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-145342v7/shard-bmg-3/igt@kms_hdr@bpc-switch-suspen=
d.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/6740">Intel XE#6740</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145342v7/shard-bmg-7/igt@kms_hdr@invalid-hdr@pipe-a-hd=
mi-a-3.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6740">Intel XE#6740</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145342v7/shard-bmg-6/igt@kms_plane_scaling@planes-upsc=
ale-20x20-downscale-factor-0-5@pipe-b.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +4 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145342v7/shard-bmg-6/igt@kms_pm_rpm@modeset-lpsp-stres=
s-no-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145342v7/shard-bmg-6/igt@kms_vrr@flip-dpms.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">I=
ntel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145342v7/shard-bmg-6/igt@xe_eudebug_online@writes-cach=
ing-vram-bb-sram-target-sram.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-priority:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145342v7/shard-bmg-6/igt@xe_exec_multi_queue@few-execs=
-preempt-mode-fault-priority.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +2 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4380-1580579412915ac76344699e53124b580060302d/shard-bmg-7/igt@xe_exerc=
ise_blt@fast-copy-inc-dimension.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-145342v7/shard-bmg-3/igt@xe_exercise_b=
lt@fast-copy-inc-dimension.html">ABORT</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>) +1 other test abor=
t</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-vram01-331x331=
:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4380-1580579412915ac76344699e53124b580060302d/shard-bmg-7/igt@xe_exerc=
ise_blt@fast-copy-inc-dimension@xmajor-system-vram01-331x331.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145342v7/=
shard-bmg-3/igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-vram0=
1-331x331.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3970">Intel XE#3970</a>) +57 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145342v7/shard-bmg-6/igt@xe_fault_injection@probe-fail=
-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/5466">Intel XE#5466</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-gt-list:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145342v7/shard-bmg-6/igt@xe_query@multigpu-query-gt-li=
st.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_hdr@bpc-switch@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4380-1580579412915ac76344699e53124b580060302d/shard-bmg-7/igt@kms_hdr@=
bpc-switch@pipe-a-dp-2.html">ABORT</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/6740">Intel XE#6740</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145342v7/shard-bmg-6/igt@kms_hdr=
@bpc-switch@pipe-a-dp-2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4380-1580579412915ac76344699e53124b580060302d/shard-lnl-3/igt@kms_vrr@=
flipline.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4227">Intel XE#4227</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-145342v7/shard-lnl-5/igt@kms_vrr@flipline.html"=
>PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4380-1580579412915ac76344699e53124b580060302d/shard-bmg-6/igt@kms_hdr@=
invalid-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-145342v7/shard-bmg-7/igt@kms_hdr@invalid-hdr=
.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/6740">Intel XE#6740</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4380-1580579412915ac76344699e53124b580060302d/shard-bmg-8/igt@kms_tile=
d_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145342v7/shard-bmg-10/igt@k=
ms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4380-1580579412915ac76344699e53124b580060302d/shard-bmg-10/igt@kms_til=
ed_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145342v7/sh=
ard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426"=
>Intel XE#2426</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4380-1580579412915ac76344699e53124b580060302d -&gt; xe-pw-145=
342v7</li>
</ul>
<p>IGT_8699: 0b67ab25f2eb58b296872c8c34474b79353727d5 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-4380-1580579412915ac76344699e53124b580060302d: 1580579412915ac76344699=
e53124b580060302d<br />
  xe-pw-145342v7: 145342v7</p>

</body>
</html>

--===============2002284573288007542==--
