Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04891D711C9
	for <intel-xe@archiver.kernel.org>; Wed, 20 Nov 2024 17:04:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB1A810E035;
	Wed, 20 Nov 2024 17:04:06 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEF1510E035;
 Wed, 20 Nov 2024 17:04:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Consider_joiner_calculatio?=
 =?utf-8?q?n_for_panel_fitting?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nemesa Garg" <nemesa.garg@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 20 Nov 2024 17:04:05 -0000
Message-ID: <173212224586.766962.9101908661033415545@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241120053838.3794419-1-nemesa.garg@intel.com>
In-Reply-To: <20241120053838.3794419-1-nemesa.garg@intel.com>
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

Series: Consider joiner calculation for panel fitting
URL   : https://patchwork.freedesktop.org/series/141583/
State : failure

== Summary ==

CI Bug Log - changes from xe-2254-ccf64319402f90f68549e2047a7f985a46436e41_full -> xe-pw-141583v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-141583v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-141583v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-141583v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_concurrent@multi-plane-atomic-lowres:
    - shard-bmg:          [PASS][1] -> [DMESG-WARN][2] +3 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-3/igt@kms_concurrent@multi-plane-atomic-lowres.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-bmg-5/igt@kms_concurrent@multi-plane-atomic-lowres.html

  * igt@kms_cursor_crc@cursor-offscreen-64x64:
    - shard-bmg:          [PASS][3] -> [SKIP][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-64x64.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-64x64.html

  * igt@kms_cursor_edge_walk@128x128-top-bottom@pipe-a-dp-2:
    - shard-bmg:          [PASS][5] -> [INCOMPLETE][6] +2 other tests incomplete
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-8/igt@kms_cursor_edge_walk@128x128-top-bottom@pipe-a-dp-2.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-bmg-7/igt@kms_cursor_edge_walk@128x128-top-bottom@pipe-a-dp-2.html

  * igt@kms_draw_crc@fill-fb:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][7] +1 other test incomplete
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-464/igt@kms_draw_crc@fill-fb.html

  * igt@xe_exec_fault_mode@many-execqueues-rebind:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][8]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-bmg-1/igt@xe_exec_fault_mode@many-execqueues-rebind.html

  
#### Warnings ####

  * igt@kms_big_fb@linear-8bpp-rotate-0:
    - shard-bmg:          [DMESG-FAIL][9] ([Intel XE#3468]) -> [DMESG-WARN][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-3/igt@kms_big_fb@linear-8bpp-rotate-0.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-bmg-6/igt@kms_big_fb@linear-8bpp-rotate-0.html

  * igt@xe_exec_balancer@many-execqueues-virtual-userptr:
    - shard-dg2-set2:     [SKIP][11] ([Intel XE#1130]) -> [DMESG-WARN][12] +1 other test dmesg-warn
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@xe_exec_balancer@many-execqueues-virtual-userptr.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-433/igt@xe_exec_balancer@many-execqueues-virtual-userptr.html

  * igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate:
    - shard-bmg:          [DMESG-FAIL][13] ([Intel XE#3371]) -> [DMESG-WARN][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-5/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-bmg-5/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html

  * igt@xe_module_load@reload:
    - shard-dg2-set2:     [FAIL][15] ([Intel XE#2136]) -> [FAIL][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@xe_module_load@reload.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-466/igt@xe_module_load@reload.html

  
Known issues
------------

  Here are the changes found in xe-pw-141583v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_getstats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#2423])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-434/igt@core_getstats.html

  * igt@core_getversion@basic:
    - shard-dg2-set2:     NOTRUN -> [FAIL][18] ([Intel XE#3440])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-434/igt@core_getversion@basic.html

  * igt@core_hotunplug@hotunbind-rebind:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][19] ([Intel XE#3468] / [Intel XE#3521])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-bmg-8/igt@core_hotunplug@hotunbind-rebind.html

  * igt@core_hotunplug@hotunplug-rescan:
    - shard-dg2-set2:     [PASS][20] -> [SKIP][21] ([Intel XE#1885])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-436/igt@core_hotunplug@hotunplug-rescan.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-466/igt@core_hotunplug@hotunplug-rescan.html

  * igt@fbdev@info:
    - shard-dg2-set2:     [PASS][22] -> [SKIP][23] ([Intel XE#2134])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-435/igt@fbdev@info.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-466/igt@fbdev@info.html

  * igt@fbdev@pan:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#2134])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-434/igt@fbdev@pan.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#3157])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-lnl-4/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-adlp:         [PASS][26] -> [FAIL][27] ([Intel XE#1426]) +1 other test fail
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-adlp-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-adlp-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][28] ([Intel XE#2613])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-bmg-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-3.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2327])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-bmg-4/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-adlp:         NOTRUN -> [SKIP][30] ([Intel XE#1124])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-adlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#1407])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-lnl-4/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#316]) +2 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-433/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][33] ([Intel XE#1033])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#1124]) +4 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-433/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#1124])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-lnl-4/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#316]) +2 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-adlp-4/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#610])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-464/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#1124]) +4 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [PASS][39] -> [DMESG-FAIL][40] ([Intel XE#1033])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:
    - shard-adlp:         NOTRUN -> [SKIP][41] ([Intel XE#367]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-adlp-6/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#2191])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-adlp-4/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#2191])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-433/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#455] / [Intel XE#787]) +25 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#455] / [Intel XE#787]) +9 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-adlp-6/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#787]) +14 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-adlp-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2887]) +3 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#2907]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#2652] / [Intel XE#787]) +17 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#787]) +153 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#2907]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-adlp-6/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-adlp:         NOTRUN -> [SKIP][52] ([Intel XE#1152] / [Intel XE#455])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-adlp-6/igt@kms_cdclk@plane-scaling.html

  * igt@kms_cdclk@plane-scaling@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][53] ([Intel XE#1152]) +2 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-adlp-6/igt@kms_cdclk@plane-scaling@pipe-a-hdmi-a-1.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#2325]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-bmg-1/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#306])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-464/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@dp-edid-read:
    - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#373])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-433/igt@kms_chamelium_edid@dp-edid-read.html

  * igt@kms_chamelium_edid@vga-edid-read:
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#373])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-lnl-4/igt@kms_chamelium_edid@vga-edid-read.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#2252]) +2 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-bmg-1/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_chamelium_hpd@dp-hpd:
    - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#373]) +2 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-adlp-6/igt@kms_chamelium_hpd@dp-hpd.html

  * igt@kms_color@invalid-degamma-lut-sizes@pipe-a:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][60] ([Intel XE#1727])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-464/igt@kms_color@invalid-degamma-lut-sizes@pipe-a.html

  * igt@kms_content_protection@content-type-change:
    - shard-adlp:         NOTRUN -> [SKIP][61] ([Intel XE#455]) +8 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-adlp-6/igt@kms_content_protection@content-type-change.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-adlp:         NOTRUN -> [SKIP][62] ([Intel XE#308])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-adlp-4/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-64x64:
    - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#2423] / [i915#2575]) +41 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-64x64.html

  * igt@kms_cursor_edge_walk@128x128-left-edge@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][64] ([Intel XE#3468]) +2 other tests dmesg-fail
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-bmg-1/igt@kms_cursor_edge_walk@128x128-left-edge@pipe-a-dp-2.html

  * igt@kms_cursor_edge_walk@256x256-right-edge@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][65] ([Intel XE#3468]) +19 other tests dmesg-warn
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-bmg-6/igt@kms_cursor_edge_walk@256x256-right-edge@pipe-d-hdmi-a-3.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-bmg:          [PASS][66] -> [SKIP][67] ([Intel XE#2291])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-3/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-bmg-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#323])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-lnl-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][69] ([Intel XE#877])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_dsc@dsc-basic:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#2244])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-bmg-4/igt@kms_dsc@dsc-basic.html

  * igt@kms_feature_discovery@psr1:
    - shard-adlp:         NOTRUN -> [SKIP][71] ([Intel XE#1135])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-adlp-6/igt@kms_feature_discovery@psr1.html

  * igt@kms_feature_discovery@psr2:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#2374])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-bmg-1/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#1421])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-lnl-4/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:
    - shard-bmg:          [PASS][74] -> [FAIL][75] ([Intel XE#2882]) +4 other tests fail
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3:
    - shard-bmg:          [PASS][76] -> [FAIL][77] ([Intel XE#3321] / [Intel XE#3487])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][78] ([Intel XE#310])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-adlp-6/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-bmg:          [PASS][79] -> [SKIP][80] ([Intel XE#2316]) +2 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-7/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-bmg-6/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@busy-flip:
    - shard-dg2-set2:     [PASS][81] -> [SKIP][82] ([Intel XE#2423] / [i915#2575]) +88 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-435/igt@kms_flip@busy-flip.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-434/igt@kms_flip@busy-flip.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][83] ([Intel XE#1727] / [Intel XE#3468])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#2293] / [Intel XE#2380])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#2293])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][86] ([Intel XE#2136]) +37 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#651]) +4 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#2311]) +7 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [FAIL][89] ([Intel XE#2333]) +1 other test fail
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][90] ([Intel XE#2136] / [Intel XE#2351]) +17 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#656]) +1 other test skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [PASS][92] -> [SKIP][93] ([Intel XE#2136] / [Intel XE#2351]) +13 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][94] ([Intel XE#656]) +16 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:
    - shard-dg2-set2:     [PASS][95] -> [SKIP][96] ([Intel XE#2136]) +24 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear:
    - shard-adlp:         NOTRUN -> [SKIP][97] ([Intel XE#651]) +2 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#2352])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][99] ([Intel XE#653]) +5 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#2313]) +5 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][101] ([Intel XE#653]) +7 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][102] ([Intel XE#346])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-lnl-4/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][103] ([Intel XE#346])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-adlp-6/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#2934])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-bmg-4/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][105] ([Intel XE#2925])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-433/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_plane@pixel-format@pipe-b-plane-0:
    - shard-bmg:          [PASS][106] -> [DMESG-WARN][107] ([Intel XE#877]) +1 other test dmesg-warn
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-6/igt@kms_plane@pixel-format@pipe-b-plane-0.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-bmg-1/igt@kms_plane@pixel-format@pipe-b-plane-0.html

  * igt@kms_plane_alpha_blend@alpha-transparent-fb:
    - shard-adlp:         [PASS][108] -> [DMESG-WARN][109] ([Intel XE#3086]) +1 other test dmesg-warn
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-adlp-8/igt@kms_plane_alpha_blend@alpha-transparent-fb.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-adlp-9/igt@kms_plane_alpha_blend@alpha-transparent-fb.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-adlp:         NOTRUN -> [SKIP][110] ([Intel XE#309]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-adlp-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-lnl:          NOTRUN -> [SKIP][111] ([Intel XE#3307])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-lnl-4/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][112] ([Intel XE#361])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c:
    - shard-dg2-set2:     NOTRUN -> [SKIP][113] ([Intel XE#2763]) +8 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a:
    - shard-adlp:         NOTRUN -> [SKIP][114] ([Intel XE#2763]) +2 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-adlp-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:
    - shard-adlp:         NOTRUN -> [SKIP][115] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-adlp-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][116] ([Intel XE#2763] / [Intel XE#455]) +4 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b:
    - shard-lnl:          NOTRUN -> [SKIP][117] ([Intel XE#2763]) +3 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-lnl-4/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-dg2-set2:     NOTRUN -> [SKIP][118] ([Intel XE#870])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-464/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][119] ([Intel XE#2938])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-bmg-4/igt@kms_pm_backlight@brightness-with-dpms.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][120] ([Intel XE#2938])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-433/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          NOTRUN -> [FAIL][121] ([Intel XE#1430])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-lnl-4/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-dg2-set2:     [PASS][122] -> [SKIP][123] ([Intel XE#2446]) +1 other test skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-463/igt@kms_pm_rpm@dpms-non-lpsp.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-434/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-dg2-set2:     NOTRUN -> [SKIP][124] ([Intel XE#2446])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-434/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-stress-extra-wait:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][125] ([Intel XE#2864] / [Intel XE#3468])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-bmg-4/igt@kms_pm_rpm@modeset-stress-extra-wait.html
    - shard-dg2-set2:     NOTRUN -> [ABORT][126] ([Intel XE#3468]) +1 other test abort
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-433/igt@kms_pm_rpm@modeset-stress-extra-wait.html

  * igt@kms_pm_rpm@universal-planes@plane-59:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][127] ([Intel XE#3468]) +7 other tests dmesg-warn
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-436/igt@kms_pm_rpm@universal-planes@plane-59.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-lnl:          NOTRUN -> [SKIP][128] ([Intel XE#2893])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-lnl-4/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-adlp:         NOTRUN -> [SKIP][129] ([Intel XE#1489]) +1 other test skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-adlp-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][130] ([Intel XE#1489])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-433/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr@fbc-pr-cursor-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][131] ([Intel XE#2234] / [Intel XE#2850]) +4 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-bmg-4/igt@kms_psr@fbc-pr-cursor-plane-onoff.html

  * igt@kms_psr@fbc-psr2-cursor-blt:
    - shard-adlp:         NOTRUN -> [SKIP][132] ([Intel XE#2850] / [Intel XE#929]) +5 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-adlp-6/igt@kms_psr@fbc-psr2-cursor-blt.html

  * igt@kms_psr@psr2-cursor-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][133] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-433/igt@kms_psr@psr2-cursor-plane-onoff.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][134] ([Intel XE#3414])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-433/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-bmg:          NOTRUN -> [SKIP][135] ([Intel XE#2330])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-adlp:         NOTRUN -> [SKIP][136] ([Intel XE#1127])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-adlp-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-adlp:         NOTRUN -> [SKIP][137] ([Intel XE#3414])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-adlp-6/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-lnl:          NOTRUN -> [SKIP][138] ([Intel XE#1435])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-lnl-4/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_sysfs_edid_timing:
    - shard-bmg:          [PASS][139] -> [DMESG-FAIL][140] ([Intel XE#3468])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-7/igt@kms_sysfs_edid_timing.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-bmg-6/igt@kms_sysfs_edid_timing.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-adlp:         NOTRUN -> [SKIP][141] ([Intel XE#330])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-adlp-6/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:
    - shard-lnl:          [PASS][142] -> [FAIL][143] ([Intel XE#899])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-adlp:         [PASS][144] -> [ABORT][145] ([Intel XE#1034] / [Intel XE#2625])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-adlp-2/igt@kms_vblank@ts-continuation-suspend.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-adlp-8/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1:
    - shard-adlp:         [PASS][146] -> [DMESG-WARN][147] ([Intel XE#2953] / [Intel XE#3086])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-adlp-2/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-adlp-8/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1:
    - shard-adlp:         [PASS][148] -> [ABORT][149] ([Intel XE#1034])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-adlp-2/igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-adlp-8/igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1.html

  * igt@kms_vrr@flip-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][150] ([Intel XE#455]) +10 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-433/igt@kms_vrr@flip-dpms.html
    - shard-bmg:          NOTRUN -> [SKIP][151] ([Intel XE#1499])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-bmg-4/igt@kms_vrr@flip-dpms.html

  * igt@testdisplay:
    - shard-dg2-set2:     [PASS][152] -> [SKIP][153] ([Intel XE#2423]) +1 other test skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-435/igt@testdisplay.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-466/igt@testdisplay.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-adlp:         NOTRUN -> [SKIP][154] ([Intel XE#1447])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-adlp-6/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue:
    - shard-lnl:          [PASS][155] -> [FAIL][156] ([Intel XE#2667])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-lnl-3/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-lnl-3/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html

  * igt@xe_eudebug@basic-vms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][157] ([Intel XE#2905])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-464/igt@xe_eudebug@basic-vms.html

  * igt@xe_eudebug@multigpu-basic-client:
    - shard-bmg:          NOTRUN -> [SKIP][158] ([Intel XE#2905]) +1 other test skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-bmg-8/igt@xe_eudebug@multigpu-basic-client.html

  * igt@xe_eudebug_online@single-step-one:
    - shard-adlp:         NOTRUN -> [SKIP][159] ([Intel XE#2905]) +5 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-adlp-4/igt@xe_eudebug_online@single-step-one.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - shard-bmg:          NOTRUN -> [FAIL][160] ([Intel XE#2364])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-bmg-4/igt@xe_evict@evict-beng-large-multi-vm-cm.html
    - shard-dg2-set2:     NOTRUN -> [FAIL][161] ([Intel XE#1600]) +1 other test fail
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-433/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_evict@evict-small-multi-vm:
    - shard-adlp:         NOTRUN -> [SKIP][162] ([Intel XE#261] / [Intel XE#688]) +2 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-adlp-4/igt@xe_evict@evict-small-multi-vm.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:
    - shard-lnl:          NOTRUN -> [SKIP][163] ([Intel XE#688])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-lnl-4/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html

  * igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][164] ([Intel XE#1727]) +1 other test dmesg-warn
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-bmg-4/igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
    - shard-lnl:          NOTRUN -> [SKIP][165] ([Intel XE#1392]) +2 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-lnl-4/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][166] ([Intel XE#1392]) +2 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-adlp-6/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][167] ([Intel XE#2322]) +4 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-bmg-2/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_basic@once-userptr-invalidate-race:
    - shard-dg2-set2:     [PASS][168] -> [SKIP][169] ([Intel XE#1130]) +166 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-433/igt@xe_exec_basic@once-userptr-invalidate-race.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-434/igt@xe_exec_basic@once-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-prefetch:
    - shard-bmg:          [PASS][170] -> [DMESG-WARN][171] ([Intel XE#3468]) +10 other tests dmesg-warn
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-2/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-prefetch.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-bmg-4/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-prefetch.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][172] ([Intel XE#288]) +7 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-433/igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-imm:
    - shard-adlp:         NOTRUN -> [SKIP][173] ([Intel XE#288]) +10 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-adlp-6/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-imm.html

  * igt@xe_exec_reset@cat-error:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][174] ([Intel XE#358])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-adlp-6/igt@xe_exec_reset@cat-error.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][175] ([Intel XE#3467])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-464/igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][176] ([Intel XE#3343] / [Intel XE#3468])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][177] ([Intel XE#3343])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-433/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - shard-dg2-set2:     [PASS][178] -> [SKIP][179] ([Intel XE#2229]) +1 other test skip
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-433/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-434/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_live_ktest@xe_mocs:
    - shard-bmg:          NOTRUN -> [SKIP][180] ([Intel XE#1192])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-bmg-1/igt@xe_live_ktest@xe_mocs.html

  * igt@xe_module_load@force-load:
    - shard-dg2-set2:     NOTRUN -> [SKIP][181] ([Intel XE#378])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-466/igt@xe_module_load@force-load.html

  * igt@xe_module_load@unload:
    - shard-dg2-set2:     [PASS][182] -> [DMESG-WARN][183] ([Intel XE#3467])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@xe_module_load@unload.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-436/igt@xe_module_load@unload.html

  * igt@xe_oa@invalid-map-oa-buffer:
    - shard-adlp:         NOTRUN -> [SKIP][184] ([Intel XE#2541]) +2 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-adlp-6/igt@xe_oa@invalid-map-oa-buffer.html

  * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
    - shard-dg2-set2:     NOTRUN -> [SKIP][185] ([Intel XE#2541]) +2 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-433/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html

  * igt@xe_pm@s4-basic:
    - shard-lnl:          [PASS][186] -> [ABORT][187] ([Intel XE#1358] / [Intel XE#1607])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-lnl-4/igt@xe_pm@s4-basic.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-lnl-2/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-adlp:         [PASS][188] -> [ABORT][189] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-adlp-3/igt@xe_pm@s4-multiple-execs.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm_residency@gt-c6-freeze@gt1:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][190] ([Intel XE#1727] / [Intel XE#3468]) +1 other test dmesg-fail
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-bmg-4/igt@xe_pm_residency@gt-c6-freeze@gt1.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-adlp:         [PASS][191] -> [FAIL][192] ([Intel XE#958])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-adlp-2/igt@xe_pm_residency@toggle-gt-c6.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-adlp-8/igt@xe_pm_residency@toggle-gt-c6.html
    - shard-lnl:          [PASS][193] -> [FAIL][194] ([Intel XE#958])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-lnl-1/igt@xe_pm_residency@toggle-gt-c6.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-lnl-4/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_query@multigpu-query-hwconfig:
    - shard-adlp:         NOTRUN -> [SKIP][195] ([Intel XE#944]) +1 other test skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-adlp-4/igt@xe_query@multigpu-query-hwconfig.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-bmg:          NOTRUN -> [SKIP][196] ([Intel XE#944]) +1 other test skip
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-bmg-2/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-dg2-set2:     NOTRUN -> [SKIP][197] ([Intel XE#944])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-464/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-adlp:         [PASS][198] -> [FAIL][199] ([Intel XE#3507])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-adlp-3/igt@xe_sriov_flr@flr-vf1-clear.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-adlp-1/igt@xe_sriov_flr@flr-vf1-clear.html

  * igt@xe_vm@munmap-style-unbind-many-either-side-partial:
    - shard-dg2-set2:     NOTRUN -> [SKIP][200] ([Intel XE#1130]) +66 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-434/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html

  * igt@xe_wedged@basic-wedged:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][201] ([Intel XE#2919])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-adlp-4/igt@xe_wedged@basic-wedged.html

  
#### Possible fixes ####

  * igt@core_getversion@all-cards:
    - shard-dg2-set2:     [FAIL][202] ([Intel XE#3440]) -> [PASS][203]
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@core_getversion@all-cards.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-463/igt@core_getversion@all-cards.html

  * igt@core_hotunplug@hotrebind:
    - shard-dg2-set2:     [SKIP][204] ([Intel XE#1885]) -> [PASS][205]
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@core_hotunplug@hotrebind.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-436/igt@core_hotunplug@hotrebind.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:
    - shard-lnl:          [FAIL][206] ([Intel XE#1426]) -> [PASS][207] +1 other test pass
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-lnl-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-lnl-8/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-bmg:          [FAIL][208] ([Intel XE#1426]) -> [PASS][209] +1 other test pass
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-6/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-bmg-1/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][210] ([Intel XE#1033]) -> [PASS][211]
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-bmg:          [INCOMPLETE][212] ([Intel XE#3226]) -> [PASS][213]
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-bmg-4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_dp_aux_dev:
    - shard-dg2-set2:     [SKIP][214] ([Intel XE#2423]) -> [PASS][215]
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@kms_dp_aux_dev.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-463/igt@kms_dp_aux_dev.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][216] ([Intel XE#2882]) -> [PASS][217]
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][218] ([Intel XE#3487]) -> [PASS][219]
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [DMESG-WARN][220] ([Intel XE#2953] / [Intel XE#3086]) -> [PASS][221] +1 other test pass
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-adlp-9/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@plain-flip-fb-recreate@a-edp1:
    - shard-lnl:          [FAIL][222] ([Intel XE#886]) -> [PASS][223] +1 other test pass
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-lnl-3/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-lnl-5/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html

  * igt@kms_flip@plain-flip-fb-recreate@c-edp1:
    - shard-lnl:          [FAIL][224] ([Intel XE#3149] / [Intel XE#886]) -> [PASS][225] +1 other test pass
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-lnl-3/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-lnl-5/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][226] ([Intel XE#2136] / [Intel XE#2351]) -> [PASS][227] +14 other tests pass
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][228] ([Intel XE#2136]) -> [PASS][229] +26 other tests pass
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html

  * igt@kms_hdr@static-toggle-suspend@pipe-a-dp-2:
    - shard-bmg:          [SKIP][230] -> [PASS][231] +1 other test pass
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-6/igt@kms_hdr@static-toggle-suspend@pipe-a-dp-2.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-bmg-8/igt@kms_hdr@static-toggle-suspend@pipe-a-dp-2.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg2-set2:     [SKIP][232] ([Intel XE#2446]) -> [PASS][233] +2 other tests pass
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-464/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_rotation_crc@sprite-rotation-180:
    - shard-dg2-set2:     [SKIP][234] ([Intel XE#2423] / [i915#2575]) -> [PASS][235] +105 other tests pass
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@kms_rotation_crc@sprite-rotation-180.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-433/igt@kms_rotation_crc@sprite-rotation-180.html

  * igt@kms_sequence@queue-idle@pipe-a-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][236] -> [PASS][237] +1 other test pass
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-433/igt@kms_sequence@queue-idle@pipe-a-dp-4.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-433/igt@kms_sequence@queue-idle@pipe-a-dp-4.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
    - shard-lnl:          [FAIL][238] ([Intel XE#899]) -> [PASS][239]
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html

  * igt@kms_vrr@negative-basic:
    - shard-bmg:          [INCOMPLETE][240] -> [PASS][241] +2 other tests pass
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-2/igt@kms_vrr@negative-basic.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-bmg-2/igt@kms_vrr@negative-basic.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [TIMEOUT][242] ([Intel XE#1473] / [Intel XE#2472]) -> [PASS][243]
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-8/igt@xe_evict@evict-mixed-many-threads-small.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-bmg-7/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_balancer@twice-virtual-basic:
    - shard-dg2-set2:     [SKIP][244] ([Intel XE#1130]) -> [PASS][245] +185 other tests pass
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@xe_exec_balancer@twice-virtual-basic.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-433/igt@xe_exec_balancer@twice-virtual-basic.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-imm:
    - shard-bmg:          [DMESG-WARN][246] ([Intel XE#3468]) -> [PASS][247] +7 other tests pass
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-imm.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-bmg-4/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-imm.html

  * igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate:
    - shard-dg2-set2:     [DMESG-FAIL][248] ([Intel XE#3371]) -> [PASS][249]
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-464/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-463/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html

  * igt@xe_gt_freq@freq_reset_multiple:
    - shard-lnl:          [DMESG-WARN][250] ([Intel XE#3184]) -> [PASS][251]
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-lnl-6/igt@xe_gt_freq@freq_reset_multiple.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-lnl-6/igt@xe_gt_freq@freq_reset_multiple.html

  * igt@xe_live_ktest@xe_bo:
    - shard-dg2-set2:     [TIMEOUT][252] ([Intel XE#2961] / [Intel XE#3191]) -> [PASS][253] +1 other test pass
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-433/igt@xe_live_ktest@xe_bo.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-434/igt@xe_live_ktest@xe_bo.html

  * igt@xe_pm@s4-basic:
    - shard-adlp:         [ABORT][254] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][255] +1 other test pass
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-adlp-9/igt@xe_pm@s4-basic.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-adlp-6/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-lnl:          [ABORT][256] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][257]
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-lnl-4/igt@xe_pm@s4-multiple-execs.html

  
#### Warnings ####

  * igt@core_hotunplug@hotreplug:
    - shard-dg2-set2:     [SKIP][258] ([Intel XE#1885]) -> [DMESG-WARN][259] ([Intel XE#3468] / [Intel XE#3521]) +1 other test dmesg-warn
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@core_hotunplug@hotreplug.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-435/igt@core_hotunplug@hotreplug.html

  * igt@core_hotunplug@unbind-rebind:
    - shard-dg2-set2:     [SKIP][260] ([Intel XE#1885]) -> [DMESG-WARN][261] ([Intel XE#3468])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@core_hotunplug@unbind-rebind.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-433/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2-set2:     [SKIP][262] ([Intel XE#2423] / [i915#2575]) -> [SKIP][263] ([Intel XE#623])
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-435/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1:
    - shard-adlp:         [DMESG-FAIL][264] ([Intel XE#1033]) -> [DMESG-WARN][265] ([Intel XE#1033])
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-adlp-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html

  * igt@kms_atomic_interruptible@atomic-setmode:
    - shard-bmg:          [DMESG-WARN][266] ([Intel XE#3468]) -> [INCOMPLETE][267] ([Intel XE#3468]) +1 other test incomplete
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-6/igt@kms_atomic_interruptible@atomic-setmode.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-bmg-3/igt@kms_atomic_interruptible@atomic-setmode.html
    - shard-dg2-set2:     [SKIP][268] ([Intel XE#2423] / [i915#2575]) -> [DMESG-WARN][269] ([Intel XE#3468])
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@kms_atomic_interruptible@atomic-setmode.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-463/igt@kms_atomic_interruptible@atomic-setmode.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][270] ([Intel XE#316]) -> [SKIP][271] ([Intel XE#2136]) +2 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-436/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-466/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][272] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][273] ([Intel XE#316]) +1 other test skip
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-435/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@linear-16bpp-rotate-180:
    - shard-bmg:          [DMESG-FAIL][274] ([Intel XE#3468]) -> [DMESG-WARN][275] ([Intel XE#3468]) +2 other tests dmesg-warn
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-4/igt@kms_big_fb@linear-16bpp-rotate-180.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-bmg-7/igt@kms_big_fb@linear-16bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][276] ([Intel XE#2136]) -> [SKIP][277] ([Intel XE#316])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-436/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][278] ([Intel XE#316]) -> [SKIP][279] ([Intel XE#2136] / [Intel XE#2351]) +1 other test skip
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-463/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-466/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][280] ([Intel XE#1124]) -> [SKIP][281] ([Intel XE#2136] / [Intel XE#2351]) +1 other test skip
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-433/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-434/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][282] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][283] ([Intel XE#607])
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-435/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][284] ([Intel XE#1124]) -> [SKIP][285] ([Intel XE#2136]) +9 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-436/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-466/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][286] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][287] ([Intel XE#1124]) +5 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2-set2:     [SKIP][288] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][289] ([Intel XE#619])
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][290] ([Intel XE#2136]) -> [SKIP][291] ([Intel XE#607])
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][292] ([Intel XE#2136]) -> [SKIP][293] ([Intel XE#610])
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-dg2-set2:     [SKIP][294] ([Intel XE#2136]) -> [SKIP][295] ([Intel XE#1124]) +6 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][296] ([Intel XE#367]) -> [SKIP][297] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-433/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-434/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][298] ([Intel XE#2423] / [i915#2575]) -> [SKIP][299] ([Intel XE#2191]) +1 other test skip
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-464/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][300] ([Intel XE#2423] / [i915#2575]) -> [SKIP][301] ([Intel XE#367]) +4 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-464/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][302] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][303] ([Intel XE#455] / [Intel XE#787]) +2 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-436/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][304] ([Intel XE#2136]) -> [SKIP][305] ([Intel XE#2907])
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][306] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][307] ([Intel XE#2136] / [Intel XE#2351]) +5 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][308] ([Intel XE#3442]) -> [SKIP][309] ([Intel XE#2136])
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][310] ([Intel XE#2136]) -> [SKIP][311] ([Intel XE#3442])
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][312] ([Intel XE#2136]) -> [SKIP][313] ([Intel XE#455] / [Intel XE#787]) +14 other tests skip
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][314] ([Intel XE#2907]) -> [SKIP][315] ([Intel XE#2136])
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     [SKIP][316] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][317] ([Intel XE#2136]) +8 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-dg2-set2:     [SKIP][318] ([Intel XE#2423] / [i915#2575]) -> [SKIP][319] ([Intel XE#306]) +1 other test skip
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@kms_chamelium_color@ctm-0-75.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-436/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-dg2-set2:     [SKIP][320] ([Intel XE#306]) -> [SKIP][321] ([Intel XE#2423] / [i915#2575])
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-463/igt@kms_chamelium_color@ctm-negative.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-466/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-dg2-set2:     [SKIP][322] ([Intel XE#373]) -> [SKIP][323] ([Intel XE#2423] / [i915#2575]) +14 other tests skip
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     [SKIP][324] ([Intel XE#2423] / [i915#2575]) -> [SKIP][325] ([Intel XE#373]) +13 other tests skip
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@kms_chamelium_hpd@vga-hpd.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-433/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_color@invalid-degamma-lut-sizes:
    - shard-dg2-set2:     [SKIP][326] ([Intel XE#2423] / [i915#2575]) -> [DMESG-WARN][327] ([Intel XE#1727])
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@kms_color@invalid-degamma-lut-sizes.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-464/igt@kms_color@invalid-degamma-lut-sizes.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2-set2:     [FAIL][328] ([Intel XE#1178]) -> [SKIP][329] ([Intel XE#2423] / [i915#2575])
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-436/igt@kms_content_protection@atomic-dpms.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-466/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-dg2-set2:     [SKIP][330] ([Intel XE#2423] / [i915#2575]) -> [SKIP][331] ([Intel XE#308]) +1 other test skip
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-436/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-dg2-set2:     [SKIP][332] ([Intel XE#2423] / [i915#2575]) -> [INCOMPLETE][333] ([Intel XE#3226])
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-464/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-dg2-set2:     [SKIP][334] ([Intel XE#2423] / [i915#2575]) -> [SKIP][335] ([Intel XE#323]) +1 other test skip
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-435/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-dg2-set2:     [SKIP][336] ([Intel XE#455]) -> [SKIP][337] ([Intel XE#2136] / [Intel XE#2351])
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-436/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-466/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-dg2-set2:     [SKIP][338] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][339] ([Intel XE#455]) +3 other tests skip
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@kms_dsc@dsc-with-formats.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-463/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-dg2-set2:     [SKIP][340] ([Intel XE#2136]) -> [INCOMPLETE][341] ([Intel XE#3468])
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@kms_fbcon_fbt@fbc-suspend.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-436/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg2-set2:     [SKIP][342] ([Intel XE#776]) -> [SKIP][343] ([Intel XE#2136])
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-463/igt@kms_fbcon_fbt@psr-suspend.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-434/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2-set2:     [SKIP][344] ([Intel XE#2423] / [i915#2575]) -> [SKIP][345] ([Intel XE#703])
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@kms_feature_discovery@display-3x.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-436/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2-set2:     [SKIP][346] ([Intel XE#1135]) -> [SKIP][347] ([Intel XE#2423] / [i915#2575])
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-435/igt@kms_feature_discovery@psr1.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-434/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][348] ([Intel XE#3487]) -> [FAIL][349] ([Intel XE#3321] / [Intel XE#3487])
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html

  * igt@kms_flip@absolute-wf_vblank-interruptible@c-dp2:
    - shard-bmg:          [DMESG-FAIL][350] -> [DMESG-WARN][351] ([Intel XE#3468]) +1 other test dmesg-warn
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-6/igt@kms_flip@absolute-wf_vblank-interruptible@c-dp2.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-bmg-1/igt@kms_flip@absolute-wf_vblank-interruptible@c-dp2.html

  * igt@kms_flip@flip-vs-expired-vblank@a-dp4:
    - shard-dg2-set2:     [FAIL][352] ([Intel XE#3487]) -> [FAIL][353] ([Intel XE#3321] / [Intel XE#3487])
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@c-dp4:
    - shard-dg2-set2:     [FAIL][354] ([Intel XE#301] / [Intel XE#3487]) -> [FAIL][355] ([Intel XE#301] / [Intel XE#3321] / [Intel XE#3487]) +1 other test fail
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html

  * igt@kms_flip@flip-vs-rmfb-interruptible@d-hdmi-a3:
    - shard-bmg:          [DMESG-WARN][356] -> [DMESG-WARN][357] ([Intel XE#3468]) +6 other tests dmesg-warn
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-5/igt@kms_flip@flip-vs-rmfb-interruptible@d-hdmi-a3.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-bmg-5/igt@kms_flip@flip-vs-rmfb-interruptible@d-hdmi-a3.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling:
    - shard-dg2-set2:     [SKIP][358] ([Intel XE#2136]) -> [INCOMPLETE][359] ([Intel XE#1727] / [Intel XE#3468])
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
    - shard-dg2-set2:     [INCOMPLETE][360] ([Intel XE#3468]) -> [SKIP][361] ([Intel XE#2136] / [Intel XE#2351])
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][362] ([Intel XE#455]) -> [SKIP][363] ([Intel XE#2136]) +4 other tests skip
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][364] ([Intel XE#2136]) -> [SKIP][365] ([Intel XE#455])
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move:
    - shard-bmg:          [SKIP][366] ([Intel XE#2312]) -> [SKIP][367] ([Intel XE#2311])
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][368] ([Intel XE#2311]) -> [SKIP][369] ([Intel XE#2312]) +10 other tests skip
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][370] ([Intel XE#651]) -> [SKIP][371] ([Intel XE#2136]) +23 other tests skip
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:
    - shard-bmg:          [FAIL][372] ([Intel XE#2333]) -> [SKIP][373] ([Intel XE#2312]) +4 other tests skip
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
    - shard-dg2-set2:     [SKIP][374] ([Intel XE#2136]) -> [SKIP][375] ([Intel XE#651]) +27 other tests skip
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][376] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][377] ([Intel XE#651]) +12 other tests skip
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][378] ([Intel XE#651]) -> [SKIP][379] ([Intel XE#2136] / [Intel XE#2351]) +12 other tests skip
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][380] ([Intel XE#2136]) -> [SKIP][381] ([Intel XE#653]) +33 other tests skip
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][382] ([Intel XE#2313]) -> [SKIP][383] ([Intel XE#2312]) +11 other tests skip
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][384] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][385] ([Intel XE#653]) +7 other tests skip
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][386] ([Intel XE#653]) -> [SKIP][387] ([Intel XE#2136]) +23 other tests skip
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-rte:
    - shard-bmg:          [SKIP][388] ([Intel XE#2312]) -> [SKIP][389] ([Intel XE#2313])
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-rte.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][390] ([Intel XE#653]) -> [SKIP][391] ([Intel XE#2136] / [Intel XE#2351]) +7 other tests skip
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2-set2:     [SKIP][392] ([Intel XE#605]) -> [SKIP][393] ([Intel XE#2423] / [i915#2575])
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-433/igt@kms_getfb@getfb-reject-ccs.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-434/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-dg2-set2:     [SKIP][394] ([Intel XE#2136]) -> [SKIP][395] ([Intel XE#346])
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@kms_joiner@basic-big-joiner.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-436/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-dg2-set2:     [SKIP][396] ([Intel XE#346]) -> [SKIP][397] ([Intel XE#2136])
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-435/igt@kms_joiner@invalid-modeset-big-joiner.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-434/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-dg2-set2:     [SKIP][398] ([Intel XE#2136]) -> [SKIP][399] ([Intel XE#2927])
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-463/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb:
    - shard-dg2-set2:     [INCOMPLETE][400] -> [SKIP][401] ([Intel XE#2423] / [i915#2575])
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-435/igt@kms_plane_alpha_blend@alpha-opaque-fb.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-434/igt@kms_plane_alpha_blend@alpha-opaque-fb.html

  * igt@kms_plane_cursor@primary:
    - shard-dg2-set2:     [FAIL][402] ([Intel XE#616]) -> [SKIP][403] ([Intel XE#2423] / [i915#2575])
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-433/igt@kms_plane_cursor@primary.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-434/igt@kms_plane_cursor@primary.html

  * igt@kms_plane_lowres@tiling-x@pipe-d-hdmi-a-1:
    - shard-adlp:         [FAIL][404] ([Intel XE#1874]) -> [DMESG-FAIL][405] ([Intel XE#1033])
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-adlp-1/igt@kms_plane_lowres@tiling-x@pipe-d-hdmi-a-1.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-adlp-8/igt@kms_plane_lowres@tiling-x@pipe-d-hdmi-a-1.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2-set2:     [SKIP][406] ([Intel XE#2423] / [i915#2575]) -> [FAIL][407] ([Intel XE#361])
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2-set2:     [SKIP][408] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][409] ([Intel XE#2423] / [i915#2575]) +3 other tests skip
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][410] ([Intel XE#2423] / [i915#2575]) -> [SKIP][411] ([Intel XE#2763] / [Intel XE#455])
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg2-set2:     [SKIP][412] ([Intel XE#2136]) -> [SKIP][413] ([Intel XE#3309])
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@kms_pm_dc@dc5-retention-flops.html
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-464/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg2-set2:     [SKIP][414] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][415] ([Intel XE#1129])
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@kms_pm_dc@dc6-psr.html
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-436/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-dg2-set2:     [SKIP][416] ([Intel XE#908]) -> [SKIP][417] ([Intel XE#2136])
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-436/igt@kms_pm_dc@deep-pkgc.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-466/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@basic-rte:
    - shard-dg2-set2:     [ABORT][418] ([Intel XE#3468]) -> [SKIP][419] ([Intel XE#2446])
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-435/igt@kms_pm_rpm@basic-rte.html
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-466/igt@kms_pm_rpm@basic-rte.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-dg2-set2:     [SKIP][420] ([Intel XE#2446]) -> [DMESG-WARN][421] ([Intel XE#3468])
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-435/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@universal-planes:
    - shard-dg2-set2:     [SKIP][422] ([Intel XE#2446]) -> [DMESG-WARN][423] ([Intel XE#2042] / [Intel XE#3468])
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@kms_pm_rpm@universal-planes.html
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-436/igt@kms_pm_rpm@universal-planes.html

  * igt@kms_pm_rpm@universal-planes-dpms:
    - shard-dg2-set2:     [DMESG-WARN][424] ([Intel XE#2042] / [Intel XE#3468]) -> [SKIP][425] ([Intel XE#2446])
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-463/igt@kms_pm_rpm@universal-planes-dpms.html
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-466/igt@kms_pm_rpm@universal-planes-dpms.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][426] ([Intel XE#2136]) -> [SKIP][427] ([Intel XE#1489]) +12 other tests skip
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-436/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][428] ([Intel XE#1489]) -> [SKIP][429] ([Intel XE#2136]) +10 other tests skip
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-435/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-466/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg2-set2:     [SKIP][430] ([Intel XE#1122]) -> [SKIP][431] ([Intel XE#2136])
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-463/igt@kms_psr2_su@page_flip-p010.html
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-434/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][432] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][433] ([Intel XE#2850] / [Intel XE#929]) +6 other tests skip
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-plane-move.html
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-433/igt@kms_psr@fbc-psr-sprite-plane-move.html

  * igt@kms_psr@fbc-psr-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][434] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][435] ([Intel XE#2136] / [Intel XE#2351]) +7 other tests skip
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-463/igt@kms_psr@fbc-psr-sprite-plane-onoff.html
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-plane-onoff.html

  * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
    - shard-dg2-set2:     [SKIP][436] ([Intel XE#2136]) -> [SKIP][437] ([Intel XE#2850] / [Intel XE#929]) +11 other tests skip
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-463/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html

  * igt@kms_psr@pr-sprite-blt:
    - shard-dg2-set2:     [SKIP][438] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][439] ([Intel XE#2136]) +10 other tests skip
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-433/igt@kms_psr@pr-sprite-blt.html
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-434/igt@kms_psr@pr-sprite-blt.html

  * igt@kms_psr@psr-cursor-plane-move:
    - shard-dg2-set2:     [SKIP][440] ([Intel XE#2351]) -> [SKIP][441] ([Intel XE#2850] / [Intel XE#929])
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@kms_psr@psr-cursor-plane-move.html
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-436/igt@kms_psr@psr-cursor-plane-move.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-dg2-set2:     [SKIP][442] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][443] ([Intel XE#2351])
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-435/igt@kms_psr@psr-primary-page-flip.html
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-466/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg2-set2:     [SKIP][444] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][445] ([Intel XE#2939])
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-435/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2-set2:     [SKIP][446] ([Intel XE#2423] / [i915#2575]) -> [SKIP][447] ([Intel XE#3414]) +1 other test skip
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@kms_rotation_crc@bad-tiling.html
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-436/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][448] ([Intel XE#1127]) -> [SKIP][449] ([Intel XE#2423] / [i915#2575])
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-433/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-dg2-set2:     [SKIP][450] ([Intel XE#3414]) -> [SKIP][451] ([Intel XE#2423] / [i915#2575])
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-436/igt@kms_rotation_crc@sprite-rotation-90.html
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-466/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-dg2-set2:     [SKIP][452] ([Intel XE#455]) -> [SKIP][453] ([Intel XE#2423] / [i915#2575]) +5 other tests skip
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-435/igt@kms_scaling_modes@scaling-mode-full-aspect.html
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-434/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [FAIL][454] ([Intel XE#1729]) -> [SKIP][455] ([Intel XE#2423] / [i915#2575])
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern.html
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][456] ([Intel XE#2423] / [i915#2575]) -> [SKIP][457] ([Intel XE#1500])
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2-set2:     [SKIP][458] ([Intel XE#330]) -> [SKIP][459] ([Intel XE#2423] / [i915#2575])
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-435/igt@kms_tv_load_detect@load-detect.html
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-434/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vblank@query-busy:
    - shard-dg2-set2:     [SKIP][460] ([Intel XE#2423] / [i915#2575]) -> [INCOMPLETE][461] ([Intel XE#1727])
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@kms_vblank@query-busy.html
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-436/igt@kms_vblank@query-busy.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     [SKIP][462] ([Intel XE#2423] / [i915#2575]) -> [SKIP][463] ([Intel XE#455]) +9 other tests skip
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@kms_vrr@flipline.html
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-436/igt@kms_vrr@flipline.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2-set2:     [SKIP][464] ([Intel XE#756]) -> [SKIP][465] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-436/igt@kms_writeback@writeback-fb-id.html
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-466/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-dg2-set2:     [SKIP][466] ([Intel XE#2423] / [i915#2575]) -> [SKIP][467] ([Intel XE#756])
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@kms_writeback@writeback-invalid-parameters.html
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-435/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg2-set2:     [SKIP][468] ([Intel XE#1091] / [Intel XE#2849]) -> [SKIP][469] ([Intel XE#2423] / [i915#2575])
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-435/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-434/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     [SKIP][470] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][471] ([Intel XE#1130])
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-435/igt@xe_compute_preempt@compute-preempt-many.html
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-466/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_copy_basic@mem-copy-linear-0x369:
    - shard-dg2-set2:     [SKIP][472] ([Intel XE#1123]) -> [SKIP][473] ([Intel XE#1130])
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0x369.html
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0x369.html

  * igt@xe_copy_basic@mem-copy-linear-0x3fff:
    - shard-dg2-set2:     [SKIP][474] ([Intel XE#1130]) -> [SKIP][475] ([Intel XE#1123])
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0x3fff.html

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - shard-dg2-set2:     [SKIP][476] ([Intel XE#1130]) -> [SKIP][477] ([Intel XE#1126])
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0x3fff.html
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0x3fff.html

  * igt@xe_eudebug_online@interrupt-all-set-breakpoint:
    - shard-dg2-set2:     [SKIP][478] ([Intel XE#2905]) -> [SKIP][479] ([Intel XE#1130]) +12 other tests skip
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-435/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-434/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-dg2-set2:     [SKIP][480] ([Intel XE#1130]) -> [INCOMPLETE][481] ([Intel XE#1473])
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-433/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-invalidate:
    - shard-dg2-set2:     [SKIP][482] ([Intel XE#1130]) -> [DMESG-WARN][483] ([Intel XE#1727]) +1 other test dmesg-warn
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-invalidate.html
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-464/igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-invalidate.html

  * igt@xe_exec_basic@many-userptr-invalidate-race:
    - shard-dg2-set2:     [DMESG-WARN][484] ([Intel XE#1727]) -> [SKIP][485] ([Intel XE#1130]) +2 other tests skip
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-435/igt@xe_exec_basic@many-userptr-invalidate-race.html
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-434/igt@xe_exec_basic@many-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-dg2-set2:     [INCOMPLETE][486] -> [SKIP][487] ([Intel XE#1130])
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-433/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-434/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
    - shard-dg2-set2:     [SKIP][488] ([Intel XE#288]) -> [SKIP][489] ([Intel XE#1130]) +24 other tests skip
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-463/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-434/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][490] ([Intel XE#1130]) -> [SKIP][491] ([Intel XE#288]) +32 other tests skip
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-433/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
    - shard-dg2-set2:     [SKIP][492] ([Intel XE#2360]) -> [SKIP][493] ([Intel XE#1130])
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-433/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-434/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-dg2-set2:     [SKIP][494] ([Intel XE#1130]) -> [SKIP][495] ([Intel XE#2360])
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-463/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_exec_sip_eudebug@breakpoint-writesip:
    - shard-dg2-set2:     [SKIP][496] ([Intel XE#1130]) -> [SKIP][497] ([Intel XE#2905]) +14 other tests skip
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@xe_exec_sip_eudebug@breakpoint-writesip.html
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-436/igt@xe_exec_sip_eudebug@breakpoint-writesip.html

  * igt@xe_exec_threads@threads-hang-fd-rebind:
    - shard-dg2-set2:     [SKIP][498] ([Intel XE#1130]) -> [DMESG-WARN][499] ([Intel XE#358])
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@xe_exec_threads@threads-hang-fd-rebind.html
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-433/igt@xe_exec_threads@threads-hang-fd-rebind.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_device_create:
    - shard-bmg:          [DMESG-WARN][500] ([Intel XE#3467] / [Intel XE#3468]) -> [DMESG-WARN][501] ([Intel XE#3467])
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-xe_device_create.html
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_device_create.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:
    - shard-dg2-set2:     [DMESG-WARN][502] ([Intel XE#3467]) -> [SKIP][503] ([Intel XE#1130]) +3 other tests skip
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-435/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-434/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init:
    - shard-bmg:          [DMESG-WARN][504] ([Intel XE#3343]) -> [ABORT][505] ([Intel XE#3343])
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html
    - shard-dg2-set2:     [DMESG-WARN][506] ([Intel XE#3343]) -> [SKIP][507] ([Intel XE#1130])
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-435/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:
    - shard-dg2-set2:     [SKIP][508] ([Intel XE#1130]) -> [DMESG-WARN][509] ([Intel XE#3343])
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-436/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:
    - shard-adlp:         [DMESG-WARN][510] ([Intel XE#3086] / [Intel XE#3343]) -> [DMESG-WARN][511] ([Intel XE#3343])
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-adlp-8/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-adlp-9/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early:
    - shard-bmg:          [DMESG-WARN][512] ([Intel XE#3467]) -> [DMESG-WARN][513] ([Intel XE#3467] / [Intel XE#3468])
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html

  * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create:
    - shard-bmg:          [DMESG-FAIL][514] ([Intel XE#3467]) -> [DMESG-FAIL][515] ([Intel XE#3467] / [Intel XE#3468])
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-bmg-3/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html

  * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:
    - shard-bmg:          [FAIL][516] ([Intel XE#3539]) -> [FAIL][517] ([Intel XE#3499] / [Intel XE#3539]) +1 other test fail
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-3/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-bmg-7/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html

  * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:
    - shard-lnl:          [FAIL][518] ([Intel XE#3539]) -> [FAIL][519] ([Intel XE#3499] / [Intel XE#3539]) +4 other tests fail
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-lnl-1/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-lnl-4/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html

  * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run:
    - shard-dg2-set2:     [SKIP][520] ([Intel XE#1130]) -> [DMESG-WARN][521] ([Intel XE#3467]) +2 other tests dmesg-warn
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-433/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     [SKIP][522] ([Intel XE#255]) -> [SKIP][523] ([Intel XE#1130])
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-436/igt@xe_huc_copy@huc_copy.html
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-466/igt@xe_huc_copy@huc_copy.html

  * igt@xe_module_load@reload-no-display:
    - shard-dg2-set2:     [FAIL][524] ([Intel XE#2136]) -> [DMESG-WARN][525] ([Intel XE#3467])
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@xe_module_load@reload-no-display.html
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-463/igt@xe_module_load@reload-no-display.html

  * igt@xe_oa@closed-fd-and-unmapped-access:
    - shard-dg2-set2:     [SKIP][526] ([Intel XE#2541]) -> [SKIP][527] ([Intel XE#1130]) +7 other tests skip
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-433/igt@xe_oa@closed-fd-and-unmapped-access.html
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-434/igt@xe_oa@closed-fd-and-unmapped-access.html

  * igt@xe_oa@syncs-userptr-wait-cfg:
    - shard-dg2-set2:     [SKIP][528] ([Intel XE#1130]) -> [SKIP][529] ([Intel XE#2541]) +9 other tests skip
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@xe_oa@syncs-userptr-wait-cfg.html
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-435/igt@xe_oa@syncs-userptr-wait-cfg.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-dg2-set2:     [SKIP][530] ([Intel XE#1337]) -> [SKIP][531] ([Intel XE#1130])
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-433/igt@xe_pat@display-vs-wb-transient.html
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-434/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_pat@pat-index-xe2:
    - shard-adlp:         [SKIP][532] ([Intel XE#977]) -> [SKIP][533] ([Intel XE#2839] / [Intel XE#977])
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-adlp-3/igt@xe_pat@pat-index-xe2.html
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-adlp-9/igt@xe_pat@pat-index-xe2.html
    - shard-dg2-set2:     [SKIP][534] ([Intel XE#1130]) -> [SKIP][535] ([Intel XE#2839] / [Intel XE#977])
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@xe_pat@pat-index-xe2.html
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-436/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xelp:
    - shard-bmg:          [SKIP][536] ([Intel XE#2245]) -> [SKIP][537] ([Intel XE#2237] / [Intel XE#2245])
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-3/igt@xe_pat@pat-index-xelp.html
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-bmg-7/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-dg2-set2:     [SKIP][538] ([Intel XE#1130]) -> [SKIP][539] ([Intel XE#979])
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@xe_pat@pat-index-xelpg.html
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-433/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-dg2-set2:     [SKIP][540] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][541] ([Intel XE#1130]) +1 other test skip
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-436/igt@xe_pm@d3cold-mmap-system.html
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-466/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@d3hot-basic:
    - shard-dg2-set2:     [DMESG-WARN][542] ([Intel XE#3468]) -> [SKIP][543] ([Intel XE#1130])
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-435/igt@xe_pm@d3hot-basic.html
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-434/igt@xe_pm@d3hot-basic.html

  * igt@xe_pm@d3hot-mmap-system:
    - shard-dg2-set2:     [SKIP][544] ([Intel XE#1130]) -> [DMESG-WARN][545] ([Intel XE#3468]) +2 other tests dmesg-warn
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@xe_pm@d3hot-mmap-system.html
   [545]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-435/igt@xe_pm@d3hot-mmap-system.html

  * igt@xe_pm@s3-basic-exec:
    - shard-dg2-set2:     [DMESG-WARN][546] ([Intel XE#3468] / [Intel XE#569]) -> [SKIP][547] ([Intel XE#1130])
   [546]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-435/igt@xe_pm@s3-basic-exec.html
   [547]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-466/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][548] ([Intel XE#1130]) -> [SKIP][549] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [548]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@xe_pm@s3-d3cold-basic-exec.html
   [549]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-464/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-dg2-set2:     [SKIP][550] ([Intel XE#1130]) -> [DMESG-WARN][551] ([Intel XE#3468] / [Intel XE#569])
   [550]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@xe_pm@s3-d3hot-basic-exec.html
   [551]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-463/igt@xe_pm@s3-d3hot-basic-exec.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-dg2-set2:     [SKIP][552] ([Intel XE#1130]) -> [DMESG-WARN][553] ([Intel XE#1727] / [Intel XE#3468])
   [552]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@xe_pm@s4-d3hot-basic-exec.html
   [553]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-433/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     [SKIP][554] ([Intel XE#1130]) -> [SKIP][555] ([Intel XE#944]) +3 other tests skip
   [554]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@xe_query@multigpu-query-engines.html
   [555]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-463/igt@xe_query@multigpu-query-engines.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-dg2-set2:     [SKIP][556] ([Intel XE#944]) -> [SKIP][557] ([Intel XE#1130]) +1 other test skip
   [556]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-435/igt@xe_query@multigpu-query-uc-fw-version-guc.html
   [557]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-434/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-dg2-set2:     [SKIP][558] ([Intel XE#3342]) -> [SKIP][559] ([Intel XE#1130])
   [558]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-463/igt@xe_sriov_flr@flr-vf1-clear.html
   [559]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-466/igt@xe_sriov_flr@flr-vf1-clear.html

  * igt@xe_vm@large-split-misaligned-binds-33554432:
    - shard-dg2-set2:     [DMESG-WARN][560] -> [SKIP][561] ([Intel XE#1130]) +2 other tests skip
   [560]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-435/igt@xe_vm@large-split-misaligned-binds-33554432.html
   [561]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-434/igt@xe_vm@large-split-misaligned-binds-33554432.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-dg2-set2:     [ABORT][562] ([Intel XE#3075] / [Intel XE#3084]) -> [SKIP][563] ([Intel XE#1130])
   [562]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-463/igt@xe_wedged@wedged-mode-toggle.html
   [563]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/shard-dg2-434/igt@xe_wedged@wedged-mode-toggle.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1034]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2237]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2237
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2613]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2613
  [Intel XE#2625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2667]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2667
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2839]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2839
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2864]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2919]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#2961]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2961
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#3075]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3075
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084
  [Intel XE#3086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3157]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3157
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3184]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184
  [Intel XE#3191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3191
  [Intel XE#3226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343
  [Intel XE#3371]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3371
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3440]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3440
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467
  [Intel XE#3468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468
  [Intel XE#3487]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3487
  [Intel XE#3499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3499
  [Intel XE#3507]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3507
  [Intel XE#3521]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3521
  [Intel XE#3539]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3539
  [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
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


Build changes
-------------

  * Linux: xe-2254-ccf64319402f90f68549e2047a7f985a46436e41 -> xe-pw-141583v1

  IGT_8118: 17707095f1e5d3c30f463b43022f01c0160579b6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2254-ccf64319402f90f68549e2047a7f985a46436e41: ccf64319402f90f68549e2047a7f985a46436e41
  xe-pw-141583v1: 141583v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141583v1/index.html
