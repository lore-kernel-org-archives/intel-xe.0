Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0CAED743D1
	for <intel-xe@archiver.kernel.org>; Wed, 20 Nov 2024 20:28:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 666C510E02D;
	Wed, 20 Nov 2024 20:28:48 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EEDB10E02D;
 Wed, 20 Nov 2024 20:28:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/i915=3A_intel=5Fdispla?=
 =?utf-8?q?y_conversions=2C_cleanups_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 20 Nov 2024 20:28:47 -0000
Message-ID: <173213452733.837841.1098724166212712143@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <cover.1732102179.git.jani.nikula@intel.com>
In-Reply-To: <cover.1732102179.git.jani.nikula@intel.com>
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

Series: drm/i915: intel_display conversions, cleanups (rev2)
URL   : https://patchwork.freedesktop.org/series/141175/
State : failure

== Summary ==

CI Bug Log - changes from xe-2254-ccf64319402f90f68549e2047a7f985a46436e41_full -> xe-pw-141175v2_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-141175v2_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-141175v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-141175v2_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_dirtyfb@default-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][1] +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-bmg-2/igt@kms_dirtyfb@default-dirtyfb-ioctl.html

  * igt@kms_vblank@query-busy@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][2]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-463/igt@kms_vblank@query-busy@pipe-a-hdmi-a-6.html

  * igt@xe_drm_fdinfo@utilization-others-idle:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-bmg-2/igt@xe_drm_fdinfo@utilization-others-idle.html

  * igt@xe_exec_threads@threads-cm-shared-vm-rebind:
    - shard-bmg:          [PASS][4] -> [DMESG-WARN][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-7/igt@xe_exec_threads@threads-cm-shared-vm-rebind.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-bmg-8/igt@xe_exec_threads@threads-cm-shared-vm-rebind.html

  * igt@xe_module_load@many-reload:
    - shard-dg2-set2:     NOTRUN -> [FAIL][6]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-466/igt@xe_module_load@many-reload.html

  
#### Warnings ####

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-imm:
    - shard-bmg:          [DMESG-WARN][7] ([Intel XE#3468]) -> [DMESG-WARN][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-7/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-imm.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-bmg-8/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-imm.html

  * igt@xe_exec_reset@close-fd-no-exec:
    - shard-dg2-set2:     [SKIP][9] ([Intel XE#1130]) -> [DMESG-WARN][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@xe_exec_reset@close-fd-no-exec.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-463/igt@xe_exec_reset@close-fd-no-exec.html

  * igt@xe_module_load@reload:
    - shard-dg2-set2:     [FAIL][11] ([Intel XE#2136]) -> [FAIL][12] +1 other test fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@xe_module_load@reload.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-466/igt@xe_module_load@reload.html

  
Known issues
------------

  Here are the changes found in xe-pw-141175v2_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotunplug-rescan:
    - shard-dg2-set2:     [PASS][13] -> [SKIP][14] ([Intel XE#1885])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-436/igt@core_hotunplug@hotunplug-rescan.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-466/igt@core_hotunplug@hotunplug-rescan.html

  * igt@core_setmaster@master-drop-set-root:
    - shard-dg2-set2:     [PASS][15] -> [FAIL][16] ([Intel XE#3130] / [Intel XE#3249])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-433/igt@core_setmaster@master-drop-set-root.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-434/igt@core_setmaster@master-drop-set-root.html

  * igt@core_setmaster@master-drop-set-shared-fd:
    - shard-dg2-set2:     [PASS][17] -> [SKIP][18] ([Intel XE#3453])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-433/igt@core_setmaster@master-drop-set-shared-fd.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-466/igt@core_setmaster@master-drop-set-shared-fd.html

  * igt@core_setmaster_vs_auth:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#2423])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-434/igt@core_setmaster_vs_auth.html

  * igt@fbdev@unaligned-read:
    - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#2134])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-466/igt@fbdev@unaligned-read.html

  * igt@fbdev@unaligned-write:
    - shard-dg2-set2:     [PASS][21] -> [SKIP][22] ([Intel XE#2134])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-433/igt@fbdev@unaligned-write.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-466/igt@fbdev@unaligned-write.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#3157])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-lnl-3/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:
    - shard-adlp:         [PASS][24] -> [FAIL][25] ([Intel XE#827])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html

  * igt@kms_atomic@plane-invalid-params-fence:
    - shard-dg2-set2:     [PASS][26] -> [SKIP][27] ([Intel XE#2423] / [i915#2575]) +59 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-433/igt@kms_atomic@plane-invalid-params-fence.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-466/igt@kms_atomic@plane-invalid-params-fence.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#1124])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-adlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#1407])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-lnl-3/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][30] ([Intel XE#1033])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#1124])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-lnl-3/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#316]) +2 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-adlp-3/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [PASS][33] -> [DMESG-FAIL][34] ([Intel XE#1033])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#1124]) +3 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-bmg-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:
    - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#367]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-adlp-4/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          [PASS][37] -> [SKIP][38] ([Intel XE#2314] / [Intel XE#2894])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
    - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#2191])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-adlp-3/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2314] / [Intel XE#2894])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-bmg-6/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#367]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-464/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#455] / [Intel XE#787]) +9 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-adlp-4/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#787]) +14 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-adlp-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#2887]) +4 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#787]) +111 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#455] / [Intel XE#787]) +17 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][47] ([Intel XE#3113])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [PASS][48] -> [INCOMPLETE][49] ([Intel XE#1727])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][50] -> [DMESG-WARN][51] ([Intel XE#3113])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [PASS][52] -> [INCOMPLETE][53] ([Intel XE#3124])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][54] ([Intel XE#2907]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-adlp-4/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-adlp:         NOTRUN -> [SKIP][55] ([Intel XE#1152] / [Intel XE#455])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-adlp-4/igt@kms_cdclk@plane-scaling.html

  * igt@kms_cdclk@plane-scaling@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][56] ([Intel XE#1152]) +2 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-adlp-4/igt@kms_cdclk@plane-scaling@pipe-a-hdmi-a-1.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#1152]) +3 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-464/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#2325]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-bmg-2/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_edid@vga-edid-read:
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#373])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-lnl-3/igt@kms_chamelium_edid@vga-edid-read.html

  * igt@kms_chamelium_hpd@dp-hpd:
    - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#373]) +2 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-adlp-4/igt@kms_chamelium_hpd@dp-hpd.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#2252]) +4 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-bmg-6/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_color@invalid-degamma-lut-sizes@pipe-a:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][62] ([Intel XE#1727])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-435/igt@kms_color@invalid-degamma-lut-sizes@pipe-a.html

  * igt@kms_content_protection@content-type-change:
    - shard-adlp:         NOTRUN -> [SKIP][63] ([Intel XE#455]) +8 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-adlp-4/igt@kms_content_protection@content-type-change.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#455]) +6 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-464/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@legacy@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][65] ([Intel XE#1178])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-433/igt@kms_content_protection@legacy@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#2320])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-128x42.html

  * igt@kms_cursor_crc@cursor-random-128x128@pipe-a-dp-2:
    - shard-bmg:          [PASS][67] -> [DMESG-FAIL][68] ([Intel XE#3468]) +4 other tests dmesg-fail
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-5/igt@kms_cursor_crc@cursor-random-128x128@pipe-a-dp-2.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-bmg-2/igt@kms_cursor_crc@cursor-random-128x128@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-adlp:         NOTRUN -> [SKIP][69] ([Intel XE#308])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-adlp-3/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_edge_walk@128x128-left-edge@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][70] ([Intel XE#3468]) +1 other test dmesg-fail
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-bmg-2/igt@kms_cursor_edge_walk@128x128-left-edge@pipe-a-dp-2.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#2291]) +3 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-bmg:          [PASS][72] -> [SKIP][73] ([Intel XE#2291]) +4 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-bmg-6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#323])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-lnl-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
    - shard-dg2-set2:     NOTRUN -> [SKIP][75] ([Intel XE#2423] / [i915#2575]) +63 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-466/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#1340]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#2351])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-434/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#2244])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-bmg-6/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_feature_discovery@psr1:
    - shard-adlp:         NOTRUN -> [SKIP][79] ([Intel XE#1135])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-adlp-4/igt@kms_feature_discovery@psr1.html

  * igt@kms_feature_discovery@psr2:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#2374])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-bmg-2/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#1421])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-lnl-3/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-bmg:          [PASS][82] -> [SKIP][83] ([Intel XE#2316]) +3 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-8/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-bmg-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][84] ([Intel XE#3486])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][85] ([Intel XE#3321] / [Intel XE#3486])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][86] ([Intel XE#301]) +3 other tests fail
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3:
    - shard-bmg:          [PASS][87] -> [FAIL][88] ([Intel XE#3321] / [Intel XE#3487])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3:
    - shard-bmg:          [PASS][89] -> [FAIL][90] ([Intel XE#2882])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#2316])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-bmg-6/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][92] ([Intel XE#310])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-adlp-4/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [PASS][93] -> [INCOMPLETE][94] ([Intel XE#2635]) +1 other test incomplete
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][95] ([Intel XE#1727] / [Intel XE#3468])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#2293] / [Intel XE#2380])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#2293])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#2312]) +7 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#2311]) +5 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [FAIL][100] ([Intel XE#2333]) +1 other test fail
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#656]) +1 other test skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [PASS][102] -> [SKIP][103] ([Intel XE#2136] / [Intel XE#2351]) +9 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [PASS][104] -> [SKIP][105] ([Intel XE#2136]) +11 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][106] ([Intel XE#656]) +16 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][107] ([Intel XE#651]) +3 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][108] ([Intel XE#2136] / [Intel XE#2351]) +23 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear:
    - shard-adlp:         NOTRUN -> [SKIP][109] ([Intel XE#651]) +2 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][110] ([Intel XE#2352])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][111] ([Intel XE#2136]) +62 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][112] ([Intel XE#653]) +5 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#2313]) +3 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-slowdraw:
    - shard-dg2-set2:     NOTRUN -> [SKIP][114] ([Intel XE#653]) +4 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-slowdraw.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][115] ([Intel XE#346])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-lnl-3/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][116] ([Intel XE#346])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-adlp-4/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-bmg:          [PASS][117] -> [SKIP][118] ([Intel XE#3012])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-4/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_plane_cursor@overlay:
    - shard-lnl:          [PASS][119] -> [FAIL][120] ([Intel XE#1471]) +1 other test fail
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-lnl-7/igt@kms_plane_cursor@overlay.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-lnl-2/igt@kms_plane_cursor@overlay.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-adlp:         NOTRUN -> [SKIP][121] ([Intel XE#309]) +1 other test skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-adlp-4/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-lnl:          NOTRUN -> [SKIP][122] ([Intel XE#3307])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-lnl-3/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][123] ([Intel XE#361])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a:
    - shard-adlp:         NOTRUN -> [SKIP][124] ([Intel XE#2763]) +2 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-adlp-3/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:
    - shard-adlp:         NOTRUN -> [SKIP][125] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-adlp-3/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:
    - shard-bmg:          NOTRUN -> [SKIP][126] ([Intel XE#2763]) +4 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-bmg-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b:
    - shard-lnl:          NOTRUN -> [SKIP][127] ([Intel XE#2763]) +3 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-lnl-3/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b.html

  * igt@kms_pm_rpm@legacy-planes-dpms:
    - shard-dg2-set2:     [PASS][128] -> [SKIP][129] ([Intel XE#2446])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-433/igt@kms_pm_rpm@legacy-planes-dpms.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-466/igt@kms_pm_rpm@legacy-planes-dpms.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][130] ([Intel XE#3468])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-464/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-stress-extra-wait:
    - shard-dg2-set2:     NOTRUN -> [SKIP][131] ([Intel XE#2446]) +1 other test skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-434/igt@kms_pm_rpm@modeset-stress-extra-wait.html

  * igt@kms_pm_rpm@universal-planes:
    - shard-lnl:          [PASS][132] -> [DMESG-WARN][133] ([Intel XE#2042])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-lnl-1/igt@kms_pm_rpm@universal-planes.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-lnl-4/igt@kms_pm_rpm@universal-planes.html

  * igt@kms_pm_rpm@universal-planes@plane-41:
    - shard-lnl:          [PASS][134] -> [DMESG-WARN][135] ([Intel XE#3184])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-lnl-1/igt@kms_pm_rpm@universal-planes@plane-41.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-lnl-4/igt@kms_pm_rpm@universal-planes@plane-41.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-lnl:          NOTRUN -> [SKIP][136] ([Intel XE#2893])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-lnl-3/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-adlp:         NOTRUN -> [SKIP][137] ([Intel XE#1489]) +1 other test skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-adlp-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][138] ([Intel XE#1489])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-bmg-6/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-bmg:          NOTRUN -> [SKIP][139] ([Intel XE#2387])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-bmg-6/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][140] ([Intel XE#2234] / [Intel XE#2850]) +3 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-bmg-6/igt@kms_psr@fbc-psr-suspend.html

  * igt@kms_psr@fbc-psr2-cursor-blt:
    - shard-adlp:         NOTRUN -> [SKIP][141] ([Intel XE#2850] / [Intel XE#929]) +5 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-adlp-4/igt@kms_psr@fbc-psr2-cursor-blt.html

  * igt@kms_psr@psr2-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][142] ([Intel XE#2850] / [Intel XE#929])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-464/igt@kms_psr@psr2-suspend.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-bmg:          NOTRUN -> [SKIP][143] ([Intel XE#3414])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-bmg-6/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-bmg:          NOTRUN -> [SKIP][144] ([Intel XE#2330])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-bmg-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-adlp:         NOTRUN -> [SKIP][145] ([Intel XE#1127])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-adlp-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-adlp:         NOTRUN -> [SKIP][146] ([Intel XE#3414])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-adlp-4/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][147] ([Intel XE#3414])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-464/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-lnl:          NOTRUN -> [SKIP][148] ([Intel XE#1435])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-lnl-3/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-adlp:         NOTRUN -> [SKIP][149] ([Intel XE#330])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-adlp-4/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:
    - shard-lnl:          [PASS][150] -> [FAIL][151] ([Intel XE#899])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html

  * igt@kms_vrr@flip-basic:
    - shard-bmg:          NOTRUN -> [SKIP][152] ([Intel XE#1499])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-bmg-6/igt@kms_vrr@flip-basic.html

  * igt@xe_ccs@ctrl-surf-copy-new-ctx:
    - shard-dg2-set2:     NOTRUN -> [SKIP][153] ([Intel XE#1130]) +106 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-434/igt@xe_ccs@ctrl-surf-copy-new-ctx.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-adlp:         NOTRUN -> [SKIP][154] ([Intel XE#1447])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-adlp-4/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_drm_fdinfo@utilization-single-full-load-isolation:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][155] ([Intel XE#3468]) +20 other tests dmesg-warn
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-bmg-6/igt@xe_drm_fdinfo@utilization-single-full-load-isolation.html

  * igt@xe_eudebug@multigpu-basic-client:
    - shard-bmg:          NOTRUN -> [SKIP][156] ([Intel XE#2905]) +1 other test skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-bmg-6/igt@xe_eudebug@multigpu-basic-client.html

  * igt@xe_eudebug_online@single-step-one:
    - shard-adlp:         NOTRUN -> [SKIP][157] ([Intel XE#2905]) +5 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-adlp-3/igt@xe_eudebug_online@single-step-one.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [PASS][158] -> [TIMEOUT][159] ([Intel XE#1473])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-2/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-bmg-2/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-small-multi-vm:
    - shard-adlp:         NOTRUN -> [SKIP][160] ([Intel XE#261] / [Intel XE#688]) +2 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-adlp-3/igt@xe_evict@evict-small-multi-vm.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:
    - shard-lnl:          NOTRUN -> [SKIP][161] ([Intel XE#688])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-lnl-3/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:
    - shard-dg2-set2:     [PASS][162] -> [SKIP][163] ([Intel XE#1130]) +105 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-436/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-466/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [SKIP][164] ([Intel XE#2322]) +3 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-bmg-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
    - shard-lnl:          NOTRUN -> [SKIP][165] ([Intel XE#1392]) +2 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-lnl-3/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][166] ([Intel XE#1392]) +2 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-adlp-4/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-prefetch:
    - shard-bmg:          [PASS][167] -> [DMESG-WARN][168] ([Intel XE#3468]) +19 other tests dmesg-warn
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-2/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-prefetch.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-bmg-8/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-prefetch.html

  * igt@xe_exec_fault_mode@many-execqueues-invalid-fault:
    - shard-dg2-set2:     NOTRUN -> [SKIP][169] ([Intel XE#288]) +2 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-464/igt@xe_exec_fault_mode@many-execqueues-invalid-fault.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-imm:
    - shard-adlp:         NOTRUN -> [SKIP][170] ([Intel XE#288]) +10 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-adlp-4/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-imm.html

  * igt@xe_exec_reset@cat-error:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][171] ([Intel XE#358])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-adlp-4/igt@xe_exec_reset@cat-error.html

  * igt@xe_exec_sip_eudebug@breakpoint-waitsip-heavy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][172] ([Intel XE#2905]) +2 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-464/igt@xe_exec_sip_eudebug@breakpoint-waitsip-heavy.html

  * igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate:
    - shard-adlp:         [PASS][173] -> [DMESG-FAIL][174] ([Intel XE#3371])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-adlp-1/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-adlp-6/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate.html

  * igt@xe_fault_injection@vm-create-fail-xe_pt_create:
    - shard-adlp:         [PASS][175] -> [DMESG-WARN][176] ([Intel XE#3086]) +1 other test dmesg-warn
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-adlp-4/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-adlp-3/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html

  * igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:
    - shard-bmg:          [PASS][177] -> [DMESG-WARN][178] ([Intel XE#3467])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-5/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-bmg-2/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html

  * igt@xe_live_ktest@xe_mocs:
    - shard-bmg:          NOTRUN -> [SKIP][179] ([Intel XE#1192])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-bmg-2/igt@xe_live_ktest@xe_mocs.html

  * igt@xe_module_load@force-load:
    - shard-dg2-set2:     NOTRUN -> [SKIP][180] ([Intel XE#378])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-466/igt@xe_module_load@force-load.html

  * igt@xe_oa@invalid-map-oa-buffer:
    - shard-adlp:         NOTRUN -> [SKIP][181] ([Intel XE#2541]) +2 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-adlp-4/igt@xe_oa@invalid-map-oa-buffer.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-adlp:         [PASS][182] -> [ABORT][183] ([Intel XE#1358] / [Intel XE#1607])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-adlp-1/igt@xe_pm@s4-d3hot-basic-exec.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          [PASS][184] -> [FAIL][185] ([Intel XE#958])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-lnl-1/igt@xe_pm_residency@toggle-gt-c6.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-lnl-4/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_query@multigpu-query-hwconfig:
    - shard-adlp:         NOTRUN -> [SKIP][186] ([Intel XE#944]) +1 other test skip
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-adlp-3/igt@xe_query@multigpu-query-hwconfig.html

  * igt@xe_query@multigpu-query-invalid-size:
    - shard-bmg:          NOTRUN -> [SKIP][187] ([Intel XE#944])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-bmg-6/igt@xe_query@multigpu-query-invalid-size.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-adlp:         [PASS][188] -> [FAIL][189] ([Intel XE#3507])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-adlp-3/igt@xe_sriov_flr@flr-vf1-clear.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-adlp-8/igt@xe_sriov_flr@flr-vf1-clear.html

  * igt@xe_wedged@basic-wedged:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][190] ([Intel XE#2919])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-adlp-3/igt@xe_wedged@basic-wedged.html

  
#### Possible fixes ####

  * igt@fbdev@write:
    - shard-dg2-set2:     [SKIP][191] ([Intel XE#2134]) -> [PASS][192]
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@fbdev@write.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-433/igt@fbdev@write.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-bmg:          [INCOMPLETE][193] ([Intel XE#2613]) -> [PASS][194]
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-bmg-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:
    - shard-lnl:          [FAIL][195] ([Intel XE#1426]) -> [PASS][196] +1 other test pass
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-lnl-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-lnl-4/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-bmg:          [FAIL][197] ([Intel XE#1426]) -> [PASS][198]
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-6/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-bmg-6/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][199] ([Intel XE#2136]) -> [PASS][200] +22 other tests pass
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-435/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][201] ([Intel XE#2136] / [Intel XE#2351]) -> [PASS][202] +5 other tests pass
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-463/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@linear-16bpp-rotate-180:
    - shard-bmg:          [DMESG-FAIL][203] ([Intel XE#3468]) -> [PASS][204] +4 other tests pass
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-4/igt@kms_big_fb@linear-16bpp-rotate-180.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-bmg-4/igt@kms_big_fb@linear-16bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][205] ([Intel XE#1033]) -> [PASS][206]
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [DMESG-WARN][207] ([Intel XE#877]) -> [PASS][208]
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_feature_discovery@display:
    - shard-dg2-set2:     [SKIP][209] ([Intel XE#2423] / [i915#2575]) -> [PASS][210] +72 other tests pass
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@kms_feature_discovery@display.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-435/igt@kms_feature_discovery@display.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][211] ([Intel XE#3487]) -> [PASS][212]
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][213] ([Intel XE#2882]) -> [PASS][214]
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [DMESG-WARN][215] ([Intel XE#2953] / [Intel XE#3086]) -> [PASS][216] +1 other test pass
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-adlp-9/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@plain-flip-fb-recreate@a-edp1:
    - shard-lnl:          [FAIL][217] ([Intel XE#886]) -> [PASS][218] +1 other test pass
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-lnl-3/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-lnl-1/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html

  * igt@kms_flip@plain-flip-fb-recreate@c-edp1:
    - shard-lnl:          [FAIL][219] ([Intel XE#3149] / [Intel XE#886]) -> [PASS][220] +1 other test pass
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-lnl-3/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-lnl-1/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-valid-mode:
    - shard-bmg:          [INCOMPLETE][221] ([Intel XE#1727] / [Intel XE#3468]) -> [PASS][222] +1 other test pass
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-valid-mode.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-render:
    - shard-bmg:          [INCOMPLETE][223] ([Intel XE#3468]) -> [PASS][224]
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-render.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-render.html

  * igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-2:
    - shard-bmg:          [SKIP][225] -> [PASS][226]
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-6/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-2.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-bmg-1/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-2.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][227] -> [PASS][228] +1 other test pass
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-435/igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-6.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-464/igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-6.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-lnl:          [FAIL][229] ([Intel XE#2029]) -> [PASS][230]
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-lnl-2/igt@kms_pm_dc@deep-pkgc.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg2-set2:     [SKIP][231] ([Intel XE#2446]) -> [PASS][232] +1 other test pass
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-435/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_vrr@negative-basic:
    - shard-bmg:          [INCOMPLETE][233] -> [PASS][234] +1 other test pass
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-2/igt@kms_vrr@negative-basic.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-bmg-2/igt@kms_vrr@negative-basic.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [TIMEOUT][235] ([Intel XE#1473] / [Intel XE#2472]) -> [PASS][236]
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-8/igt@xe_evict@evict-mixed-many-threads-small.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_basic@many-userptr-invalidate-race:
    - shard-dg2-set2:     [DMESG-WARN][237] ([Intel XE#1727]) -> [PASS][238]
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-435/igt@xe_exec_basic@many-userptr-invalidate-race.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-464/igt@xe_exec_basic@many-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate:
    - shard-bmg:          [DMESG-FAIL][239] ([Intel XE#3371]) -> [PASS][240]
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-5/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-bmg-3/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html

  * igt@xe_exec_threads@threads-hang-shared-vm-userptr-invalidate:
    - shard-bmg:          [DMESG-WARN][241] -> [PASS][242] +4 other tests pass
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-4/igt@xe_exec_threads@threads-hang-shared-vm-userptr-invalidate.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-bmg-4/igt@xe_exec_threads@threads-hang-shared-vm-userptr-invalidate.html

  * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create:
    - shard-adlp:         [DMESG-WARN][243] ([Intel XE#3086]) -> [PASS][244]
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-adlp-2/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-adlp-2/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html

  * igt@xe_gt_freq@freq_reset_multiple:
    - shard-lnl:          [DMESG-WARN][245] ([Intel XE#3184]) -> [PASS][246]
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-lnl-6/igt@xe_gt_freq@freq_reset_multiple.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-lnl-5/igt@xe_gt_freq@freq_reset_multiple.html

  * igt@xe_pm@s2idle-exec-after:
    - shard-dg2-set2:     [SKIP][247] ([Intel XE#1130]) -> [PASS][248] +138 other tests pass
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@xe_pm@s2idle-exec-after.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-464/igt@xe_pm@s2idle-exec-after.html

  * igt@xe_pm@s3-basic:
    - shard-bmg:          [DMESG-WARN][249] ([Intel XE#3468] / [Intel XE#569]) -> [PASS][250]
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-4/igt@xe_pm@s3-basic.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-bmg-4/igt@xe_pm@s3-basic.html

  * igt@xe_pm@s4-basic:
    - shard-adlp:         [ABORT][251] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][252] +1 other test pass
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-adlp-9/igt@xe_pm@s4-basic.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-adlp-4/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-lnl:          [ABORT][253] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][254]
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-lnl-3/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_vm@large-split-binds-2147483648:
    - shard-bmg:          [DMESG-WARN][255] ([Intel XE#3468]) -> [PASS][256] +20 other tests pass
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-7/igt@xe_vm@large-split-binds-2147483648.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-bmg-8/igt@xe_vm@large-split-binds-2147483648.html

  * igt@xe_vm@large-split-misaligned-binds-33554432:
    - shard-dg2-set2:     [DMESG-WARN][257] -> [PASS][258] +2 other tests pass
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-435/igt@xe_vm@large-split-misaligned-binds-33554432.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-464/igt@xe_vm@large-split-misaligned-binds-33554432.html

  
#### Warnings ####

  * igt@core_hotunplug@hotunbind-rebind:
    - shard-dg2-set2:     [SKIP][259] ([Intel XE#1885]) -> [DMESG-WARN][260] ([Intel XE#3468] / [Intel XE#3521])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@core_hotunplug@hotunbind-rebind.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-435/igt@core_hotunplug@hotunbind-rebind.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1:
    - shard-adlp:         [DMESG-FAIL][261] ([Intel XE#1033]) -> [DMESG-WARN][262] ([Intel XE#1033])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-dg2-set2:     [SKIP][263] ([Intel XE#455]) -> [SKIP][264] ([Intel XE#2423] / [i915#2575]) +3 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-433/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-466/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-0:
    - shard-bmg:          [DMESG-WARN][265] ([Intel XE#3468]) -> [DMESG-FAIL][266] ([Intel XE#3468])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-5/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-bmg-3/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][267] ([Intel XE#316]) -> [SKIP][268] ([Intel XE#2136]) +2 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-436/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-466/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][269] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][270] ([Intel XE#316])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@kms_big_fb@linear-64bpp-rotate-270.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-463/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][271] ([Intel XE#2136]) -> [SKIP][272] ([Intel XE#316])
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-463/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][273] ([Intel XE#316]) -> [SKIP][274] ([Intel XE#2136] / [Intel XE#2351])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-463/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-466/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-dg2-set2:     [SKIP][275] ([Intel XE#619]) -> [SKIP][276] ([Intel XE#2136] / [Intel XE#2351])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][277] ([Intel XE#2136]) -> [SKIP][278] ([Intel XE#1124]) +8 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][279] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][280] ([Intel XE#1124]) +2 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-433/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][281] ([Intel XE#1124]) -> [SKIP][282] ([Intel XE#2136]) +4 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-436/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-466/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][283] ([Intel XE#367]) -> [SKIP][284] ([Intel XE#2423] / [i915#2575])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-436/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-466/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][285] ([Intel XE#2191]) -> [SKIP][286] ([Intel XE#2423] / [i915#2575])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-433/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][287] ([Intel XE#2423] / [i915#2575]) -> [SKIP][288] ([Intel XE#2191]) +2 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-464/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][289] ([Intel XE#2423] / [i915#2575]) -> [SKIP][290] ([Intel XE#367]) +3 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-435/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][291] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][292] ([Intel XE#2136]) +5 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-433/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-466/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][293] ([Intel XE#2907]) -> [SKIP][294] ([Intel XE#2136]) +1 other test skip
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-433/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-466/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][295] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][296] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-463/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][297] ([Intel XE#2136]) -> [SKIP][298] ([Intel XE#2907])
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][299] ([Intel XE#2136]) -> [SKIP][300] ([Intel XE#455] / [Intel XE#787]) +11 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][301] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][302] ([Intel XE#2136] / [Intel XE#2351]) +1 other test skip
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [SKIP][303] ([Intel XE#2136] / [Intel XE#2351]) -> [INCOMPLETE][304] ([Intel XE#1727])
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-dg2-set2:     [SKIP][305] ([Intel XE#306]) -> [SKIP][306] ([Intel XE#2423] / [i915#2575])
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-463/igt@kms_chamelium_color@ctm-negative.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-466/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_edid@vga-edid-read:
    - shard-dg2-set2:     [SKIP][307] ([Intel XE#2423] / [i915#2575]) -> [SKIP][308] ([Intel XE#373]) +8 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@kms_chamelium_edid@vga-edid-read.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-463/igt@kms_chamelium_edid@vga-edid-read.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-dg2-set2:     [SKIP][309] ([Intel XE#373]) -> [SKIP][310] ([Intel XE#2423] / [i915#2575]) +8 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_color@invalid-degamma-lut-sizes:
    - shard-dg2-set2:     [SKIP][311] ([Intel XE#2423] / [i915#2575]) -> [DMESG-WARN][312] ([Intel XE#1727])
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@kms_color@invalid-degamma-lut-sizes.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-435/igt@kms_color@invalid-degamma-lut-sizes.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2-set2:     [FAIL][313] ([Intel XE#1178]) -> [SKIP][314] ([Intel XE#2423] / [i915#2575])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-436/igt@kms_content_protection@atomic-dpms.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-466/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@legacy:
    - shard-dg2-set2:     [SKIP][315] ([Intel XE#2423] / [i915#2575]) -> [FAIL][316] ([Intel XE#1178])
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@kms_content_protection@legacy.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-433/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-dg2-set2:     [SKIP][317] ([Intel XE#308]) -> [SKIP][318] ([Intel XE#2423] / [i915#2575])
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-433/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-434/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-dg2-set2:     [SKIP][319] ([Intel XE#2423] / [i915#2575]) -> [SKIP][320] ([Intel XE#308])
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-463/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-dg2-set2:     [SKIP][321] ([Intel XE#2423] / [i915#2575]) -> [SKIP][322] ([Intel XE#323])
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-463/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-dg2-set2:     [SKIP][323] ([Intel XE#2423] / [i915#2575]) -> [INCOMPLETE][324] ([Intel XE#3226]) +1 other test incomplete
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-433/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-dg2-set2:     [SKIP][325] ([Intel XE#307]) -> [SKIP][326] ([Intel XE#2423] / [i915#2575])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-433/igt@kms_display_modes@mst-extended-mode-negative.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-466/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-dg2-set2:     [SKIP][327] ([Intel XE#455]) -> [SKIP][328] ([Intel XE#2136] / [Intel XE#2351])
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-436/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-466/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2-set2:     [SKIP][329] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][330] ([Intel XE#455])
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@kms_dsc@dsc-with-bpc-formats.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-464/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-dg2-set2:     [SKIP][331] ([Intel XE#2136]) -> [INCOMPLETE][332] ([Intel XE#3468])
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@kms_fbcon_fbt@fbc-suspend.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-463/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     [SKIP][333] ([Intel XE#2423] / [i915#2575]) -> [SKIP][334] ([Intel XE#701])
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@kms_feature_discovery@chamelium.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-433/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2-set2:     [SKIP][335] ([Intel XE#2423] / [i915#2575]) -> [SKIP][336] ([Intel XE#703])
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@kms_feature_discovery@display-3x.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-463/igt@kms_feature_discovery@display-3x.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-dg2-set2:     [SKIP][337] ([Intel XE#2423] / [i915#2575]) -> [FAIL][338] ([Intel XE#301])
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][339] ([Intel XE#3487]) -> [FAIL][340] ([Intel XE#3321] / [Intel XE#3487])
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html

  * igt@kms_flip@absolute-wf_vblank-interruptible@c-dp2:
    - shard-bmg:          [DMESG-FAIL][341] -> [DMESG-WARN][342] ([Intel XE#3468]) +1 other test dmesg-warn
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-6/igt@kms_flip@absolute-wf_vblank-interruptible@c-dp2.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-bmg-1/igt@kms_flip@absolute-wf_vblank-interruptible@c-dp2.html

  * igt@kms_flip@flip-vs-rmfb-interruptible@d-hdmi-a3:
    - shard-bmg:          [DMESG-WARN][343] -> [DMESG-WARN][344] ([Intel XE#3468]) +4 other tests dmesg-warn
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-5/igt@kms_flip@flip-vs-rmfb-interruptible@d-hdmi-a3.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-bmg-3/igt@kms_flip@flip-vs-rmfb-interruptible@d-hdmi-a3.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling:
    - shard-dg2-set2:     [SKIP][345] ([Intel XE#2136]) -> [INCOMPLETE][346] ([Intel XE#1727] / [Intel XE#3468])
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-dg2-set2:     [SKIP][347] ([Intel XE#2136]) -> [SKIP][348] ([Intel XE#455]) +3 other tests skip
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][349] ([Intel XE#455]) -> [SKIP][350] ([Intel XE#2136]) +3 other tests skip
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move:
    - shard-bmg:          [SKIP][351] ([Intel XE#2312]) -> [SKIP][352] ([Intel XE#2311])
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][353] ([Intel XE#651]) -> [SKIP][354] ([Intel XE#2136]) +12 other tests skip
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][355] ([Intel XE#651]) -> [SKIP][356] ([Intel XE#2136] / [Intel XE#2351]) +6 other tests skip
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
    - shard-dg2-set2:     [SKIP][357] ([Intel XE#2136]) -> [SKIP][358] ([Intel XE#651]) +15 other tests skip
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:
    - shard-bmg:          [FAIL][359] ([Intel XE#2333]) -> [DMESG-FAIL][360] ([Intel XE#3468])
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [DMESG-FAIL][361] ([Intel XE#3468]) -> [SKIP][362] ([Intel XE#2312]) +1 other test skip
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          [DMESG-FAIL][363] ([Intel XE#3468]) -> [FAIL][364] ([Intel XE#2333]) +1 other test fail
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [FAIL][365] ([Intel XE#2333]) -> [SKIP][366] ([Intel XE#2312]) +7 other tests skip
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][367] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][368] ([Intel XE#651]) +8 other tests skip
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][369] ([Intel XE#2311]) -> [SKIP][370] ([Intel XE#2312]) +15 other tests skip
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][371] ([Intel XE#2313]) -> [SKIP][372] ([Intel XE#2312]) +13 other tests skip
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][373] ([Intel XE#2136]) -> [SKIP][374] ([Intel XE#653]) +20 other tests skip
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][375] ([Intel XE#653]) -> [SKIP][376] ([Intel XE#2136]) +17 other tests skip
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][377] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][378] ([Intel XE#653]) +5 other tests skip
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move:
    - shard-dg2-set2:     [SKIP][379] ([Intel XE#653]) -> [SKIP][380] ([Intel XE#2136] / [Intel XE#2351]) +3 other tests skip
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-2p-rte:
    - shard-bmg:          [SKIP][381] ([Intel XE#2312]) -> [SKIP][382] ([Intel XE#2313])
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-rte.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-rte.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-dg2-set2:     [SKIP][383] ([Intel XE#2136]) -> [SKIP][384] ([Intel XE#346])
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@kms_joiner@basic-big-joiner.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-463/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2-set2:     [SKIP][385] ([Intel XE#2423] / [i915#2575]) -> [FAIL][386] ([Intel XE#361])
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][387] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][388] ([Intel XE#2423] / [i915#2575])
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-dg2-set2:     [SKIP][389] ([Intel XE#2136]) -> [SKIP][390] ([Intel XE#870])
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@kms_pm_backlight@bad-brightness.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-464/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2-set2:     [SKIP][391] ([Intel XE#1122]) -> [SKIP][392] ([Intel XE#2136] / [Intel XE#2351])
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-433/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-466/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg2-set2:     [SKIP][393] ([Intel XE#2136]) -> [SKIP][394] ([Intel XE#3309])
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@kms_pm_dc@dc5-retention-flops.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-435/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     [SKIP][395] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][396] ([Intel XE#908])
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@kms_pm_dc@dc6-dpms.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-433/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg2-set2:     [SKIP][397] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][398] ([Intel XE#1129])
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@kms_pm_dc@dc6-psr.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-463/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-dg2-set2:     [SKIP][399] ([Intel XE#908]) -> [SKIP][400] ([Intel XE#2136])
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-436/igt@kms_pm_dc@deep-pkgc.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-466/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@universal-planes-dpms:
    - shard-dg2-set2:     [DMESG-WARN][401] ([Intel XE#2042] / [Intel XE#3468]) -> [SKIP][402] ([Intel XE#2446])
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-463/igt@kms_pm_rpm@universal-planes-dpms.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-466/igt@kms_pm_rpm@universal-planes-dpms.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][403] ([Intel XE#2136]) -> [SKIP][404] ([Intel XE#1489]) +5 other tests skip
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-464/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][405] ([Intel XE#1489]) -> [SKIP][406] ([Intel XE#2136]) +5 other tests skip
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-436/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-466/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     [SKIP][407] ([Intel XE#1122]) -> [SKIP][408] ([Intel XE#2136])
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-433/igt@kms_psr2_su@page_flip-nv12.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-466/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-pr-dpms:
    - shard-dg2-set2:     [SKIP][409] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][410] ([Intel XE#2136]) +5 other tests skip
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-436/igt@kms_psr@fbc-pr-dpms.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-466/igt@kms_psr@fbc-pr-dpms.html

  * igt@kms_psr@fbc-psr-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][411] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][412] ([Intel XE#2136] / [Intel XE#2351]) +3 other tests skip
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-463/igt@kms_psr@fbc-psr-sprite-plane-onoff.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-plane-onoff.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     [SKIP][413] ([Intel XE#2136]) -> [SKIP][414] ([Intel XE#2850] / [Intel XE#929]) +11 other tests skip
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@kms_psr@fbc-psr2-primary-render.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-433/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@pr-dpms:
    - shard-dg2-set2:     [SKIP][415] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][416] ([Intel XE#2850] / [Intel XE#929]) +5 other tests skip
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@kms_psr@pr-dpms.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-464/igt@kms_psr@pr-dpms.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2-set2:     [SKIP][417] ([Intel XE#2423] / [i915#2575]) -> [SKIP][418] ([Intel XE#3414])
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@kms_rotation_crc@bad-tiling.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-463/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-dg2-set2:     [SKIP][419] ([Intel XE#2423] / [i915#2575]) -> [SKIP][420] ([Intel XE#1127])
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-433/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-dg2-set2:     [SKIP][421] ([Intel XE#3414]) -> [SKIP][422] ([Intel XE#2423] / [i915#2575])
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-436/igt@kms_rotation_crc@sprite-rotation-90.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-466/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_sequence@queue-idle:
    - shard-dg2-set2:     [INCOMPLETE][423] -> [SKIP][424] ([Intel XE#2423] / [i915#2575])
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-433/igt@kms_sequence@queue-idle.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-434/igt@kms_sequence@queue-idle.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][425] ([Intel XE#2426]) -> [FAIL][426] ([Intel XE#1729])
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html
    - shard-dg2-set2:     [FAIL][427] ([Intel XE#1729]) -> [SKIP][428] ([Intel XE#2423] / [i915#2575])
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vblank@query-busy:
    - shard-dg2-set2:     [SKIP][429] ([Intel XE#2423] / [i915#2575]) -> [INCOMPLETE][430] ([Intel XE#1727])
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@kms_vblank@query-busy.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-463/igt@kms_vblank@query-busy.html

  * igt@kms_vblank@query-forked-hang:
    - shard-bmg:          [DMESG-FAIL][431] ([Intel XE#3468]) -> [DMESG-WARN][432] ([Intel XE#3468]) +2 other tests dmesg-warn
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-4/igt@kms_vblank@query-forked-hang.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-bmg-6/igt@kms_vblank@query-forked-hang.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     [SKIP][433] ([Intel XE#2423] / [i915#2575]) -> [SKIP][434] ([Intel XE#455]) +7 other tests skip
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@kms_vrr@flipline.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-463/igt@kms_vrr@flipline.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2-set2:     [SKIP][435] ([Intel XE#756]) -> [SKIP][436] ([Intel XE#2423] / [i915#2575])
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-436/igt@kms_writeback@writeback-fb-id.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-466/igt@kms_writeback@writeback-fb-id.html

  * igt@xe_copy_basic@mem-copy-linear-0x369:
    - shard-dg2-set2:     [SKIP][437] ([Intel XE#1123]) -> [SKIP][438] ([Intel XE#1130])
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0x369.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0x369.html

  * igt@xe_copy_basic@mem-set-linear-0x369:
    - shard-dg2-set2:     [SKIP][439] ([Intel XE#1130]) -> [SKIP][440] ([Intel XE#1126])
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0x369.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0x369.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-dg2-set2:     [SKIP][441] ([Intel XE#1126]) -> [SKIP][442] ([Intel XE#1130])
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0xfd.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-invalidate:
    - shard-dg2-set2:     [SKIP][443] ([Intel XE#1130]) -> [DMESG-WARN][444] ([Intel XE#1727]) +1 other test dmesg-warn
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-invalidate.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-435/igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-invalidate.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:
    - shard-dg2-set2:     [SKIP][445] ([Intel XE#1130]) -> [SKIP][446] ([Intel XE#288]) +22 other tests skip
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-435/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     [SKIP][447] ([Intel XE#288]) -> [SKIP][448] ([Intel XE#1130]) +16 other tests skip
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-433/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     [SKIP][449] ([Intel XE#1130]) -> [SKIP][450] ([Intel XE#2360])
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-433/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_exec_sip_eudebug@breakpoint-waitsip:
    - shard-dg2-set2:     [SKIP][451] ([Intel XE#2905]) -> [SKIP][452] ([Intel XE#1130]) +7 other tests skip
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-436/igt@xe_exec_sip_eudebug@breakpoint-waitsip.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-466/igt@xe_exec_sip_eudebug@breakpoint-waitsip.html

  * igt@xe_exec_sip_eudebug@breakpoint-writesip:
    - shard-dg2-set2:     [SKIP][453] ([Intel XE#1130]) -> [SKIP][454] ([Intel XE#2905]) +10 other tests skip
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@xe_exec_sip_eudebug@breakpoint-writesip.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-463/igt@xe_exec_sip_eudebug@breakpoint-writesip.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:
    - shard-adlp:         [DMESG-WARN][455] ([Intel XE#3086] / [Intel XE#3343]) -> [DMESG-WARN][456] ([Intel XE#3343])
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-adlp-8/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-adlp-9/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init:
    - shard-bmg:          [DMESG-WARN][457] ([Intel XE#3467] / [Intel XE#3468]) -> [DMESG-WARN][458] ([Intel XE#3467]) +1 other test dmesg-warn
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init.html
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early:
    - shard-bmg:          [DMESG-WARN][459] ([Intel XE#3467]) -> [DMESG-WARN][460] ([Intel XE#3467] / [Intel XE#3468]) +1 other test dmesg-warn
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:
    - shard-dg2-set2:     [SKIP][461] ([Intel XE#1130]) -> [DMESG-WARN][462] ([Intel XE#3343]) +1 other test dmesg-warn
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-433/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html

  * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create:
    - shard-dg2-set2:     [DMESG-WARN][463] ([Intel XE#3467]) -> [SKIP][464] ([Intel XE#1130]) +1 other test skip
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-433/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-466/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html
    - shard-bmg:          [DMESG-FAIL][465] ([Intel XE#3467]) -> [DMESG-FAIL][466] ([Intel XE#3467] / [Intel XE#3468])
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-bmg-3/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html

  * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:
    - shard-bmg:          [FAIL][467] ([Intel XE#3539]) -> [FAIL][468] ([Intel XE#3499] / [Intel XE#3539]) +1 other test fail
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-3/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-bmg-8/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html

  * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:
    - shard-lnl:          [FAIL][469] ([Intel XE#3539]) -> [FAIL][470] ([Intel XE#3499] / [Intel XE#3539]) +4 other tests fail
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-lnl-1/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-lnl-4/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html

  * igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc:
    - shard-bmg:          [DMESG-FAIL][471] ([Intel XE#3467]) -> [FAIL][472] ([Intel XE#3499] / [Intel XE#3539]) +1 other test fail
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-6/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-bmg-6/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html
    - shard-dg2-set2:     [SKIP][473] ([Intel XE#1130]) -> [DMESG-WARN][474] ([Intel XE#3467])
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-435/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     [SKIP][475] ([Intel XE#255]) -> [SKIP][476] ([Intel XE#1130])
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-436/igt@xe_huc_copy@huc_copy.html
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-466/igt@xe_huc_copy@huc_copy.html

  * igt@xe_oa@disabled-read-error:
    - shard-dg2-set2:     [SKIP][477] ([Intel XE#2541]) -> [SKIP][478] ([Intel XE#1130]) +3 other tests skip
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-433/igt@xe_oa@disabled-read-error.html
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-466/igt@xe_oa@disabled-read-error.html

  * igt@xe_oa@non-privileged-map-oa-buffer:
    - shard-dg2-set2:     [SKIP][479] ([Intel XE#1130]) -> [SKIP][480] ([Intel XE#2541]) +5 other tests skip
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@xe_oa@non-privileged-map-oa-buffer.html
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-464/igt@xe_oa@non-privileged-map-oa-buffer.html

  * igt@xe_pat@pat-index-xe2:
    - shard-adlp:         [SKIP][481] ([Intel XE#977]) -> [SKIP][482] ([Intel XE#2839] / [Intel XE#977])
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-adlp-3/igt@xe_pat@pat-index-xe2.html
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-adlp-8/igt@xe_pat@pat-index-xe2.html
    - shard-dg2-set2:     [SKIP][483] ([Intel XE#1130]) -> [SKIP][484] ([Intel XE#2839] / [Intel XE#977])
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@xe_pat@pat-index-xe2.html
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-463/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xelp:
    - shard-bmg:          [SKIP][485] ([Intel XE#2245]) -> [SKIP][486] ([Intel XE#2237] / [Intel XE#2245])
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-3/igt@xe_pat@pat-index-xelp.html
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-bmg-8/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][487] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][488] ([Intel XE#1130]) +2 other tests skip
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-433/igt@xe_pm@d3cold-basic-exec.html
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-466/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][489] ([Intel XE#1130]) -> [SKIP][490] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-433/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s4-exec-after:
    - shard-lnl:          [DMESG-WARN][491] ([Intel XE#3466]) -> [ABORT][492] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#3466])
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-lnl-8/igt@xe_pm@s4-exec-after.html
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-lnl-2/igt@xe_pm@s4-exec-after.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-dg2-set2:     [SKIP][493] ([Intel XE#1130]) -> [DMESG-WARN][494] ([Intel XE#3468])
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@xe_pm@s4-multiple-execs.html
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-463/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     [SKIP][495] ([Intel XE#1130]) -> [SKIP][496] ([Intel XE#579])
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@xe_pm@vram-d3cold-threshold.html
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-464/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_query@multigpu-query-config:
    - shard-dg2-set2:     [SKIP][497] ([Intel XE#1130]) -> [SKIP][498] ([Intel XE#944]) +2 other tests skip
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@xe_query@multigpu-query-config.html
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-464/igt@xe_query@multigpu-query-config.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-dg2-set2:     [SKIP][499] ([Intel XE#944]) -> [SKIP][500] ([Intel XE#1130])
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-433/igt@xe_query@multigpu-query-uc-fw-version-huc.html
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-466/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-dg2-set2:     [SKIP][501] ([Intel XE#3342]) -> [SKIP][502] ([Intel XE#1130])
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-463/igt@xe_sriov_flr@flr-vf1-clear.html
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/shard-dg2-466/igt@xe_sriov_flr@flr-vf1-clear.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
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
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1471]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1471
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
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
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2613]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2613
  [Intel XE#2635]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2839]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2839
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2919]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3130
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3157]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3157
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3184]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184
  [Intel XE#3226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3249
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343
  [Intel XE#3371]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3371
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3453]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3453
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3466
  [Intel XE#3467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467
  [Intel XE#3468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468
  [Intel XE#3486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3486
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
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * Linux: xe-2254-ccf64319402f90f68549e2047a7f985a46436e41 -> xe-pw-141175v2

  IGT_8118: 17707095f1e5d3c30f463b43022f01c0160579b6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2254-ccf64319402f90f68549e2047a7f985a46436e41: ccf64319402f90f68549e2047a7f985a46436e41
  xe-pw-141175v2: 141175v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v2/index.html
