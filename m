Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5C71D711BF
	for <intel-xe@archiver.kernel.org>; Wed, 20 Nov 2024 16:17:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 647B010E2D3;
	Wed, 20 Nov 2024 16:17:41 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B2C710E0ED;
 Wed, 20 Nov 2024 16:17:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe=3A_Add_support_for_?=
 =?utf-8?q?G2G_communication_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: john.c.harrison@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 20 Nov 2024 16:17:40 -0000
Message-ID: <173211946012.766962.17246534430229716246@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241120000222.204095-1-John.C.Harrison@Intel.com>
In-Reply-To: <20241120000222.204095-1-John.C.Harrison@Intel.com>
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

Series: drm/xe: Add support for G2G communication (rev3)
URL   : https://patchwork.freedesktop.org/series/141119/
State : failure

== Summary ==

CI Bug Log - changes from xe-2254-ccf64319402f90f68549e2047a7f985a46436e41_full -> xe-pw-141119v3_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-141119v3_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-141119v3_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-141119v3_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_draw_crc@fill-fb:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-463/igt@kms_draw_crc@fill-fb.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2-set2:     NOTRUN -> [ABORT][2]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-435/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@flip-vs-wf_vblank-interruptible:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][3] +1 other test incomplete
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-bmg-1/igt@kms_flip@flip-vs-wf_vblank-interruptible.html

  * igt@kms_sequence@queue-idle:
    - shard-bmg:          [PASS][4] -> [INCOMPLETE][5] +1 other test incomplete
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-1/igt@kms_sequence@queue-idle.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-bmg-8/igt@kms_sequence@queue-idle.html

  * igt@xe_mmap@bad-flags:
    - shard-bmg:          [PASS][6] -> [DMESG-WARN][7] +1 other test dmesg-warn
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-5/igt@xe_mmap@bad-flags.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-bmg-2/igt@xe_mmap@bad-flags.html

  * igt@xe_vm@large-binds-33554432:
    - shard-lnl:          [PASS][8] -> [DMESG-WARN][9] +8 other tests dmesg-warn
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-lnl-7/igt@xe_vm@large-binds-33554432.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-lnl-3/igt@xe_vm@large-binds-33554432.html

  * igt@xe_vm@mmap-style-bind-userptr-one-partial:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][10]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-463/igt@xe_vm@mmap-style-bind-userptr-one-partial.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][11]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-bmg-6/igt@xe_wedged@wedged-mode-toggle.html

  
#### Warnings ####

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-a-hdmi-a-3:
    - shard-bmg:          [SKIP][12] ([Intel XE#2652] / [Intel XE#787]) -> [INCOMPLETE][13] +1 other test incomplete
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-8/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-a-hdmi-a-3.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-bmg-5/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-a-hdmi-a-3.html

  * igt@xe_exec_balancer@many-execqueues-virtual-userptr:
    - shard-dg2-set2:     [SKIP][14] ([Intel XE#1130]) -> [DMESG-WARN][15]
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@xe_exec_balancer@many-execqueues-virtual-userptr.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-433/igt@xe_exec_balancer@many-execqueues-virtual-userptr.html

  * igt@xe_module_load@reload:
    - shard-dg2-set2:     [FAIL][16] ([Intel XE#2136]) -> [FAIL][17]
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@xe_module_load@reload.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-466/igt@xe_module_load@reload.html

  
New tests
---------

  New tests have been introduced between xe-2254-ccf64319402f90f68549e2047a7f985a46436e41_full and xe-pw-141119v3_full:

### New IGT tests (2) ###

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.09] s

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.10] s

  

Known issues
------------

  Here are the changes found in xe-pw-141119v3_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_getstats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#2423]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-434/igt@core_getstats.html

  * igt@core_getversion@basic:
    - shard-dg2-set2:     NOTRUN -> [FAIL][19] ([Intel XE#3440])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-434/igt@core_getversion@basic.html

  * igt@core_hotunplug@hotunplug-rescan:
    - shard-dg2-set2:     [PASS][20] -> [SKIP][21] ([Intel XE#1885])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-436/igt@core_hotunplug@hotunplug-rescan.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-434/igt@core_hotunplug@hotunplug-rescan.html

  * igt@core_setmaster@master-drop-set-root:
    - shard-dg2-set2:     [PASS][22] -> [FAIL][23] ([Intel XE#3130] / [Intel XE#3249])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-433/igt@core_setmaster@master-drop-set-root.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-466/igt@core_setmaster@master-drop-set-root.html

  * igt@fbdev@info:
    - shard-dg2-set2:     [PASS][24] -> [SKIP][25] ([Intel XE#2134])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-435/igt@fbdev@info.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-466/igt@fbdev@info.html

  * igt@fbdev@pan:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#2134])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-434/igt@fbdev@pan.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:
    - shard-adlp:         [PASS][27] -> [FAIL][28] ([Intel XE#827])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-lnl:          [PASS][29] -> [FAIL][30] ([Intel XE#1426]) +1 other test fail
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-lnl-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-lnl-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][31] ([Intel XE#3225] / [Intel XE#402])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-463/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#1124])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-adlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#316])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-463/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][34] ([Intel XE#1033])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][35] ([Intel XE#316]) +2 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-adlp-3/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#610])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-463/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#1124]) +2 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [PASS][38] -> [DMESG-WARN][39] ([Intel XE#1033])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#1124]) +2 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-463/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:
    - shard-adlp:         NOTRUN -> [SKIP][41] ([Intel XE#367]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-adlp-8/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#2191])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-adlp-3/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#455] / [Intel XE#787]) +18 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#455] / [Intel XE#787]) +9 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-adlp-8/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#787]) +14 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-adlp-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#787]) +118 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][47] ([Intel XE#3113])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#2907]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-adlp-8/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#314]) +3 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-464/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html

  * igt@kms_cdclk@plane-scaling:
    - shard-adlp:         NOTRUN -> [SKIP][50] ([Intel XE#1152] / [Intel XE#455])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-adlp-8/igt@kms_cdclk@plane-scaling.html

  * igt@kms_cdclk@plane-scaling@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#1152]) +2 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-adlp-8/igt@kms_cdclk@plane-scaling@pipe-a-hdmi-a-1.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#306])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-463/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_frames@dp-frame-dump:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2252])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-bmg-6/igt@kms_chamelium_frames@dp-frame-dump.html

  * igt@kms_chamelium_hpd@dp-hpd:
    - shard-adlp:         NOTRUN -> [SKIP][54] ([Intel XE#373]) +2 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-adlp-8/igt@kms_chamelium_hpd@dp-hpd.html

  * igt@kms_color@invalid-degamma-lut-sizes@pipe-a:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][55] ([Intel XE#1727])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-463/igt@kms_color@invalid-degamma-lut-sizes@pipe-a.html

  * igt@kms_content_protection@content-type-change:
    - shard-adlp:         NOTRUN -> [SKIP][56] ([Intel XE#455]) +8 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-adlp-8/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][57] ([Intel XE#1178]) +1 other test fail
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-464/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-adlp:         NOTRUN -> [SKIP][58] ([Intel XE#308])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-adlp-3/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-64x64:
    - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#2423] / [i915#2575]) +48 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-64x64.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-bmg:          [PASS][60] -> [SKIP][61] ([Intel XE#2291]) +2 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@torture-bo@pipe-a:
    - shard-bmg:          [PASS][62] -> [DMESG-WARN][63] ([Intel XE#3468]) +2 other tests dmesg-warn
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-6/igt@kms_cursor_legacy@torture-bo@pipe-a.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-bmg-5/igt@kms_cursor_legacy@torture-bo@pipe-a.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#2351])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-466/igt@kms_dsc@dsc-basic.html

  * igt@kms_feature_discovery@psr1:
    - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#1135])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-adlp-8/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3:
    - shard-bmg:          [PASS][66] -> [FAIL][67] ([Intel XE#2882])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][68] ([Intel XE#310])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-adlp-8/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-bmg:          [PASS][69] -> [SKIP][70] ([Intel XE#2316]) +5 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-bmg-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@absolute-wf_vblank-interruptible:
    - shard-adlp:         [PASS][71] -> [DMESG-WARN][72] ([Intel XE#3086]) +5 other tests dmesg-warn
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-adlp-6/igt@kms_flip@absolute-wf_vblank-interruptible.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-adlp-4/igt@kms_flip@absolute-wf_vblank-interruptible.html

  * igt@kms_flip@busy-flip:
    - shard-dg2-set2:     [PASS][73] -> [SKIP][74] ([Intel XE#2423] / [i915#2575]) +86 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-435/igt@kms_flip@busy-flip.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-434/igt@kms_flip@busy-flip.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-lnl:          [PASS][75] -> [FAIL][76] ([Intel XE#886]) +1 other test fail
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-lnl-6/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][77] ([Intel XE#1727] / [Intel XE#3468])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][78] ([Intel XE#455]) +7 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][79] ([Intel XE#2136]) +48 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [PASS][80] -> [SKIP][81] ([Intel XE#2136]) +26 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([Intel XE#2136] / [Intel XE#2351]) +12 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [PASS][83] -> [SKIP][84] ([Intel XE#2136] / [Intel XE#2351]) +8 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][85] ([Intel XE#656]) +16 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][86] ([Intel XE#651])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#2311]) +2 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear:
    - shard-adlp:         NOTRUN -> [SKIP][88] ([Intel XE#651]) +2 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][89] ([Intel XE#653]) +5 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#2312]) +2 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][91] ([Intel XE#653]) +4 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][92] ([Intel XE#346])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-adlp-8/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-adlp:         NOTRUN -> [SKIP][93] ([Intel XE#309]) +1 other test skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-adlp-8/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c:
    - shard-dg2-set2:     NOTRUN -> [SKIP][94] ([Intel XE#2763]) +5 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a:
    - shard-adlp:         NOTRUN -> [SKIP][95] ([Intel XE#2763]) +2 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-adlp-3/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:
    - shard-adlp:         NOTRUN -> [SKIP][96] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-adlp-3/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#2763] / [Intel XE#455]) +2 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#870])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-463/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-dg2-set2:     [PASS][99] -> [SKIP][100] ([Intel XE#2446]) +1 other test skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-463/igt@kms_pm_rpm@dpms-non-lpsp.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-434/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@drm-resources-equal:
    - shard-dg2-set2:     NOTRUN -> [DMESG-FAIL][101] ([Intel XE#3468])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-463/igt@kms_pm_rpm@drm-resources-equal.html

  * igt@kms_pm_rpm@modeset-stress-extra-wait:
    - shard-dg2-set2:     NOTRUN -> [SKIP][102] ([Intel XE#2446]) +1 other test skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-466/igt@kms_pm_rpm@modeset-stress-extra-wait.html

  * igt@kms_pm_rpm@universal-planes@plane-59:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][103] ([Intel XE#3468]) +6 other tests dmesg-warn
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-436/igt@kms_pm_rpm@universal-planes@plane-59.html

  * igt@kms_pm_rpm@universal-planes@plane-77:
    - shard-dg2-set2:     NOTRUN -> [ABORT][104] ([Intel XE#3468])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-436/igt@kms_pm_rpm@universal-planes@plane-77.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-adlp:         NOTRUN -> [SKIP][105] ([Intel XE#1489]) +1 other test skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-adlp-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#2387])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-bmg-6/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr-sprite-plane-onoff:
    - shard-lnl:          [PASS][107] -> [DMESG-WARN][108] ([Intel XE#3466]) +6 other tests dmesg-warn
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-lnl-7/igt@kms_psr@fbc-psr-sprite-plane-onoff.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-lnl-3/igt@kms_psr@fbc-psr-sprite-plane-onoff.html

  * igt@kms_psr@fbc-psr2-cursor-blt:
    - shard-adlp:         NOTRUN -> [SKIP][109] ([Intel XE#2850] / [Intel XE#929]) +5 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-adlp-8/igt@kms_psr@fbc-psr2-cursor-blt.html

  * igt@kms_psr@pr-cursor-plane-move:
    - shard-bmg:          NOTRUN -> [SKIP][110] ([Intel XE#2234] / [Intel XE#2850])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-bmg-6/igt@kms_psr@pr-cursor-plane-move.html

  * igt@kms_psr@psr-sprite-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][111] ([Intel XE#2850] / [Intel XE#929])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-463/igt@kms_psr@psr-sprite-render.html

  * igt@kms_psr@psr2-dpms:
    - shard-lnl:          [PASS][112] -> [DMESG-WARN][113] ([Intel XE#3514]) +5 other tests dmesg-warn
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-lnl-7/igt@kms_psr@psr2-dpms.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-lnl-3/igt@kms_psr@psr2-dpms.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-adlp:         NOTRUN -> [SKIP][114] ([Intel XE#1127])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-adlp-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-adlp:         NOTRUN -> [SKIP][115] ([Intel XE#3414])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-adlp-8/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-adlp:         NOTRUN -> [SKIP][116] ([Intel XE#330])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-adlp-8/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vblank@accuracy-idle:
    - shard-lnl:          [PASS][117] -> [FAIL][118] ([Intel XE#1523]) +1 other test fail
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-lnl-7/igt@kms_vblank@accuracy-idle.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-lnl-3/igt@kms_vblank@accuracy-idle.html

  * igt@testdisplay:
    - shard-dg2-set2:     [PASS][119] -> [SKIP][120] ([Intel XE#2423]) +1 other test skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-435/igt@testdisplay.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-466/igt@testdisplay.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-adlp:         NOTRUN -> [SKIP][121] ([Intel XE#1447])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-adlp-8/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_eudebug@basic-vms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][122] ([Intel XE#2905])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-463/igt@xe_eudebug@basic-vms.html

  * igt@xe_eudebug_online@resume-dss:
    - shard-bmg:          NOTRUN -> [SKIP][123] ([Intel XE#2905])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-bmg-6/igt@xe_eudebug_online@resume-dss.html

  * igt@xe_eudebug_online@single-step-one:
    - shard-adlp:         NOTRUN -> [SKIP][124] ([Intel XE#2905]) +5 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-adlp-3/igt@xe_eudebug_online@single-step-one.html

  * igt@xe_evict@evict-large-multi-vm-cm:
    - shard-dg2-set2:     NOTRUN -> [FAIL][125] ([Intel XE#1600])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-463/igt@xe_evict@evict-large-multi-vm-cm.html

  * igt@xe_evict@evict-small-multi-vm:
    - shard-adlp:         NOTRUN -> [SKIP][126] ([Intel XE#261] / [Intel XE#688]) +2 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-adlp-3/igt@xe_evict@evict-small-multi-vm.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][127] ([Intel XE#1392]) +2 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-adlp-8/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][128] ([Intel XE#2322]) +1 other test skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-bmg-1/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-prefetch:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][129] ([Intel XE#2594])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-bmg-6/igt@xe_exec_fault_mode@many-execqueues-userptr-prefetch.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-imm:
    - shard-adlp:         NOTRUN -> [SKIP][130] ([Intel XE#288]) +10 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-adlp-8/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-imm.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][131] ([Intel XE#288]) +2 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-463/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race-imm.html

  * igt@xe_exec_reset@cat-error:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][132] ([Intel XE#358])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-adlp-8/igt@xe_exec_reset@cat-error.html

  * igt@xe_exec_threads@threads-cm-shared-vm-userptr:
    - shard-bmg:          [PASS][133] -> [FAIL][134] ([Intel XE#3535])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-4/igt@xe_exec_threads@threads-cm-shared-vm-userptr.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-bmg-1/igt@xe_exec_threads@threads-cm-shared-vm-userptr.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][135] ([Intel XE#3467])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-463/igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-dg2-set2:     NOTRUN -> [FAIL][136] ([Intel XE#1999]) +1 other test fail
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-434/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_module_load@unload:
    - shard-dg2-set2:     [PASS][137] -> [DMESG-WARN][138] ([Intel XE#3467])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@xe_module_load@unload.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-436/igt@xe_module_load@unload.html

  * igt@xe_oa@invalid-map-oa-buffer:
    - shard-adlp:         NOTRUN -> [SKIP][139] ([Intel XE#2541]) +2 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-adlp-8/igt@xe_oa@invalid-map-oa-buffer.html

  * igt@xe_oa@non-zero-reason@ccs-0:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][140] ([Intel XE#3468])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-bmg-4/igt@xe_oa@non-zero-reason@ccs-0.html

  * igt@xe_oa@whitelisted-registers-userspace-config:
    - shard-dg2-set2:     NOTRUN -> [SKIP][141] ([Intel XE#2541]) +1 other test skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-463/igt@xe_oa@whitelisted-registers-userspace-config.html

  * igt@xe_pm@s2idle-vm-bind-prefetch:
    - shard-adlp:         [PASS][142] -> [DMESG-WARN][143] ([Intel XE#2953] / [Intel XE#3086])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-adlp-8/igt@xe_pm@s2idle-vm-bind-prefetch.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-adlp-6/igt@xe_pm@s2idle-vm-bind-prefetch.html

  * igt@xe_pm@s4-mocs:
    - shard-adlp:         [PASS][144] -> [ABORT][145] ([Intel XE#1794]) +1 other test abort
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-adlp-2/igt@xe_pm@s4-mocs.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-adlp-9/igt@xe_pm@s4-mocs.html
    - shard-lnl:          [PASS][146] -> [ABORT][147] ([Intel XE#1794])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-lnl-3/igt@xe_pm@s4-mocs.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-lnl-2/igt@xe_pm@s4-mocs.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          [PASS][148] -> [FAIL][149] ([Intel XE#958])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-lnl-1/igt@xe_pm_residency@toggle-gt-c6.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-lnl-7/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_query@multigpu-query-hwconfig:
    - shard-adlp:         NOTRUN -> [SKIP][150] ([Intel XE#944]) +1 other test skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-adlp-3/igt@xe_query@multigpu-query-hwconfig.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-bmg:          NOTRUN -> [SKIP][151] ([Intel XE#944])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-bmg-1/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-dg2-set2:     NOTRUN -> [SKIP][152] ([Intel XE#944])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-463/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-adlp:         [PASS][153] -> [FAIL][154] ([Intel XE#3507])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-adlp-3/igt@xe_sriov_flr@flr-vf1-clear.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-adlp-1/igt@xe_sriov_flr@flr-vf1-clear.html

  * igt@xe_vm@large-split-binds-536870912:
    - shard-dg2-set2:     [PASS][155] -> [SKIP][156] ([Intel XE#1130]) +166 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-436/igt@xe_vm@large-split-binds-536870912.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-434/igt@xe_vm@large-split-binds-536870912.html

  * igt@xe_vm@munmap-style-unbind-many-either-side-partial:
    - shard-dg2-set2:     NOTRUN -> [SKIP][157] ([Intel XE#1130]) +74 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-434/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html

  * igt@xe_wedged@basic-wedged:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][158] ([Intel XE#2919])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-adlp-3/igt@xe_wedged@basic-wedged.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-lnl:          [PASS][159] -> [DMESG-WARN][160] ([Intel XE#3119] / [Intel XE#3466])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-lnl-7/igt@xe_wedged@wedged-at-any-timeout.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-lnl-3/igt@xe_wedged@wedged-at-any-timeout.html

  
#### Possible fixes ####

  * igt@core_getversion@all-cards:
    - shard-dg2-set2:     [FAIL][161] ([Intel XE#3440]) -> [PASS][162]
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@core_getversion@all-cards.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-435/igt@core_getversion@all-cards.html

  * igt@core_hotunplug@hotrebind:
    - shard-dg2-set2:     [SKIP][163] ([Intel XE#1885]) -> [PASS][164]
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@core_hotunplug@hotrebind.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-436/igt@core_hotunplug@hotrebind.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-bmg:          [INCOMPLETE][165] ([Intel XE#2613]) -> [PASS][166]
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-bmg-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:
    - shard-lnl:          [FAIL][167] ([Intel XE#1426]) -> [PASS][168] +1 other test pass
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-lnl-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-lnl-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-bmg:          [FAIL][169] ([Intel XE#1426]) -> [PASS][170]
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-6/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-bmg-6/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          [DMESG-FAIL][171] ([Intel XE#3468]) -> [PASS][172] +5 other tests pass
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-bmg-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][173] ([Intel XE#1033]) -> [PASS][174]
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_dp_aux_dev:
    - shard-dg2-set2:     [SKIP][175] ([Intel XE#2423]) -> [PASS][176]
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@kms_dp_aux_dev.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-435/igt@kms_dp_aux_dev.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][177] ([Intel XE#3487]) -> [PASS][178] +1 other test pass
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][179] ([Intel XE#2882]) -> [PASS][180]
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html

  * igt@kms_flip@plain-flip-fb-recreate@a-edp1:
    - shard-lnl:          [FAIL][181] ([Intel XE#886]) -> [PASS][182] +1 other test pass
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-lnl-3/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-lnl-4/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html

  * igt@kms_flip@plain-flip-fb-recreate@c-edp1:
    - shard-lnl:          [FAIL][183] ([Intel XE#3149] / [Intel XE#886]) -> [PASS][184] +1 other test pass
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-lnl-3/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-lnl-4/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][185] ([Intel XE#2136] / [Intel XE#2351]) -> [PASS][186] +8 other tests pass
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][187] ([Intel XE#2136]) -> [PASS][188] +25 other tests pass
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-render:
    - shard-bmg:          [INCOMPLETE][189] ([Intel XE#3468]) -> [PASS][190]
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-render.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-render.html

  * igt@kms_hdr@static-toggle-suspend@pipe-a-dp-2:
    - shard-bmg:          [SKIP][191] -> [PASS][192] +1 other test pass
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-6/igt@kms_hdr@static-toggle-suspend@pipe-a-dp-2.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-bmg-7/igt@kms_hdr@static-toggle-suspend@pipe-a-dp-2.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg2-set2:     [SKIP][193] ([Intel XE#2446]) -> [PASS][194] +2 other tests pass
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-463/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_rotation_crc@sprite-rotation-180:
    - shard-dg2-set2:     [SKIP][195] ([Intel XE#2423] / [i915#2575]) -> [PASS][196] +87 other tests pass
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@kms_rotation_crc@sprite-rotation-180.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-433/igt@kms_rotation_crc@sprite-rotation-180.html

  * igt@kms_sequence@get-idle:
    - shard-bmg:          [DMESG-WARN][197] ([Intel XE#3468]) -> [PASS][198] +38 other tests pass
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-6/igt@kms_sequence@get-idle.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-bmg-6/igt@kms_sequence@get-idle.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
    - shard-lnl:          [FAIL][199] ([Intel XE#899]) -> [PASS][200]
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [FAIL][201] ([Intel XE#2159]) -> [PASS][202] +1 other test pass
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@kms_vrr@negative-basic:
    - shard-bmg:          [INCOMPLETE][203] -> [PASS][204] +1 other test pass
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-2/igt@kms_vrr@negative-basic.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-bmg-1/igt@kms_vrr@negative-basic.html

  * igt@xe_exec_balancer@twice-virtual-basic:
    - shard-dg2-set2:     [SKIP][205] ([Intel XE#1130]) -> [PASS][206] +153 other tests pass
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@xe_exec_balancer@twice-virtual-basic.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-433/igt@xe_exec_balancer@twice-virtual-basic.html

  * igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate:
    - shard-bmg:          [DMESG-FAIL][207] ([Intel XE#3371]) -> [PASS][208]
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-5/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-bmg-2/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html

  * igt@xe_exec_threads@threads-hang-shared-vm-userptr-invalidate:
    - shard-bmg:          [DMESG-WARN][209] -> [PASS][210] +4 other tests pass
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-4/igt@xe_exec_threads@threads-hang-shared-vm-userptr-invalidate.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-bmg-3/igt@xe_exec_threads@threads-hang-shared-vm-userptr-invalidate.html

  * igt@xe_gt_freq@freq_reset_multiple:
    - shard-lnl:          [DMESG-WARN][211] ([Intel XE#3184]) -> [PASS][212]
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-lnl-6/igt@xe_gt_freq@freq_reset_multiple.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-lnl-5/igt@xe_gt_freq@freq_reset_multiple.html

  * igt@xe_module_load@reload-no-display:
    - shard-bmg:          [DMESG-WARN][213] ([Intel XE#3467]) -> [PASS][214]
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-6/igt@xe_module_load@reload-no-display.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-bmg-6/igt@xe_module_load@reload-no-display.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-bmg:          [DMESG-WARN][215] ([Intel XE#3468] / [Intel XE#569]) -> [PASS][216] +1 other test pass
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-6/igt@xe_pm@s3-d3hot-basic-exec.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-bmg-6/igt@xe_pm@s3-d3hot-basic-exec.html

  * igt@xe_pm@s4-basic:
    - shard-adlp:         [ABORT][217] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][218] +1 other test pass
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-adlp-9/igt@xe_pm@s4-basic.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-adlp-8/igt@xe_pm@s4-basic.html

  
#### Warnings ####

  * igt@core_hotunplug@hotunbind-rebind:
    - shard-dg2-set2:     [SKIP][219] ([Intel XE#1885]) -> [DMESG-WARN][220] ([Intel XE#3468] / [Intel XE#3521])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@core_hotunplug@hotunbind-rebind.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-463/igt@core_hotunplug@hotunbind-rebind.html

  * igt@core_hotunplug@unbind-rebind:
    - shard-dg2-set2:     [SKIP][221] ([Intel XE#1885]) -> [DMESG-WARN][222] ([Intel XE#3468])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@core_hotunplug@unbind-rebind.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-433/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1:
    - shard-adlp:         [DMESG-FAIL][223] ([Intel XE#1033]) -> [DMESG-WARN][224] ([Intel XE#1033])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html

  * igt@kms_atomic_interruptible@atomic-setmode:
    - shard-dg2-set2:     [SKIP][225] ([Intel XE#2423] / [i915#2575]) -> [DMESG-WARN][226] ([Intel XE#3468])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@kms_atomic_interruptible@atomic-setmode.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-435/igt@kms_atomic_interruptible@atomic-setmode.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][227] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][228] ([Intel XE#316])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-464/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][229] ([Intel XE#316]) -> [SKIP][230] ([Intel XE#2136] / [Intel XE#2351])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-435/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-466/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
    - shard-bmg:          [DMESG-FAIL][231] ([Intel XE#3468]) -> [DMESG-WARN][232] ([Intel XE#3468]) +1 other test dmesg-warn
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-1/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-bmg-8/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][233] ([Intel XE#316]) -> [SKIP][234] ([Intel XE#2136]) +2 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-436/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-434/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-bmg:          [DMESG-WARN][235] ([Intel XE#3468]) -> [DMESG-FAIL][236] ([Intel XE#3468])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-bmg-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][237] ([Intel XE#2136]) -> [SKIP][238] ([Intel XE#316]) +1 other test skip
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-464/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     [SKIP][239] ([Intel XE#2136]) -> [SKIP][240] ([Intel XE#1124]) +5 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][241] ([Intel XE#1124]) -> [SKIP][242] ([Intel XE#2136]) +9 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-436/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-434/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][243] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][244] ([Intel XE#1124]) +6 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-435/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][245] ([Intel XE#2136]) -> [SKIP][246] ([Intel XE#607])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][247] ([Intel XE#2136]) -> [SKIP][248] ([Intel XE#610])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg2-set2:     [SKIP][249] ([Intel XE#1124]) -> [SKIP][250] ([Intel XE#2136] / [Intel XE#2351]) +1 other test skip
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][251] ([Intel XE#367]) -> [SKIP][252] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-436/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-434/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][253] ([Intel XE#2423] / [i915#2575]) -> [SKIP][254] ([Intel XE#2191]) +1 other test skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-463/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][255] ([Intel XE#2423] / [i915#2575]) -> [SKIP][256] ([Intel XE#367]) +3 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-463/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][257] ([Intel XE#2136]) -> [SKIP][258] ([Intel XE#455] / [Intel XE#787]) +12 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-464/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     [SKIP][259] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][260] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][261] ([Intel XE#2136]) -> [SKIP][262] ([Intel XE#2907])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][263] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][264] ([Intel XE#2136] / [Intel XE#2351]) +3 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][265] ([Intel XE#3442]) -> [SKIP][266] ([Intel XE#2136])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][267] ([Intel XE#2136]) -> [SKIP][268] ([Intel XE#3442])
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [FAIL][269] ([Intel XE#616]) -> [SKIP][270] ([Intel XE#2136])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [SKIP][271] ([Intel XE#2136] / [Intel XE#2351]) -> [INCOMPLETE][272] ([Intel XE#1727])
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][273] ([Intel XE#2907]) -> [SKIP][274] ([Intel XE#2136])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     [SKIP][275] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][276] ([Intel XE#2136]) +9 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-dg2-set2:     [SKIP][277] ([Intel XE#306]) -> [SKIP][278] ([Intel XE#2423] / [i915#2575])
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-436/igt@kms_chamelium_color@ctm-0-50.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-434/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-dg2-set2:     [SKIP][279] ([Intel XE#2423] / [i915#2575]) -> [SKIP][280] ([Intel XE#306]) +1 other test skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@kms_chamelium_color@ctm-0-75.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-436/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-dg2-set2:     [SKIP][281] ([Intel XE#373]) -> [SKIP][282] ([Intel XE#2423] / [i915#2575]) +12 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     [SKIP][283] ([Intel XE#2423] / [i915#2575]) -> [SKIP][284] ([Intel XE#373]) +11 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@kms_chamelium_hpd@vga-hpd.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-433/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_color@invalid-degamma-lut-sizes:
    - shard-dg2-set2:     [SKIP][285] ([Intel XE#2423] / [i915#2575]) -> [DMESG-WARN][286] ([Intel XE#1727])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@kms_color@invalid-degamma-lut-sizes.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-463/igt@kms_color@invalid-degamma-lut-sizes.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2-set2:     [FAIL][287] ([Intel XE#1178]) -> [SKIP][288] ([Intel XE#2423] / [i915#2575])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-436/igt@kms_content_protection@atomic-dpms.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-434/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@legacy:
    - shard-dg2-set2:     [SKIP][289] ([Intel XE#2423] / [i915#2575]) -> [FAIL][290] ([Intel XE#1178]) +1 other test fail
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@kms_content_protection@legacy.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-464/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-dg2-set2:     [SKIP][291] ([Intel XE#2423] / [i915#2575]) -> [SKIP][292] ([Intel XE#308])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@kms_cursor_crc@cursor-random-512x170.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-433/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-dg2-set2:     [SKIP][293] ([Intel XE#308]) -> [SKIP][294] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-436/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-434/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-dg2-set2:     [SKIP][295] ([Intel XE#2423] / [i915#2575]) -> [INCOMPLETE][296] ([Intel XE#3226])
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-463/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     [SKIP][297] ([Intel XE#2423] / [i915#2575]) -> [SKIP][298] ([Intel XE#323]) +1 other test skip
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-464/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-dg2-set2:     [SKIP][299] ([Intel XE#455]) -> [SKIP][300] ([Intel XE#2136] / [Intel XE#2351])
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-436/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-434/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-dg2-set2:     [SKIP][301] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][302] ([Intel XE#455]) +2 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@kms_dsc@dsc-with-formats.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-435/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg2-set2:     [SKIP][303] ([Intel XE#776]) -> [SKIP][304] ([Intel XE#2136]) +1 other test skip
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-463/igt@kms_fbcon_fbt@psr-suspend.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-434/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     [SKIP][305] ([Intel XE#2423] / [i915#2575]) -> [SKIP][306] ([Intel XE#701])
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@kms_feature_discovery@chamelium.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-464/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2-set2:     [SKIP][307] ([Intel XE#1135]) -> [SKIP][308] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-435/igt@kms_feature_discovery@psr1.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-434/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@absolute-wf_vblank-interruptible@c-dp2:
    - shard-bmg:          [DMESG-FAIL][309] -> [DMESG-WARN][310] ([Intel XE#3468]) +1 other test dmesg-warn
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-6/igt@kms_flip@absolute-wf_vblank-interruptible@c-dp2.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-bmg-5/igt@kms_flip@absolute-wf_vblank-interruptible@c-dp2.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-dg2-set2:     [DMESG-FAIL][311] ([Intel XE#1727]) -> [SKIP][312] ([Intel XE#2423] / [i915#2575])
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-rmfb-interruptible@d-hdmi-a3:
    - shard-bmg:          [DMESG-WARN][313] -> [DMESG-WARN][314] ([Intel XE#3468]) +4 other tests dmesg-warn
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-5/igt@kms_flip@flip-vs-rmfb-interruptible@d-hdmi-a3.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-bmg-2/igt@kms_flip@flip-vs-rmfb-interruptible@d-hdmi-a3.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling:
    - shard-dg2-set2:     [SKIP][315] ([Intel XE#2136]) -> [INCOMPLETE][316] ([Intel XE#1727] / [Intel XE#3468])
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
    - shard-bmg:          [INCOMPLETE][317] ([Intel XE#3468]) -> [DMESG-WARN][318] ([Intel XE#3468]) +1 other test dmesg-warn
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-dg2-set2:     [SKIP][319] ([Intel XE#2136]) -> [SKIP][320] ([Intel XE#455]) +2 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][321] ([Intel XE#455]) -> [SKIP][322] ([Intel XE#2136]) +3 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move:
    - shard-bmg:          [SKIP][323] ([Intel XE#2312]) -> [SKIP][324] ([Intel XE#2311])
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][325] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][326] ([Intel XE#651]) +10 other tests skip
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][327] ([Intel XE#651]) -> [SKIP][328] ([Intel XE#2136]) +20 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][329] ([Intel XE#651]) -> [SKIP][330] ([Intel XE#2136] / [Intel XE#2351]) +12 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:
    - shard-bmg:          [DMESG-FAIL][331] ([Intel XE#3468]) -> [FAIL][332] ([Intel XE#2333]) +2 other tests fail
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-rte:
    - shard-dg2-set2:     [INCOMPLETE][333] ([Intel XE#3468]) -> [SKIP][334] ([Intel XE#2136])
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-1p-rte.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
    - shard-bmg:          [FAIL][335] ([Intel XE#2333]) -> [SKIP][336] ([Intel XE#2312]) +2 other tests skip
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2-set2:     [SKIP][337] ([Intel XE#658]) -> [SKIP][338] ([Intel XE#2136] / [Intel XE#2351])
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
    - shard-dg2-set2:     [SKIP][339] ([Intel XE#2136]) -> [SKIP][340] ([Intel XE#651]) +22 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][341] ([Intel XE#2311]) -> [SKIP][342] ([Intel XE#2312]) +6 other tests skip
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][343] ([Intel XE#2136]) -> [SKIP][344] ([Intel XE#653]) +27 other tests skip
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][345] ([Intel XE#2313]) -> [SKIP][346] ([Intel XE#2312]) +8 other tests skip
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][347] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][348] ([Intel XE#653]) +8 other tests skip
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][349] ([Intel XE#653]) -> [SKIP][350] ([Intel XE#2136]) +23 other tests skip
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][351] ([Intel XE#653]) -> [SKIP][352] ([Intel XE#2136] / [Intel XE#2351]) +7 other tests skip
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-rte:
    - shard-bmg:          [SKIP][353] ([Intel XE#2312]) -> [SKIP][354] ([Intel XE#2313])
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-rte.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-rte.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [SKIP][355] ([Intel XE#2423] / [i915#2575]) -> [SKIP][356] ([Intel XE#455]) +7 other tests skip
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@kms_hdr@invalid-hdr.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-464/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-dg2-set2:     [SKIP][357] ([Intel XE#346]) -> [SKIP][358] ([Intel XE#2136])
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-435/igt@kms_joiner@invalid-modeset-big-joiner.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-434/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-dg2-set2:     [SKIP][359] ([Intel XE#2136]) -> [SKIP][360] ([Intel XE#2927])
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-435/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb:
    - shard-dg2-set2:     [INCOMPLETE][361] -> [SKIP][362] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-435/igt@kms_plane_alpha_blend@alpha-opaque-fb.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-434/igt@kms_plane_alpha_blend@alpha-opaque-fb.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][363] ([Intel XE#2423] / [i915#2575]) -> [SKIP][364] ([Intel XE#2763] / [Intel XE#455])
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][365] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][366] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html

  * igt@kms_pm_backlight@fade:
    - shard-dg2-set2:     [SKIP][367] ([Intel XE#2136]) -> [SKIP][368] ([Intel XE#870])
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@kms_pm_backlight@fade.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-464/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg2-set2:     [SKIP][369] ([Intel XE#2136]) -> [SKIP][370] ([Intel XE#3309])
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@kms_pm_dc@dc5-retention-flops.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-463/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     [SKIP][371] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][372] ([Intel XE#908])
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@kms_pm_dc@dc6-dpms.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-464/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-dg2-set2:     [SKIP][373] ([Intel XE#908]) -> [SKIP][374] ([Intel XE#2136])
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-436/igt@kms_pm_dc@deep-pkgc.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-434/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@basic-rte:
    - shard-dg2-set2:     [ABORT][375] ([Intel XE#3468]) -> [SKIP][376] ([Intel XE#2446])
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-435/igt@kms_pm_rpm@basic-rte.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-466/igt@kms_pm_rpm@basic-rte.html

  * igt@kms_pm_rpm@universal-planes:
    - shard-dg2-set2:     [SKIP][377] ([Intel XE#2446]) -> [ABORT][378] ([Intel XE#3468]) +1 other test abort
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@kms_pm_rpm@universal-planes.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-436/igt@kms_pm_rpm@universal-planes.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][379] ([Intel XE#2136]) -> [SKIP][380] ([Intel XE#1489]) +9 other tests skip
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-463/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][381] ([Intel XE#1489]) -> [SKIP][382] ([Intel XE#2136]) +7 other tests skip
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-435/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-466/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg2-set2:     [SKIP][383] ([Intel XE#1122]) -> [SKIP][384] ([Intel XE#2136])
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-463/igt@kms_psr2_su@page_flip-p010.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-434/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-dg2-set2:     [SKIP][385] ([Intel XE#2136]) -> [SKIP][386] ([Intel XE#1122])
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@kms_psr2_su@page_flip-xrgb8888.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-464/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-dpms:
    - shard-dg2-set2:     [SKIP][387] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][388] ([Intel XE#2136]) +9 other tests skip
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-436/igt@kms_psr@fbc-pr-dpms.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-434/igt@kms_psr@fbc-pr-dpms.html

  * igt@kms_psr@fbc-pr-sprite-render:
    - shard-dg2-set2:     [SKIP][389] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][390] ([Intel XE#2136] / [Intel XE#2351]) +6 other tests skip
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-435/igt@kms_psr@fbc-pr-sprite-render.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-466/igt@kms_psr@fbc-pr-sprite-render.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     [SKIP][391] ([Intel XE#2136]) -> [SKIP][392] ([Intel XE#2850] / [Intel XE#929]) +9 other tests skip
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@kms_psr@fbc-psr2-primary-render.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-464/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@psr-cursor-plane-move:
    - shard-dg2-set2:     [SKIP][393] ([Intel XE#2351]) -> [SKIP][394] ([Intel XE#2850] / [Intel XE#929])
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@kms_psr@psr-cursor-plane-move.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-436/igt@kms_psr@psr-cursor-plane-move.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     [SKIP][395] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][396] ([Intel XE#2850] / [Intel XE#929]) +5 other tests skip
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@kms_psr@psr-dpms.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-464/igt@kms_psr@psr-dpms.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-dg2-set2:     [SKIP][397] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][398] ([Intel XE#2351]) +1 other test skip
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-435/igt@kms_psr@psr-primary-page-flip.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-466/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2-set2:     [SKIP][399] ([Intel XE#1127]) -> [SKIP][400] ([Intel XE#2423] / [i915#2575])
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-dg2-set2:     [SKIP][401] ([Intel XE#2423] / [i915#2575]) -> [SKIP][402] ([Intel XE#3414]) +1 other test skip
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@kms_rotation_crc@sprite-rotation-270.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-436/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-dg2-set2:     [SKIP][403] ([Intel XE#3414]) -> [SKIP][404] ([Intel XE#2423] / [i915#2575])
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-436/igt@kms_rotation_crc@sprite-rotation-90.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-434/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-dg2-set2:     [SKIP][405] ([Intel XE#455]) -> [SKIP][406] ([Intel XE#2423] / [i915#2575]) +4 other tests skip
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-435/igt@kms_scaling_modes@scaling-mode-full-aspect.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-434/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [FAIL][407] ([Intel XE#1729]) -> [SKIP][408] ([Intel XE#2423] / [i915#2575])
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][409] ([Intel XE#2423] / [i915#2575]) -> [SKIP][410] ([Intel XE#1500])
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2-set2:     [SKIP][411] ([Intel XE#330]) -> [SKIP][412] ([Intel XE#2423] / [i915#2575])
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-435/igt@kms_tv_load_detect@load-detect.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-434/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2-set2:     [SKIP][413] ([Intel XE#2423] / [i915#2575]) -> [SKIP][414] ([Intel XE#756])
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@kms_writeback@writeback-check-output-xrgb2101010.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-464/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2-set2:     [SKIP][415] ([Intel XE#756]) -> [SKIP][416] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-436/igt@kms_writeback@writeback-fb-id.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-434/igt@kms_writeback@writeback-fb-id.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg2-set2:     [SKIP][417] ([Intel XE#1091] / [Intel XE#2849]) -> [SKIP][418] ([Intel XE#2423] / [i915#2575])
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-435/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-434/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     [SKIP][419] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][420] ([Intel XE#1130])
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-435/igt@xe_compute_preempt@compute-preempt-many.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-466/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_copy_basic@mem-copy-linear-0x369:
    - shard-dg2-set2:     [SKIP][421] ([Intel XE#1123]) -> [SKIP][422] ([Intel XE#1130])
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0x369.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0x369.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][423] ([Intel XE#1130]) -> [SKIP][424] ([Intel XE#1123]) +1 other test skip
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-464/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - shard-dg2-set2:     [SKIP][425] ([Intel XE#1130]) -> [SKIP][426] ([Intel XE#1126])
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0x3fff.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0x3fff.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][427] ([Intel XE#1126]) -> [SKIP][428] ([Intel XE#1130])
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0xfffe.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_eudebug_online@interrupt-all-set-breakpoint:
    - shard-dg2-set2:     [SKIP][429] ([Intel XE#2905]) -> [SKIP][430] ([Intel XE#1130]) +10 other tests skip
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-435/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-434/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html

  * igt@xe_eudebug_online@preempt-breakpoint:
    - shard-dg2-set2:     [SKIP][431] ([Intel XE#1130]) -> [SKIP][432] ([Intel XE#2905]) +14 other tests skip
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@xe_eudebug_online@preempt-breakpoint.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-464/igt@xe_eudebug_online@preempt-breakpoint.html

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-dg2-set2:     [SKIP][433] ([Intel XE#1130]) -> [TIMEOUT][434] ([Intel XE#1473])
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-large.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-464/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-dg2-set2:     [SKIP][435] ([Intel XE#1130]) -> [INCOMPLETE][436] ([Intel XE#1473])
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-433/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-invalidate:
    - shard-dg2-set2:     [SKIP][437] ([Intel XE#1130]) -> [DMESG-WARN][438] ([Intel XE#1727]) +1 other test dmesg-warn
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-invalidate.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-463/igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-invalidate.html

  * igt@xe_exec_basic@many-userptr-invalidate-race:
    - shard-dg2-set2:     [DMESG-WARN][439] ([Intel XE#1727]) -> [SKIP][440] ([Intel XE#1130])
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-435/igt@xe_exec_basic@many-userptr-invalidate-race.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-434/igt@xe_exec_basic@many-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
    - shard-dg2-set2:     [SKIP][441] ([Intel XE#288]) -> [SKIP][442] ([Intel XE#1130]) +24 other tests skip
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-463/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-434/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][443] ([Intel XE#1130]) -> [SKIP][444] ([Intel XE#288]) +29 other tests skip
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-433/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     [SKIP][445] ([Intel XE#1130]) -> [SKIP][446] ([Intel XE#2360]) +1 other test skip
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-464/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_device_create:
    - shard-dg2-set2:     [DMESG-WARN][447] ([Intel XE#3467]) -> [SKIP][448] ([Intel XE#1130]) +2 other tests skip
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-436/igt@xe_fault_injection@inject-fault-probe-function-xe_device_create.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-434/igt@xe_fault_injection@inject-fault-probe-function-xe_device_create.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init:
    - shard-dg2-set2:     [DMESG-WARN][449] ([Intel XE#3343]) -> [SKIP][450] ([Intel XE#1130])
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-435/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:
    - shard-bmg:          [DMESG-WARN][451] ([Intel XE#3343]) -> [DMESG-WARN][452] ([Intel XE#3343] / [Intel XE#3468])
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init:
    - shard-adlp:         [DMESG-WARN][453] ([Intel XE#3343]) -> [DMESG-WARN][454] ([Intel XE#3086] / [Intel XE#3343])
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-adlp-6/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-adlp-4/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:
    - shard-dg2-set2:     [SKIP][455] ([Intel XE#1130]) -> [DMESG-WARN][456] ([Intel XE#3343])
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-464/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html

  * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:
    - shard-bmg:          [FAIL][457] ([Intel XE#3539]) -> [FAIL][458] ([Intel XE#3499] / [Intel XE#3539]) +1 other test fail
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-3/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-bmg-4/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html

  * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:
    - shard-lnl:          [FAIL][459] ([Intel XE#3539]) -> [FAIL][460] ([Intel XE#3499] / [Intel XE#3539]) +4 other tests fail
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-lnl-1/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-lnl-7/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html
    - shard-bmg:          [DMESG-FAIL][461] ([Intel XE#3467]) -> [FAIL][462] ([Intel XE#3499] / [Intel XE#3539])
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-4/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-bmg-3/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html

  * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run:
    - shard-dg2-set2:     [SKIP][463] ([Intel XE#1130]) -> [DMESG-WARN][464] ([Intel XE#3467]) +2 other tests dmesg-warn
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-433/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     [SKIP][465] ([Intel XE#255]) -> [SKIP][466] ([Intel XE#1130])
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-436/igt@xe_huc_copy@huc_copy.html
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-434/igt@xe_huc_copy@huc_copy.html

  * igt@xe_live_ktest@xe_mocs:
    - shard-dg2-set2:     [SKIP][467] ([Intel XE#1192]) -> [FAIL][468] ([Intel XE#1999])
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-436/igt@xe_live_ktest@xe_mocs.html
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-434/igt@xe_live_ktest@xe_mocs.html

  * igt@xe_module_load@reload-no-display:
    - shard-dg2-set2:     [FAIL][469] ([Intel XE#2136]) -> [DMESG-WARN][470] ([Intel XE#3467])
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@xe_module_load@reload-no-display.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-435/igt@xe_module_load@reload-no-display.html

  * igt@xe_oa@missing-sample-flags:
    - shard-dg2-set2:     [SKIP][471] ([Intel XE#2541]) -> [SKIP][472] ([Intel XE#1130]) +8 other tests skip
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-435/igt@xe_oa@missing-sample-flags.html
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-434/igt@xe_oa@missing-sample-flags.html

  * igt@xe_oa@non-privileged-access-vaddr:
    - shard-dg2-set2:     [SKIP][473] ([Intel XE#1130]) -> [SKIP][474] ([Intel XE#2541]) +7 other tests skip
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@xe_oa@non-privileged-access-vaddr.html
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-435/igt@xe_oa@non-privileged-access-vaddr.html

  * igt@xe_pat@pat-index-xe2:
    - shard-adlp:         [SKIP][475] ([Intel XE#977]) -> [SKIP][476] ([Intel XE#2839] / [Intel XE#977])
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-adlp-3/igt@xe_pat@pat-index-xe2.html
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-adlp-2/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xelp:
    - shard-bmg:          [SKIP][477] ([Intel XE#2245]) -> [SKIP][478] ([Intel XE#2237] / [Intel XE#2245])
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-bmg-3/igt@xe_pat@pat-index-xelp.html
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-bmg-4/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-dg2-set2:     [SKIP][479] ([Intel XE#1130]) -> [SKIP][480] ([Intel XE#979])
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@xe_pat@pat-index-xelpg.html
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-433/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_peer2peer@write:
    - shard-dg2-set2:     [FAIL][481] ([Intel XE#1173]) -> [SKIP][482] ([Intel XE#1061])
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-436/igt@xe_peer2peer@write.html
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-434/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-dg2-set2:     [SKIP][483] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][484] ([Intel XE#1130])
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-436/igt@xe_pm@d3cold-mmap-system.html
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-434/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@d3cold-mocs:
    - shard-dg2-set2:     [SKIP][485] ([Intel XE#1130]) -> [SKIP][486] ([Intel XE#2284])
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@xe_pm@d3cold-mocs.html
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-464/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@d3hot-basic:
    - shard-dg2-set2:     [DMESG-WARN][487] ([Intel XE#3468]) -> [SKIP][488] ([Intel XE#1130])
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-435/igt@xe_pm@d3hot-basic.html
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-434/igt@xe_pm@d3hot-basic.html

  * igt@xe_pm@d3hot-multiple-execs:
    - shard-dg2-set2:     [SKIP][489] ([Intel XE#1130]) -> [DMESG-WARN][490] ([Intel XE#3468])
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@xe_pm@d3hot-multiple-execs.html
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-435/igt@xe_pm@d3hot-multiple-execs.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][491] ([Intel XE#1130]) -> [SKIP][492] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-464/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s3-basic-exec:
    - shard-dg2-set2:     [DMESG-WARN][493] ([Intel XE#3468] / [Intel XE#569]) -> [SKIP][494] ([Intel XE#1130])
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-435/igt@xe_pm@s3-basic-exec.html
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-466/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-dg2-set2:     [SKIP][495] ([Intel XE#1130]) -> [DMESG-WARN][496] ([Intel XE#3468] / [Intel XE#569])
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@xe_pm@s3-d3hot-basic-exec.html
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-435/igt@xe_pm@s3-d3hot-basic-exec.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-dg2-set2:     [SKIP][497] ([Intel XE#1130]) -> [DMESG-WARN][498] ([Intel XE#1727] / [Intel XE#3468])
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-466/igt@xe_pm@s4-d3hot-basic-exec.html
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-433/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     [SKIP][499] ([Intel XE#1130]) -> [SKIP][500] ([Intel XE#944]) +4 other tests skip
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-434/igt@xe_query@multigpu-query-engines.html
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-435/igt@xe_query@multigpu-query-engines.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-dg2-set2:     [SKIP][501] ([Intel XE#944]) -> [SKIP][502] ([Intel XE#1130])
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-435/igt@xe_query@multigpu-query-uc-fw-version-guc.html
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-434/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  * igt@xe_vm@large-split-misaligned-binds-33554432:
    - shard-dg2-set2:     [DMESG-WARN][503] -> [SKIP][504] ([Intel XE#1130]) +2 other tests skip
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-435/igt@xe_vm@large-split-misaligned-binds-33554432.html
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-434/igt@xe_vm@large-split-misaligned-binds-33554432.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-dg2-set2:     [ABORT][505] ([Intel XE#3075] / [Intel XE#3084]) -> [SKIP][506] ([Intel XE#1130])
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2254-ccf64319402f90f68549e2047a7f985a46436e41/shard-dg2-463/igt@xe_wedged@wedged-mode-toggle.html
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/shard-dg2-434/igt@xe_wedged@wedged-mode-toggle.html

  
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1523]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1523
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2237]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2237
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2613]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2613
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2839]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2839
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2919]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#3075]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3075
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084
  [Intel XE#3086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3119]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3119
  [Intel XE#3130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3130
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3184]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184
  [Intel XE#3225]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3225
  [Intel XE#3226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3249
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343
  [Intel XE#3371]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3371
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3440]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3440
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3466
  [Intel XE#3467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467
  [Intel XE#3468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468
  [Intel XE#3487]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3487
  [Intel XE#3499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3499
  [Intel XE#3507]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3507
  [Intel XE#3514]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3514
  [Intel XE#3521]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3521
  [Intel XE#3535]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3535
  [Intel XE#3539]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3539
  [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
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

  * Linux: xe-2254-ccf64319402f90f68549e2047a7f985a46436e41 -> xe-pw-141119v3

  IGT_8118: 17707095f1e5d3c30f463b43022f01c0160579b6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2254-ccf64319402f90f68549e2047a7f985a46436e41: ccf64319402f90f68549e2047a7f985a46436e41
  xe-pw-141119v3: 141119v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141119v3/index.html
