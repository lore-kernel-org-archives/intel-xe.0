Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D5A2D743E8
	for <intel-xe@archiver.kernel.org>; Wed, 20 Nov 2024 22:12:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15AE510E0A8;
	Wed, 20 Nov 2024 22:12:50 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 177ED10E0A8;
 Wed, 20 Nov 2024 22:12:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/i915/display=3A_make_a?=
 =?utf-8?q?ll_i915=5Fdrv=2Eh_includes_explicit_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 20 Nov 2024 22:12:49 -0000
Message-ID: <173214076910.857163.8779805236514962483@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <cover.1732104170.git.jani.nikula@intel.com>
In-Reply-To: <cover.1732104170.git.jani.nikula@intel.com>
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

== Series Details ==

Series: drm/i915/display: make all i915_drv.h includes explicit (rev2)
URL   : https://patchwork.freedesktop.org/series/140765/
State : failure

== Summary ==

CI Bug Log - changes from xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed_full -> xe-pw-140765v2_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-140765v2_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-140765v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-140765v2_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_dp_aux_dev:
    - shard-bmg:          [PASS][1] -> [SKIP][2] +1 other test skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-3/igt@kms_dp_aux_dev.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-6/igt@kms_dp_aux_dev.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-render:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-render.html

  * igt@kms_vblank@query-busy@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][4]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-433/igt@kms_vblank@query-busy@pipe-a-hdmi-a-6.html

  * igt@xe_exec_fault_mode@once-userptr-prefetch:
    - shard-bmg:          [PASS][5] -> [DMESG-WARN][6] +2 other tests dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-6/igt@xe_exec_fault_mode@once-userptr-prefetch.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-8/igt@xe_exec_fault_mode@once-userptr-prefetch.html

  * igt@xe_exec_reset@parallel-close-execqueues-close-fd:
    - shard-bmg:          [PASS][7] -> [ABORT][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-4/igt@xe_exec_reset@parallel-close-execqueues-close-fd.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-6/igt@xe_exec_reset@parallel-close-execqueues-close-fd.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early:
    - shard-lnl:          [PASS][9] -> [ABORT][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-lnl-3/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-lnl-3/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html

  * igt@xe_module_load@many-reload:
    - shard-dg2-set2:     NOTRUN -> [FAIL][11]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-466/igt@xe_module_load@many-reload.html

  * igt@xe_oa@polling-small-buf:
    - shard-lnl:          [PASS][12] -> [DMESG-WARN][13]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-lnl-6/igt@xe_oa@polling-small-buf.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-lnl-3/igt@xe_oa@polling-small-buf.html

  * igt@xe_query@query-cs-cycles:
    - shard-bmg:          [PASS][14] -> [FAIL][15]
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-3/igt@xe_query@query-cs-cycles.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-4/igt@xe_query@query-cs-cycles.html

  * igt@xe_spin_batch@spin-batch:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][16]
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-6/igt@xe_spin_batch@spin-batch.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][17] ([Intel XE#2136] / [Intel XE#2351]) -> [INCOMPLETE][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html

  * igt@xe_exec_reset@close-fd-no-exec:
    - shard-dg2-set2:     [SKIP][19] ([Intel XE#1130]) -> [DMESG-WARN][20] +1 other test dmesg-warn
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@xe_exec_reset@close-fd-no-exec.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-433/igt@xe_exec_reset@close-fd-no-exec.html

  * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run:
    - shard-lnl:          [FAIL][21] ([Intel XE#3499] / [Intel XE#3539]) -> [DMESG-FAIL][22]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-lnl-1/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-lnl-4/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html

  
Known issues
------------

  Here are the changes found in xe-pw-140765v2_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_getstats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#2423])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-466/igt@core_getstats.html

  * igt@core_getversion@basic:
    - shard-dg2-set2:     NOTRUN -> [FAIL][24] ([Intel XE#3440])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-434/igt@core_getversion@basic.html

  * igt@core_hotunplug@unplug-rescan:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#1885])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-434/igt@core_hotunplug@unplug-rescan.html

  * igt@fbdev@info:
    - shard-dg2-set2:     [PASS][26] -> [SKIP][27] ([Intel XE#2134])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-436/igt@fbdev@info.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-466/igt@fbdev@info.html

  * igt@fbdev@unaligned-read:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#2134]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-466/igt@fbdev@unaligned-read.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#2550]) +23 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-436/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-dg2-set2:     [PASS][30] -> [SKIP][31] ([Intel XE#2423] / [i915#2575]) +85 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-433/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-466/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
    - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#1124]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-adlp-8/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2327]) +2 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-6/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#316]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-435/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][35] ([Intel XE#1033])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#1124])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-435/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#316]) +2 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-adlp-3/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#1124]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-lnl-1/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#1124]) +5 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:
    - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#367]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-adlp-4/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [PASS][41] -> [SKIP][42] ([Intel XE#2314] / [Intel XE#2894])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#2191])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-adlp-3/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#2191])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-lnl-1/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2314] / [Intel XE#2894])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-6/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#2191])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-435/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#1512])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-lnl-1/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#787]) +146 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-436/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#455] / [Intel XE#787]) +22 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2887]) +4 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-6/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#455] / [Intel XE#787]) +9 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-adlp-4/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][52] ([Intel XE#787]) +14 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-adlp-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#2907]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#2652] / [Intel XE#787]) +18 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][55] ([Intel XE#3113])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][56] ([Intel XE#2907]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-adlp-4/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#2887]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-lnl-1/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_cdclk@plane-scaling:
    - shard-adlp:         NOTRUN -> [SKIP][58] ([Intel XE#1152] / [Intel XE#455])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-adlp-4/igt@kms_cdclk@plane-scaling.html

  * igt@kms_cdclk@plane-scaling@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#1152]) +2 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-adlp-4/igt@kms_cdclk@plane-scaling@pipe-a-hdmi-a-1.html

  * igt@kms_chamelium_edid@dp-edid-read:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#2252])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-6/igt@kms_chamelium_edid@dp-edid-read.html

  * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][61] ([Intel XE#373]) +4 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-adlp-8/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html

  * igt@kms_content_protection@content-type-change:
    - shard-adlp:         NOTRUN -> [SKIP][62] ([Intel XE#455]) +8 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-adlp-4/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@legacy@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][63] ([Intel XE#1178])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-463/igt@kms_content_protection@legacy@pipe-a-dp-4.html

  * igt@kms_content_protection@lic-type-1:
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#3278])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-lnl-1/igt@kms_content_protection@lic-type-1.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#2321])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-lnl-1/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-adlp:         NOTRUN -> [SKIP][66] ([Intel XE#308])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-adlp-3/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-64x64:
    - shard-dg2-set2:     NOTRUN -> [SKIP][67] ([Intel XE#2423] / [i915#2575]) +97 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-64x64.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#2291])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-bmg:          [PASS][69] -> [SKIP][70] ([Intel XE#2291]) +6 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [PASS][71] -> [SKIP][72] ([Intel XE#2425])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-1/igt@kms_display_modes@extended-mode-basic.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#2244]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-1/igt@kms_dsc@dsc-fractional-bpp.html
    - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#2244])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-lnl-1/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_feature_discovery@psr1:
    - shard-adlp:         NOTRUN -> [SKIP][75] ([Intel XE#1135])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-adlp-4/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          [PASS][76] -> [SKIP][77] ([Intel XE#2316]) +8 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-8/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][78] ([Intel XE#3486])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][79] ([Intel XE#3321] / [Intel XE#3486])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:
    - shard-bmg:          [PASS][80] -> [FAIL][81] ([Intel XE#2882]) +1 other test fail
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#2316]) +1 other test skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@2x-plain-flip:
    - shard-adlp:         NOTRUN -> [SKIP][83] ([Intel XE#310]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-adlp-8/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][84] ([Intel XE#1421])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-lnl-1/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@flip-vs-panning-interruptible@d-dp2:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][85] ([Intel XE#3468]) +23 other tests dmesg-warn
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-4/igt@kms_flip@flip-vs-panning-interruptible@d-dp2.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-lnl:          [PASS][86] -> [FAIL][87] ([Intel XE#886]) +1 other test fail
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-lnl-6/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-lnl-3/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#2293]) +1 other test skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#2293] / [Intel XE#2380]) +1 other test skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][90] ([Intel XE#651]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#2311]) +3 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [PASS][92] -> [SKIP][93] ([Intel XE#2136] / [Intel XE#2351]) +13 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][94] ([Intel XE#2136] / [Intel XE#2351]) +35 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][95] ([Intel XE#656]) +20 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:
    - shard-dg2-set2:     [PASS][96] -> [SKIP][97] ([Intel XE#2136]) +21 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#651])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear:
    - shard-adlp:         NOTRUN -> [SKIP][99] ([Intel XE#651]) +2 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][100] ([Intel XE#2136]) +99 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-b-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [FAIL][101] ([Intel XE#2333])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-6/igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-b-hdmi-a-3.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][102] ([Intel XE#653]) +4 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#2312]) +4 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-move:
    - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#656]) +5 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#2313]) +6 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][106] ([Intel XE#653]) +2 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][107] ([Intel XE#346])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-adlp-4/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#2934])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][109] ([Intel XE#2925])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-435/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_plane_lowres@tiling-4:
    - shard-bmg:          [PASS][110] -> [DMESG-FAIL][111] ([Intel XE#2705] / [Intel XE#3468])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-6/igt@kms_plane_lowres@tiling-4.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-4/igt@kms_plane_lowres@tiling-4.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-adlp:         NOTRUN -> [SKIP][112] ([Intel XE#309]) +1 other test skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-adlp-4/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][113] ([Intel XE#361])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a:
    - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#2763]) +4 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a:
    - shard-adlp:         NOTRUN -> [SKIP][115] ([Intel XE#2763]) +2 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-adlp-3/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:
    - shard-adlp:         NOTRUN -> [SKIP][116] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-adlp-3/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c:
    - shard-dg2-set2:     NOTRUN -> [SKIP][117] ([Intel XE#2763]) +5 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][118] ([Intel XE#2763] / [Intel XE#455]) +2 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b:
    - shard-lnl:          NOTRUN -> [SKIP][119] ([Intel XE#2763]) +3 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-lnl-1/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][120] ([Intel XE#2938])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-6/igt@kms_pm_backlight@brightness-with-dpms.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][121] ([Intel XE#2938])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-435/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [PASS][122] -> [FAIL][123] ([Intel XE#718])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-lnl-6/igt@kms_pm_dc@dc5-psr.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-lnl-3/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_rpm@cursor:
    - shard-dg2-set2:     [PASS][124] -> [SKIP][125] ([Intel XE#2446])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-433/igt@kms_pm_rpm@cursor.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-434/igt@kms_pm_rpm@cursor.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-dg2-set2:     NOTRUN -> [SKIP][126] ([Intel XE#2446]) +3 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-434/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@legacy-planes-dpms@plane-68:
    - shard-lnl:          [PASS][127] -> [DMESG-WARN][128] ([Intel XE#3184]) +1 other test dmesg-warn
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-lnl-8/igt@kms_pm_rpm@legacy-planes-dpms@plane-68.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-lnl-7/igt@kms_pm_rpm@legacy-planes-dpms@plane-68.html

  * igt@kms_pm_rpm@modeset-stress-extra-wait:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][129] ([Intel XE#2864] / [Intel XE#3468])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-6/igt@kms_pm_rpm@modeset-stress-extra-wait.html
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][130] ([Intel XE#2864] / [Intel XE#3468])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-435/igt@kms_pm_rpm@modeset-stress-extra-wait.html

  * igt@kms_pm_rpm@universal-planes:
    - shard-lnl:          NOTRUN -> [DMESG-WARN][131] ([Intel XE#2042])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-lnl-1/igt@kms_pm_rpm@universal-planes.html

  * igt@kms_pm_rpm@universal-planes@plane-50:
    - shard-lnl:          NOTRUN -> [DMESG-WARN][132] ([Intel XE#3184])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-lnl-1/igt@kms_pm_rpm@universal-planes@plane-50.html

  * igt@kms_pm_rpm@universal-planes@plane-59:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][133] ([Intel XE#3468]) +6 other tests dmesg-warn
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-433/igt@kms_pm_rpm@universal-planes@plane-59.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-adlp:         NOTRUN -> [SKIP][134] ([Intel XE#1489]) +1 other test skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-adlp-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][135] ([Intel XE#1489]) +2 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr@fbc-pr-cursor-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][136] ([Intel XE#2234] / [Intel XE#2850]) +3 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-6/igt@kms_psr@fbc-pr-cursor-plane-onoff.html

  * igt@kms_psr@fbc-psr2-cursor-blt:
    - shard-adlp:         NOTRUN -> [SKIP][137] ([Intel XE#2850] / [Intel XE#929]) +7 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-adlp-4/igt@kms_psr@fbc-psr2-cursor-blt.html

  * igt@kms_psr@psr2-cursor-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][138] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-435/igt@kms_psr@psr2-cursor-plane-onoff.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:
    - shard-adlp:         NOTRUN -> [FAIL][139] ([Intel XE#1874])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-adlp-8/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html
    - shard-bmg:          [PASS][140] -> [DMESG-FAIL][141] ([Intel XE#3468]) +6 other tests dmesg-fail
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-6/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-8/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-bmg:          NOTRUN -> [SKIP][142] ([Intel XE#3414])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-6/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-adlp:         NOTRUN -> [SKIP][143] ([Intel XE#1127])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-adlp-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-adlp:         NOTRUN -> [SKIP][144] ([Intel XE#3414])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-adlp-4/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_sequence@get-forked-busy@pipe-d-dp-2:
    - shard-bmg:          [PASS][145] -> [DMESG-WARN][146] ([Intel XE#3468]) +41 other tests dmesg-warn
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-3/igt@kms_sequence@get-forked-busy@pipe-d-dp-2.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-1/igt@kms_sequence@get-forked-busy@pipe-d-dp-2.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-bmg:          [PASS][147] -> [SKIP][148] ([Intel XE#1435])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-1/igt@kms_setmode@clone-exclusive-crtc.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-adlp:         NOTRUN -> [SKIP][149] ([Intel XE#330])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-adlp-4/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [PASS][150] -> [FAIL][151] ([Intel XE#899])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-lnl-2/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-lnl-2/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@kms_vblank@accuracy-idle:
    - shard-lnl:          [PASS][152] -> [FAIL][153] ([Intel XE#1523]) +1 other test fail
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-lnl-6/igt@kms_vblank@accuracy-idle.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-lnl-3/igt@kms_vblank@accuracy-idle.html

  * igt@kms_vblank@query-forked-busy@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][154] ([Intel XE#3468]) +9 other tests dmesg-fail
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-4/igt@kms_vblank@query-forked-busy@pipe-a-dp-2.html

  * igt@kms_vrr@flip-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][155] ([Intel XE#455]) +9 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-435/igt@kms_vrr@flip-dpms.html
    - shard-bmg:          NOTRUN -> [SKIP][156] ([Intel XE#1499])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-6/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@lobf:
    - shard-lnl:          NOTRUN -> [SKIP][157] ([Intel XE#1499])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-lnl-1/igt@kms_vrr@lobf.html

  * igt@testdisplay:
    - shard-dg2-set2:     [PASS][158] -> [SKIP][159] ([Intel XE#2423]) +2 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-436/igt@testdisplay.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-466/igt@testdisplay.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-adlp:         NOTRUN -> [SKIP][160] ([Intel XE#1447])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-adlp-4/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_compute_preempt@compute-preempt@engine-drm_xe_engine_class_compute:
    - shard-dg2-set2:     NOTRUN -> [SKIP][161] ([Intel XE#1280] / [Intel XE#455])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-435/igt@xe_compute_preempt@compute-preempt@engine-drm_xe_engine_class_compute.html

  * igt@xe_eudebug_online@reset-with-attention:
    - shard-bmg:          NOTRUN -> [SKIP][162] ([Intel XE#2905])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-2/igt@xe_eudebug_online@reset-with-attention.html

  * igt@xe_eudebug_online@single-step-one:
    - shard-adlp:         NOTRUN -> [SKIP][163] ([Intel XE#2905]) +6 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-adlp-3/igt@xe_eudebug_online@single-step-one.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - shard-bmg:          NOTRUN -> [FAIL][164] ([Intel XE#2364])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-6/igt@xe_evict@evict-beng-large-multi-vm-cm.html
    - shard-dg2-set2:     NOTRUN -> [FAIL][165] ([Intel XE#1600])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-435/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_evict@evict-large-cm:
    - shard-lnl:          NOTRUN -> [SKIP][166] ([Intel XE#688])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-lnl-1/igt@xe_evict@evict-large-cm.html

  * igt@xe_evict@evict-small-multi-vm:
    - shard-adlp:         NOTRUN -> [SKIP][167] ([Intel XE#261] / [Intel XE#688]) +2 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-adlp-3/igt@xe_evict@evict-small-multi-vm.html

  * igt@xe_exec_balancer@once-parallel-rebind:
    - shard-dg2-set2:     NOTRUN -> [SKIP][168] ([Intel XE#1130]) +162 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-434/igt@xe_exec_balancer@once-parallel-rebind.html

  * igt@xe_exec_basic@many-null-rebind:
    - shard-dg2-set2:     [PASS][169] -> [SKIP][170] ([Intel XE#1130]) +154 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-433/igt@xe_exec_basic@many-null-rebind.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-466/igt@xe_exec_basic@many-null-rebind.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][171] ([Intel XE#1392]) +3 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-adlp-4/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][172] ([Intel XE#2322])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-2/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm:
    - shard-adlp:         NOTRUN -> [SKIP][173] ([Intel XE#288]) +15 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-adlp-8/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][174] ([Intel XE#288]) +4 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-435/igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch.html

  * igt@xe_exec_reset@cat-error:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][175] ([Intel XE#358])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-adlp-4/igt@xe_exec_reset@cat-error.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][176] ([Intel XE#3343])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][177] ([Intel XE#3343])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-435/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html

  * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:
    - shard-lnl:          NOTRUN -> [FAIL][178] ([Intel XE#3499] / [Intel XE#3539])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-lnl-1/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html

  * igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:
    - shard-bmg:          [PASS][179] -> [DMESG-WARN][180] ([Intel XE#3467])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-6/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-4/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html

  * igt@xe_module_load@force-load:
    - shard-dg2-set2:     NOTRUN -> [SKIP][181] ([Intel XE#378])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-466/igt@xe_module_load@force-load.html

  * igt@xe_module_load@unload:
    - shard-dg2-set2:     [PASS][182] -> [DMESG-WARN][183] ([Intel XE#3467])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@xe_module_load@unload.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-433/igt@xe_module_load@unload.html

  * igt@xe_oa@invalid-map-oa-buffer:
    - shard-adlp:         NOTRUN -> [SKIP][184] ([Intel XE#2541]) +2 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-adlp-4/igt@xe_oa@invalid-map-oa-buffer.html

  * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
    - shard-dg2-set2:     NOTRUN -> [SKIP][185] ([Intel XE#2541])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-435/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-bmg:          NOTRUN -> [SKIP][186] ([Intel XE#1420])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-1/igt@xe_pat@pat-index-xehpc.html
    - shard-lnl:          NOTRUN -> [SKIP][187] ([Intel XE#1420] / [Intel XE#2838])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-lnl-1/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-adlp:         NOTRUN -> [SKIP][188] ([Intel XE#2284] / [Intel XE#366])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-adlp-8/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@s2idle-mocs:
    - shard-dg2-set2:     [PASS][189] -> [ABORT][190] ([Intel XE#1794])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-435/igt@xe_pm@s2idle-mocs.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-433/igt@xe_pm@s2idle-mocs.html

  * igt@xe_pm@s3-basic:
    - shard-lnl:          NOTRUN -> [SKIP][191] ([Intel XE#584])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-lnl-1/igt@xe_pm@s3-basic.html

  * igt@xe_pm@s3-basic-exec:
    - shard-adlp:         [PASS][192] -> [DMESG-WARN][193] ([Intel XE#3086] / [Intel XE#569])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-adlp-2/igt@xe_pm@s3-basic-exec.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-adlp-2/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm@s4-basic-exec:
    - shard-adlp:         [PASS][194] -> [ABORT][195] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-adlp-2/igt@xe_pm@s4-basic-exec.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-adlp-9/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm_residency@gt-c6-freeze:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][196] ([Intel XE#1727] / [Intel XE#3468])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-6/igt@xe_pm_residency@gt-c6-freeze.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-adlp:         [PASS][197] -> [FAIL][198] ([Intel XE#958])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-adlp-3/igt@xe_pm_residency@toggle-gt-c6.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-adlp-3/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_query@multigpu-query-gt-list:
    - shard-lnl:          NOTRUN -> [SKIP][199] ([Intel XE#944])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-lnl-1/igt@xe_query@multigpu-query-gt-list.html

  * igt@xe_query@multigpu-query-hwconfig:
    - shard-adlp:         NOTRUN -> [SKIP][200] ([Intel XE#944]) +1 other test skip
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-adlp-3/igt@xe_query@multigpu-query-hwconfig.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-bmg:          NOTRUN -> [SKIP][201] ([Intel XE#944]) +1 other test skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-2/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_vm@munmap-style-unbind-either-side-partial-split-page-hammer:
    - shard-bmg:          [PASS][202] -> [DMESG-WARN][203] ([Intel XE#1727]) +2 other tests dmesg-warn
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-6/igt@xe_vm@munmap-style-unbind-either-side-partial-split-page-hammer.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-4/igt@xe_vm@munmap-style-unbind-either-side-partial-split-page-hammer.html

  * igt@xe_wedged@basic-wedged:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][204] ([Intel XE#2919])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-adlp-3/igt@xe_wedged@basic-wedged.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotrebind:
    - shard-dg2-set2:     [SKIP][205] ([Intel XE#1885]) -> [PASS][206]
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@core_hotunplug@hotrebind.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-433/igt@core_hotunplug@hotrebind.html

  * igt@fbdev@write:
    - shard-dg2-set2:     [SKIP][207] ([Intel XE#2134]) -> [PASS][208]
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-466/igt@fbdev@write.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-435/igt@fbdev@write.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-adlp:         [FAIL][209] ([Intel XE#1426]) -> [PASS][210] +1 other test pass
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-adlp-8/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-adlp-9/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][211] ([Intel XE#2136]) -> [PASS][212] +30 other tests pass
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@kms_big_fb@4-tiled-addfb-size-overflow.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-436/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          [DMESG-WARN][213] ([Intel XE#3468]) -> [PASS][214] +43 other tests pass
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-0:
    - shard-bmg:          [DMESG-FAIL][215] ([Intel XE#3468]) -> [PASS][216] +3 other tests pass
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-3/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-6/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][217] ([Intel XE#1033]) -> [PASS][218]
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p:
    - shard-lnl:          [INCOMPLETE][219] -> [PASS][220] +1 other test pass
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-lnl-6/igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-lnl-3/igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [SKIP][221] ([Intel XE#2136] / [Intel XE#2351]) -> [PASS][222] +8 other tests pass
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-436/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html

  * igt@kms_cursor_edge_walk@128x128-right-edge:
    - shard-dg2-set2:     [SKIP][223] ([Intel XE#2423] / [i915#2575]) -> [PASS][224] +99 other tests pass
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@kms_cursor_edge_walk@128x128-right-edge.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-433/igt@kms_cursor_edge_walk@128x128-right-edge.html

  * igt@kms_cursor_edge_walk@128x128-top-edge:
    - shard-dg2-set2:     [INCOMPLETE][225] -> [PASS][226] +1 other test pass
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-433/igt@kms_cursor_edge_walk@128x128-top-edge.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-435/igt@kms_cursor_edge_walk@128x128-top-edge.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][227] ([Intel XE#2291]) -> [PASS][228] +3 other tests pass
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-8/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [DMESG-WARN][229] -> [PASS][230]
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-lnl:          [FAIL][231] ([Intel XE#1475]) -> [PASS][232]
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-lnl-2/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-lnl-2/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_dp_aux_dev:
    - shard-dg2-set2:     [SKIP][233] ([Intel XE#2423]) -> [PASS][234]
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@kms_dp_aux_dev.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-436/igt@kms_dp_aux_dev.html

  * igt@kms_flip@2x-plain-flip:
    - shard-bmg:          [SKIP][235] ([Intel XE#2316]) -> [PASS][236] +4 other tests pass
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-6/igt@kms_flip@2x-plain-flip.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-8/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1:
    - shard-lnl:          [FAIL][237] ([Intel XE#886]) -> [PASS][238] +2 other tests pass
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1.html

  * igt@kms_flip@plain-flip-fb-recreate@c-edp1:
    - shard-lnl:          [FAIL][239] ([Intel XE#3149] / [Intel XE#886]) -> [PASS][240] +2 other tests pass
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-lnl-3/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-lnl-5/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-adlp:         [DMESG-WARN][241] ([Intel XE#2953] / [Intel XE#3086]) -> [PASS][242]
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-3:
    - shard-bmg:          [DMESG-WARN][243] ([Intel XE#877]) -> [PASS][244] +1 other test pass
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-2/igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-3.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-3/igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-3.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-bmg:          [SKIP][245] ([Intel XE#3012]) -> [PASS][246]
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-4/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format:
    - shard-bmg:          [DMESG-WARN][247] ([Intel XE#2566] / [Intel XE#3468]) -> [PASS][248] +1 other test pass
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-1/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-6/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg2-set2:     [SKIP][249] ([Intel XE#2446]) -> [PASS][250] +2 other tests pass
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@kms_pm_rpm@modeset-non-lpsp.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-436/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_sequence@queue-idle:
    - shard-bmg:          [INCOMPLETE][251] -> [PASS][252] +2 other tests pass
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-3/igt@kms_sequence@queue-idle.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-6/igt@kms_sequence@queue-idle.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
    - shard-lnl:          [FAIL][253] ([Intel XE#899]) -> [PASS][254] +1 other test pass
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-lnl-2/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-lnl-2/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-bmg:          [DMESG-WARN][255] ([Intel XE#1727] / [Intel XE#3468]) -> [PASS][256] +1 other test pass
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-1/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-6/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@kms_vblank@wait-forked-busy@pipe-a-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][257] ([Intel XE#3086]) -> [PASS][258] +2 other tests pass
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-adlp-8/igt@kms_vblank@wait-forked-busy@pipe-a-hdmi-a-1.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-adlp-1/igt@kms_vblank@wait-forked-busy@pipe-a-hdmi-a-1.html

  * igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-rebind:
    - shard-adlp:         [FAIL][259] ([Intel XE#3233]) -> [PASS][260]
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-adlp-4/igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-rebind.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-adlp-6/igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-rebind.html

  * igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate:
    - shard-bmg:          [DMESG-FAIL][261] ([Intel XE#3371] / [Intel XE#3468]) -> [PASS][262]
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-6/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-4/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html

  * igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate:
    - shard-lnl:          [DMESG-WARN][263] ([Intel XE#3371]) -> [PASS][264]
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-lnl-5/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-lnl-2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate.html

  * igt@xe_module_load@reload:
    - shard-dg2-set2:     [FAIL][265] -> [PASS][266]
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@xe_module_load@reload.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-436/igt@xe_module_load@reload.html

  * igt@xe_module_load@reload-no-display:
    - shard-bmg:          [DMESG-WARN][267] ([Intel XE#3467]) -> [PASS][268] +1 other test pass
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-3/igt@xe_module_load@reload-no-display.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-6/igt@xe_module_load@reload-no-display.html

  * igt@xe_pm@d3hot-multiple-execs:
    - shard-lnl:          [DMESG-WARN][269] ([Intel XE#3184]) -> [PASS][270]
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-lnl-4/igt@xe_pm@d3hot-multiple-execs.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-lnl-8/igt@xe_pm@d3hot-multiple-execs.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-bmg:          [DMESG-WARN][271] ([Intel XE#3468] / [Intel XE#569]) -> [PASS][272]
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-3/igt@xe_pm@s3-d3hot-basic-exec.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-6/igt@xe_pm@s3-d3hot-basic-exec.html

  * igt@xe_pm@s4-basic:
    - shard-adlp:         [ABORT][273] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][274] +1 other test pass
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-adlp-9/igt@xe_pm@s4-basic.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-adlp-4/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-adlp:         [ABORT][275] ([Intel XE#1794]) -> [PASS][276]
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-adlp-8/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          [FAIL][277] ([Intel XE#958]) -> [PASS][278]
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-lnl-4/igt@xe_pm_residency@toggle-gt-c6.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-lnl-1/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_vm@munmap-style-unbind-userptr-inval-many-either-side-partial:
    - shard-dg2-set2:     [SKIP][279] ([Intel XE#1130]) -> [PASS][280] +192 other tests pass
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@xe_vm@munmap-style-unbind-userptr-inval-many-either-side-partial.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-436/igt@xe_vm@munmap-style-unbind-userptr-inval-many-either-side-partial.html

  
#### Warnings ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-dg2-set2:     [ABORT][281] -> [SKIP][282] ([Intel XE#1885])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-433/igt@core_hotunplug@hotrebind-lateclose.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-466/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@core_hotunplug@unbind-rebind:
    - shard-dg2-set2:     [DMESG-WARN][283] ([Intel XE#3468]) -> [SKIP][284] ([Intel XE#1885])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-433/igt@core_hotunplug@unbind-rebind.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-434/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_atomic_interruptible@atomic-setmode:
    - shard-dg2-set2:     [SKIP][285] ([Intel XE#2423] / [i915#2575]) -> [DMESG-WARN][286] ([Intel XE#3468])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@kms_atomic_interruptible@atomic-setmode.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-436/igt@kms_atomic_interruptible@atomic-setmode.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
    - shard-bmg:          [DMESG-WARN][287] ([Intel XE#3468]) -> [DMESG-FAIL][288] ([Intel XE#3468]) +4 other tests dmesg-fail
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-6/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-8/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][289] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][290] ([Intel XE#316])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@kms_big_fb@linear-64bpp-rotate-270.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-433/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][291] ([Intel XE#2136]) -> [SKIP][292] ([Intel XE#316]) +1 other test skip
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-433/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][293] ([Intel XE#316]) -> [SKIP][294] ([Intel XE#2136])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-435/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-466/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][295] ([Intel XE#316]) -> [SKIP][296] ([Intel XE#2136] / [Intel XE#2351]) +1 other test skip
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-464/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-466/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][297] ([Intel XE#1124]) -> [SKIP][298] ([Intel XE#2136]) +7 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-436/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-466/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][299] ([Intel XE#610]) -> [SKIP][300] ([Intel XE#2136]) +1 other test skip
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-435/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][301] ([Intel XE#1124]) -> [SKIP][302] ([Intel XE#2136] / [Intel XE#2351]) +4 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-433/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-434/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][303] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][304] ([Intel XE#1124]) +5 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-436/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][305] ([Intel XE#2136]) -> [SKIP][306] ([Intel XE#1124]) +8 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-436/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][307] ([Intel XE#2136]) -> [SKIP][308] ([Intel XE#607])
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][309] ([Intel XE#2423] / [i915#2575]) -> [SKIP][310] ([Intel XE#367]) +4 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-466/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-435/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][311] ([Intel XE#2423] / [i915#2575]) -> [SKIP][312] ([Intel XE#2191])
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-463/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][313] ([Intel XE#367]) -> [SKIP][314] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-463/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][315] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][316] ([Intel XE#455] / [Intel XE#787]) +2 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-433/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][317] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][318] ([Intel XE#2136] / [Intel XE#2351]) +2 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][319] ([Intel XE#2136]) -> [SKIP][320] ([Intel XE#2907])
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][321] ([Intel XE#2136]) -> [SKIP][322] ([Intel XE#455] / [Intel XE#787]) +15 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][323] ([Intel XE#2136]) -> [SKIP][324] ([Intel XE#3442])
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [SKIP][325] ([Intel XE#2136] / [Intel XE#2351]) -> [INCOMPLETE][326] ([Intel XE#1727])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][327] ([Intel XE#2907]) -> [SKIP][328] ([Intel XE#2136])
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][329] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][330] ([Intel XE#2136]) +12 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-dg2-set2:     [SKIP][331] ([Intel XE#2423] / [i915#2575]) -> [SKIP][332] ([Intel XE#306]) +2 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-466/igt@kms_chamelium_color@ctm-limited-range.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-435/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     [SKIP][333] ([Intel XE#306]) -> [SKIP][334] ([Intel XE#2423] / [i915#2575]) +4 other tests skip
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-435/igt@kms_chamelium_color@gamma.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-466/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2-set2:     [SKIP][335] ([Intel XE#2423] / [i915#2575]) -> [SKIP][336] ([Intel XE#373]) +8 other tests skip
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     [SKIP][337] ([Intel XE#373]) -> [SKIP][338] ([Intel XE#2423] / [i915#2575]) +12 other tests skip
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-433/igt@kms_chamelium_hpd@vga-hpd.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     [SKIP][339] ([Intel XE#2423] / [i915#2575]) -> [SKIP][340] ([Intel XE#307]) +1 other test skip
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@kms_content_protection@dp-mst-lic-type-0.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-436/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-set2:     [SKIP][341] ([Intel XE#307]) -> [SKIP][342] ([Intel XE#2423] / [i915#2575])
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-433/igt@kms_content_protection@dp-mst-type-0.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-466/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [FAIL][343] ([Intel XE#1178]) -> [SKIP][344] ([Intel XE#2341]) +2 other tests skip
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-1/igt@kms_content_protection@legacy.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-6/igt@kms_content_protection@legacy.html
    - shard-dg2-set2:     [SKIP][345] ([Intel XE#2423] / [i915#2575]) -> [FAIL][346] ([Intel XE#1178])
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-466/igt@kms_content_protection@legacy.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-463/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     [SKIP][347] ([Intel XE#2423] / [i915#2575]) -> [SKIP][348] ([Intel XE#308]) +3 other tests skip
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-dg2-set2:     [SKIP][349] ([Intel XE#308]) -> [SKIP][350] ([Intel XE#2423] / [i915#2575])
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-433/igt@kms_cursor_crc@cursor-random-512x170.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-434/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-dg2-set2:     [SKIP][351] ([Intel XE#2423] / [i915#2575]) -> [SKIP][352] ([Intel XE#323])
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-433/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_draw_crc@fill-fb:
    - shard-dg2-set2:     [INCOMPLETE][353] -> [SKIP][354] ([Intel XE#2136] / [Intel XE#2351])
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-435/igt@kms_draw_crc@fill-fb.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-466/igt@kms_draw_crc@fill-fb.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-dg2-set2:     [SKIP][355] ([Intel XE#2136]) -> [SKIP][356] ([Intel XE#455]) +3 other tests skip
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@kms_dsc@dsc-with-bpc.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-436/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-dg2-set2:     [SKIP][357] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][358] ([Intel XE#455]) +3 other tests skip
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@kms_dsc@dsc-with-formats.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-436/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-dg2-set2:     [SKIP][359] ([Intel XE#2136]) -> [INCOMPLETE][360] ([Intel XE#3468]) +1 other test incomplete
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@kms_fbcon_fbt@fbc-suspend.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-433/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     [SKIP][361] ([Intel XE#2423] / [i915#2575]) -> [SKIP][362] ([Intel XE#701])
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-466/igt@kms_feature_discovery@chamelium.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-463/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2-set2:     [SKIP][363] ([Intel XE#2423] / [i915#2575]) -> [SKIP][364] ([Intel XE#703])
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@kms_feature_discovery@display-3x.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-433/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2-set2:     [SKIP][365] ([Intel XE#1135]) -> [SKIP][366] ([Intel XE#2423] / [i915#2575])
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-436/igt@kms_feature_discovery@psr1.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-466/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-bmg:          [DMESG-FAIL][367] ([Intel XE#3468]) -> [DMESG-WARN][368] ([Intel XE#3468])
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-2/igt@kms_flip@2x-absolute-wf_vblank.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-1/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@2x-absolute-wf_vblank@ab-dp2-hdmi-a3:
    - shard-bmg:          [DMESG-FAIL][369] -> [DMESG-WARN][370] ([Intel XE#3468])
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-2/igt@kms_flip@2x-absolute-wf_vblank@ab-dp2-hdmi-a3.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-1/igt@kms_flip@2x-absolute-wf_vblank@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-bmg:          [DMESG-WARN][371] ([Intel XE#877]) -> [SKIP][372] ([Intel XE#2316])
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [SKIP][373] ([Intel XE#2316]) -> [FAIL][374] ([Intel XE#2882])
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-panning-interruptible:
    - shard-bmg:          [DMESG-WARN][375] ([Intel XE#3468]) -> [DMESG-WARN][376] ([Intel XE#2705] / [Intel XE#3468])
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-6/igt@kms_flip@flip-vs-panning-interruptible.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-4/igt@kms_flip@flip-vs-panning-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2-set2:     [INCOMPLETE][377] ([Intel XE#2049] / [Intel XE#2597]) -> [SKIP][378] ([Intel XE#2423] / [i915#2575])
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-433/igt@kms_flip@flip-vs-suspend.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-434/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-dg2-set2:     [SKIP][379] ([Intel XE#455]) -> [SKIP][380] ([Intel XE#2136]) +3 other tests skip
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     [SKIP][381] ([Intel XE#455]) -> [SKIP][382] ([Intel XE#2136] / [Intel XE#2351])
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2-set2:     [SKIP][383] ([i915#5274]) -> [SKIP][384] ([Intel XE#2423] / [i915#2575])
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-463/igt@kms_force_connector_basic@prune-stale-modes.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-434/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][385] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][386] ([Intel XE#651]) +13 other tests skip
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][387] ([Intel XE#2311]) -> [SKIP][388] ([Intel XE#2312]) +16 other tests skip
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-slowdraw:
    - shard-dg2-set2:     [SKIP][389] ([Intel XE#651]) -> [SKIP][390] ([Intel XE#2136] / [Intel XE#2351]) +8 other tests skip
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-slowdraw.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-slowdraw.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:
    - shard-bmg:          [DMESG-FAIL][391] ([Intel XE#3468]) -> [FAIL][392] ([Intel XE#2333])
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
    - shard-bmg:          [DMESG-FAIL][393] ([Intel XE#3468]) -> [SKIP][394] ([Intel XE#2312]) +1 other test skip
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][395] ([Intel XE#2312]) -> [FAIL][396] ([Intel XE#2333]) +3 other tests fail
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][397] ([Intel XE#2312]) -> [DMESG-FAIL][398] ([Intel XE#3468]) +4 other tests dmesg-fail
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-rte:
    - shard-dg2-set2:     [INCOMPLETE][399] ([Intel XE#3468]) -> [SKIP][400] ([Intel XE#2136])
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-rte.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [FAIL][401] ([Intel XE#2333]) -> [DMESG-FAIL][402] ([Intel XE#3468]) +2 other tests dmesg-fail
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [FAIL][403] ([Intel XE#2333]) -> [SKIP][404] ([Intel XE#2312]) +6 other tests skip
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][405] ([Intel XE#651]) -> [SKIP][406] ([Intel XE#2136]) +25 other tests skip
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
    - shard-dg2-set2:     [SKIP][407] ([Intel XE#2136]) -> [SKIP][408] ([Intel XE#651]) +24 other tests skip
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][409] ([Intel XE#2312]) -> [SKIP][410] ([Intel XE#2311]) +18 other tests skip
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][411] ([Intel XE#2136]) -> [SKIP][412] ([Intel XE#653]) +32 other tests skip
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][413] ([Intel XE#2312]) -> [SKIP][414] ([Intel XE#2313]) +17 other tests skip
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][415] ([Intel XE#2313]) -> [SKIP][416] ([Intel XE#2312]) +19 other tests skip
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-dg2-set2:     [SKIP][417] ([Intel XE#653]) -> [SKIP][418] ([Intel XE#2136] / [Intel XE#2351]) +9 other tests skip
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][419] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][420] ([Intel XE#653]) +7 other tests skip
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][421] ([Intel XE#653]) -> [SKIP][422] ([Intel XE#2136]) +26 other tests skip
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][423] -> [SKIP][424] ([Intel XE#3374])
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-dg2-set2:     [SKIP][425] ([Intel XE#2136]) -> [SKIP][426] ([Intel XE#346])
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@kms_joiner@basic-big-joiner.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-433/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-dg2-set2:     [SKIP][427] ([Intel XE#2925]) -> [SKIP][428] ([Intel XE#2136])
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-433/igt@kms_joiner@basic-force-ultra-joiner.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-466/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-dg2-set2:     [SKIP][429] ([Intel XE#346]) -> [SKIP][430] ([Intel XE#2136])
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-436/igt@kms_joiner@invalid-modeset-big-joiner.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-466/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-dg2-set2:     [SKIP][431] ([Intel XE#2136]) -> [SKIP][432] ([Intel XE#2927])
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-436/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2-set2:     [SKIP][433] ([Intel XE#356]) -> [SKIP][434] ([Intel XE#2423] / [i915#2575])
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-433/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-466/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_pipe_crc_basic@bad-source:
    - shard-dg2-set2:     [DMESG-WARN][435] -> [SKIP][436] ([Intel XE#2423] / [i915#2575])
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-436/igt@kms_pipe_crc_basic@bad-source.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-466/igt@kms_pipe_crc_basic@bad-source.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb:
    - shard-dg2-set2:     [INCOMPLETE][437] -> [SKIP][438] ([Intel XE#2423] / [i915#2575])
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-436/igt@kms_plane_alpha_blend@alpha-opaque-fb.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-466/igt@kms_plane_alpha_blend@alpha-opaque-fb.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2-set2:     [SKIP][439] ([Intel XE#2423] / [i915#2575]) -> [FAIL][440] ([Intel XE#361])
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
    - shard-dg2-set2:     [SKIP][441] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][442] ([Intel XE#2423] / [i915#2575]) +3 other tests skip
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][443] ([Intel XE#2423] / [i915#2575]) -> [SKIP][444] ([Intel XE#2763] / [Intel XE#455])
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-dg2-set2:     [SKIP][445] ([Intel XE#870]) -> [SKIP][446] ([Intel XE#2136])
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-435/igt@kms_pm_backlight@basic-brightness.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-466/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg2-set2:     [SKIP][447] ([Intel XE#2136]) -> [SKIP][448] ([Intel XE#870]) +1 other test skip
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@kms_pm_backlight@fade-with-suspend.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-436/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     [SKIP][449] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][450] ([Intel XE#908])
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-466/igt@kms_pm_dc@dc6-dpms.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-463/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg2-set2:     [SKIP][451] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][452] ([Intel XE#1129])
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@kms_pm_dc@dc6-psr.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-433/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@basic-rte:
    - shard-dg2-set2:     [DMESG-WARN][453] ([Intel XE#3468]) -> [SKIP][454] ([Intel XE#2446])
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-436/igt@kms_pm_rpm@basic-rte.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-466/igt@kms_pm_rpm@basic-rte.html

  * igt@kms_pm_rpm@drm-resources-equal:
    - shard-dg2-set2:     [ABORT][455] ([Intel XE#3468]) -> [SKIP][456] ([Intel XE#2446])
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-435/igt@kms_pm_rpm@drm-resources-equal.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-466/igt@kms_pm_rpm@drm-resources-equal.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-dg2-set2:     [SKIP][457] ([Intel XE#2446]) -> [DMESG-WARN][458] ([Intel XE#2042] / [Intel XE#3468]) +1 other test dmesg-warn
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@kms_pm_rpm@system-suspend-modeset.html
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-436/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_pm_rpm@universal-planes-dpms:
    - shard-dg2-set2:     [DMESG-WARN][459] ([Intel XE#2042] / [Intel XE#3468]) -> [SKIP][460] ([Intel XE#2446])
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-464/igt@kms_pm_rpm@universal-planes-dpms.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-466/igt@kms_pm_rpm@universal-planes-dpms.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][461] ([Intel XE#2136]) -> [SKIP][462] ([Intel XE#1489]) +11 other tests skip
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-433/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][463] ([Intel XE#1489]) -> [SKIP][464] ([Intel XE#2136]) +9 other tests skip
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-436/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-466/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr@fbc-psr-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][465] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][466] ([Intel XE#2136] / [Intel XE#2351]) +8 other tests skip
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-464/igt@kms_psr@fbc-psr-sprite-plane-onoff.html
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-plane-onoff.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     [SKIP][467] ([Intel XE#2136]) -> [SKIP][468] ([Intel XE#2850] / [Intel XE#929]) +11 other tests skip
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-466/igt@kms_psr@fbc-psr2-primary-render.html
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-463/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@pr-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][469] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][470] ([Intel XE#2136]) +5 other tests skip
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-436/igt@kms_psr@pr-sprite-plane-move.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-466/igt@kms_psr@pr-sprite-plane-move.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-dg2-set2:     [SKIP][471] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][472] ([Intel XE#2351])
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-436/igt@kms_psr@psr-primary-page-flip.html
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-466/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr@psr-sprite-blt:
    - shard-dg2-set2:     [SKIP][473] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][474] ([Intel XE#2850] / [Intel XE#929]) +6 other tests skip
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@kms_psr@psr-sprite-blt.html
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-433/igt@kms_psr@psr-sprite-blt.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][475] ([Intel XE#2351]) -> [SKIP][476] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@kms_psr@psr-sprite-plane-onoff.html
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-436/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2-set2:     [SKIP][477] ([Intel XE#2423] / [i915#2575]) -> [SKIP][478] ([Intel XE#3414]) +1 other test skip
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@kms_rotation_crc@bad-tiling.html
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-433/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][479] ([Intel XE#2423] / [i915#2575]) -> [SKIP][480] ([Intel XE#1127]) +1 other test skip
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-dg2-set2:     [SKIP][481] ([Intel XE#455]) -> [SKIP][482] ([Intel XE#2423] / [i915#2575]) +12 other tests skip
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-436/igt@kms_scaling_modes@scaling-mode-full-aspect.html
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-466/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][483] ([Intel XE#2509]) -> [SKIP][484] ([Intel XE#2426])
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-dg2-set2:     [SKIP][485] ([Intel XE#1500]) -> [SKIP][486] ([Intel XE#2423] / [i915#2575])
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2-set2:     [SKIP][487] ([Intel XE#330]) -> [SKIP][488] ([Intel XE#2423] / [i915#2575])
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-436/igt@kms_tv_load_detect@load-detect.html
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-466/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vblank@query-busy:
    - shard-dg2-set2:     [SKIP][489] ([Intel XE#2423] / [i915#2575]) -> [INCOMPLETE][490] ([Intel XE#1727])
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@kms_vblank@query-busy.html
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-433/igt@kms_vblank@query-busy.html

  * igt@kms_vrr@cmrr:
    - shard-dg2-set2:     [SKIP][491] ([Intel XE#2423] / [i915#2575]) -> [SKIP][492] ([Intel XE#2168])
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@kms_vrr@cmrr.html
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-436/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     [SKIP][493] ([Intel XE#2423] / [i915#2575]) -> [SKIP][494] ([Intel XE#455]) +11 other tests skip
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@kms_vrr@flipline.html
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-433/igt@kms_vrr@flipline.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg2-set2:     [SKIP][495] ([Intel XE#1091] / [Intel XE#2849]) -> [SKIP][496] ([Intel XE#2423] / [i915#2575])
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-436/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-466/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_compute_preempt@compute-preempt:
    - shard-dg2-set2:     [SKIP][497] ([Intel XE#1130]) -> [SKIP][498] ([Intel XE#1280] / [Intel XE#455])
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-466/igt@xe_compute_preempt@compute-preempt.html
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-435/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     [SKIP][499] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][500] ([Intel XE#1130])
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-436/igt@xe_compute_preempt@compute-preempt-many.html
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-466/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_copy_basic@mem-copy-linear-0x3fff:
    - shard-dg2-set2:     [SKIP][501] ([Intel XE#1130]) -> [SKIP][502] ([Intel XE#1123])
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0x3fff.html

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - shard-dg2-set2:     [SKIP][503] ([Intel XE#1126]) -> [SKIP][504] ([Intel XE#1130])
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0x3fff.html
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0x3fff.html

  * igt@xe_eudebug_online@interrupt-all-set-breakpoint:
    - shard-dg2-set2:     [SKIP][505] ([Intel XE#2905]) -> [SKIP][506] ([Intel XE#1130]) +13 other tests skip
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-436/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-466/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html

  * igt@xe_evict@evict-large-multi-vm-cm:
    - shard-dg2-set2:     [FAIL][507] ([Intel XE#1600]) -> [SKIP][508] ([Intel XE#1130])
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-435/igt@xe_evict@evict-large-multi-vm-cm.html
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-466/igt@xe_evict@evict-large-multi-vm-cm.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-dg2-set2:     [INCOMPLETE][509] ([Intel XE#1473]) -> [SKIP][510] ([Intel XE#1130])
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-433/igt@xe_evict@evict-mixed-many-threads-small.html
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_basic@twice-userptr:
    - shard-dg2-set2:     [DMESG-WARN][511] ([Intel XE#1727]) -> [SKIP][512] ([Intel XE#1130]) +2 other tests skip
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-463/igt@xe_exec_basic@twice-userptr.html
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-434/igt@xe_exec_basic@twice-userptr.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-imm:
    - shard-dg2-set2:     [SKIP][513] ([Intel XE#1130]) -> [SKIP][514] ([Intel XE#288]) +33 other tests skip
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-436/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][515] ([Intel XE#288]) -> [SKIP][516] ([Intel XE#1130]) +27 other tests skip
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-433/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     [SKIP][517] ([Intel XE#1130]) -> [SKIP][518] ([Intel XE#2360]) +1 other test skip
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-466/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-463/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_exec_sip_eudebug@breakpoint-writesip:
    - shard-dg2-set2:     [SKIP][519] ([Intel XE#1130]) -> [SKIP][520] ([Intel XE#2905]) +14 other tests skip
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@xe_exec_sip_eudebug@breakpoint-writesip.html
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-433/igt@xe_exec_sip_eudebug@breakpoint-writesip.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init:
    - shard-adlp:         [DMESG-WARN][521] ([Intel XE#3343]) -> [DMESG-WARN][522] ([Intel XE#3086] / [Intel XE#3343])
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-adlp-2/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-adlp-2/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html
    - shard-dg2-set2:     [DMESG-WARN][523] ([Intel XE#3343]) -> [SKIP][524] ([Intel XE#1130])
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-436/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:
    - shard-adlp:         [DMESG-WARN][525] ([Intel XE#3086] / [Intel XE#3343]) -> [DMESG-WARN][526] ([Intel XE#3343])
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-adlp-8/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-adlp-1/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early:
    - shard-bmg:          [DMESG-WARN][527] ([Intel XE#3467]) -> [DMESG-WARN][528] ([Intel XE#3467] / [Intel XE#3468]) +2 other tests dmesg-warn
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:
    - shard-dg2-set2:     [SKIP][529] ([Intel XE#1130]) -> [DMESG-WARN][530] ([Intel XE#3343]) +2 other tests dmesg-warn
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-463/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html

  * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:
    - shard-bmg:          [FAIL][531] ([Intel XE#3499] / [Intel XE#3539]) -> [DMESG-FAIL][532] ([Intel XE#3467])
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-3/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html

  * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run:
    - shard-dg2-set2:     [DMESG-WARN][533] ([Intel XE#3467]) -> [SKIP][534] ([Intel XE#1130]) +5 other tests skip
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-433/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-434/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html

  * igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc:
    - shard-bmg:          [DMESG-FAIL][535] ([Intel XE#3467]) -> [DMESG-FAIL][536] ([Intel XE#3467] / [Intel XE#3468]) +1 other test dmesg-fail
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-8/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-2/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html

  * igt@xe_module_load@reload-no-display:
    - shard-dg2-set2:     [FAIL][537] -> [DMESG-WARN][538] ([Intel XE#3467])
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@xe_module_load@reload-no-display.html
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-436/igt@xe_module_load@reload-no-display.html

  * igt@xe_oa@non-privileged-access-vaddr:
    - shard-dg2-set2:     [SKIP][539] ([Intel XE#1130]) -> [SKIP][540] ([Intel XE#2541]) +7 other tests skip
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@xe_oa@non-privileged-access-vaddr.html
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-436/igt@xe_oa@non-privileged-access-vaddr.html

  * igt@xe_oa@whitelisted-registers-userspace-config:
    - shard-dg2-set2:     [SKIP][541] ([Intel XE#2541]) -> [SKIP][542] ([Intel XE#1130]) +9 other tests skip
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-435/igt@xe_oa@whitelisted-registers-userspace-config.html
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-466/igt@xe_oa@whitelisted-registers-userspace-config.html

  * igt@xe_pat@pat-index-xe2:
    - shard-dg2-set2:     [SKIP][543] ([Intel XE#1130]) -> [SKIP][544] ([Intel XE#2839] / [Intel XE#977])
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@xe_pat@pat-index-xe2.html
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-433/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-dg2-set2:     [SKIP][545] ([Intel XE#979]) -> [SKIP][546] ([Intel XE#1130])
   [545]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-433/igt@xe_pat@pat-index-xelpg.html
   [546]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-434/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     [FAIL][547] ([Intel XE#1173]) -> [SKIP][548] ([Intel XE#1061])
   [547]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-433/igt@xe_peer2peer@read.html
   [548]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-466/igt@xe_peer2peer@read.html

  * igt@xe_pm@d3hot-multiple-execs:
    - shard-dg2-set2:     [SKIP][549] ([Intel XE#1130]) -> [DMESG-WARN][550] ([Intel XE#3468]) +1 other test dmesg-warn
   [549]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@xe_pm@d3hot-multiple-execs.html
   [550]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-436/igt@xe_pm@d3hot-multiple-execs.html

  * igt@xe_pm@s2idle-basic:
    - shard-dg2-set2:     [DMESG-WARN][551] ([Intel XE#3468]) -> [SKIP][552] ([Intel XE#1130]) +2 other tests skip
   [551]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-436/igt@xe_pm@s2idle-basic.html
   [552]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-466/igt@xe_pm@s2idle-basic.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][553] ([Intel XE#1130]) -> [SKIP][554] ([Intel XE#2284] / [Intel XE#366])
   [553]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-466/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [554]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-463/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s2idle-d3hot-basic-exec:
    - shard-dg2-set2:     [SKIP][555] ([Intel XE#1130]) -> [ABORT][556] ([Intel XE#1358])
   [555]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@xe_pm@s2idle-d3hot-basic-exec.html
   [556]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-436/igt@xe_pm@s2idle-d3hot-basic-exec.html

  * igt@xe_pm@s2idle-vm-bind-prefetch:
    - shard-bmg:          [DMESG-WARN][557] ([Intel XE#1616] / [Intel XE#3468]) -> [DMESG-FAIL][558] ([Intel XE#3468])
   [557]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-6/igt@xe_pm@s2idle-vm-bind-prefetch.html
   [558]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-4/igt@xe_pm@s2idle-vm-bind-prefetch.html
    - shard-dg2-set2:     [DMESG-FAIL][559] ([Intel XE#3468]) -> [SKIP][560] ([Intel XE#1130])
   [559]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-463/igt@xe_pm@s2idle-vm-bind-prefetch.html
   [560]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-434/igt@xe_pm@s2idle-vm-bind-prefetch.html

  * igt@xe_pm@s3-basic-exec:
    - shard-dg2-set2:     [DMESG-WARN][561] ([Intel XE#3468] / [Intel XE#569]) -> [SKIP][562] ([Intel XE#1130]) +1 other test skip
   [561]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-436/igt@xe_pm@s3-basic-exec.html
   [562]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-466/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-dg2-set2:     [SKIP][563] ([Intel XE#1130]) -> [DMESG-WARN][564] ([Intel XE#3468] / [Intel XE#569])
   [563]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@xe_pm@s3-d3hot-basic-exec.html
   [564]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-436/igt@xe_pm@s3-d3hot-basic-exec.html

  * igt@xe_pm@s4-d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][565] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][566] ([Intel XE#1130])
   [565]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-464/igt@xe_pm@s4-d3cold-basic-exec.html
   [566]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-466/igt@xe_pm@s4-d3cold-basic-exec.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-dg2-set2:     [DMESG-WARN][567] ([Intel XE#1727] / [Intel XE#3468]) -> [SKIP][568] ([Intel XE#1130])
   [567]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-433/igt@xe_pm@s4-d3hot-basic-exec.html
   [568]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-434/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     [SKIP][569] ([Intel XE#1130]) -> [SKIP][570] ([Intel XE#944]) +2 other tests skip
   [569]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@xe_query@multigpu-query-engines.html
   [570]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-436/igt@xe_query@multigpu-query-engines.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-dg2-set2:     [SKIP][571] ([Intel XE#944]) -> [SKIP][572] ([Intel XE#1130]) +3 other tests skip
   [571]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-436/igt@xe_query@multigpu-query-uc-fw-version-guc.html
   [572]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-466/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-dg2-set2:     [SKIP][573] ([Intel XE#3342]) -> [SKIP][574] ([Intel XE#1130])
   [573]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-464/igt@xe_sriov_flr@flr-vf1-clear.html
   [574]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-466/igt@xe_sriov_flr@flr-vf1-clear.html

  * igt@xe_vm@large-split-misaligned-binds-33554432:
    - shard-dg2-set2:     [DMESG-WARN][575] -> [SKIP][576] ([Intel XE#1130]) +4 other tests skip
   [575]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-436/igt@xe_vm@large-split-misaligned-binds-33554432.html
   [576]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-dg2-466/igt@xe_vm@large-split-misaligned-binds-33554432.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-bmg:          [ABORT][577] -> [ABORT][578] ([Intel XE#3521])
   [577]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-3/igt@xe_wedged@wedged-at-any-timeout.html
   [578]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/shard-bmg-1/igt@xe_wedged@wedged-at-any-timeout.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1523]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1523
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2425
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2550]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2839]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2839
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2864]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2919]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3184]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3233
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343
  [Intel XE#3371]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3371
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3440]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3440
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467
  [Intel XE#3468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468
  [Intel XE#3486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3486
  [Intel XE#3499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3499
  [Intel XE#3521]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3521
  [Intel XE#3539]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3539
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274


Build changes
-------------

  * Linux: xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed -> xe-pw-140765v2

  IGT_8118: 17707095f1e5d3c30f463b43022f01c0160579b6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed: 6992ee4b9cd5a553e6e429e58b97abedf546e3ed
  xe-pw-140765v2: 140765v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140765v2/index.html
