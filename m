Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69185C3DA64
	for <intel-xe@archiver.kernel.org>; Thu,  1 Aug 2024 20:32:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13AF910E06C;
	Thu,  1 Aug 2024 20:32:15 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 863F610E06C;
 Thu,  1 Aug 2024 20:32:13 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6870565757964259148=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_Parallel_submission_of_dma_fenc?=
 =?utf-8?q?e_jobs_and_LR_jobs_with_shared_hardware_resources_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 01 Aug 2024 20:32:13 -0000
Message-ID: <172254433352.489091.18175807070011008511@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240801125748.355078-1-francois.dugast@intel.com>
In-Reply-To: <20240801125748.355078-1-francois.dugast@intel.com>
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

--===============6870565757964259148==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Parallel submission of dma fence jobs and LR jobs with shared hardware resources (rev5)
URL   : https://patchwork.freedesktop.org/series/136192/
State : failure

== Summary ==

CI Bug Log - changes from xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a_full -> xe-pw-136192v5_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-136192v5_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-136192v5_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-136192v5_full:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@hotreplug-lateclose:
    - shard-lnl:          [PASS][1] -> [DMESG-WARN][2] +2 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-5/igt@core_hotunplug@hotreplug-lateclose.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-8/igt@core_hotunplug@hotreplug-lateclose.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-adlp:         [PASS][3] -> [DMESG-WARN][4] +1 other test dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-8/igt@kms_flip@flip-vs-suspend.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-8/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_vrr@flipline:
    - shard-lnl:          [PASS][5] -> [FAIL][6] +5 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-3/igt@kms_vrr@flipline.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-4/igt@kms_vrr@flipline.html

  * igt@xe_exec_reset@parallel-close-execqueues-close-fd:
    - shard-adlp:         [PASS][7] -> [FAIL][8] +4 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-4/igt@xe_exec_reset@parallel-close-execqueues-close-fd.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-8/igt@xe_exec_reset@parallel-close-execqueues-close-fd.html
    - shard-dg2-set2:     [PASS][9] -> [FAIL][10] +3 other tests fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-433/igt@xe_exec_reset@parallel-close-execqueues-close-fd.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@xe_exec_reset@parallel-close-execqueues-close-fd.html

  * igt@xe_module_load@unload:
    - shard-adlp:         [PASS][11] -> [ABORT][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-8/igt@xe_module_load@unload.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-9/igt@xe_module_load@unload.html
    - shard-dg2-set2:     [PASS][13] -> [ABORT][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-463/igt@xe_module_load@unload.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-463/igt@xe_module_load@unload.html
    - shard-lnl:          [PASS][15] -> [ABORT][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-5/igt@xe_module_load@unload.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-3/igt@xe_module_load@unload.html

  
#### Warnings ####

  * igt@xe_exec_reset@virtual-close-execqueues-close-fd:
    - shard-dg2-set2:     [SKIP][17] ([Intel XE#1130] / [Intel XE#1201]) -> [FAIL][18] +1 other test fail
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-466/igt@xe_exec_reset@virtual-close-execqueues-close-fd.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@xe_exec_reset@virtual-close-execqueues-close-fd.html

  * igt@xe_module_load@many-reload:
    - shard-dg2-set2:     [DMESG-FAIL][19] -> [FAIL][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-466/igt@xe_module_load@many-reload.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@xe_module_load@many-reload.html

  * igt@xe_module_load@reload:
    - shard-dg2-set2:     [FAIL][21] ([Intel XE#2136]) -> [ABORT][22]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-433/igt@xe_module_load@reload.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@xe_module_load@reload.html
    - shard-lnl:          [FAIL][23] ([Intel XE#2136]) -> [ABORT][24] +2 other tests abort
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-4/igt@xe_module_load@reload.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-1/igt@xe_module_load@reload.html
    - shard-adlp:         [FAIL][25] ([Intel XE#2136]) -> [ABORT][26]
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-2/igt@xe_module_load@reload.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-8/igt@xe_module_load@reload.html

  * igt@xe_module_load@reload-no-display:
    - shard-adlp:         [FAIL][27] ([Intel XE#1204] / [Intel XE#2136]) -> [ABORT][28]
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-1/igt@xe_module_load@reload-no-display.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-6/igt@xe_module_load@reload-no-display.html
    - shard-dg2-set2:     [FAIL][29] ([Intel XE#1204] / [Intel XE#2136]) -> [ABORT][30]
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-436/igt@xe_module_load@reload-no-display.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-463/igt@xe_module_load@reload-no-display.html

  * igt@xe_vm@bind-execqueues-conflict:
    - shard-adlp:         [SKIP][31] ([Intel XE#1130] / [Intel XE#1201]) -> [FAIL][32] +1 other test fail
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-8/igt@xe_vm@bind-execqueues-conflict.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-1/igt@xe_vm@bind-execqueues-conflict.html
    - shard-lnl:          [SKIP][33] ([Intel XE#1130]) -> [FAIL][34]
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-5/igt@xe_vm@bind-execqueues-conflict.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-2/igt@xe_vm@bind-execqueues-conflict.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_big_fb@yf-tiled-addfb:
    - {shard-bmg}:        [SKIP][35] ([Intel XE#2328]) -> [SKIP][36]
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-3/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
    - {shard-bmg}:        [SKIP][37] ([Intel XE#1124]) -> [SKIP][38] +2 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-bmg-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - {shard-bmg}:        [SKIP][39] ([Intel XE#367]) -> [SKIP][40]
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-bmg-8/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-3/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-b-hdmi-a-3:
    - {shard-bmg}:        [PASS][41] -> [DMESG-FAIL][42]
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-b-hdmi-a-3.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-b-hdmi-a-3.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:
    - {shard-bmg}:        [SKIP][43] ([Intel XE#2251]) -> [SKIP][44] +3 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - {shard-bmg}:        [FAIL][45] -> [SKIP][46]
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-bmg-4/igt@kms_cdclk@mode-transition-all-outputs.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-2/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@ctm-0-75:
    - {shard-bmg}:        [SKIP][47] ([Intel XE#2325]) -> [SKIP][48]
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-bmg-2/igt@kms_chamelium_color@ctm-0-75.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-3/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:
    - {shard-bmg}:        [SKIP][49] ([Intel XE#2252]) -> [SKIP][50] +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-bmg-4/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-3/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html

  * igt@kms_content_protection@srm:
    - {shard-bmg}:        [SKIP][51] -> [FAIL][52]
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-bmg-4/igt@kms_content_protection@srm.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-2/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-onscreen-32x10:
    - {shard-bmg}:        [SKIP][53] ([Intel XE#2320]) -> [SKIP][54] +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-32x10.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-3/igt@kms_cursor_crc@cursor-onscreen-32x10.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - {shard-bmg}:        [SKIP][55] -> [DMESG-WARN][56]
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-bmg-2/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - {shard-bmg}:        [SKIP][57] ([Intel XE#2286]) -> [SKIP][58] +2 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-bmg-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - {shard-bmg}:        [PASS][59] -> [INCOMPLETE][60] +4 other tests incomplete
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-bmg-5/igt@kms_flip@flip-vs-suspend-interruptible.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-2/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - {shard-bmg}:        [SKIP][61] ([Intel XE#2293]) -> [SKIP][62] +2 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - {shard-bmg}:        [SKIP][63] ([Intel XE#2311]) -> [SKIP][64] +5 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
    - {shard-bmg}:        [FAIL][65] ([Intel XE#2333]) -> [SKIP][66] +2 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-msflip-blt:
    - {shard-bmg}:        [SKIP][67] ([Intel XE#2312]) -> [SKIP][68]
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-msflip-blt.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
    - {shard-bmg}:        [SKIP][69] ([Intel XE#2313]) -> [SKIP][70] +5 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_hdr@static-toggle-suspend:
    - {shard-bmg}:        [FAIL][71] ([Intel XE#2382]) -> [SKIP][72]
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-bmg-5/igt@kms_hdr@static-toggle-suspend.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-4/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_plane@pixel-format@pipe-b-plane-0:
    - {shard-bmg}:        NOTRUN -> [DMESG-WARN][73] +1 other test dmesg-warn
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-1/igt@kms_plane@pixel-format@pipe-b-plane-0.html

  * igt@kms_plane_multiple@tiling-none:
    - {shard-bmg}:        [PASS][74] -> [SKIP][75] +74 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-bmg-8/igt@kms_plane_multiple@tiling-none.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-3/igt@kms_plane_multiple@tiling-none.html

  * igt@kms_pm_backlight@basic-brightness:
    - {shard-bmg}:        [SKIP][76] ([Intel XE#870]) -> [SKIP][77]
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-bmg-4/igt@kms_pm_backlight@basic-brightness.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-3/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:
    - {shard-bmg}:        [SKIP][78] ([Intel XE#1489]) -> [SKIP][79]
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-bmg-3/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-3/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr@pr-suspend:
    - {shard-bmg}:        [SKIP][80] ([Intel XE#2234]) -> [SKIP][81] +3 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-bmg-4/igt@kms_psr@pr-suspend.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-3/igt@kms_psr@pr-suspend.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - {shard-bmg}:        [SKIP][82] ([Intel XE#2329]) -> [SKIP][83]
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-bmg-4/igt@kms_rotation_crc@primary-rotation-90.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-3/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_tiled_display@basic-test-pattern:
    - {shard-bmg}:        [SKIP][84] ([Intel XE#2426]) -> [FAIL][85]
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - {shard-bmg}:        [PASS][86] -> [FAIL][87] +7 other tests fail
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-bmg-8/igt@kms_universal_plane@cursor-fb-leak.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-7/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - {shard-bmg}:        [TIMEOUT][88] ([Intel XE#1027]) -> [INCOMPLETE][89]
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-bmg-3/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-5/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-beng-threads-large:
    - {shard-bmg}:        NOTRUN -> [TIMEOUT][90]
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-1/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_evict@evict-cm-threads-large:
    - {shard-bmg}:        [PASS][91] -> [TIMEOUT][92]
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-bmg-6/igt@xe_evict@evict-cm-threads-large.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-8/igt@xe_evict@evict-cm-threads-large.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - {shard-bmg}:        [TIMEOUT][93] -> [INCOMPLETE][94]
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict@evict-mixed-threads-small:
    - {shard-bmg}:        [PASS][95] -> [DMESG-WARN][96] +3 other tests dmesg-warn
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-bmg-1/igt@xe_evict@evict-mixed-threads-small.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-6/igt@xe_evict@evict-mixed-threads-small.html

  * igt@xe_exec_basic@multigpu-once-null-defer-bind:
    - {shard-bmg}:        [SKIP][97] ([Intel XE#2322]) -> [SKIP][98] +1 other test skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-bmg-8/igt@xe_exec_basic@multigpu-once-null-defer-bind.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-3/igt@xe_exec_basic@multigpu-once-null-defer-bind.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm:
    - {shard-bmg}:        NOTRUN -> [SKIP][99] +22 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-3/igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm.html

  * igt@xe_module_load@many-reload:
    - {shard-bmg}:        [TIMEOUT][100] -> [FAIL][101]
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-bmg-7/igt@xe_module_load@many-reload.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-3/igt@xe_module_load@many-reload.html

  * igt@xe_module_load@unload:
    - {shard-bmg}:        NOTRUN -> [ABORT][102]
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-3/igt@xe_module_load@unload.html

  * igt@xe_vm@bind-execqueues-conflict:
    - {shard-bmg}:        NOTRUN -> [FAIL][103] +5 other tests fail
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-7/igt@xe_vm@bind-execqueues-conflict.html

  
Known issues
------------

  Here are the changes found in xe-pw-136192v5_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-adlp:         NOTRUN -> [ABORT][104] ([Intel XE#2421])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-8/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@core_hotunplug@hotunplug-rescan:
    - shard-dg2-set2:     [PASS][105] -> [SKIP][106] ([Intel XE#1201] / [Intel XE#1885])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-466/igt@core_hotunplug@hotunplug-rescan.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@core_hotunplug@hotunplug-rescan.html

  * igt@intel_hwmon@hwmon-read:
    - shard-lnl:          NOTRUN -> [SKIP][107] ([Intel XE#1125])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-5/igt@intel_hwmon@hwmon-read.html
    - shard-adlp:         NOTRUN -> [SKIP][108] ([Intel XE#1125] / [Intel XE#1201])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-9/igt@intel_hwmon@hwmon-read.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:
    - shard-adlp:         [PASS][109] -> [DMESG-WARN][110] ([Intel XE#324]) +1 other test dmesg-warn
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][111] ([Intel XE#1201] / [Intel XE#801]) +23 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-466/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y:
    - shard-adlp:         [PASS][112] -> [DMESG-WARN][113] ([Intel XE#2338])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - shard-lnl:          [PASS][114] -> [FAIL][115] ([Intel XE#1659])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-7/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-2/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-180:
    - shard-dg2-set2:     [PASS][116] -> [SKIP][117] ([Intel XE#1201]) +6 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@kms_big_fb@x-tiled-16bpp-rotate-180.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@kms_big_fb@x-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-180:
    - shard-adlp:         NOTRUN -> [FAIL][118] ([Intel XE#1874]) +1 other test fail
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-9/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][119] ([Intel XE#1201] / [Intel XE#316]) +2 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-463/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
    - shard-lnl:          NOTRUN -> [SKIP][120] ([Intel XE#1407]) +2 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-8/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
    - shard-adlp:         NOTRUN -> [SKIP][121] ([Intel XE#1201] / [Intel XE#316]) +2 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-9/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][122] ([Intel XE#1124] / [Intel XE#1201]) +2 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html
    - shard-lnl:          NOTRUN -> [SKIP][123] ([Intel XE#1124]) +2 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [PASS][124] -> [FAIL][125] ([Intel XE#1231])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][126] ([Intel XE#1201] / [Intel XE#2351]) +2 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-463/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
    - shard-lnl:          NOTRUN -> [SKIP][127] ([Intel XE#2351]) +5 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-3/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [SKIP][128] ([Intel XE#1124] / [Intel XE#1201]) +6 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][129] ([Intel XE#1201] / [Intel XE#2191])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-9/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
    - shard-adlp:         NOTRUN -> [SKIP][130] ([Intel XE#1201] / [Intel XE#367])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-6/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][131] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-433/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][132] ([Intel XE#1201] / [Intel XE#787]) +83 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][133] ([Intel XE#1201] / [Intel XE#787]) +56 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-2/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][134] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +16 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-435/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][135] ([Intel XE#787]) +6 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][136] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-y-tiled-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][137] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +26 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-8/igt@kms_ccs@random-ccs-data-y-tiled-ccs.html
    - shard-lnl:          NOTRUN -> [SKIP][138] ([Intel XE#1399]) +4 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-3/igt@kms_ccs@random-ccs-data-y-tiled-ccs.html

  * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][139] ([Intel XE#1201] / [Intel XE#314]) +3 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-466/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-lnl:          NOTRUN -> [SKIP][140] ([Intel XE#306])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-8/igt@kms_chamelium_color@ctm-max.html
    - shard-adlp:         NOTRUN -> [SKIP][141] ([Intel XE#1201] / [Intel XE#306])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-9/igt@kms_chamelium_color@ctm-max.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][142] ([Intel XE#1201] / [Intel XE#306])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-463/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][143] ([Intel XE#1201] / [Intel XE#373]) +3 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-433/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html
    - shard-lnl:          NOTRUN -> [SKIP][144] ([Intel XE#373]) +3 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-7/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html

  * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
    - shard-adlp:         NOTRUN -> [SKIP][145] ([Intel XE#1201] / [Intel XE#373]) +3 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-9/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html

  * igt@kms_content_protection@legacy:
    - shard-adlp:         NOTRUN -> [SKIP][146] ([Intel XE#1201] / [Intel XE#455]) +14 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-8/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
    - shard-dg2-set2:     NOTRUN -> [SKIP][147] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) +5 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-463/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-adlp:         NOTRUN -> [SKIP][148] ([Intel XE#1201] / [Intel XE#308])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-4/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][149] ([Intel XE#1201] / [Intel XE#455]) +10 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@kms_cursor_crc@cursor-sliding-max-size.html
    - shard-lnl:          NOTRUN -> [SKIP][150] ([Intel XE#1424]) +2 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-6/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-adlp:         NOTRUN -> [SKIP][151] ([Intel XE#1201] / [Intel XE#309]) +1 other test skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-8/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
    - shard-lnl:          NOTRUN -> [SKIP][152] ([Intel XE#309]) +2 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-1/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-adlp:         NOTRUN -> [SKIP][153] ([Intel XE#1201] / [Intel XE#323])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2-set2:     NOTRUN -> [SKIP][154] ([Intel XE#1201] / [Intel XE#703])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-433/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-lnl:          NOTRUN -> [SKIP][155] ([Intel XE#1138])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-4/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible@ac-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][156] -> [INCOMPLETE][157] ([Intel XE#1195]) +1 other test incomplete
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-435/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible@ac-hdmi-a6-dp4.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible@ac-hdmi-a6-dp4.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][158] ([Intel XE#1201] / [Intel XE#310]) +2 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-1/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
    - shard-lnl:          NOTRUN -> [SKIP][159] ([Intel XE#1421]) +1 other test skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-3/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [PASS][160] -> [DMESG-WARN][161] ([Intel XE#1551]) +1 other test dmesg-warn
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-435/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check@a-edp1:
    - shard-lnl:          [PASS][162] -> [FAIL][163] ([Intel XE#886]) +1 other test fail
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-7/igt@kms_flip@wf_vblank-ts-check@a-edp1.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-4/igt@kms_flip@wf_vblank-ts-check@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][164] ([Intel XE#455])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][165] ([Intel XE#1401] / [Intel XE#1745])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][166] ([Intel XE#1401]) +4 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][167] ([Intel XE#324]) +3 other tests dmesg-fail
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][168] ([Intel XE#1397] / [Intel XE#1745]) +2 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][169] ([Intel XE#1397]) +2 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:
    - shard-adlp:         [PASS][170] -> [FAIL][171] ([Intel XE#1874]) +3 other tests fail
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html

  * igt@kms_force_connector_basic@force-connector-state:
    - shard-dg2-set2:     NOTRUN -> [SKIP][172] ([Intel XE#1201] / [i915#2575]) +1 other test skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][173] ([Intel XE#1201]) +20 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render:
    - shard-lnl:          [PASS][174] -> [SKIP][175] ([Intel XE#2351]) +4 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:
    - shard-adlp:         NOTRUN -> [FAIL][176] ([Intel XE#1861])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt:
    - shard-adlp:         [PASS][177] -> [FAIL][178] ([Intel XE#1861])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][179] ([Intel XE#651]) +2 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-wc.html
    - shard-lnl:          NOTRUN -> [SKIP][180] ([Intel XE#651]) +7 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][181] ([Intel XE#1201] / [Intel XE#651]) +15 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][182] ([Intel XE#1201] / [Intel XE#651]) +8 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][183] ([Intel XE#1201] / [Intel XE#653]) +4 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:
    - shard-dg2-set2:     NOTRUN -> [SKIP][184] ([Intel XE#1201] / [Intel XE#653]) +9 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:
    - shard-adlp:         NOTRUN -> [SKIP][185] ([Intel XE#1201] / [Intel XE#656]) +21 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][186] ([Intel XE#1201]) +5 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][187] ([Intel XE#656]) +12 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][188] ([Intel XE#653]) +2 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-move.html

  * igt@kms_getfb@getfb2-into-addfb2:
    - shard-lnl:          [PASS][189] -> [SKIP][190] ([Intel XE#2423]) +13 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-5/igt@kms_getfb@getfb2-into-addfb2.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-3/igt@kms_getfb@getfb2-into-addfb2.html

  * igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][191] ([Intel XE#1450]) +1 other test skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-5/igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1.html

  * igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][192] ([Intel XE#1450] / [Intel XE#599]) +1 other test skip
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-5/igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1:
    - shard-lnl:          [PASS][193] -> [FAIL][194] ([Intel XE#2028]) +2 other tests fail
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-8/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html

  * igt@kms_plane@pixel-format:
    - shard-adlp:         NOTRUN -> [INCOMPLETE][195] ([Intel XE#1035] / [Intel XE#1195])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-6/igt@kms_plane@pixel-format.html

  * igt@kms_plane@pixel-format@pipe-a-plane-3:
    - shard-adlp:         NOTRUN -> [WARN][196] ([Intel XE#2078]) +1 other test warn
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-6/igt@kms_plane@pixel-format@pipe-a-plane-3.html

  * igt@kms_plane@plane-panning-bottom-right:
    - shard-dg2-set2:     [PASS][197] -> [SKIP][198] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) +15 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@kms_plane@plane-panning-bottom-right.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@kms_plane@plane-panning-bottom-right.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:
    - shard-dg2-set2:     NOTRUN -> [FAIL][199] ([Intel XE#616])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-435/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [DMESG-FAIL][200] ([Intel XE#1551])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-435/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html

  * igt@kms_plane@plane-position-covered:
    - shard-lnl:          [PASS][201] -> [DMESG-FAIL][202] ([Intel XE#324]) +2 other tests dmesg-fail
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-7/igt@kms_plane@plane-position-covered.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-5/igt@kms_plane@plane-position-covered.html

  * igt@kms_plane@plane-position-covered@pipe-b-plane-1:
    - shard-lnl:          [PASS][203] -> [DMESG-WARN][204] ([Intel XE#324]) +3 other tests dmesg-warn
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-7/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-5/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html

  * igt@kms_plane_lowres@tiling-4@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][205] ([Intel XE#599]) +3 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-1/igt@kms_plane_lowres@tiling-4@pipe-b-edp-1.html

  * igt@kms_plane_multiple@tiling-none:
    - shard-adlp:         [PASS][206] -> [SKIP][207] ([Intel XE#1201]) +44 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-4/igt@kms_plane_multiple@tiling-none.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-4/igt@kms_plane_multiple@tiling-none.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][208] -> [FAIL][209] ([Intel XE#361])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][210] ([Intel XE#498]) +3 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-1/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b-edp-1.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers:
    - shard-lnl:          NOTRUN -> [SKIP][211] ([Intel XE#2423]) +4 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-3/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20:
    - shard-dg2-set2:     [PASS][212] -> [SKIP][213] ([Intel XE#1201] / [i915#2575]) +10 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-adlp:         NOTRUN -> [SKIP][214] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) +1 other test skip
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][215] ([Intel XE#1201] / [Intel XE#2318]) +2 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-c-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][216] ([Intel XE#2318]) +9 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-c-edp-1.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [PASS][217] -> [FAIL][218] ([Intel XE#718])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-8/igt@kms_pm_dc@dc5-dpms.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-8/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-adlp:         [PASS][219] -> [FAIL][220] ([Intel XE#718])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-6/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-adlp:         NOTRUN -> [SKIP][221] ([Intel XE#1201] / [Intel XE#734])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-2/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][222] ([Intel XE#1201] / [Intel XE#1489]) +2 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][223] ([Intel XE#1489])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:
    - shard-lnl:          [PASS][224] -> [DMESG-WARN][225] ([Intel XE#1705]) +1 other test dmesg-warn
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-1/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-7/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-lnl:          NOTRUN -> [SKIP][226] ([Intel XE#1128])
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-1/igt@kms_psr2_su@frontbuffer-xrgb8888.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][227] ([Intel XE#1122] / [Intel XE#1201])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-adlp:         NOTRUN -> [SKIP][228] ([Intel XE#1122] / [Intel XE#1201]) +1 other test skip
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-1/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-cursor-plane-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][229] ([Intel XE#1201] / [Intel XE#929]) +6 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-466/igt@kms_psr@fbc-pr-cursor-plane-move.html

  * igt@kms_psr@pr-sprite-plane-onoff:
    - shard-adlp:         NOTRUN -> [SKIP][230] ([Intel XE#1201] / [Intel XE#929]) +7 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-2/igt@kms_psr@pr-sprite-plane-onoff.html
    - shard-lnl:          NOTRUN -> [SKIP][231] ([Intel XE#1406])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-6/igt@kms_psr@pr-sprite-plane-onoff.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][232] ([Intel XE#1201] / [Intel XE#327])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-adlp:         NOTRUN -> [SKIP][233] ([Intel XE#1201] / [Intel XE#362])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-1/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-adlp:         [PASS][234] -> [FAIL][235] ([Intel XE#771] / [Intel XE#899])
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:
    - shard-adlp:         [PASS][236] -> [FAIL][237] ([Intel XE#899])
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2-set2:     NOTRUN -> [SKIP][238] ([Intel XE#1091] / [Intel XE#1201])
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-466/igt@sriov_basic@enable-vfs-autoprobe-off.html
    - shard-lnl:          NOTRUN -> [SKIP][239] ([Intel XE#1091])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-6/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_ccs@block-multicopy-compressed:
    - shard-adlp:         NOTRUN -> [SKIP][240] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#488])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-2/igt@xe_ccs@block-multicopy-compressed.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-adlp:         NOTRUN -> [SKIP][241] ([Intel XE#1201] / [Intel XE#1447])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-2/igt@xe_compute@ccs-mode-compute-kernel.html
    - shard-dg2-set2:     NOTRUN -> [FAIL][242] ([Intel XE#1050])
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-435/igt@xe_compute@ccs-mode-compute-kernel.html
    - shard-lnl:          NOTRUN -> [SKIP][243] ([Intel XE#1447])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-4/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-adlp:         NOTRUN -> [SKIP][244] ([Intel XE#1123] / [Intel XE#1201])
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-1/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     [PASS][245] -> [INCOMPLETE][246] ([Intel XE#1195] / [Intel XE#1473])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-435/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-beng-mixed-threads-large-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][247] ([Intel XE#688]) +2 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-1/igt@xe_evict@evict-beng-mixed-threads-large-multi-vm.html
    - shard-adlp:         NOTRUN -> [SKIP][248] ([Intel XE#1201] / [Intel XE#261]) +1 other test skip
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-9/igt@xe_evict@evict-beng-mixed-threads-large-multi-vm.html

  * igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:
    - shard-adlp:         NOTRUN -> [SKIP][249] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688]) +2 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:
    - shard-adlp:         NOTRUN -> [SKIP][250] ([Intel XE#1201] / [Intel XE#1392]) +3 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html
    - shard-lnl:          NOTRUN -> [SKIP][251] ([Intel XE#1392]) +1 other test skip
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html

  * igt@xe_exec_basic@no-exec-basic-defer-bind:
    - shard-dg2-set2:     [PASS][252] -> [SKIP][253] ([Intel XE#1130] / [Intel XE#1201]) +37 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-435/igt@xe_exec_basic@no-exec-basic-defer-bind.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@xe_exec_basic@no-exec-basic-defer-bind.html

  * igt@xe_exec_compute_mode@many-rebind:
    - shard-lnl:          [PASS][254] -> [SKIP][255] ([Intel XE#1130]) +24 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-2/igt@xe_exec_compute_mode@many-rebind.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-3/igt@xe_exec_compute_mode@many-rebind.html

  * igt@xe_exec_fault_mode@invalid-va:
    - shard-adlp:         NOTRUN -> [SKIP][256] ([Intel XE#1201] / [Intel XE#288]) +14 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-2/igt@xe_exec_fault_mode@invalid-va.html

  * igt@xe_exec_fault_mode@many-rebind-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][257] ([Intel XE#288]) +3 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@xe_exec_fault_mode@many-rebind-prefetch.html

  * igt@xe_exec_fault_mode@many-userptr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][258] ([Intel XE#1201] / [Intel XE#288]) +9 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-435/igt@xe_exec_fault_mode@many-userptr.html

  * igt@xe_exec_threads@threads-bal-mixed-shared-vm-basic:
    - shard-adlp:         NOTRUN -> [SKIP][259] ([Intel XE#1130] / [Intel XE#1201]) +2 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-4/igt@xe_exec_threads@threads-bal-mixed-shared-vm-basic.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][260] ([Intel XE#1130] / [Intel XE#1201]) +3 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@xe_exec_threads@threads-bal-mixed-shared-vm-basic.html

  * igt@xe_exec_threads@threads-mixed-shared-vm-userptr:
    - shard-adlp:         [PASS][261] -> [INCOMPLETE][262] ([Intel XE#1169] / [Intel XE#1195])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-4/igt@xe_exec_threads@threads-mixed-shared-vm-userptr.html
    - shard-dg2-set2:     [PASS][263] -> [INCOMPLETE][264] ([Intel XE#1169] / [Intel XE#1195] / [Intel XE#1356])
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-433/igt@xe_exec_threads@threads-mixed-shared-vm-userptr.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-434/igt@xe_exec_threads@threads-mixed-shared-vm-userptr.html

  * igt@xe_live_ktest@xe_bo:
    - shard-lnl:          [PASS][265] -> [SKIP][266] ([Intel XE#1192])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-6/igt@xe_live_ktest@xe_bo.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-6/igt@xe_live_ktest@xe_bo.html

  * igt@xe_oa@closed-fd-and-unmapped-access:
    - shard-dg2-set2:     NOTRUN -> [SKIP][267] ([Intel XE#1201] / [Intel XE#2419]) +1 other test skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-434/igt@xe_oa@closed-fd-and-unmapped-access.html

  * igt@xe_oa@invalid-oa-format-id:
    - shard-adlp:         NOTRUN -> [SKIP][268] ([Intel XE#1201] / [Intel XE#2419]) +2 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-8/igt@xe_oa@invalid-oa-format-id.html

  * igt@xe_oa@short-reads:
    - shard-lnl:          NOTRUN -> [SKIP][269] ([Intel XE#2419])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-3/igt@xe_oa@short-reads.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-adlp:         NOTRUN -> [SKIP][270] ([Intel XE#1201] / [Intel XE#979])
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-9/igt@xe_pat@pat-index-xehpc.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][271] ([Intel XE#1201] / [Intel XE#979])
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-463/igt@xe_pat@pat-index-xehpc.html
    - shard-lnl:          NOTRUN -> [SKIP][272] ([Intel XE#1420])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-8/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pm@s2idle-vm-bind-unbind-all:
    - shard-lnl:          [PASS][273] -> [FAIL][274] ([Intel XE#1924] / [Intel XE#2028])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-5/igt@xe_pm@s2idle-vm-bind-unbind-all.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-1/igt@xe_pm@s2idle-vm-bind-unbind-all.html

  * igt@xe_pm@s3-basic-exec:
    - shard-lnl:          NOTRUN -> [SKIP][275] ([Intel XE#584])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-4/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm@s3-vm-bind-prefetch:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][276] ([Intel XE#569])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@xe_pm@s3-vm-bind-prefetch.html

  * igt@xe_pm_residency@idle-residency:
    - shard-adlp:         [PASS][277] -> [SKIP][278] ([Intel XE#1130] / [Intel XE#1201]) +14 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-9/igt@xe_pm_residency@idle-residency.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-4/igt@xe_pm_residency@idle-residency.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-dg2-set2:     NOTRUN -> [SKIP][279] ([Intel XE#1201] / [Intel XE#944])
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-463/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  * igt@xe_query@query-uc-fw-version-huc:
    - shard-lnl:          NOTRUN -> [SKIP][280] ([Intel XE#1130])
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-3/igt@xe_query@query-uc-fw-version-huc.html

  
#### Possible fixes ####

  * igt@fbdev@nullptr:
    - shard-dg2-set2:     [SKIP][281] ([Intel XE#2134]) -> [PASS][282]
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@fbdev@nullptr.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@fbdev@nullptr.html

  * igt@kms_big_fb@x-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][283] ([Intel XE#1201] / [Intel XE#2351]) -> [PASS][284] +2 other tests pass
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-433/igt@kms_big_fb@x-tiled-addfb-size-offset-overflow.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-434/igt@kms_big_fb@x-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@x-tiled-addfb-size-overflow:
    - shard-lnl:          [SKIP][285] ([Intel XE#2351]) -> [PASS][286] +39 other tests pass
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-8/igt@kms_big_fb@x-tiled-addfb-size-overflow.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-7/igt@kms_big_fb@x-tiled-addfb-size-overflow.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-c-hdmi-a-3:
    - {shard-bmg}:        [DMESG-WARN][287] -> [PASS][288] +3 other tests pass
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-c-hdmi-a-3.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-c-hdmi-a-3.html

  * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
    - {shard-bmg}:        [SKIP][289] ([Intel XE#2291]) -> [PASS][290]
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-bmg-4/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-3/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@single-move@pipe-a:
    - shard-lnl:          [DMESG-WARN][291] ([Intel XE#877]) -> [PASS][292] +1 other test pass
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-4/igt@kms_cursor_legacy@single-move@pipe-a.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-4/igt@kms_cursor_legacy@single-move@pipe-a.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - {shard-bmg}:        [SKIP][293] ([Intel XE#1340]) -> [PASS][294]
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-bmg-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-8/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-dg2-set2:     [SKIP][295] ([Intel XE#1201] / [i915#2575]) -> [PASS][296] +36 other tests pass
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-463/igt@kms_flip@2x-dpms-vs-vblank-race.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-463/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - {shard-bmg}:        [SKIP][297] ([Intel XE#2316]) -> [PASS][298] +4 other tests pass
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@busy-flip:
    - shard-dg2-set2:     [SKIP][299] ([Intel XE#2423] / [i915#2575]) -> [PASS][300] +5 other tests pass
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@kms_flip@busy-flip.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-434/igt@kms_flip@busy-flip.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-lnl:          [FAIL][301] ([Intel XE#886]) -> [PASS][302] +1 other test pass
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-rmfb:
    - shard-lnl:          [SKIP][303] ([Intel XE#2423]) -> [PASS][304] +51 other tests pass
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-8/igt@kms_flip@flip-vs-rmfb.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-2/igt@kms_flip@flip-vs-rmfb.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:
    - shard-dg2-set2:     [SKIP][305] ([Intel XE#1201]) -> [PASS][306] +17 other tests pass
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - {shard-bmg}:        [FAIL][307] -> [PASS][308] +1 other test pass
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-x:
    - shard-adlp:         [FAIL][309] ([Intel XE#1874]) -> [PASS][310] +1 other test pass
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-x.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-x.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [FAIL][311] ([Intel XE#1332]) -> [PASS][312]
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][313] ([Intel XE#2351]) -> [PASS][314]
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][315] -> [PASS][316] +3 other tests pass
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-dg2-set2:     [SKIP][317] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) -> [PASS][318] +14 other tests pass
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-463/igt@kms_hdr@static-toggle-dpms.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_plane@plane-position-hole@pipe-a-plane-2:
    - shard-lnl:          [DMESG-FAIL][319] ([Intel XE#324]) -> [PASS][320]
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-a-plane-2.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-2/igt@kms_plane@plane-position-hole@pipe-a-plane-2.html

  * igt@kms_plane@plane-position-hole@pipe-b-plane-4:
    - shard-lnl:          [DMESG-WARN][321] ([Intel XE#324]) -> [PASS][322]
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-b-plane-4.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-2/igt@kms_plane@plane-position-hole@pipe-b-plane-4.html

  * igt@kms_plane_cursor@viewport:
    - shard-dg2-set2:     [FAIL][323] ([Intel XE#616]) -> [PASS][324] +1 other test pass
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@kms_plane_cursor@viewport.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-463/igt@kms_plane_cursor@viewport.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-lnl:          [SKIP][325] ([Intel XE#870]) -> [PASS][326]
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-3/igt@kms_pm_backlight@fade-with-dpms.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-2/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_rpm@universal-planes:
    - shard-lnl:          [SKIP][327] -> [PASS][328] +2 other tests pass
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-8/igt@kms_pm_rpm@universal-planes.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-4/igt@kms_pm_rpm@universal-planes.html

  * igt@kms_psr@psr2-no-drrs@edp-1:
    - shard-lnl:          [FAIL][329] ([Intel XE#1649]) -> [PASS][330] +1 other test pass
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-2/igt@kms_psr@psr2-no-drrs@edp-1.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-4/igt@kms_psr@psr2-no-drrs@edp-1.html

  * igt@kms_sequence@get-idle:
    - {shard-bmg}:        [SKIP][331] -> [PASS][332] +65 other tests pass
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-bmg-2/igt@kms_sequence@get-idle.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-2/igt@kms_sequence@get-idle.html

  * igt@kms_vblank@wait-forked-hang:
    - {shard-bmg}:        [INCOMPLETE][333] -> [PASS][334] +1 other test pass
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-bmg-5/igt@kms_vblank@wait-forked-hang.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-2/igt@kms_vblank@wait-forked-hang.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-lnl:          [FAIL][335] -> [PASS][336] +1 other test pass
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-8/igt@kms_vrr@flip-basic-fastset.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-1/igt@kms_vrr@flip-basic-fastset.html

  * igt@xe_exec_balancer@once-parallel-rebind:
    - shard-dg2-set2:     [SKIP][337] ([Intel XE#1130] / [Intel XE#1201]) -> [PASS][338] +80 other tests pass
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-463/igt@xe_exec_balancer@once-parallel-rebind.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@xe_exec_balancer@once-parallel-rebind.html

  * igt@xe_exec_basic@once-null-rebind:
    - shard-dg2-set2:     [SKIP][339] ([Intel XE#1130]) -> [PASS][340] +17 other tests pass
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@xe_exec_basic@once-null-rebind.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@xe_exec_basic@once-null-rebind.html

  * igt@xe_exec_basic@twice-null:
    - shard-lnl:          [SKIP][341] ([Intel XE#1130]) -> [PASS][342] +118 other tests pass
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-2/igt@xe_exec_basic@twice-null.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-4/igt@xe_exec_basic@twice-null.html

  * igt@xe_exec_compute_mode@many-execqueues-preempt-fence-early:
    - shard-adlp:         [FAIL][343] ([Intel XE#1069]) -> [PASS][344] +1 other test pass
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-4/igt@xe_exec_compute_mode@many-execqueues-preempt-fence-early.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-6/igt@xe_exec_compute_mode@many-execqueues-preempt-fence-early.html

  * igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate-race:
    - shard-lnl:          [FAIL][345] ([Intel XE#1069]) -> [PASS][346]
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-3/igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate-race.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-3/igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - {shard-bmg}:        [FAIL][347] ([Intel XE#2343]) -> [PASS][348]
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-bmg-5/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-8/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
    - shard-lnl:          [FAIL][349] ([Intel XE#2343]) -> [PASS][350]
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-7/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-3/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - {shard-bmg}:        [TIMEOUT][351] -> [PASS][352]
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-bmg-6/igt@xe_exec_reset@parallel-gt-reset.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-5/igt@xe_exec_reset@parallel-gt-reset.html
    - shard-dg2-set2:     [TIMEOUT][353] ([Intel XE#2105]) -> [PASS][354]
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-436/igt@xe_exec_reset@parallel-gt-reset.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-434/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_exec_threads@threads-hang-rebind:
    - shard-adlp:         [SKIP][355] ([Intel XE#1201]) -> [PASS][356] +113 other tests pass
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-2/igt@xe_exec_threads@threads-hang-rebind.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-8/igt@xe_exec_threads@threads-hang-rebind.html

  * igt@xe_pm@s2idle-basic-exec:
    - shard-lnl:          [FAIL][357] ([Intel XE#1924] / [Intel XE#2028]) -> [PASS][358] +1 other test pass
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-1/igt@xe_pm@s2idle-basic-exec.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-8/igt@xe_pm@s2idle-basic-exec.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-adlp:         [ABORT][359] ([Intel XE#1794]) -> [PASS][360]
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-8/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_vm@large-split-misaligned-binds-1073741824:
    - shard-adlp:         [SKIP][361] ([Intel XE#1130] / [Intel XE#1201]) -> [PASS][362] +37 other tests pass
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-2/igt@xe_vm@large-split-misaligned-binds-1073741824.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-1/igt@xe_vm@large-split-misaligned-binds-1073741824.html

  * igt@xe_vm@large-userptr-misaligned-binds-4194304:
    - {shard-bmg}:        [SKIP][363] ([Intel XE#1130]) -> [PASS][364] +8 other tests pass
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-bmg-2/igt@xe_vm@large-userptr-misaligned-binds-4194304.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-7/igt@xe_vm@large-userptr-misaligned-binds-4194304.html

  
#### Warnings ####

  * igt@core_hotunplug@hotunbind-rebind:
    - shard-adlp:         [SKIP][365] ([Intel XE#1201]) -> [ABORT][366] ([Intel XE#2421])
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-8/igt@core_hotunplug@hotunbind-rebind.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-6/igt@core_hotunplug@hotunbind-rebind.html
    - shard-dg2-set2:     [SKIP][367] ([Intel XE#1201]) -> [ABORT][368] ([Intel XE#2421])
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-463/igt@core_hotunplug@hotunbind-rebind.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@core_hotunplug@hotunbind-rebind.html
    - shard-lnl:          [SKIP][369] -> [ABORT][370] ([Intel XE#2421])
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-8/igt@core_hotunplug@hotunbind-rebind.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-8/igt@core_hotunplug@hotunbind-rebind.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][371] ([Intel XE#2351]) -> [SKIP][372] ([Intel XE#1201] / [Intel XE#316])
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-435/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-adlp:         [SKIP][373] ([Intel XE#1201]) -> [SKIP][374] ([Intel XE#1124] / [Intel XE#1201]) +5 other tests skip
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@linear-64bpp-rotate-0:
    - shard-lnl:          [SKIP][375] ([Intel XE#2351]) -> [DMESG-WARN][376] ([Intel XE#1725])
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-4/igt@kms_big_fb@linear-64bpp-rotate-0.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-6/igt@kms_big_fb@linear-64bpp-rotate-0.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][377] ([Intel XE#1201]) -> [SKIP][378] ([Intel XE#316])
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-463/igt@kms_big_fb@linear-8bpp-rotate-270.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][379] ([Intel XE#1201]) -> [SKIP][380] ([Intel XE#1201] / [Intel XE#316])
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-436/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-435/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
    - shard-lnl:          [SKIP][381] ([Intel XE#2351]) -> [SKIP][382] ([Intel XE#1407]) +2 other tests skip
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-5/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-4/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][383] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][384] ([Intel XE#316]) +1 other test skip
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-463/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [FAIL][385] ([Intel XE#1231]) -> [DMESG-FAIL][386] ([Intel XE#324])
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [SKIP][387] ([Intel XE#1201]) -> [FAIL][388] ([Intel XE#1231])
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-adlp:         [SKIP][389] ([Intel XE#1201]) -> [SKIP][390] ([Intel XE#1201] / [Intel XE#316]) +5 other tests skip
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-1/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-2/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
    - shard-dg2-set2:     [SKIP][391] -> [SKIP][392] ([Intel XE#1124] / [Intel XE#1201]) +1 other test skip
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-435/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg2-set2:     [SKIP][393] ([Intel XE#1201]) -> [SKIP][394] ([Intel XE#1124] / [Intel XE#1201]) +5 other tests skip
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
    - shard-lnl:          [SKIP][395] ([Intel XE#2351]) -> [SKIP][396] ([Intel XE#1124]) +8 other tests skip
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [FAIL][397] ([Intel XE#1204]) -> [SKIP][398] ([Intel XE#1201]) +1 other test skip
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
    - shard-dg2-set2:     [SKIP][399] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][400] ([Intel XE#1201] / [Intel XE#2351])
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-dg2-set2:     [SKIP][401] ([Intel XE#1124]) -> [SKIP][402] ([Intel XE#1124] / [Intel XE#1201]) +4 other tests skip
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [DMESG-FAIL][403] ([Intel XE#324]) -> [FAIL][404] ([Intel XE#1231]) +1 other test fail
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-adlp:         [SKIP][405] ([Intel XE#1201]) -> [FAIL][406] ([Intel XE#1874]) +2 other tests fail
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][407] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][408] ([Intel XE#1124]) +7 other tests skip
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-433/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-adlp:         [SKIP][409] ([Intel XE#1201] / [Intel XE#619]) -> [SKIP][410] ([Intel XE#1201])
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-6/igt@kms_big_fb@yf-tiled-addfb.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-4/igt@kms_big_fb@yf-tiled-addfb.html
    - shard-dg2-set2:     [SKIP][411] ([Intel XE#1201] / [Intel XE#619]) -> [SKIP][412] ([Intel XE#1201])
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][413] ([Intel XE#1201] / [Intel XE#607]) -> [SKIP][414] ([Intel XE#607])
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-dg2-set2:     [SKIP][415] ([Intel XE#1201]) -> [SKIP][416] ([Intel XE#1124])
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-adlp:         [SKIP][417] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][418] ([Intel XE#1201]) +3 other tests skip
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html
    - shard-dg2-set2:     [SKIP][419] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][420] ([Intel XE#1201]) +1 other test skip
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-lnl:          [SKIP][421] ([Intel XE#1124]) -> [SKIP][422] ([Intel XE#2351])
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][423] ([Intel XE#1201] / [i915#2575]) -> [SKIP][424] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-466/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-466/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][425] ([Intel XE#367]) -> [SKIP][426] ([Intel XE#1201] / [i915#2575])
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
    - shard-adlp:         [SKIP][427] ([Intel XE#1201] / [Intel XE#2191]) -> [SKIP][428] ([Intel XE#1201])
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-6/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-4/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-adlp:         [SKIP][429] ([Intel XE#1201]) -> [SKIP][430] ([Intel XE#1201] / [Intel XE#2191]) +1 other test skip
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-8/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-2/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
    - shard-lnl:          [SKIP][431] ([Intel XE#2423]) -> [SKIP][432] ([Intel XE#2191]) +1 other test skip
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-5/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-8/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][433] ([Intel XE#1201] / [i915#2575]) -> [SKIP][434] ([Intel XE#1201] / [Intel XE#2191])
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-433/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-463/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][435] ([Intel XE#2191]) -> [SKIP][436] ([Intel XE#1201] / [Intel XE#2191])
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-435/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][437] ([Intel XE#367]) -> [SKIP][438] ([Intel XE#1201] / [Intel XE#367])
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-463/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-adlp:         [SKIP][439] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][440] ([Intel XE#1201])
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-8/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-4/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
    - shard-dg2-set2:     [SKIP][441] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][442] ([Intel XE#1201] / [i915#2575])
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-435/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][443] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][444] ([Intel XE#367]) +1 other test skip
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-433/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-adlp:         [SKIP][445] ([Intel XE#1201]) -> [SKIP][446] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +10 other tests skip
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-4/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-6/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][447] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][448] ([Intel XE#787]) +41 other tests skip
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-435/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][449] ([Intel XE#787]) -> [SKIP][450] ([Intel XE#1201] / [Intel XE#787]) +41 other tests skip
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-6.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-435/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][451] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][452] ([Intel XE#1201]) +2 other tests skip
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][453] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][454] ([Intel XE#1201] / [Intel XE#2351])
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-434/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][455] ([Intel XE#1201]) -> [SKIP][456] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +5 other tests skip
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html
    - shard-lnl:          [SKIP][457] ([Intel XE#2351]) -> [SKIP][458] ([Intel XE#1399]) +10 other tests skip
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs:
    - shard-adlp:         [SKIP][459] ([Intel XE#1201]) -> [SKIP][460] ([Intel XE#1201] / [Intel XE#1252])
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html
    - shard-dg2-set2:     [SKIP][461] ([Intel XE#1201]) -> [SKIP][462] ([Intel XE#1201] / [Intel XE#1252])
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs:
    - shard-dg2-set2:     [SKIP][463] ([Intel XE#1201] / [Intel XE#2351]) -> [SKIP][464] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787])
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs.html
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs:
    - shard-dg2-set2:     [SKIP][465] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][466] ([Intel XE#1201])
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs.html
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:
    - shard-adlp:         [SKIP][467] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][468] ([Intel XE#1201]) +4 other tests skip
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-9/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-9/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html
    - shard-lnl:          [SKIP][469] ([Intel XE#1399]) -> [SKIP][470] ([Intel XE#2351])
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-6/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-3/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][471] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][472] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +11 other tests skip
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     [SKIP][473] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][474] ([Intel XE#455] / [Intel XE#787]) +11 other tests skip
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-adlp:         [SKIP][475] ([Intel XE#1201]) -> [SKIP][476] ([Intel XE#1201] / [Intel XE#306]) +1 other test skip
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-8/igt@kms_chamelium_color@ctm-0-50.html
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-6/igt@kms_chamelium_color@ctm-0-50.html
    - shard-dg2-set2:     [SKIP][477] ([Intel XE#1201] / [i915#2575]) -> [SKIP][478] ([Intel XE#1201] / [Intel XE#306])
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-463/igt@kms_chamelium_color@ctm-0-50.html
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-dg2-set2:     [SKIP][479] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][480] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575])
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-433/igt@kms_chamelium_color@ctm-0-75.html
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-463/igt@kms_chamelium_color@ctm-0-75.html
    - shard-lnl:          [SKIP][481] ([Intel XE#306]) -> [SKIP][482] ([Intel XE#2423])
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-2/igt@kms_chamelium_color@ctm-0-75.html
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-3/igt@kms_chamelium_color@ctm-0-75.html
    - shard-adlp:         [SKIP][483] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][484] ([Intel XE#1201])
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-2/igt@kms_chamelium_color@ctm-0-75.html
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-9/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-lnl:          [SKIP][485] ([Intel XE#2423]) -> [SKIP][486] ([Intel XE#306]) +1 other test skip
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-8/igt@kms_chamelium_color@ctm-negative.html
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-2/igt@kms_chamelium_color@ctm-negative.html
    - shard-dg2-set2:     [SKIP][487] ([Intel XE#2423] / [i915#2575]) -> [SKIP][488] ([Intel XE#1201] / [Intel XE#306])
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@kms_chamelium_color@ctm-negative.html
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-463/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-dg2-set2:     [SKIP][489] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][490] ([Intel XE#373]) +5 other tests skip
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-435/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:
    - shard-adlp:         [SKIP][491] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][492] ([Intel XE#1201])
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-4/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-4/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html
    - shard-dg2-set2:     [SKIP][493] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][494] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575])
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-434/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html
    - shard-lnl:          [SKIP][495] ([Intel XE#373]) -> [SKIP][496] ([Intel XE#2423])
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-6/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-5/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - shard-adlp:         [SKIP][497] ([Intel XE#1201]) -> [SKIP][498] ([Intel XE#1201] / [Intel XE#373]) +7 other tests skip
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-8/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-8/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
    - shard-dg2-set2:     [SKIP][499] ([Intel XE#373]) -> [SKIP][500] ([Intel XE#1201] / [Intel XE#373]) +1 other test skip
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-463/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-dg2-set2:     [SKIP][501] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) -> [SKIP][502] ([Intel XE#1201] / [Intel XE#373]) +1 other test skip
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd.html
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm:
    - shard-dg2-set2:     [SKIP][503] ([Intel XE#2423] / [i915#2575]) -> [SKIP][504] ([Intel XE#1201] / [Intel XE#373]) +2 other tests skip
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-storm.html
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-storm.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2-set2:     [SKIP][505] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][506] ([Intel XE#1201] / [i915#2575])
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     [SKIP][507] ([Intel XE#1201] / [i915#2575]) -> [SKIP][508] ([Intel XE#1201] / [Intel XE#373]) +2 other tests skip
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-463/igt@kms_chamelium_hpd@vga-hpd.html
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-463/igt@kms_chamelium_hpd@vga-hpd.html
    - shard-lnl:          [SKIP][509] ([Intel XE#2423]) -> [SKIP][510] ([Intel XE#373]) +7 other tests skip
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-5/igt@kms_chamelium_hpd@vga-hpd.html
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-7/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg2-set2:     [SKIP][511] ([Intel XE#1201] / [Intel XE#307]) -> [SKIP][512] ([Intel XE#307])
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-434/igt@kms_content_protection@dp-mst-lic-type-1.html
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-adlp:         [SKIP][513] ([Intel XE#1201]) -> [SKIP][514] ([Intel XE#1201] / [Intel XE#307])
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-1/igt@kms_content_protection@dp-mst-type-0.html
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-9/igt@kms_content_protection@dp-mst-type-0.html
    - shard-dg2-set2:     [SKIP][515] ([Intel XE#1201] / [i915#2575]) -> [SKIP][516] ([Intel XE#1201] / [Intel XE#307])
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-436/igt@kms_content_protection@dp-mst-type-0.html
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-433/igt@kms_content_protection@dp-mst-type-0.html
    - shard-lnl:          [SKIP][517] ([Intel XE#2423]) -> [SKIP][518] ([Intel XE#307])
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-5/igt@kms_content_protection@dp-mst-type-0.html
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-1/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_cursor_crc@cursor-onscreen-32x10:
    - shard-dg2-set2:     [SKIP][519] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][520] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575])
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-32x10.html
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@kms_cursor_crc@cursor-onscreen-32x10.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     [SKIP][521] ([Intel XE#1201] / [i915#2575]) -> [SKIP][522] ([Intel XE#1201] / [Intel XE#308])
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-436/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-512x170.html
    - shard-lnl:          [SKIP][523] ([Intel XE#2423]) -> [SKIP][524] ([Intel XE#1413]) +1 other test skip
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-5/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-2/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
    - shard-lnl:          [SKIP][525] ([Intel XE#1424]) -> [SKIP][526] ([Intel XE#2423]) +1 other test skip
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-2/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-3/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html

  * igt@kms_cursor_crc@cursor-sliding-32x32:
    - shard-lnl:          [SKIP][527] ([Intel XE#2423]) -> [SKIP][528] ([Intel XE#1424]) +1 other test skip
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-5/igt@kms_cursor_crc@cursor-sliding-32x32.html
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-3/igt@kms_cursor_crc@cursor-sliding-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-dg2-set2:     [SKIP][529] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) -> [SKIP][530] ([Intel XE#1201] / [Intel XE#308])
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-433/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-433/igt@kms_cursor_crc@cursor-sliding-512x170.html
    - shard-adlp:         [SKIP][531] ([Intel XE#1201]) -> [SKIP][532] ([Intel XE#1201] / [Intel XE#308]) +1 other test skip
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-2/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-4/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-lnl:          [SKIP][533] ([Intel XE#2423]) -> [SKIP][534] ([Intel XE#309]) +4 other tests skip
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-2/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2-set2:     [SKIP][535] ([Intel XE#323]) -> [SKIP][536] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575])
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-463/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - shard-lnl:          [SKIP][537] ([Intel XE#323]) -> [SKIP][538] ([Intel XE#2423]) +2 other tests skip
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - shard-adlp:         [SKIP][539] ([Intel XE#1201] / [Intel XE#323]) -> [SKIP][540] ([Intel XE#1201]) +2 other tests skip
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-dg2-set2:     [SKIP][541] ([Intel XE#1201] / [Intel XE#323]) -> [SKIP][542] ([Intel XE#323])
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-436/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-adlp:         [SKIP][543] ([Intel XE#1201]) -> [SKIP][544] ([Intel XE#1201] / [Intel XE#309]) +3 other tests skip
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-lnl:          [SKIP][545] ([Intel XE#309]) -> [SKIP][546] ([Intel XE#2423])
   [545]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-3/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html
   [546]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-5/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-dg2-set2:     [SKIP][547] ([Intel XE#323]) -> [SKIP][548] ([Intel XE#1201] / [Intel XE#323])
   [547]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [548]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-433/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     [SKIP][549] ([Intel XE#1201] / [Intel XE#323]) -> [SKIP][550] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) +1 other test skip
   [549]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [550]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-463/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2-set2:     [SKIP][551] ([Intel XE#1201]) -> [SKIP][552] ([Intel XE#1201] / [Intel XE#455]) +2 other tests skip
   [551]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-433/igt@kms_dsc@dsc-with-bpc-formats.html
   [552]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-463/igt@kms_dsc@dsc-with-bpc-formats.html
    - shard-lnl:          [SKIP][553] ([Intel XE#2351]) -> [SKIP][554] ([Intel XE#599])
   [553]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-2/igt@kms_dsc@dsc-with-bpc-formats.html
   [554]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-2/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2-set2:     [SKIP][555] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][556] ([Intel XE#455]) +6 other tests skip
   [555]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-434/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [556]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     [SKIP][557] ([Intel XE#1201] / [i915#2575]) -> [SKIP][558] ([Intel XE#1201] / [Intel XE#701])
   [557]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-436/igt@kms_feature_discovery@chamelium.html
   [558]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-463/igt@kms_feature_discovery@chamelium.html
    - shard-lnl:          [SKIP][559] ([Intel XE#2423]) -> [SKIP][560] ([Intel XE#701])
   [559]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-5/igt@kms_feature_discovery@chamelium.html
   [560]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-8/igt@kms_feature_discovery@chamelium.html
    - shard-adlp:         [SKIP][561] ([Intel XE#1201]) -> [SKIP][562] ([Intel XE#1201] / [Intel XE#701])
   [561]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-1/igt@kms_feature_discovery@chamelium.html
   [562]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-9/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-2x:
    - shard-lnl:          [SKIP][563] ([Intel XE#2423]) -> [SKIP][564] ([Intel XE#702])
   [563]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-4/igt@kms_feature_discovery@display-2x.html
   [564]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-7/igt@kms_feature_discovery@display-2x.html
    - shard-adlp:         [SKIP][565] ([Intel XE#1201]) -> [SKIP][566] ([Intel XE#1201] / [Intel XE#702])
   [565]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-2/igt@kms_feature_discovery@display-2x.html
   [566]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-4/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2-set2:     [SKIP][567] ([Intel XE#1137]) -> [SKIP][568] ([Intel XE#1137] / [Intel XE#1201])
   [567]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@kms_feature_discovery@dp-mst.html
   [568]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-434/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-lnl:          [SKIP][569] ([Intel XE#2423]) -> [SKIP][570] ([Intel XE#1421]) +6 other tests skip
   [569]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-5/igt@kms_flip@2x-dpms-vs-vblank-race.html
   [570]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-2/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-adlp:         [SKIP][571] ([Intel XE#1201]) -> [SKIP][572] ([Intel XE#1201] / [Intel XE#310]) +6 other tests skip
   [571]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-2/igt@kms_flip@2x-flip-vs-dpms.html
   [572]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-2/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible:
    - shard-adlp:         [SKIP][573] ([Intel XE#1201] / [Intel XE#310]) -> [SKIP][574] ([Intel XE#1201]) +3 other tests skip
   [573]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-1/igt@kms_flip@2x-flip-vs-panning-interruptible.html
   [574]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-4/igt@kms_flip@2x-flip-vs-panning-interruptible.html

  * igt@kms_flip@2x-flip-vs-rmfb:
    - shard-lnl:          [SKIP][575] ([Intel XE#1421]) -> [SKIP][576] ([Intel XE#2423]) +1 other test skip
   [575]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-6/igt@kms_flip@2x-flip-vs-rmfb.html
   [576]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-3/igt@kms_flip@2x-flip-vs-rmfb.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-dg2-set2:     [DMESG-WARN][577] ([Intel XE#2019]) -> [SKIP][578] ([Intel XE#1201] / [i915#2575])
   [577]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend.html
   [578]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
    - shard-adlp:         [SKIP][579] ([Intel XE#1201]) -> [SKIP][580] ([Intel XE#1201] / [Intel XE#455]) +11 other tests skip
   [579]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html
   [580]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-9/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html
    - shard-dg2-set2:     [SKIP][581] -> [SKIP][582] ([Intel XE#455])
   [581]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html
   [582]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html
    - shard-lnl:          [SKIP][583] ([Intel XE#2351]) -> [SKIP][584] ([Intel XE#1401] / [Intel XE#1745]) +3 other tests skip
   [583]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html
   [584]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
    - shard-dg2-set2:     [SKIP][585] ([Intel XE#1201] / [Intel XE#2351]) -> [SKIP][586] ([Intel XE#1201] / [Intel XE#455])
   [585]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html
   [586]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][587] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][588] ([Intel XE#1201])
   [587]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
   [588]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][589] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][590] ([Intel XE#1201] / [Intel XE#2351])
   [589]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [590]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
    - shard-lnl:          [SKIP][591] ([Intel XE#1401] / [Intel XE#1745]) -> [SKIP][592] ([Intel XE#2351]) +1 other test skip
   [591]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [592]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
    - shard-adlp:         [DMESG-FAIL][593] ([Intel XE#324]) -> [SKIP][594] ([Intel XE#1201])
   [593]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [594]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][595] -> [SKIP][596] ([Intel XE#1201] / [Intel XE#651]) +1 other test skip
   [595]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt.html
   [596]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][597] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][598] ([Intel XE#1201] / [Intel XE#2351]) +1 other test skip
   [597]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-plflip-blt.html
   [598]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][599] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][600] ([Intel XE#1201]) +3 other tests skip
   [599]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [600]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - shard-adlp:         [SKIP][601] ([Intel XE#1201]) -> [SKIP][602] ([Intel XE#1201] / [Intel XE#656]) +21 other tests skip
   [601]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
   [602]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
    - shard-dg2-set2:     [SKIP][603] ([Intel XE#1201] / [Intel XE#2351]) -> [SKIP][604] ([Intel XE#651])
   [603]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
   [604]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt:
    - shard-adlp:         [SKIP][605] ([Intel XE#1201] / [Intel XE#656]) -> [SKIP][606] ([Intel XE#1201]) +5 other tests skip
   [605]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt.html
   [606]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-slowdraw:
    - shard-dg2-set2:     [SKIP][607] ([Intel XE#1201] / [Intel XE#2351]) -> [SKIP][608] ([Intel XE#1201] / [Intel XE#651]) +2 other tests skip
   [607]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-slowdraw.html
   [608]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-slowdraw.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
    - shard-adlp:         [SKIP][609] ([Intel XE#1201]) -> [FAIL][610] ([Intel XE#1861]) +1 other test fail
   [609]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
   [610]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-render:
    - shard-adlp:         [SKIP][611] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][612] ([Intel XE#1201]) +1 other test skip
   [611]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-render.html
   [612]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-render.html
    - shard-lnl:          [SKIP][613] ([Intel XE#651]) -> [SKIP][614] ([Intel XE#2351])
   [613]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-render.html
   [614]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff:
    - shard-adlp:         [SKIP][615] ([Intel XE#1201]) -> [SKIP][616] ([Intel XE#1201] / [Intel XE#651]) +9 other tests skip
   [615]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff.html
   [616]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][617] ([Intel XE#651]) -> [SKIP][618] ([Intel XE#1201] / [Intel XE#651]) +6 other tests skip
   [617]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt.html
   [618]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][619] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][620] ([Intel XE#651]) +16 other tests skip
   [619]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [620]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][621] ([Intel XE#2351]) -> [SKIP][622] ([Intel XE#1201] / [Intel XE#651])
   [621]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html
   [622]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][623] ([Intel XE#651]) -> [SKIP][624] ([Intel XE#1201])
   [623]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-mmap-wc.html
   [624]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render:
    - shard-lnl:          [SKIP][625] ([Intel XE#2351]) -> [SKIP][626] ([Intel XE#656]) +22 other tests skip
   [625]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render.html
   [626]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render.html
    - shard-dg2-set2:     [SKIP][627] ([Intel XE#1201]) -> [SKIP][628] ([Intel XE#651])
   [627]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render.html
   [628]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][629] -> [SKIP][630] ([Intel XE#1201])
   [629]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html
   [630]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][631] ([Intel XE#1201]) -> [SKIP][632] ([Intel XE#1201] / [Intel XE#651]) +10 other tests skip
   [631]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html
   [632]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html
    - shard-lnl:          [SKIP][633] ([Intel XE#2351]) -> [SKIP][634] ([Intel XE#651]) +11 other tests skip
   [633]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html
   [634]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4:
    - shard-adlp:         [SKIP][635] ([Intel XE#1201]) -> [SKIP][636] ([Intel XE#1151] / [Intel XE#1201])
   [635]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4.html
   [636]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-dg2-set2:     [SKIP][637] ([Intel XE#658]) -> [SKIP][638] ([Intel XE#1201] / [Intel XE#658])
   [637]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [638]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
    - shard-dg2-set2:     [SKIP][639] ([Intel XE#653]) -> [SKIP][640] ([Intel XE#1201])
   [639]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html
   [640]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][641] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][642] ([Intel XE#1201]) +2 other tests skip
   [641]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt.html
   [642]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-adlp:         [SKIP][643] ([Intel XE#1201]) -> [SKIP][644] ([Intel XE#1201] / [Intel XE#653]) +8 other tests skip
   [643]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html
   [644]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html
    - shard-dg2-set2:     [SKIP][645] ([Intel XE#1201] / [Intel XE#2351]) -> [SKIP][646] ([Intel XE#1201] / [Intel XE#653]) +2 other tests skip
   [645]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html
   [646]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][647] ([Intel XE#653]) -> [SKIP][648] ([Intel XE#1201] / [Intel XE#653]) +9 other tests skip
   [647]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html
   [648]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][649] ([Intel XE#1201]) -> [SKIP][650] ([Intel XE#653])
   [649]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt.html
   [650]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][651] ([Intel XE#2351]) -> [SKIP][652] ([Intel XE#1201] / [Intel XE#2351])
   [651]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html
   [652]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear:
    - shard-dg2-set2:     [SKIP][653] ([Intel XE#1201]) -> [SKIP][654] ([Intel XE#1201] / [Intel XE#653]) +10 other tests skip
   [653]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html
   [654]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
    - shard-adlp:         [SKIP][655] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][656] ([Intel XE#1201]) +3 other tests skip
   [655]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-9/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html
   [656]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html
    - shard-dg2-set2:     [SKIP][657] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][658] ([Intel XE#1201] / [Intel XE#2351])
   [657]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html
   [658]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:
    - shard-lnl:          [SKIP][659] ([Intel XE#656]) -> [SKIP][660] ([Intel XE#2351]) +2 other tests skip
   [659]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html
   [660]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][661] -> [SKIP][662] ([Intel XE#1201] / [Intel XE#653]) +1 other test skip
   [661]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [662]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][663] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][664] ([Intel XE#653]) +16 other tests skip
   [663]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html
   [664]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2-set2:     [SKIP][665] ([Intel XE#1201] / [Intel XE#605]) -> [SKIP][666] ([Intel XE#605])
   [665]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-435/igt@kms_getfb@getfb-reject-ccs.html
   [666]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdr@static-swap:
    - shard-adlp:         [SKIP][667] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][668] ([Intel XE#1201]) +3 other tests skip
   [667]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-4/igt@kms_hdr@static-swap.html
   [668]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-4/igt@kms_hdr@static-swap.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-lnl:          [SKIP][669] ([Intel XE#2423]) -> [SKIP][670] ([Intel XE#599]) +2 other tests skip
   [669]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-8/igt@kms_hdr@static-toggle-dpms.html
   [670]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-7/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-adlp:         [SKIP][671] ([Intel XE#1201]) -> [SKIP][672] ([Intel XE#1201] / [Intel XE#356])
   [671]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-8/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [672]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-9/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-dg2-set2:     [SKIP][673] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) -> [SKIP][674] ([Intel XE#1201] / [Intel XE#356])
   [673]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-463/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [674]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-433/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-lnl:          [SKIP][675] ([Intel XE#2423]) -> [SKIP][676] ([Intel XE#356])
   [675]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-8/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [676]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-dg2-set2:     [SKIP][677] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) -> [SKIP][678] ([Intel XE#1201] / [Intel XE#455]) +1 other test skip
   [677]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-463/igt@kms_panel_fitting@atomic-fastset.html
   [678]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-dg2-set2:     [SKIP][679] ([Intel XE#1201] / [i915#2575]) -> [DMESG-FAIL][680] ([Intel XE#1551])
   [679]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-463/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [680]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-435/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:
    - shard-lnl:          [SKIP][681] ([Intel XE#2423]) -> [SKIP][682] ([Intel XE#2318]) +1 other test skip
   [681]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-7/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html
   [682]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-6/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][683] ([Intel XE#2318] / [Intel XE#455]) -> [SKIP][684] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) +1 other test skip
   [683]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
   [684]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][685] ([Intel XE#2318]) -> [SKIP][686] ([Intel XE#1201] / [Intel XE#2318]) +2 other tests skip
   [685]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html
   [686]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-adlp:         [SKIP][687] ([Intel XE#1201]) -> [SKIP][688] ([Intel XE#1201] / [Intel XE#870])
   [687]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-1/igt@kms_pm_backlight@bad-brightness.html
   [688]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-6/igt@kms_pm_backlight@bad-brightness.html
    - shard-dg2-set2:     [SKIP][689] ([Intel XE#1201]) -> [SKIP][690] ([Intel XE#870])
   [689]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-436/igt@kms_pm_backlight@bad-brightness.html
   [690]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-adlp:         [SKIP][691] ([Intel XE#1201] / [Intel XE#870]) -> [SKIP][692] ([Intel XE#1201])
   [691]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-4/igt@kms_pm_backlight@basic-brightness.html
   [692]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-4/igt@kms_pm_backlight@basic-brightness.html
    - shard-dg2-set2:     [SKIP][693] ([Intel XE#1201] / [Intel XE#870]) -> [SKIP][694] ([Intel XE#1201])
   [693]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-434/igt@kms_pm_backlight@basic-brightness.html
   [694]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-adlp:         [SKIP][695] ([Intel XE#1201]) -> [SKIP][696] ([Intel XE#1122] / [Intel XE#1201])
   [695]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-2/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [696]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-9/igt@kms_pm_dc@dc3co-vpb-simulation.html
    - shard-dg2-set2:     [SKIP][697] ([Intel XE#1201]) -> [SKIP][698] ([Intel XE#1122])
   [697]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-433/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [698]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@kms_pm_dc@dc3co-vpb-simulation.html
    - shard-lnl:          [SKIP][699] ([Intel XE#2351]) -> [SKIP][700] ([Intel XE#736])
   [699]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-2/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [700]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-5/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2-set2:     [SKIP][701] ([Intel XE#1129] / [Intel XE#1201]) -> [SKIP][702] ([Intel XE#1129])
   [701]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-433/igt@kms_pm_dc@dc5-psr.html
   [702]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-dg2-set2:     [SKIP][703] ([Intel XE#908]) -> [SKIP][704] ([Intel XE#1201] / [Intel XE#908])
   [703]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@kms_pm_dc@deep-pkgc.html
   [704]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-433/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_prop_blob@blob-prop-core:
    - shard-dg2-set2:     [SKIP][705] ([Intel XE#2423] / [i915#2575]) -> [SKIP][706] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575])
   [705]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@kms_prop_blob@blob-prop-core.html
   [706]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-463/igt@kms_prop_blob@blob-prop-core.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
    - shard-dg2-set2:     [SKIP][707] ([Intel XE#1489]) -> [SKIP][708] ([Intel XE#1201] / [Intel XE#1489]) +1 other test skip
   [707]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html
   [708]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][709] ([Intel XE#1201]) -> [SKIP][710] ([Intel XE#1201] / [Intel XE#1489]) +2 other tests skip
   [709]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-463/igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area.html
   [710]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-433/igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:
    - shard-dg2-set2:     [SKIP][711] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][712] ([Intel XE#1489]) +1 other test skip
   [711]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-433/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
   [712]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr@fbc-pr-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][713] ([Intel XE#1201]) -> [SKIP][714] ([Intel XE#929]) +1 other test skip
   [713]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-433/igt@kms_psr@fbc-pr-sprite-plane-onoff.html
   [714]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@kms_psr@fbc-pr-sprite-plane-onoff.html

  * igt@kms_psr@fbc-pr-sprite-render:
    - shard-adlp:         [SKIP][715] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][716] ([Intel XE#1201]) +3 other tests skip
   [715]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-9/igt@kms_psr@fbc-pr-sprite-render.html
   [716]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-4/igt@kms_psr@fbc-pr-sprite-render.html
    - shard-dg2-set2:     [SKIP][717] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][718] ([Intel XE#1201] / [Intel XE#2351])
   [717]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-435/igt@kms_psr@fbc-pr-sprite-render.html
   [718]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@kms_psr@fbc-pr-sprite-render.html
    - shard-lnl:          [SKIP][719] ([Intel XE#1406]) -> [SKIP][720] ([Intel XE#2351]) +1 other test skip
   [719]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-6/igt@kms_psr@fbc-pr-sprite-render.html
   [720]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-5/igt@kms_psr@fbc-pr-sprite-render.html

  * igt@kms_psr@fbc-psr2-sprite-blt:
    - shard-dg2-set2:     [SKIP][721] ([Intel XE#2351]) -> [SKIP][722] ([Intel XE#1201] / [Intel XE#929])
   [721]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-blt.html
   [722]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@kms_psr@fbc-psr2-sprite-blt.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][723] ([Intel XE#1201]) -> [SKIP][724] ([Intel XE#1201] / [Intel XE#929]) +5 other tests skip
   [723]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-463/igt@kms_psr@fbc-psr2-sprite-plane-move.html
   [724]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-466/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@pr-dpms:
    - shard-dg2-set2:     [SKIP][725] -> [SKIP][726] ([Intel XE#1201] / [Intel XE#929]) +2 other tests skip
   [725]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@kms_psr@pr-dpms.html
   [726]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@kms_psr@pr-dpms.html
    - shard-lnl:          [SKIP][727] ([Intel XE#2351]) -> [SKIP][728] ([Intel XE#1406]) +4 other tests skip
   [727]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-8/igt@kms_psr@pr-dpms.html
   [728]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-1/igt@kms_psr@pr-dpms.html

  * igt@kms_psr@pr-suspend:
    - shard-dg2-set2:     [SKIP][729] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][730] ([Intel XE#1201]) +2 other tests skip
   [729]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-435/igt@kms_psr@pr-suspend.html
   [730]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-463/igt@kms_psr@pr-suspend.html

  * igt@kms_psr@psr-basic:
    - shard-adlp:         [SKIP][731] ([Intel XE#1201]) -> [SKIP][732] ([Intel XE#1201] / [Intel XE#929]) +11 other tests skip
   [731]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-8/igt@kms_psr@psr-basic.html
   [732]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-6/igt@kms_psr@psr-basic.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     [SKIP][733] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][734] ([Intel XE#929]) +6 other tests skip
   [733]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-433/igt@kms_psr@psr-dpms.html
   [734]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@kms_psr@psr-dpms.html

  * igt@kms_psr@psr-sprite-blt:
    - shard-dg2-set2:     [SKIP][735] ([Intel XE#929]) -> [SKIP][736] ([Intel XE#1201] / [Intel XE#929]) +1 other test skip
   [735]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@kms_psr@psr-sprite-blt.html
   [736]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-463/igt@kms_psr@psr-sprite-blt.html

  * igt@kms_psr@psr-suspend@edp-1:
    - shard-lnl:          [FAIL][737] -> [FAIL][738] ([Intel XE#2028]) +1 other test fail
   [737]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-1/igt@kms_psr@psr-suspend@edp-1.html
   [738]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-1/igt@kms_psr@psr-suspend@edp-1.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-adlp:         [SKIP][739] ([Intel XE#1201]) -> [SKIP][740] ([Intel XE#1149] / [Intel XE#1201])
   [739]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [740]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
    - shard-dg2-set2:     [SKIP][741] ([Intel XE#1201] / [Intel XE#2351]) -> [SKIP][742] ([Intel XE#1149] / [Intel XE#1201])
   [741]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-436/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [742]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-435/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-adlp:         [SKIP][743] ([Intel XE#1149] / [Intel XE#1201]) -> [SKIP][744] ([Intel XE#1201])
   [743]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [744]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-4/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
    - shard-dg2-set2:     [SKIP][745] ([Intel XE#1149] / [Intel XE#1201]) -> [SKIP][746] ([Intel XE#1201])
   [745]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-433/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [746]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2-set2:     [SKIP][747] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][748] ([Intel XE#327])
   [747]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-436/igt@kms_rotation_crc@bad-tiling.html
   [748]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-adlp:         [SKIP][749] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][750] ([Intel XE#1201])
   [749]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-9/igt@kms_rotation_crc@primary-rotation-90.html
   [750]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-4/igt@kms_rotation_crc@primary-rotation-90.html
    - shard-dg2-set2:     [SKIP][751] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][752] ([Intel XE#1201] / [i915#2575])
   [751]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-435/igt@kms_rotation_crc@primary-rotation-90.html
   [752]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][753] ([Intel XE#1127]) -> [SKIP][754] ([Intel XE#1127] / [Intel XE#1201])
   [753]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [754]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-adlp:         [SKIP][755] ([Intel XE#1201]) -> [SKIP][756] ([Intel XE#1127] / [Intel XE#1201])
   [755]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [756]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
    - shard-dg2-set2:     [SKIP][757] ([Intel XE#1201] / [i915#2575]) -> [SKIP][758] ([Intel XE#1127] / [Intel XE#1201])
   [757]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [758]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
    - shard-lnl:          [SKIP][759] ([Intel XE#2423]) -> [SKIP][760] ([Intel XE#1127])
   [759]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [760]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_vrr@cmrr:
    - shard-adlp:         [SKIP][761] ([Intel XE#1201] / [Intel XE#2168]) -> [SKIP][762] ([Intel XE#1201])
   [761]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-8/igt@kms_vrr@cmrr.html
   [762]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-4/igt@kms_vrr@cmrr.html
    - shard-dg2-set2:     [SKIP][763] ([Intel XE#1201] / [Intel XE#2168]) -> [SKIP][764] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575])
   [763]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-463/igt@kms_vrr@cmrr.html
   [764]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@flip-dpms:
    - shard-dg2-set2:     [SKIP][765] ([Intel XE#1201] / [i915#2575]) -> [SKIP][766] ([Intel XE#1201] / [Intel XE#455]) +2 other tests skip
   [765]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-466/igt@kms_vrr@flip-dpms.html
   [766]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-463/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     [SKIP][767] ([Intel XE#455]) -> [SKIP][768] ([Intel XE#1201] / [Intel XE#455]) +5 other tests skip
   [767]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@kms_vrr@flipline.html
   [768]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-433/igt@kms_vrr@flipline.html

  * igt@kms_writeback@writeback-check-output:
    - shard-dg2-set2:     [SKIP][769] ([Intel XE#1201] / [Intel XE#756]) -> [SKIP][770] ([Intel XE#756])
   [769]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-434/igt@kms_writeback@writeback-check-output.html
   [770]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@kms_writeback@writeback-check-output.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg2-set2:     [SKIP][771] ([Intel XE#2423] / [i915#2575]) -> [SKIP][772] ([Intel XE#1091] / [Intel XE#1201])
   [771]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [772]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-463/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
    - shard-lnl:          [SKIP][773] ([Intel XE#2423]) -> [SKIP][774] ([Intel XE#1091])
   [773]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-8/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [774]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-8/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_ccs@block-copy-compressed:
    - shard-adlp:         [SKIP][775] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#488]) -> [SKIP][776] ([Intel XE#1201])
   [775]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-1/igt@xe_ccs@block-copy-compressed.html
   [776]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-9/igt@xe_ccs@block-copy-compressed.html

  * igt@xe_ccs@suspend-resume:
    - shard-adlp:         [SKIP][777] ([Intel XE#1201]) -> [SKIP][778] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#488])
   [777]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-1/igt@xe_ccs@suspend-resume.html
   [778]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-1/igt@xe_ccs@suspend-resume.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     [SKIP][779] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) -> [SKIP][780] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [779]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-433/igt@xe_compute_preempt@compute-preempt-many.html
   [780]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_copy_basic@mem-copy-linear-0x369:
    - shard-adlp:         [SKIP][781] ([Intel XE#1123] / [Intel XE#1201]) -> [SKIP][782] ([Intel XE#1201])
   [781]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-4/igt@xe_copy_basic@mem-copy-linear-0x369.html
   [782]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-4/igt@xe_copy_basic@mem-copy-linear-0x369.html
    - shard-dg2-set2:     [SKIP][783] ([Intel XE#1123] / [Intel XE#1201]) -> [SKIP][784] ([Intel XE#1130] / [Intel XE#1201])
   [783]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0x369.html
   [784]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0x369.html

  * igt@xe_evict@evict-beng-cm-threads-large:
    - shard-adlp:         [SKIP][785] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][786] ([Intel XE#1201] / [Intel XE#261])
   [785]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-2/igt@xe_evict@evict-beng-cm-threads-large.html
   [786]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-4/igt@xe_evict@evict-beng-cm-threads-large.html
    - shard-dg2-set2:     [SKIP][787] ([Intel XE#1130] / [Intel XE#1201]) -> [TIMEOUT][788] ([Intel XE#1473] / [Intel XE#392])
   [787]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-433/igt@xe_evict@evict-beng-cm-threads-large.html
   [788]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-466/igt@xe_evict@evict-beng-cm-threads-large.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-adlp:         [SKIP][789] ([Intel XE#1201]) -> [SKIP][790] ([Intel XE#1201] / [Intel XE#261]) +1 other test skip
   [789]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-8/igt@xe_evict@evict-beng-threads-large.html
   [790]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-6/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_evict@evict-large-multi-vm-cm:
    - shard-dg2-set2:     [SKIP][791] ([Intel XE#1130] / [Intel XE#1201]) -> [FAIL][792] ([Intel XE#1600])
   [791]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-463/igt@xe_evict@evict-large-multi-vm-cm.html
   [792]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-463/igt@xe_evict@evict-large-multi-vm-cm.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-lnl:          [SKIP][793] ([Intel XE#688]) -> [SKIP][794] ([Intel XE#1130]) +2 other tests skip
   [793]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-6/igt@xe_evict@evict-mixed-threads-large.html
   [794]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-5/igt@xe_evict@evict-mixed-threads-large.html
    - shard-adlp:         [SKIP][795] ([Intel XE#1201] / [Intel XE#261]) -> [SKIP][796] ([Intel XE#1201])
   [795]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-9/igt@xe_evict@evict-mixed-threads-large.html
   [796]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-4/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_evict@evict-small-external-cm:
    - shard-adlp:         [SKIP][797] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][798] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688])
   [797]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-1/igt@xe_evict@evict-small-external-cm.html
   [798]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-2/igt@xe_evict@evict-small-external-cm.html
    - shard-lnl:          [SKIP][799] ([Intel XE#1130]) -> [SKIP][800] ([Intel XE#688]) +4 other tests skip
   [799]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-8/igt@xe_evict@evict-small-external-cm.html
   [800]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-8/igt@xe_evict@evict-small-external-cm.html

  * igt@xe_evict@evict-threads-small:
    - shard-adlp:         [SKIP][801] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688]) -> [SKIP][802] ([Intel XE#1201]) +1 other test skip
   [801]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-4/igt@xe_evict@evict-threads-small.html
   [802]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-9/igt@xe_evict@evict-threads-small.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:
    - shard-adlp:         [SKIP][803] ([Intel XE#1201]) -> [SKIP][804] ([Intel XE#1201] / [Intel XE#688])
   [803]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-1/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html
   [804]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-1/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html

  * igt@xe_exec_balancer@many-parallel-userptr-invalidate:
    - shard-dg2-set2:     [SKIP][805] ([Intel XE#1130]) -> [SKIP][806] ([Intel XE#1130] / [Intel XE#1201]) +2 other tests skip
   [805]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html
   [806]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-once-basic:
    - shard-adlp:         [SKIP][807] ([Intel XE#1201]) -> [SKIP][808] ([Intel XE#1201] / [Intel XE#1392]) +4 other tests skip
   [807]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-8/igt@xe_exec_basic@multigpu-once-basic.html
   [808]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-2/igt@xe_exec_basic@multigpu-once-basic.html

  * igt@xe_exec_basic@multigpu-once-null-defer-bind:
    - shard-adlp:         [SKIP][809] ([Intel XE#1201] / [Intel XE#1392]) -> [SKIP][810] ([Intel XE#1201]) +1 other test skip
   [809]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-8/igt@xe_exec_basic@multigpu-once-null-defer-bind.html
   [810]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-4/igt@xe_exec_basic@multigpu-once-null-defer-bind.html
    - shard-lnl:          [SKIP][811] ([Intel XE#1392]) -> [SKIP][812] ([Intel XE#1130]) +1 other test skip
   [811]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-5/igt@xe_exec_basic@multigpu-once-null-defer-bind.html
   [812]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-5/igt@xe_exec_basic@multigpu-once-null-defer-bind.html

  * igt@xe_exec_basic@multigpu-once-rebind:
    - shard-lnl:          [SKIP][813] ([Intel XE#1130]) -> [SKIP][814] ([Intel XE#1392]) +4 other tests skip
   [813]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-5/igt@xe_exec_basic@multigpu-once-rebind.html
   [814]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-1/igt@xe_exec_basic@multigpu-once-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue:
    - shard-adlp:         [SKIP][815] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][816] ([Intel XE#1201] / [Intel XE#288]) +5 other tests skip
   [815]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-8/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue.html
   [816]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-6/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm:
    - shard-dg2-set2:     [SKIP][817] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][818] ([Intel XE#1130] / [Intel XE#1201]) +7 other tests skip
   [817]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-463/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html
   [818]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html
    - shard-adlp:         [SKIP][819] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][820] ([Intel XE#1130] / [Intel XE#1201])
   [819]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-8/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html
   [820]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-4/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][821] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][822] ([Intel XE#288]) +10 other tests skip
   [821]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-435/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race.html
   [822]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-execqueues-invalid-userptr-fault:
    - shard-adlp:         [SKIP][823] ([Intel XE#1201]) -> [SKIP][824] ([Intel XE#1201] / [Intel XE#288]) +11 other tests skip
   [823]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-2/igt@xe_exec_fault_mode@many-execqueues-invalid-userptr-fault.html
   [824]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-9/igt@xe_exec_fault_mode@many-execqueues-invalid-userptr-fault.html
    - shard-dg2-set2:     [SKIP][825] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][826] ([Intel XE#288])
   [825]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-433/igt@xe_exec_fault_mode@many-execqueues-invalid-userptr-fault.html
   [826]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-invalid-userptr-fault.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch:
    - shard-dg2-set2:     [SKIP][827] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][828] ([Intel XE#1201] / [Intel XE#288]) +15 other tests skip
   [827]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-466/igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch.html
   [828]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-435/igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-userptr-rebind:
    - shard-dg2-set2:     [SKIP][829] ([Intel XE#288]) -> [SKIP][830] ([Intel XE#1201] / [Intel XE#288]) +9 other tests skip
   [829]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-rebind.html
   [830]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-433/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_fault_mode@once-userptr-invalidate-prefetch:
    - shard-adlp:         [SKIP][831] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][832] ([Intel XE#1201]) +6 other tests skip
   [831]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-9/igt@xe_exec_fault_mode@once-userptr-invalidate-prefetch.html
   [832]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-4/igt@xe_exec_fault_mode@once-userptr-invalidate-prefetch.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-prefetch:
    - shard-dg2-set2:     [SKIP][833] ([Intel XE#1130]) -> [SKIP][834] ([Intel XE#1201] / [Intel XE#288])
   [833]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-prefetch.html
   [834]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-435/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-prefetch.html

  * igt@xe_gt_freq@freq_suspend:
    - shard-adlp:         [SKIP][835] ([Intel XE#1201]) -> [FAIL][836] ([Intel XE#2028])
   [835]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-4/igt@xe_gt_freq@freq_suspend.html
   [836]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-8/igt@xe_gt_freq@freq_suspend.html
    - shard-lnl:          [SKIP][837] ([Intel XE#1130]) -> [SKIP][838] ([Intel XE#584])
   [837]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-7/igt@xe_gt_freq@freq_suspend.html
   [838]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-3/igt@xe_gt_freq@freq_suspend.html

  * igt@xe_media_fill@media-fill:
    - shard-dg2-set2:     [SKIP][839] ([Intel XE#1201] / [Intel XE#560]) -> [SKIP][840] ([Intel XE#560])
   [839]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-434/igt@xe_media_fill@media-fill.html
   [840]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@xe_media_fill@media-fill.html

  * igt@xe_oa@oa-regs-whitelisted:
    - shard-dg2-set2:     [SKIP][841] ([Intel XE#1201] / [Intel XE#2419]) -> [SKIP][842] ([Intel XE#2419]) +4 other tests skip
   [841]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-466/igt@xe_oa@oa-regs-whitelisted.html
   [842]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@xe_oa@oa-regs-whitelisted.html

  * igt@xe_oa@polling-small-buf:
    - shard-dg2-set2:     [SKIP][843] ([Intel XE#2419]) -> [SKIP][844] ([Intel XE#1201] / [Intel XE#2419]) +3 other tests skip
   [843]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@xe_oa@polling-small-buf.html
   [844]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-463/igt@xe_oa@polling-small-buf.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][845] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) -> [SKIP][846] ([Intel XE#2284] / [Intel XE#366])
   [845]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-466/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [846]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s4-d3cold-basic-exec:
    - shard-adlp:         [SKIP][847] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) -> [SKIP][848] ([Intel XE#1130] / [Intel XE#1201])
   [847]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-1/igt@xe_pm@s4-d3cold-basic-exec.html
   [848]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-4/igt@xe_pm@s4-d3cold-basic-exec.html
    - shard-dg2-set2:     [SKIP][849] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) -> [SKIP][850] ([Intel XE#1130] / [Intel XE#1201])
   [849]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-466/igt@xe_pm@s4-d3cold-basic-exec.html
   [850]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@xe_pm@s4-d3cold-basic-exec.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-adlp:         [SKIP][851] ([Intel XE#1130] / [Intel XE#1201]) -> [ABORT][852] ([Intel XE#1358] / [Intel XE#1794])
   [851]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-2/igt@xe_pm@s4-multiple-execs.html
   [852]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     [SKIP][853] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][854] ([Intel XE#1201] / [Intel XE#579])
   [853]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-433/igt@xe_pm@vram-d3cold-threshold.html
   [854]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-435/igt@xe_pm@vram-d3cold-threshold.html
    - shard-lnl:          [SKIP][855] ([Intel XE#1130]) -> [SKIP][856] ([Intel XE#579])
   [855]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-4/igt@xe_pm@vram-d3cold-threshold.html
   [856]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-3/igt@xe_pm@vram-d3cold-threshold.html
    - shard-adlp:         [SKIP][857] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][858] ([Intel XE#1201] / [Intel XE#579])
   [857]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-2/igt@xe_pm@vram-d3cold-threshold.html
   [858]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-1/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          [SKIP][859] ([Intel XE#1130]) -> [FAIL][860] ([Intel XE#958])
   [859]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-5/igt@xe_pm_residency@toggle-gt-c6.html
   [860]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-2/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-adlp:         [SKIP][861] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][862] ([Intel XE#1130] / [Intel XE#1201]) +1 other test skip
   [861]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-6/igt@xe_query@multigpu-query-cs-cycles.html
   [862]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-9/igt@xe_query@multigpu-query-cs-cycles.html
    - shard-dg2-set2:     [SKIP][863] ([Intel XE#944]) -> [SKIP][864] ([Intel XE#1130] / [Intel XE#1201])
   [863]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@xe_query@multigpu-query-cs-cycles.html
   [864]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-463/igt@xe_query@multigpu-query-cs-cycles.html
    - shard-lnl:          [SKIP][865] ([Intel XE#944]) -> [SKIP][866] ([Intel XE#1130])
   [865]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-3/igt@xe_query@multigpu-query-cs-cycles.html
   [866]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-3/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-gt-list:
    - shard-dg2-set2:     [SKIP][867] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][868] ([Intel XE#944])
   [867]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-463/igt@xe_query@multigpu-query-gt-list.html
   [868]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@xe_query@multigpu-query-gt-list.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-adlp:         [SKIP][869] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][870] ([Intel XE#1201] / [Intel XE#944]) +2 other tests skip
   [869]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-2/igt@xe_query@multigpu-query-invalid-extension.html
   [870]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-8/igt@xe_query@multigpu-query-invalid-extension.html
    - shard-dg2-set2:     [SKIP][871] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][872] ([Intel XE#1201] / [Intel XE#944]) +1 other test skip
   [871]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-433/igt@xe_query@multigpu-query-invalid-extension.html
   [872]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-435/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_query@multigpu-query-oa-units:
    - shard-dg2-set2:     [SKIP][873] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][874] ([Intel XE#1130] / [Intel XE#1201])
   [873]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-463/igt@xe_query@multigpu-query-oa-units.html
   [874]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@xe_query@multigpu-query-oa-units.html

  * igt@xe_query@multigpu-query-topology-l3-bank-mask:
    - shard-lnl:          [SKIP][875] ([Intel XE#1130]) -> [SKIP][876] ([Intel XE#944]) +2 other tests skip
   [875]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-5/igt@xe_query@multigpu-query-topology-l3-bank-mask.html
   [876]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-4/igt@xe_query@multigpu-query-topology-l3-bank-mask.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-dg2-set2:     [SKIP][877] ([Intel XE#1130]) -> [SKIP][878] ([Intel XE#1201] / [Intel XE#944])
   [877]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-guc.html
   [878]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-466/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1027]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1027
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050
  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
  [Intel XE#1151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151
  [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1332]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1332
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1649]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1695
  [Intel XE#1705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1705
  [Intel XE#1725]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#1924]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1924
  [Intel XE#2019]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019
  [Intel XE#2028]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028
  [Intel XE#2078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2078
  [Intel XE#2105]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2251
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2329
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2338]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2338
  [Intel XE#2343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2343
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2376
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2382]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2382
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391
  [Intel XE#2419]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419
  [Intel XE#2421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2421
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2436]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#734]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
  [Intel XE#736]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/736
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#801]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/801
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * IGT: IGT_7950 -> IGT_7951
  * Linux: xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a -> xe-pw-136192v5

  IGT_7950: 7950
  IGT_7951: 7951
  xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a: abbcf7af3bd79f8729a6dba72674a81730f97f8a
  xe-pw-136192v5: 136192v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/index.html

--===============6870565757964259148==
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
<tr><td><b>Series:</b></td><td>Parallel submission of dma fence jobs and LR jobs with shared hardware resources (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136192/">https://patchwork.freedesktop.org/series/136192/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a_full -&gt; xe-pw-136192v5_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-136192v5_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-136192v5_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-136192v5_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug-lateclose:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-5/igt@core_hotunplug@hotreplug-lateclose.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-8/igt@core_hotunplug@hotreplug-lateclose.html">DMESG-WARN</a> +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-8/igt@kms_flip@flip-vs-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-8/igt@kms_flip@flip-vs-suspend.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-3/igt@kms_vrr@flipline.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-4/igt@kms_vrr@flipline.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-close-execqueues-close-fd:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-4/igt@xe_exec_reset@parallel-close-execqueues-close-fd.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-8/igt@xe_exec_reset@parallel-close-execqueues-close-fd.html">FAIL</a> +4 other tests fail</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-433/igt@xe_exec_reset@parallel-close-execqueues-close-fd.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@xe_exec_reset@parallel-close-execqueues-close-fd.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@unload:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-8/igt@xe_module_load@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-9/igt@xe_module_load@unload.html">ABORT</a></li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-463/igt@xe_module_load@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-463/igt@xe_module_load@unload.html">ABORT</a></li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-5/igt@xe_module_load@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-3/igt@xe_module_load@unload.html">ABORT</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@xe_exec_reset@virtual-close-execqueues-close-fd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-466/igt@xe_exec_reset@virtual-close-execqueues-close-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@xe_exec_reset@virtual-close-execqueues-close-fd.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-466/igt@xe_module_load@many-reload.html">DMESG-FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@xe_module_load@many-reload.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-433/igt@xe_module_load@reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@xe_module_load@reload.html">ABORT</a></li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-4/igt@xe_module_load@reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-1/igt@xe_module_load@reload.html">ABORT</a> +2 other tests abort</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-2/igt@xe_module_load@reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-8/igt@xe_module_load@reload.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-1/igt@xe_module_load@reload-no-display.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-6/igt@xe_module_load@reload-no-display.html">ABORT</a></li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-436/igt@xe_module_load@reload-no-display.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-463/igt@xe_module_load@reload-no-display.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@bind-execqueues-conflict:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-8/igt@xe_vm@bind-execqueues-conflict.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-1/igt@xe_vm@bind-execqueues-conflict.html">FAIL</a> +1 other test fail</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-5/igt@xe_vm@bind-execqueues-conflict.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-2/igt@xe_vm@bind-execqueues-conflict.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328">Intel XE#2328</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-3/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-bmg-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-bmg-8/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-3/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-b-hdmi-a-3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-b-hdmi-a-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-b-hdmi-a-3.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2251">Intel XE#2251</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-bmg-4/igt@kms_cdclk@mode-transition-all-outputs.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-2/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-bmg-2/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-3/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-bmg-4/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-3/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-bmg-4/igt@kms_content_protection@srm.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-2/igt@kms_content_protection@srm.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x10:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-3/igt@kms_cursor_crc@cursor-onscreen-32x10.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-bmg-2/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-bmg-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-bmg-5/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-2/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> +4 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-msflip-blt.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-bmg-5/igt@kms_hdr@static-toggle-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2382">Intel XE#2382</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-4/igt@kms_hdr@static-toggle-suspend.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format@pipe-b-plane-0:</p>
<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-1/igt@kms_plane@pixel-format@pipe-b-plane-0.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-none:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-bmg-8/igt@kms_plane_multiple@tiling-none.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-3/igt@kms_plane_multiple@tiling-none.html">SKIP</a> +74 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-bmg-4/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-3/igt@kms_pm_backlight@basic-brightness.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-bmg-3/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-3/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-suspend:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-bmg-4/igt@kms_psr@pr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-3/igt@kms_psr@pr-suspend.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-bmg-4/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2329">Intel XE#2329</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-3/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-bmg-8/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-7/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-bmg-3/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1027">Intel XE#1027</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-5/igt@xe_evict@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-1/igt@xe_evict@evict-beng-threads-large.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-large:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-bmg-6/igt@xe_evict@evict-cm-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-8/igt@xe_evict@evict-cm-threads-large.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-small:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-bmg-1/igt@xe_evict@evict-mixed-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-6/igt@xe_evict@evict-mixed-threads-small.html">DMESG-WARN</a> +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-bind:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-bmg-8/igt@xe_exec_basic@multigpu-once-null-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-3/igt@xe_exec_basic@multigpu-once-null-defer-bind.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm:</p>
<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-3/igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm.html">SKIP</a> +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-bmg-7/igt@xe_module_load@many-reload.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-3/igt@xe_module_load@many-reload.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@unload:</p>
<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-3/igt@xe_module_load@unload.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@bind-execqueues-conflict:</p>
<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-7/igt@xe_vm@bind-execqueues-conflict.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-136192v5_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-8/igt@core_hotunplug@hotrebind-lateclose.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2421">Intel XE#2421</a>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotunplug-rescan:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-466/igt@core_hotunplug@hotunplug-rescan.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@core_hotunplug@hotunplug-rescan.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-5/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125">Intel XE#1125</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-9/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125">Intel XE#1125</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-466/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/801">Intel XE#801</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2338">Intel XE#2338</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-7/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-2/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@kms_big_fb@x-tiled-16bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@kms_big_fb@x-tiled-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-9/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-463/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-8/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +2 other tests skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-9/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-463/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-3/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-9/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-6/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-433/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +83 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-2/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +56 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-435/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-8/igt@kms_ccs@random-ccs-data-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +26 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-3/igt@kms_ccs@random-ccs-data-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399">Intel XE#1399</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-466/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-8/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-9/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-463/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-433/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-7/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-9/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-8/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-128x42:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-463/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-4/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +10 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-6/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-8/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-1/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-433/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-4/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race-interruptible@ac-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-435/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible@ac-hdmi-a6-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible@ac-hdmi-a6-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-1/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-3/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-435/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-7/igt@kms_flip@wf_vblank-ts-check@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-4/igt@kms_flip@wf_vblank-ts-check@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +3 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-into-addfb2:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-5/igt@kms_getfb@getfb2-into-addfb2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-3/igt@kms_getfb@getfb2-into-addfb2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-5/igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450">Intel XE#1450</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-5/igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450">Intel XE#1450</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-8/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-6/igt@kms_plane@pixel-format.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format@pipe-a-plane-3:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-6/igt@kms_plane@pixel-format@pipe-a-plane-3.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2078">Intel XE#2078</a>) +1 other test warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@kms_plane@plane-panning-bottom-right.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@kms_plane@plane-panning-bottom-right.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-435/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-435/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-7/igt@kms_plane@plane-position-covered.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-5/igt@kms_plane@plane-position-covered.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered@pipe-b-plane-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-7/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-5/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-1/igt@kms_plane_lowres@tiling-4@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-none:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-4/igt@kms_plane_multiple@tiling-none.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-4/igt@kms_plane_multiple@tiling-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +44 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-1/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-3/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-c-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-8/igt@kms_pm_dc@dc5-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-8/igt@kms_pm_dc@dc5-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-6/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-2/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/734">Intel XE#734</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-1/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-7/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1705">Intel XE#1705</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-1/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128">Intel XE#1128</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-1/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-466/igt@kms_psr@fbc-pr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-onoff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-2/igt@kms_psr@pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +7 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-6/igt@kms_psr@pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-1/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-466/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-6/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-2/igt@xe_ccs@block-multicopy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/488">Intel XE#488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-2/igt@xe_compute@ccs-mode-compute-kernel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447">Intel XE#1447</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-435/igt@xe_compute@ccs-mode-compute-kernel.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050">Intel XE#1050</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-4/igt@xe_compute@ccs-mode-compute-kernel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447">Intel XE#1447</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-1/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-435/igt@xe_evict@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-1/igt@xe_evict@evict-beng-mixed-threads-large-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +2 other tests skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-9/igt@xe_evict@evict-beng-mixed-threads-large-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +3 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-basic-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-435/igt@xe_exec_basic@no-exec-basic-defer-bind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@xe_exec_basic@no-exec-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +37 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-rebind:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-2/igt@xe_exec_compute_mode@many-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-3/igt@xe_exec_compute_mode@many-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@invalid-va:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-2/igt@xe_exec_fault_mode@invalid-va.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@xe_exec_fault_mode@many-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-435/igt@xe_exec_fault_mode@many-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-shared-vm-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-4/igt@xe_exec_threads@threads-bal-mixed-shared-vm-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@xe_exec_threads@threads-bal-mixed-shared-vm-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-shared-vm-userptr:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-4/igt@xe_exec_threads@threads-mixed-shared-vm-userptr.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-433/igt@xe_exec_threads@threads-mixed-shared-vm-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-434/igt@xe_exec_threads@threads-mixed-shared-vm-userptr.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-6/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-6/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@closed-fd-and-unmapped-access:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-434/igt@xe_oa@closed-fd-and-unmapped-access.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-oa-format-id:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-8/igt@xe_oa@invalid-oa-format-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@short-reads:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-3/igt@xe_oa@short-reads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-9/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-463/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-8/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-unbind-all:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-5/igt@xe_pm@s2idle-vm-bind-unbind-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-1/igt@xe_pm@s2idle-vm-bind-unbind-all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1924">Intel XE#1924</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-4/igt@xe_pm@s3-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#584</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@xe_pm@s3-vm-bind-prefetch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@idle-residency:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-9/igt@xe_pm_residency@idle-residency.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-4/igt@xe_pm_residency@idle-residency.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-463/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@query-uc-fw-version-huc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-3/igt@xe_query@query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@fbdev@nullptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@fbdev@nullptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-433/igt@kms_big_fb@x-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-434/igt@kms_big_fb@x-tiled-addfb-size-offset-overflow.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-8/igt@kms_big_fb@x-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-7/igt@kms_big_fb@x-tiled-addfb-size-overflow.html">PASS</a> +39 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-c-hdmi-a-3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-c-hdmi-a-3.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-c-hdmi-a-3.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-bmg-4/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-3/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-move@pipe-a:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-4/igt@kms_cursor_legacy@single-move@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-4/igt@kms_cursor_legacy@single-move@pipe-a.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-bmg-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340">Intel XE#1340</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-8/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-463/igt@kms_flip@2x-dpms-vs-vblank-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-463/igt@kms_flip@2x-dpms-vs-vblank-race.html">PASS</a> +36 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@busy-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@kms_flip@busy-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-434/igt@kms_flip@busy-flip.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-8/igt@kms_flip@flip-vs-rmfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-2/igt@kms_flip@flip-vs-rmfb.html">PASS</a> +51 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html">PASS</a> +17 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-x.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-x.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1332">Intel XE#1332</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-463/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@kms_hdr@static-toggle-dpms.html">PASS</a> +14 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-a-plane-2:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-a-plane-2.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-2/igt@kms_plane@plane-position-hole@pipe-a-plane-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-b-plane-4:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-b-plane-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-2/igt@kms_plane@plane-position-hole@pipe-b-plane-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@kms_plane_cursor@viewport.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-463/igt@kms_plane_cursor@viewport.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-3/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-2/igt@kms_pm_backlight@fade-with-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-8/igt@kms_pm_rpm@universal-planes.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-4/igt@kms_pm_rpm@universal-planes.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-no-drrs@edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-2/igt@kms_psr@psr2-no-drrs@edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649">Intel XE#1649</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-4/igt@kms_psr@psr2-no-drrs@edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-idle:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-bmg-2/igt@kms_sequence@get-idle.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-2/igt@kms_sequence@get-idle.html">PASS</a> +65 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-hang:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-bmg-5/igt@kms_vblank@wait-forked-hang.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-2/igt@kms_vblank@wait-forked-hang.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-8/igt@kms_vrr@flip-basic-fastset.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-1/igt@kms_vrr@flip-basic-fastset.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-parallel-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-463/igt@xe_exec_balancer@once-parallel-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@xe_exec_balancer@once-parallel-rebind.html">PASS</a> +80 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-null-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@xe_exec_basic@once-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@xe_exec_basic@once-null-rebind.html">PASS</a> +17 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-null:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-2/igt@xe_exec_basic@twice-null.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-4/igt@xe_exec_basic@twice-null.html">PASS</a> +118 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-execqueues-preempt-fence-early:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-4/igt@xe_exec_compute_mode@many-execqueues-preempt-fence-early.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-6/igt@xe_exec_compute_mode@many-execqueues-preempt-fence-early.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-3/igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-3/igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-bmg-5/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2343">Intel XE#2343</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-8/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">PASS</a></li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-7/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2343">Intel XE#2343</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-3/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-bmg-6/igt@xe_exec_reset@parallel-gt-reset.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-5/igt@xe_exec_reset@parallel-gt-reset.html">PASS</a></li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-436/igt@xe_exec_reset@parallel-gt-reset.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105">Intel XE#2105</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-434/igt@xe_exec_reset@parallel-gt-reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-rebind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-2/igt@xe_exec_threads@threads-hang-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-8/igt@xe_exec_threads@threads-hang-rebind.html">PASS</a> +113 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-1/igt@xe_pm@s2idle-basic-exec.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1924">Intel XE#1924</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-8/igt@xe_pm@s2idle-basic-exec.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-8/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-misaligned-binds-1073741824:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-2/igt@xe_vm@large-split-misaligned-binds-1073741824.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-1/igt@xe_vm@large-split-misaligned-binds-1073741824.html">PASS</a> +37 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-misaligned-binds-4194304:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-bmg-2/igt@xe_vm@large-userptr-misaligned-binds-4194304.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-bmg-7/igt@xe_vm@large-userptr-misaligned-binds-4194304.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunbind-rebind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-8/igt@core_hotunplug@hotunbind-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-6/igt@core_hotunplug@hotunbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2421">Intel XE#2421</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-463/igt@core_hotunplug@hotunbind-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@core_hotunplug@hotunbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2421">Intel XE#2421</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-8/igt@core_hotunplug@hotunbind-rebind.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-8/igt@core_hotunplug@hotunbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2421">Intel XE#2421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-435/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-4/igt@kms_big_fb@linear-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-6/igt@kms_big_fb@linear-64bpp-rotate-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725">Intel XE#1725</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-463/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-436/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-435/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-5/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-4/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-463/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-1/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-2/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +5 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-435/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +5 other tests skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-433/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-6/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-4/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-466/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-466/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-6/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-4/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-8/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-2/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-5/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-8/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-433/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-463/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-435/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-463/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-8/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-4/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-435/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-433/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-4/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-6/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-435/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +41 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-435/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +41 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-434/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399">Intel XE#1399</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-9/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-9/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +4 other tests skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-6/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399">Intel XE#1399</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-3/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-8/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-6/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-463/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-433/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-463/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-2/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-3/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-2/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-9/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-8/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-2/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-463/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-435/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-4/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-4/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-434/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-6/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-5/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-8/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-8/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-463/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-storm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-storm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-463/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-463/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-5/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-7/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-434/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-1/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-9/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-436/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-433/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-5/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-1/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x10:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@kms_cursor_crc@cursor-onscreen-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-436/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-5/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-2/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413">Intel XE#1413</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-128x42:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-2/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-3/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x32:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-5/igt@kms_cursor_crc@cursor-sliding-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-3/igt@kms_cursor_crc@cursor-sliding-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-433/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-433/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-2/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-4/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-2/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-463/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other tests skip</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-436/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-3/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-5/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-433/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-463/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-433/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-463/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-2/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-2/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-434/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-436/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-463/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-5/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-8/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-1/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-9/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-4/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-7/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/702">Intel XE#702</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-2/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-4/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/702">Intel XE#702</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-434/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-5/igt@kms_flip@2x-dpms-vs-vblank-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-2/igt@kms_flip@2x-dpms-vs-vblank-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-2/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-2/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-1/igt@kms_flip@2x-flip-vs-panning-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-4/igt@kms_flip@2x-flip-vs-panning-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-6/igt@kms_flip@2x-flip-vs-rmfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-3/igt@kms_flip@2x-flip-vs-rmfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-9/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +11 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +21 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +22 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +10 other tests skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151">Intel XE#1151</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +8 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-9/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-435/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">Intel XE#605</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">Intel XE#605</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-4/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-4/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-8/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-7/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-8/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-9/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-463/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-433/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-8/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-463/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-463/igt@kms_plane@plane-panning-bottom-right-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-435/igt@kms_plane@plane-panning-bottom-right-suspend.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-7/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-6/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-1/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-6/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-436/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-4/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-4/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-434/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-2/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-9/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-433/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-2/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-5/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/736">Intel XE#736</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-433/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-433/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@blob-prop-core:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@kms_prop_blob@blob-prop-core.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-463/igt@kms_prop_blob@blob-prop-core.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-463/igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-433/igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-433/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-433/igt@kms_psr@fbc-pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@kms_psr@fbc-pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-render:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-9/igt@kms_psr@fbc-pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-4/igt@kms_psr@fbc-pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-435/igt@kms_psr@fbc-pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@kms_psr@fbc-pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-6/igt@kms_psr@fbc-pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-5/igt@kms_psr@fbc-pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@kms_psr@fbc-psr2-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-463/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-466/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@kms_psr@pr-dpms.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@kms_psr@pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-8/igt@kms_psr@pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-1/igt@kms_psr@pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-435/igt@kms_psr@pr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-463/igt@kms_psr@pr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-8/igt@kms_psr@psr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-6/igt@kms_psr@psr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-433/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@kms_psr@psr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-463/igt@kms_psr@psr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-suspend@edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-1/igt@kms_psr@psr-suspend@edp-1.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-1/igt@kms_psr@psr-suspend@edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-436/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-435/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-4/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-433/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-436/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-9/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-4/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-435/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-8/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-4/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-463/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-466/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-463/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-433/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-434/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-463/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-8/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-8/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-copy-compressed:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-1/igt@xe_ccs@block-copy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/488">Intel XE#488</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-9/igt@xe_ccs@block-copy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-1/igt@xe_ccs@suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-1/igt@xe_ccs@suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/488">Intel XE#488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-433/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x369:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-4/igt@xe_copy_basic@mem-copy-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-4/igt@xe_copy_basic@mem-copy-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-large:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-2/igt@xe_evict@evict-beng-cm-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-4/igt@xe_evict@evict-beng-cm-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-433/igt@xe_evict@evict-beng-cm-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-466/igt@xe_evict@evict-beng-cm-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-8/igt@xe_evict@evict-beng-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-6/igt@xe_evict@evict-beng-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-463/igt@xe_evict@evict-large-multi-vm-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-463/igt@xe_evict@evict-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600">Intel XE#1600</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-6/igt@xe_evict@evict-mixed-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-5/igt@xe_evict@evict-mixed-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +2 other tests skip</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-9/igt@xe_evict@evict-mixed-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-4/igt@xe_evict@evict-mixed-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-cm:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-1/igt@xe_evict@evict-small-external-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-2/igt@xe_evict@evict-small-external-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-8/igt@xe_evict@evict-small-external-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-8/igt@xe_evict@evict-small-external-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-small:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-4/igt@xe_evict@evict-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-9/igt@xe_evict@evict-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-1/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-1/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-parallel-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-8/igt@xe_exec_basic@multigpu-once-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-2/igt@xe_exec_basic@multigpu-once-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-bind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-8/igt@xe_exec_basic@multigpu-once-null-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-4/igt@xe_exec_basic@multigpu-once-null-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-5/igt@xe_exec_basic@multigpu-once-null-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-5/igt@xe_exec_basic@multigpu-once-null-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-rebind:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-5/igt@xe_exec_basic@multigpu-once-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-1/igt@xe_exec_basic@multigpu-once-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-8/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-6/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-463/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +7 other tests skip</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-8/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-4/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-435/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-invalid-userptr-fault:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-2/igt@xe_exec_fault_mode@many-execqueues-invalid-userptr-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-9/igt@xe_exec_fault_mode@many-execqueues-invalid-userptr-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +11 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-433/igt@xe_exec_fault_mode@many-execqueues-invalid-userptr-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-invalid-userptr-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-466/igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-435/igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-433/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-invalidate-prefetch:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-9/igt@xe_exec_fault_mode@once-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-4/igt@xe_exec_fault_mode@once-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-435/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-4/igt@xe_gt_freq@freq_suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-8/igt@xe_gt_freq@freq_suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-7/igt@xe_gt_freq@freq_suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-3/igt@xe_gt_freq@freq_suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#584</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-434/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/560">Intel XE#560</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/560">Intel XE#560</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-466/igt@xe_oa@oa-regs-whitelisted.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@xe_oa@oa-regs-whitelisted.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling-small-buf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@xe_oa@polling-small-buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-463/igt@xe_oa@polling-small-buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-466/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3cold-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-1/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-4/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-466/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-2/igt@xe_pm@s4-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-433/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-435/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-4/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-3/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-2/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-1/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-5/igt@xe_pm_residency@toggle-gt-c6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-2/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-6/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-9/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-463/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-3/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-3/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-gt-list:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-463/igt@xe_query@multigpu-query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-432/igt@xe_query@multigpu-query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-adlp-2/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-adlp-8/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-433/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-435/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-oa-units:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-463/igt@xe_query@multigpu-query-oa-units.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-436/igt@xe_query@multigpu-query-oa-units.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology-l3-bank-mask:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-lnl-5/igt@xe_query@multigpu-query-topology-l3-bank-mask.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-lnl-4/igt@xe_query@multigpu-query-topology-l3-bank-mask.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/shard-dg2-466/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7950 -&gt; IGT_7951</li>
<li>Linux: xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a -&gt; xe-pw-136192v5</li>
</ul>
<p>IGT_7950: 7950<br />
  IGT_7951: 7951<br />
  xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a: abbcf7af3bd79f8729a6dba72674a81730f97f8a<br />
  xe-pw-136192v5: 136192v5</p>

</body>
</html>

--===============6870565757964259148==--
