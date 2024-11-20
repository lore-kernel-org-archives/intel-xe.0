Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ECD0D743ED
	for <intel-xe@archiver.kernel.org>; Wed, 20 Nov 2024 23:08:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A40610E1F0;
	Wed, 20 Nov 2024 23:08:36 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53B5610E1F0;
 Wed, 20 Nov 2024 23:08:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/i915=3A_MST_and_DDI_cl?=
 =?utf-8?q?eanups_and_refactoring_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 20 Nov 2024 23:08:34 -0000
Message-ID: <173214411435.894643.10493382974610101958@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <cover.1732106557.git.jani.nikula@intel.com>
In-Reply-To: <cover.1732106557.git.jani.nikula@intel.com>
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

Series: drm/i915: MST and DDI cleanups and refactoring (rev3)
URL   : https://patchwork.freedesktop.org/series/141501/
State : failure

== Summary ==

CI Bug Log - changes from xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed_full -> xe-pw-141501v3_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-141501v3_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-141501v3_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-141501v3_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-lnl:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-lnl-3/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-lnl-8/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_dp_aux_dev:
    - shard-bmg:          [PASS][3] -> [SKIP][4] +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-3/igt@kms_dp_aux_dev.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-6/igt@kms_dp_aux_dev.html

  * igt@kms_vblank@wait-forked-busy-hang:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][5] +2 other tests incomplete
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-436/igt@kms_vblank@wait-forked-busy-hang.html

  * igt@xe_exec_fault_mode@many-userptr-imm:
    - shard-bmg:          [PASS][6] -> [INCOMPLETE][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-6/igt@xe_exec_fault_mode@many-userptr-imm.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-2/igt@xe_exec_fault_mode@many-userptr-imm.html

  * igt@xe_module_load@many-reload:
    - shard-dg2-set2:     NOTRUN -> [FAIL][8]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-434/igt@xe_module_load@many-reload.html

  * igt@xe_vm@large-userptr-split-binds-16777216:
    - shard-bmg:          [PASS][9] -> [DMESG-WARN][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-6/igt@xe_vm@large-userptr-split-binds-16777216.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-1/igt@xe_vm@large-userptr-split-binds-16777216.html

  
#### Warnings ####

  * igt@xe_prime_self_import@basic-llseek-bad:
    - shard-dg2-set2:     [SKIP][11] ([Intel XE#1130]) -> [DMESG-WARN][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@xe_prime_self_import@basic-llseek-bad.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-463/igt@xe_prime_self_import@basic-llseek-bad.html

  
Known issues
------------

  Here are the changes found in xe-pw-141501v3_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_getstats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#2423])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-434/igt@core_getstats.html

  * igt@core_getversion@basic:
    - shard-dg2-set2:     NOTRUN -> [FAIL][14] ([Intel XE#3440])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-434/igt@core_getversion@basic.html

  * igt@fbdev@unaligned-read:
    - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#2134]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-434/igt@fbdev@unaligned-read.html

  * igt@kms_3d:
    - shard-dg2-set2:     [PASS][16] -> [SKIP][17] ([Intel XE#2423])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-433/igt@kms_3d.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-466/igt@kms_3d.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#2550]) +23 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-463/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-dg2-set2:     [PASS][19] -> [SKIP][20] ([Intel XE#2423] / [i915#2575]) +74 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-433/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-466/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#1124])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-adlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2327]) +2 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-6/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#316])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-436/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][24] ([Intel XE#1033])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [PASS][25] -> [DMESG-FAIL][26] ([Intel XE#1033])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#1124])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-436/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#316]) +2 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-adlp-8/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#1124]) +2 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-lnl-4/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#1124]) +6 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:
    - shard-adlp:         NOTRUN -> [SKIP][31] ([Intel XE#367]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-adlp-1/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [PASS][32] -> [SKIP][33] ([Intel XE#2314] / [Intel XE#2894])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#2191])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-adlp-8/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#2191])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-lnl-4/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2314] / [Intel XE#2894]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-6/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#2191]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-435/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#367])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-435/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#1512])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-lnl-4/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#787]) +97 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-463/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#455] / [Intel XE#787]) +15 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-433/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2887]) +5 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-6/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#455] / [Intel XE#787]) +9 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-adlp-1/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#787]) +14 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-adlp-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#2907]) +2 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2652] / [Intel XE#787]) +18 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][47] ([Intel XE#3468])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#2907])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-adlp-1/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#2887]) +3 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-lnl-4/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_cdclk@plane-scaling:
    - shard-adlp:         NOTRUN -> [SKIP][50] ([Intel XE#1152] / [Intel XE#455])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-adlp-1/igt@kms_cdclk@plane-scaling.html

  * igt@kms_cdclk@plane-scaling@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#1152]) +2 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-adlp-1/igt@kms_cdclk@plane-scaling@pipe-a-hdmi-a-1.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#306])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-lnl-4/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_hpd@dp-hpd:
    - shard-adlp:         NOTRUN -> [SKIP][53] ([Intel XE#373]) +2 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-adlp-1/igt@kms_chamelium_hpd@dp-hpd.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#2252]) +2 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-6/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_content_protection@content-type-change:
    - shard-adlp:         NOTRUN -> [SKIP][55] ([Intel XE#455]) +8 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-adlp-1/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@legacy@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][56] ([Intel XE#1178])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-433/igt@kms_content_protection@legacy@pipe-a-dp-4.html

  * igt@kms_content_protection@lic-type-1:
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#3278])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-lnl-4/igt@kms_content_protection@lic-type-1.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#2321]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-lnl-4/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2320])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-128x42.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#308])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-adlp-8/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-64x64:
    - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#2423] / [i915#2575]) +72 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-64x64.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#2291]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-bmg:          [PASS][63] -> [SKIP][64] ([Intel XE#2291]) +5 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#1340]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#2244]) +2 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-4/igt@kms_dsc@dsc-fractional-bpp.html
    - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#2244])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-lnl-4/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_feature_discovery@psr1:
    - shard-adlp:         NOTRUN -> [SKIP][68] ([Intel XE#1135])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-adlp-1/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          [PASS][69] -> [SKIP][70] ([Intel XE#2316]) +8 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-8/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#1421]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-lnl-4/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][72] ([Intel XE#3321] / [Intel XE#3486])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:
    - shard-bmg:          [PASS][73] -> [FAIL][74] ([Intel XE#3321] / [Intel XE#3487])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3:
    - shard-bmg:          [PASS][75] -> [FAIL][76] ([Intel XE#2882])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][77] ([Intel XE#310])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-adlp-1/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#2316]) +2 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1:
    - shard-lnl:          [PASS][79] -> [FAIL][80] ([Intel XE#886])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-lnl-2/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1.html

  * igt@kms_flip@flip-vs-panning-interruptible@d-dp2:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][81] ([Intel XE#3468]) +20 other tests dmesg-warn
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-2/igt@kms_flip@flip-vs-panning-interruptible@d-dp2.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [PASS][82] -> [DMESG-WARN][83] ([Intel XE#2953] / [Intel XE#3086]) +3 other tests dmesg-warn
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:
    - shard-dg2-set2:     [PASS][84] -> [SKIP][85] ([Intel XE#2136] / [Intel XE#2351]) +9 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][86] ([Intel XE#455]) +6 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#2293] / [Intel XE#2380]) +2 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#2293]) +2 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#2311]) +6 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][90] ([Intel XE#2136] / [Intel XE#2351]) +21 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][91] ([Intel XE#656]) +15 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:
    - shard-dg2-set2:     [PASS][92] -> [SKIP][93] ([Intel XE#2136]) +17 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-render:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][94] ([Intel XE#3468])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#651])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][96] ([Intel XE#651]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear:
    - shard-adlp:         NOTRUN -> [SKIP][97] ([Intel XE#651]) +2 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#2136]) +66 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][99] ([Intel XE#653]) +2 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-b-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [FAIL][100] ([Intel XE#2333]) +1 other test fail
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-6/igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-b-hdmi-a-3.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][101] ([Intel XE#653]) +4 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#2312]) +7 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][103] ([Intel XE#656]) +8 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-lnl-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#2313]) +9 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][105] ([Intel XE#346])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-adlp-1/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#2934])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][107] ([Intel XE#2925])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-436/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_plane_lowres@tiling-4:
    - shard-bmg:          [PASS][108] -> [DMESG-FAIL][109] ([Intel XE#2705] / [Intel XE#3468])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-6/igt@kms_plane_lowres@tiling-4.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-1/igt@kms_plane_lowres@tiling-4.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-adlp:         NOTRUN -> [SKIP][110] ([Intel XE#309]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-adlp-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][111] ([Intel XE#361])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a:
    - shard-dg2-set2:     NOTRUN -> [SKIP][112] ([Intel XE#2763]) +2 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][113] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a:
    - shard-adlp:         NOTRUN -> [SKIP][114] ([Intel XE#2763]) +2 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-adlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:
    - shard-adlp:         NOTRUN -> [SKIP][115] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-adlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:
    - shard-bmg:          NOTRUN -> [SKIP][116] ([Intel XE#2763]) +9 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b:
    - shard-lnl:          NOTRUN -> [SKIP][117] ([Intel XE#2763]) +3 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-lnl-4/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][118] ([Intel XE#2938])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-6/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-dg2-set2:     NOTRUN -> [SKIP][119] ([Intel XE#2446]) +2 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-434/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg2-set2:     [PASS][120] -> [SKIP][121] ([Intel XE#2446])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-435/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-466/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@modeset-stress-extra-wait:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][122] ([Intel XE#2864] / [Intel XE#3468])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-6/igt@kms_pm_rpm@modeset-stress-extra-wait.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-adlp:         NOTRUN -> [SKIP][123] ([Intel XE#1489]) +1 other test skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-adlp-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][124] ([Intel XE#1489]) +3 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-bmg:          NOTRUN -> [SKIP][125] ([Intel XE#2387])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-6/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-pr-cursor-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][126] ([Intel XE#2234] / [Intel XE#2850]) +4 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-6/igt@kms_psr@fbc-pr-cursor-plane-onoff.html

  * igt@kms_psr@fbc-pr-sprite-plane-move:
    - shard-lnl:          NOTRUN -> [SKIP][127] ([Intel XE#1406])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-lnl-4/igt@kms_psr@fbc-pr-sprite-plane-move.html

  * igt@kms_psr@fbc-psr2-cursor-blt:
    - shard-adlp:         NOTRUN -> [SKIP][128] ([Intel XE#2850] / [Intel XE#929]) +5 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-adlp-1/igt@kms_psr@fbc-psr2-cursor-blt.html

  * igt@kms_psr@fbc-psr2-no-drrs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][129] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-435/igt@kms_psr@fbc-psr2-no-drrs.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-bmg:          NOTRUN -> [SKIP][130] ([Intel XE#3414]) +1 other test skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-6/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:
    - shard-bmg:          [PASS][131] -> [DMESG-FAIL][132] ([Intel XE#3468]) +3 other tests dmesg-fail
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-6/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-1/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-adlp:         NOTRUN -> [SKIP][133] ([Intel XE#1127])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-adlp-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-adlp:         NOTRUN -> [SKIP][134] ([Intel XE#3414])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-adlp-1/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-adlp:         NOTRUN -> [SKIP][135] ([Intel XE#330])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-adlp-1/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [PASS][136] -> [FAIL][137] ([Intel XE#899])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-lnl-2/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@kms_vblank@query-busy:
    - shard-adlp:         [PASS][138] -> [DMESG-WARN][139] ([Intel XE#3086]) +1 other test dmesg-warn
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-adlp-4/igt@kms_vblank@query-busy.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-adlp-2/igt@kms_vblank@query-busy.html

  * igt@kms_vblank@query-forked-busy@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][140] ([Intel XE#3468]) +9 other tests dmesg-fail
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-2/igt@kms_vblank@query-forked-busy@pipe-a-dp-2.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][141] -> [FAIL][142] ([Intel XE#2159]) +1 other test fail
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@kms_vrr@flip-basic:
    - shard-bmg:          NOTRUN -> [SKIP][143] ([Intel XE#1499]) +1 other test skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-6/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@lobf:
    - shard-lnl:          NOTRUN -> [SKIP][144] ([Intel XE#1499])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-lnl-4/igt@kms_vrr@lobf.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-adlp:         NOTRUN -> [SKIP][145] ([Intel XE#1447])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-adlp-1/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_eudebug_online@resume-dss:
    - shard-bmg:          NOTRUN -> [SKIP][146] ([Intel XE#2905]) +1 other test skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-6/igt@xe_eudebug_online@resume-dss.html

  * igt@xe_eudebug_online@single-step-one:
    - shard-adlp:         NOTRUN -> [SKIP][147] ([Intel XE#2905]) +5 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-adlp-8/igt@xe_eudebug_online@single-step-one.html

  * igt@xe_eudebug_online@tdctl-parameters:
    - shard-lnl:          NOTRUN -> [SKIP][148] ([Intel XE#2905])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-lnl-4/igt@xe_eudebug_online@tdctl-parameters.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - shard-bmg:          NOTRUN -> [FAIL][149] ([Intel XE#2364])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-6/igt@xe_evict@evict-beng-large-multi-vm-cm.html
    - shard-dg2-set2:     NOTRUN -> [FAIL][150] ([Intel XE#1600])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-436/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_evict@evict-large-cm:
    - shard-lnl:          NOTRUN -> [SKIP][151] ([Intel XE#688]) +1 other test skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-lnl-4/igt@xe_evict@evict-large-cm.html

  * igt@xe_evict@evict-small-multi-vm:
    - shard-adlp:         NOTRUN -> [SKIP][152] ([Intel XE#261] / [Intel XE#688]) +2 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-adlp-8/igt@xe_evict@evict-small-multi-vm.html

  * igt@xe_exec_basic@many-null-rebind:
    - shard-dg2-set2:     [PASS][153] -> [SKIP][154] ([Intel XE#1130]) +127 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-433/igt@xe_exec_basic@many-null-rebind.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-466/igt@xe_exec_basic@many-null-rebind.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][155] ([Intel XE#1392]) +2 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-adlp-1/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][156] ([Intel XE#2322])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-3/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-imm:
    - shard-adlp:         NOTRUN -> [SKIP][157] ([Intel XE#288]) +10 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-adlp-1/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][158] ([Intel XE#288]) +2 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-436/igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch.html

  * igt@xe_exec_reset@cat-error:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][159] ([Intel XE#358])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-adlp-1/igt@xe_exec_reset@cat-error.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][160] ([Intel XE#3086])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-adlp-8/igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][161] ([Intel XE#3343])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html

  * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:
    - shard-lnl:          NOTRUN -> [FAIL][162] ([Intel XE#3499] / [Intel XE#3539])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-lnl-4/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html

  * igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:
    - shard-bmg:          [PASS][163] -> [DMESG-WARN][164] ([Intel XE#3467])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-6/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-1/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html

  * igt@xe_gt_freq@freq_reset_multiple:
    - shard-lnl:          [PASS][165] -> [DMESG-WARN][166] ([Intel XE#3184])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-lnl-5/igt@xe_gt_freq@freq_reset_multiple.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-lnl-2/igt@xe_gt_freq@freq_reset_multiple.html

  * igt@xe_oa@invalid-map-oa-buffer:
    - shard-adlp:         NOTRUN -> [SKIP][167] ([Intel XE#2541]) +2 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-adlp-1/igt@xe_oa@invalid-map-oa-buffer.html

  * igt@xe_oa@rc6-disable:
    - shard-dg2-set2:     NOTRUN -> [SKIP][168] ([Intel XE#2541])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-435/igt@xe_oa@rc6-disable.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-bmg:          NOTRUN -> [SKIP][169] ([Intel XE#1420])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-4/igt@xe_pat@pat-index-xehpc.html
    - shard-lnl:          NOTRUN -> [SKIP][170] ([Intel XE#1420] / [Intel XE#2838])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-lnl-4/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][171] ([Intel XE#2284] / [Intel XE#366])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-435/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@s3-basic:
    - shard-lnl:          NOTRUN -> [SKIP][172] ([Intel XE#584])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-lnl-4/igt@xe_pm@s3-basic.html

  * igt@xe_pm@s4-mocs:
    - shard-adlp:         [PASS][173] -> [ABORT][174] ([Intel XE#1794])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-adlp-3/igt@xe_pm@s4-mocs.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-adlp-9/igt@xe_pm@s4-mocs.html

  * igt@xe_pm_residency@gt-c6-freeze:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][175] ([Intel XE#1727] / [Intel XE#3468])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-6/igt@xe_pm_residency@gt-c6-freeze.html

  * igt@xe_query@multigpu-query-hwconfig:
    - shard-adlp:         NOTRUN -> [SKIP][176] ([Intel XE#944]) +1 other test skip
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-adlp-8/igt@xe_query@multigpu-query-hwconfig.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-bmg:          NOTRUN -> [SKIP][177] ([Intel XE#944]) +1 other test skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-3/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_query@multigpu-query-oa-units:
    - shard-lnl:          NOTRUN -> [SKIP][178] ([Intel XE#944]) +1 other test skip
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-lnl-4/igt@xe_query@multigpu-query-oa-units.html

  * igt@xe_vm@large-split-binds-2147483648:
    - shard-bmg:          [PASS][179] -> [DMESG-WARN][180] ([Intel XE#3468]) +13 other tests dmesg-warn
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-2/igt@xe_vm@large-split-binds-2147483648.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-4/igt@xe_vm@large-split-binds-2147483648.html

  * igt@xe_vm@munmap-style-unbind-either-side-partial-split-page-hammer:
    - shard-bmg:          [PASS][181] -> [DMESG-WARN][182] ([Intel XE#1727]) +2 other tests dmesg-warn
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-6/igt@xe_vm@munmap-style-unbind-either-side-partial-split-page-hammer.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-2/igt@xe_vm@munmap-style-unbind-either-side-partial-split-page-hammer.html

  * igt@xe_vm@munmap-style-unbind-many-either-side-partial:
    - shard-dg2-set2:     NOTRUN -> [SKIP][183] ([Intel XE#1130]) +110 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-434/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html

  * igt@xe_wedged@basic-wedged:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][184] ([Intel XE#2919] / [Intel XE#3086])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-adlp-8/igt@xe_wedged@basic-wedged.html

  
#### Possible fixes ####

  * igt@core_setmaster@master-drop-set-shared-fd:
    - shard-dg2-set2:     [SKIP][185] ([Intel XE#3453]) -> [PASS][186]
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-466/igt@core_setmaster@master-drop-set-shared-fd.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-436/igt@core_setmaster@master-drop-set-shared-fd.html

  * igt@fbdev@unaligned-write:
    - shard-dg2-set2:     [SKIP][187] ([Intel XE#2134]) -> [PASS][188]
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-466/igt@fbdev@unaligned-write.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-436/igt@fbdev@unaligned-write.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:
    - shard-adlp:         [FAIL][189] ([Intel XE#827]) -> [PASS][190] +1 other test pass
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html

  * igt@kms_atomic@plane-invalid-params-fence:
    - shard-dg2-set2:     [SKIP][191] ([Intel XE#2423] / [i915#2575]) -> [PASS][192] +66 other tests pass
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-466/igt@kms_atomic@plane-invalid-params-fence.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-436/igt@kms_atomic@plane-invalid-params-fence.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-adlp:         [FAIL][193] ([Intel XE#1426]) -> [PASS][194] +1 other test pass
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-adlp-8/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-adlp-4/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][195] ([Intel XE#2136]) -> [PASS][196] +18 other tests pass
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@kms_big_fb@4-tiled-addfb-size-overflow.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-463/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-0:
    - shard-bmg:          [DMESG-FAIL][197] ([Intel XE#3468]) -> [PASS][198] +4 other tests pass
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-3/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-6/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p:
    - shard-lnl:          [INCOMPLETE][199] -> [PASS][200] +1 other test pass
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-lnl-6/igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-lnl-6/igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [SKIP][201] ([Intel XE#2136] / [Intel XE#2351]) -> [PASS][202] +4 other tests pass
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-463/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html

  * igt@kms_cursor_edge_walk@128x128-top-edge:
    - shard-dg2-set2:     [INCOMPLETE][203] -> [PASS][204] +1 other test pass
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-433/igt@kms_cursor_edge_walk@128x128-top-edge.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-436/igt@kms_cursor_edge_walk@128x128-top-edge.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][205] ([Intel XE#2291]) -> [PASS][206] +3 other tests pass
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-lnl:          [FAIL][207] ([Intel XE#1475]) -> [PASS][208]
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-lnl-2/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-lnl-4/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_flip@2x-plain-flip:
    - shard-bmg:          [SKIP][209] ([Intel XE#2316]) -> [PASS][210] +4 other tests pass
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-6/igt@kms_flip@2x-plain-flip.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-1/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1:
    - shard-lnl:          [FAIL][211] ([Intel XE#886]) -> [PASS][212] +1 other test pass
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-lnl-2/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2:
    - shard-bmg:          [DMESG-WARN][213] ([Intel XE#3468]) -> [PASS][214] +57 other tests pass
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2-set2:     [INCOMPLETE][215] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][216]
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-433/igt@kms_flip@flip-vs-suspend.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-435/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@d-dp4:
    - shard-dg2-set2:     [INCOMPLETE][217] ([Intel XE#2049]) -> [PASS][218]
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-433/igt@kms_flip@flip-vs-suspend@d-dp4.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-435/igt@kms_flip@flip-vs-suspend@d-dp4.html

  * igt@kms_flip@plain-flip-fb-recreate@c-edp1:
    - shard-lnl:          [FAIL][219] ([Intel XE#3149] / [Intel XE#886]) -> [PASS][220] +2 other tests pass
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-lnl-3/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-lnl-5/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-adlp:         [DMESG-WARN][221] ([Intel XE#2953] / [Intel XE#3086]) -> [PASS][222]
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-3:
    - shard-bmg:          [DMESG-WARN][223] ([Intel XE#877]) -> [PASS][224] +1 other test pass
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-2/igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-3.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-8/igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-3.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-bmg:          [SKIP][225] ([Intel XE#3012]) -> [PASS][226]
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-1/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format:
    - shard-bmg:          [DMESG-WARN][227] ([Intel XE#2566] / [Intel XE#3468]) -> [PASS][228] +1 other test pass
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-1/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-3/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html

  * igt@kms_pm_rpm@legacy-planes-dpms:
    - shard-dg2-set2:     [SKIP][229] ([Intel XE#2446]) -> [PASS][230]
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-466/igt@kms_pm_rpm@legacy-planes-dpms.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-436/igt@kms_pm_rpm@legacy-planes-dpms.html

  * igt@kms_sequence@queue-idle:
    - shard-bmg:          [INCOMPLETE][231] -> [PASS][232] +2 other tests pass
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-3/igt@kms_sequence@queue-idle.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-6/igt@kms_sequence@queue-idle.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:
    - shard-lnl:          [FAIL][233] ([Intel XE#899]) -> [PASS][234]
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-lnl-2/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-dp-2:
    - shard-bmg:          [DMESG-WARN][235] ([Intel XE#1727] / [Intel XE#3468]) -> [PASS][236] +3 other tests pass
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-1/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-dp-2.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-3/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-dp-2.html

  * igt@kms_vblank@wait-forked-busy@pipe-a-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][237] ([Intel XE#3086]) -> [PASS][238] +2 other tests pass
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-adlp-8/igt@kms_vblank@wait-forked-busy@pipe-a-hdmi-a-1.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-adlp-4/igt@kms_vblank@wait-forked-busy@pipe-a-hdmi-a-1.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [TIMEOUT][239] ([Intel XE#1473]) -> [PASS][240]
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-1/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-3/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-rebind:
    - shard-adlp:         [FAIL][241] ([Intel XE#3233]) -> [PASS][242]
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-adlp-4/igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-rebind.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-adlp-2/igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-rebind.html

  * igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate:
    - shard-bmg:          [DMESG-FAIL][243] ([Intel XE#3371] / [Intel XE#3468]) -> [PASS][244]
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-6/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-2/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html
    - shard-lnl:          [DMESG-WARN][245] ([Intel XE#2687] / [Intel XE#3371]) -> [PASS][246]
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-lnl-3/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-lnl-8/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html

  * igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate:
    - shard-lnl:          [DMESG-WARN][247] ([Intel XE#3371]) -> [PASS][248]
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-lnl-5/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-lnl-7/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate.html

  * igt@xe_intel_bb@simple-bb:
    - shard-dg2-set2:     [SKIP][249] ([Intel XE#1130]) -> [PASS][250] +123 other tests pass
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-466/igt@xe_intel_bb@simple-bb.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-436/igt@xe_intel_bb@simple-bb.html

  * igt@xe_module_load@reload:
    - shard-dg2-set2:     [FAIL][251] -> [PASS][252]
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@xe_module_load@reload.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-463/igt@xe_module_load@reload.html

  * igt@xe_module_load@reload-no-display:
    - shard-bmg:          [DMESG-WARN][253] ([Intel XE#3467]) -> [PASS][254] +1 other test pass
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-3/igt@xe_module_load@reload-no-display.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-6/igt@xe_module_load@reload-no-display.html

  * igt@xe_pm@d3hot-multiple-execs:
    - shard-lnl:          [DMESG-WARN][255] ([Intel XE#3184]) -> [PASS][256]
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-lnl-4/igt@xe_pm@d3hot-multiple-execs.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-lnl-1/igt@xe_pm@d3hot-multiple-execs.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-bmg:          [DMESG-WARN][257] ([Intel XE#3468] / [Intel XE#569]) -> [PASS][258]
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-3/igt@xe_pm@s3-d3hot-basic-exec.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-6/igt@xe_pm@s3-d3hot-basic-exec.html

  * igt@xe_pm@s4-basic:
    - shard-adlp:         [ABORT][259] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][260] +1 other test pass
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-adlp-9/igt@xe_pm@s4-basic.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-adlp-1/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-lnl:          [ABORT][261] ([Intel XE#1607] / [Intel XE#1794]) -> [PASS][262]
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-lnl-4/igt@xe_pm@s4-vm-bind-prefetch.html

  
#### Warnings ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-dg2-set2:     [ABORT][263] -> [SKIP][264] ([Intel XE#1885])
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-433/igt@core_hotunplug@hotrebind-lateclose.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-466/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@core_hotunplug@hotreplug:
    - shard-dg2-set2:     [DMESG-WARN][265] ([Intel XE#3468] / [Intel XE#3521]) -> [SKIP][266] ([Intel XE#1885]) +1 other test skip
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-463/igt@core_hotunplug@hotreplug.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-434/igt@core_hotunplug@hotreplug.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2-set2:     [SKIP][267] ([Intel XE#623]) -> [SKIP][268] ([Intel XE#2423] / [i915#2575])
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-463/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-434/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][269] ([Intel XE#316]) -> [SKIP][270] ([Intel XE#2136] / [Intel XE#2351])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-463/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-434/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@linear-16bpp-rotate-180:
    - shard-bmg:          [DMESG-FAIL][271] ([Intel XE#3468]) -> [DMESG-WARN][272] ([Intel XE#3468]) +1 other test dmesg-warn
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-8/igt@kms_big_fb@linear-16bpp-rotate-180.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-4/igt@kms_big_fb@linear-16bpp-rotate-180.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][273] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][274] ([Intel XE#316])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@kms_big_fb@linear-64bpp-rotate-270.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-433/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][275] ([Intel XE#2136]) -> [SKIP][276] ([Intel XE#316]) +2 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-433/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][277] ([Intel XE#316]) -> [SKIP][278] ([Intel XE#2136])
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-435/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-434/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][279] ([Intel XE#1124]) -> [SKIP][280] ([Intel XE#2136]) +5 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-436/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-434/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-dg2-set2:     [SKIP][281] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][282] ([Intel XE#619])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][283] ([Intel XE#607]) -> [SKIP][284] ([Intel XE#2136] / [Intel XE#2351])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-463/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][285] ([Intel XE#610]) -> [SKIP][286] ([Intel XE#2136])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-435/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg2-set2:     [SKIP][287] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][288] ([Intel XE#1124]) +1 other test skip
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][289] ([Intel XE#1124]) -> [SKIP][290] ([Intel XE#2136] / [Intel XE#2351]) +5 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2-set2:     [SKIP][291] ([Intel XE#619]) -> [SKIP][292] ([Intel XE#2136] / [Intel XE#2351])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][293] ([Intel XE#2136]) -> [SKIP][294] ([Intel XE#1124]) +7 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][295] ([Intel XE#2423] / [i915#2575]) -> [SKIP][296] ([Intel XE#367]) +2 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-433/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][297] ([Intel XE#2423] / [i915#2575]) -> [SKIP][298] ([Intel XE#2191]) +1 other test skip
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-436/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][299] ([Intel XE#2191]) -> [SKIP][300] ([Intel XE#2423] / [i915#2575])
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-435/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][301] ([Intel XE#367]) -> [SKIP][302] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-435/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-466/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][303] ([Intel XE#2136]) -> [SKIP][304] ([Intel XE#455] / [Intel XE#787]) +10 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-466/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-436/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][305] ([Intel XE#2136]) -> [SKIP][306] ([Intel XE#2907]) +2 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-466/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-436/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][307] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][308] ([Intel XE#455] / [Intel XE#787])
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-433/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][309] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][310] ([Intel XE#2136] / [Intel XE#2351])
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [SKIP][311] ([Intel XE#2136] / [Intel XE#2351]) -> [INCOMPLETE][312] ([Intel XE#1727] / [Intel XE#3468])
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][313] ([Intel XE#2907]) -> [SKIP][314] ([Intel XE#2136])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][315] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][316] ([Intel XE#2136]) +9 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-dg2-set2:     [SKIP][317] ([Intel XE#2423] / [i915#2575]) -> [SKIP][318] ([Intel XE#306])
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@kms_chamelium_color@ctm-0-25.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-463/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     [SKIP][319] ([Intel XE#306]) -> [SKIP][320] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-435/igt@kms_chamelium_color@gamma.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-434/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@hdmi-mode-timings:
    - shard-dg2-set2:     [SKIP][321] ([Intel XE#373]) -> [SKIP][322] ([Intel XE#2423] / [i915#2575]) +7 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-433/igt@kms_chamelium_edid@hdmi-mode-timings.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-466/igt@kms_chamelium_edid@hdmi-mode-timings.html

  * igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
    - shard-dg2-set2:     [SKIP][323] ([Intel XE#2423] / [i915#2575]) -> [SKIP][324] ([Intel XE#373]) +6 other tests skip
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-466/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-436/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html

  * igt@kms_color@invalid-degamma-lut-sizes:
    - shard-dg2-set2:     [DMESG-WARN][325] ([Intel XE#1727]) -> [SKIP][326] ([Intel XE#2423] / [i915#2575])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-435/igt@kms_color@invalid-degamma-lut-sizes.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-466/igt@kms_color@invalid-degamma-lut-sizes.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [FAIL][327] ([Intel XE#1178]) -> [SKIP][328] ([Intel XE#2341]) +1 other test skip
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-8/igt@kms_content_protection@atomic.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-6/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     [SKIP][329] ([Intel XE#2423] / [i915#2575]) -> [SKIP][330] ([Intel XE#307]) +1 other test skip
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@kms_content_protection@dp-mst-lic-type-0.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-463/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-set2:     [SKIP][331] ([Intel XE#307]) -> [SKIP][332] ([Intel XE#2423] / [i915#2575])
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-433/igt@kms_content_protection@dp-mst-type-0.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-466/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@legacy:
    - shard-dg2-set2:     [SKIP][333] ([Intel XE#2423] / [i915#2575]) -> [FAIL][334] ([Intel XE#1178])
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-466/igt@kms_content_protection@legacy.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-433/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-dg2-set2:     [SKIP][335] ([Intel XE#2423] / [i915#2575]) -> [SKIP][336] ([Intel XE#308])
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-433/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-dg2-set2:     [INCOMPLETE][337] ([Intel XE#3226]) -> [SKIP][338] ([Intel XE#2423] / [i915#2575])
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-435/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-466/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-dg2-set2:     [SKIP][339] ([Intel XE#2423] / [i915#2575]) -> [SKIP][340] ([Intel XE#323])
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-433/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [DMESG-WARN][341] -> [DMESG-WARN][342] ([Intel XE#877])
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-dg2-set2:     [SKIP][343] ([Intel XE#323]) -> [SKIP][344] ([Intel XE#2423] / [i915#2575])
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-463/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_draw_crc@fill-fb:
    - shard-dg2-set2:     [INCOMPLETE][345] -> [SKIP][346] ([Intel XE#2136] / [Intel XE#2351])
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-435/igt@kms_draw_crc@fill-fb.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-434/igt@kms_draw_crc@fill-fb.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-dg2-set2:     [SKIP][347] ([Intel XE#2136]) -> [SKIP][348] ([Intel XE#455]) +4 other tests skip
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@kms_dsc@dsc-with-bpc.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-463/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-dg2-set2:     [SKIP][349] ([Intel XE#2136]) -> [INCOMPLETE][350] ([Intel XE#3468]) +1 other test incomplete
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@kms_fbcon_fbt@fbc-suspend.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-433/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     [SKIP][351] ([Intel XE#2423] / [i915#2575]) -> [SKIP][352] ([Intel XE#701])
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-466/igt@kms_feature_discovery@chamelium.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-433/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2-set2:     [SKIP][353] ([Intel XE#2423] / [i915#2575]) -> [SKIP][354] ([Intel XE#703])
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@kms_feature_discovery@display-3x.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-433/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2-set2:     [SKIP][355] ([Intel XE#1135]) -> [SKIP][356] ([Intel XE#2423] / [i915#2575])
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-436/igt@kms_feature_discovery@psr1.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-434/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-absolute-wf_vblank@ab-dp2-hdmi-a3:
    - shard-bmg:          [DMESG-FAIL][357] -> [DMESG-WARN][358] ([Intel XE#3468])
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-2/igt@kms_flip@2x-absolute-wf_vblank@ab-dp2-hdmi-a3.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-4/igt@kms_flip@2x-absolute-wf_vblank@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-bmg:          [DMESG-WARN][359] ([Intel XE#877]) -> [SKIP][360] ([Intel XE#2316])
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [SKIP][361] ([Intel XE#2316]) -> [FAIL][362] ([Intel XE#2882])
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-lnl:          [FAIL][363] ([Intel XE#886]) -> [FAIL][364] ([Intel XE#3149] / [Intel XE#886])
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-lnl-2/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-panning-interruptible:
    - shard-bmg:          [DMESG-WARN][365] ([Intel XE#3468]) -> [DMESG-WARN][366] ([Intel XE#2705] / [Intel XE#3468])
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-6/igt@kms_flip@flip-vs-panning-interruptible.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-2/igt@kms_flip@flip-vs-panning-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling:
    - shard-dg2-set2:     [INCOMPLETE][367] ([Intel XE#1727] / [Intel XE#3468]) -> [SKIP][368] ([Intel XE#2136])
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-valid-mode:
    - shard-bmg:          [DMESG-WARN][369] ([Intel XE#1727] / [Intel XE#3468]) -> [INCOMPLETE][370] ([Intel XE#1727] / [Intel XE#3468]) +1 other test incomplete
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-valid-mode.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
    - shard-bmg:          [DMESG-WARN][371] ([Intel XE#3468]) -> [INCOMPLETE][372] ([Intel XE#3468]) +1 other test incomplete
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-dg2-set2:     [SKIP][373] ([Intel XE#455]) -> [SKIP][374] ([Intel XE#2136]) +2 other tests skip
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
    - shard-dg2-set2:     [SKIP][375] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][376] ([Intel XE#455])
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-dg2-set2:     [SKIP][377] ([Intel XE#455]) -> [SKIP][378] ([Intel XE#2136] / [Intel XE#2351])
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move:
    - shard-dg2-set2:     [SKIP][379] ([Intel XE#2136]) -> [SKIP][380] ([Intel XE#651]) +10 other tests skip
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][381] ([Intel XE#2311]) -> [SKIP][382] ([Intel XE#2312]) +12 other tests skip
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-slowdraw:
    - shard-dg2-set2:     [SKIP][383] ([Intel XE#651]) -> [SKIP][384] ([Intel XE#2136] / [Intel XE#2351]) +7 other tests skip
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-slowdraw.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-slowdraw.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:
    - shard-bmg:          [DMESG-FAIL][385] ([Intel XE#3468]) -> [FAIL][386] ([Intel XE#2333]) +2 other tests fail
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][387] ([Intel XE#2312]) -> [FAIL][388] ([Intel XE#2333]) +3 other tests fail
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][389] ([Intel XE#2312]) -> [DMESG-FAIL][390] ([Intel XE#3468]) +2 other tests dmesg-fail
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [FAIL][391] ([Intel XE#2333]) -> [SKIP][392] ([Intel XE#2312]) +6 other tests skip
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][393] ([Intel XE#2312]) -> [SKIP][394] ([Intel XE#2311]) +17 other tests skip
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][395] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][396] ([Intel XE#651]) +11 other tests skip
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][397] ([Intel XE#651]) -> [SKIP][398] ([Intel XE#2136]) +15 other tests skip
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][399] ([Intel XE#2312]) -> [SKIP][400] ([Intel XE#2313]) +15 other tests skip
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][401] ([Intel XE#2313]) -> [SKIP][402] ([Intel XE#2312]) +15 other tests skip
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][403] ([Intel XE#2136]) -> [SKIP][404] ([Intel XE#653]) +18 other tests skip
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:
    - shard-dg2-set2:     [SKIP][405] ([Intel XE#653]) -> [SKIP][406] ([Intel XE#2136]) +20 other tests skip
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][407] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][408] ([Intel XE#653]) +6 other tests skip
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][409] ([Intel XE#653]) -> [SKIP][410] ([Intel XE#2136] / [Intel XE#2351]) +5 other tests skip
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-dg2-set2:     [SKIP][411] ([Intel XE#2136]) -> [SKIP][412] ([Intel XE#346])
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@kms_joiner@basic-big-joiner.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-433/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-dg2-set2:     [SKIP][413] ([Intel XE#2925]) -> [SKIP][414] ([Intel XE#2136])
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-433/igt@kms_joiner@basic-force-ultra-joiner.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-466/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-dg2-set2:     [SKIP][415] ([Intel XE#346]) -> [SKIP][416] ([Intel XE#2136])
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-436/igt@kms_joiner@invalid-modeset-big-joiner.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-434/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2-set2:     [SKIP][417] ([Intel XE#356]) -> [SKIP][418] ([Intel XE#2423] / [i915#2575])
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-433/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-466/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb:
    - shard-dg2-set2:     [INCOMPLETE][419] -> [SKIP][420] ([Intel XE#2423] / [i915#2575])
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-436/igt@kms_plane_alpha_blend@alpha-opaque-fb.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-434/igt@kms_plane_alpha_blend@alpha-opaque-fb.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2-set2:     [SKIP][421] ([Intel XE#2423] / [i915#2575]) -> [FAIL][422] ([Intel XE#361])
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
    - shard-dg2-set2:     [SKIP][423] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][424] ([Intel XE#2423] / [i915#2575])
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-dg2-set2:     [SKIP][425] ([Intel XE#870]) -> [SKIP][426] ([Intel XE#2136])
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-435/igt@kms_pm_backlight@basic-brightness.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-434/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg2-set2:     [SKIP][427] ([Intel XE#2136]) -> [SKIP][428] ([Intel XE#870])
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@kms_pm_backlight@fade-with-suspend.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-463/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2-set2:     [SKIP][429] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][430] ([Intel XE#1122])
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-466/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-436/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg2-set2:     [SKIP][431] ([Intel XE#3309]) -> [SKIP][432] ([Intel XE#2136])
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-435/igt@kms_pm_dc@dc5-retention-flops.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-466/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     [SKIP][433] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][434] ([Intel XE#908])
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-466/igt@kms_pm_dc@dc6-dpms.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-433/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg2-set2:     [SKIP][435] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][436] ([Intel XE#1129])
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@kms_pm_dc@dc6-psr.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-433/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@basic-rte:
    - shard-dg2-set2:     [DMESG-WARN][437] ([Intel XE#3468]) -> [ABORT][438] ([Intel XE#3468])
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-436/igt@kms_pm_rpm@basic-rte.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-436/igt@kms_pm_rpm@basic-rte.html

  * igt@kms_pm_rpm@drm-resources-equal:
    - shard-dg2-set2:     [ABORT][439] ([Intel XE#3468]) -> [SKIP][440] ([Intel XE#2446])
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-435/igt@kms_pm_rpm@drm-resources-equal.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-434/igt@kms_pm_rpm@drm-resources-equal.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-dg2-set2:     [DMESG-WARN][441] ([Intel XE#3468]) -> [SKIP][442] ([Intel XE#2446])
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-463/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-434/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-dg2-set2:     [SKIP][443] ([Intel XE#2446]) -> [DMESG-WARN][444] ([Intel XE#2042] / [Intel XE#3468])
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@kms_pm_rpm@system-suspend-modeset.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-463/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][445] ([Intel XE#2136]) -> [SKIP][446] ([Intel XE#1489]) +4 other tests skip
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-433/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-cursor-plane-update-sf:
    - shard-dg2-set2:     [SKIP][447] ([Intel XE#1489]) -> [SKIP][448] ([Intel XE#2136]) +7 other tests skip
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-436/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-434/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     [SKIP][449] ([Intel XE#2136]) -> [SKIP][450] ([Intel XE#1122])
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-466/igt@kms_psr2_su@page_flip-nv12.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-436/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-pr-cursor-blt:
    - shard-dg2-set2:     [SKIP][451] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][452] ([Intel XE#2136] / [Intel XE#2351]) +3 other tests skip
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-436/igt@kms_psr@fbc-pr-cursor-blt.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-434/igt@kms_psr@fbc-pr-cursor-blt.html

  * igt@kms_psr@fbc-psr-cursor-plane-onoff:
    - shard-dg2-set2:     [SKIP][453] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][454] ([Intel XE#2136]) +9 other tests skip
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-435/igt@kms_psr@fbc-psr-cursor-plane-onoff.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-466/igt@kms_psr@fbc-psr-cursor-plane-onoff.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     [SKIP][455] ([Intel XE#2136]) -> [SKIP][456] ([Intel XE#2850] / [Intel XE#929]) +8 other tests skip
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-466/igt@kms_psr@fbc-psr2-primary-render.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-433/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@psr-sprite-blt:
    - shard-dg2-set2:     [SKIP][457] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][458] ([Intel XE#2850] / [Intel XE#929]) +3 other tests skip
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@kms_psr@psr-sprite-blt.html
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-433/igt@kms_psr@psr-sprite-blt.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg2-set2:     [SKIP][459] ([Intel XE#2939]) -> [SKIP][460] ([Intel XE#2136] / [Intel XE#2351])
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-463/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-434/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2-set2:     [SKIP][461] ([Intel XE#2423] / [i915#2575]) -> [SKIP][462] ([Intel XE#3414])
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@kms_rotation_crc@bad-tiling.html
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-433/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][463] ([Intel XE#2423] / [i915#2575]) -> [SKIP][464] ([Intel XE#1127])
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-dg2-set2:     [SKIP][465] ([Intel XE#455]) -> [SKIP][466] ([Intel XE#2423] / [i915#2575]) +6 other tests skip
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-436/igt@kms_scaling_modes@scaling-mode-full-aspect.html
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-434/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][467] ([Intel XE#2509]) -> [SKIP][468] ([Intel XE#2426])
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2-set2:     [SKIP][469] ([Intel XE#330]) -> [SKIP][470] ([Intel XE#2423] / [i915#2575])
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-436/igt@kms_tv_load_detect@load-detect.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-434/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vblank@query-busy:
    - shard-bmg:          [INCOMPLETE][471] ([Intel XE#1727]) -> [INCOMPLETE][472] ([Intel XE#1727] / [Intel XE#3468]) +1 other test incomplete
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-2/igt@kms_vblank@query-busy.html
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-4/igt@kms_vblank@query-busy.html
    - shard-dg2-set2:     [SKIP][473] ([Intel XE#2423] / [i915#2575]) -> [INCOMPLETE][474] ([Intel XE#1727])
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@kms_vblank@query-busy.html
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-433/igt@kms_vblank@query-busy.html

  * igt@kms_vblank@query-forked-busy:
    - shard-bmg:          [DMESG-WARN][475] ([Intel XE#3468]) -> [DMESG-FAIL][476] ([Intel XE#3468]) +2 other tests dmesg-fail
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-6/igt@kms_vblank@query-forked-busy.html
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-2/igt@kms_vblank@query-forked-busy.html

  * igt@kms_vrr@cmrr:
    - shard-dg2-set2:     [SKIP][477] ([Intel XE#2423] / [i915#2575]) -> [SKIP][478] ([Intel XE#2168])
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@kms_vrr@cmrr.html
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-463/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     [SKIP][479] ([Intel XE#2423] / [i915#2575]) -> [SKIP][480] ([Intel XE#455]) +9 other tests skip
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@kms_vrr@flipline.html
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-433/igt@kms_vrr@flipline.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-dg2-set2:     [SKIP][481] ([Intel XE#756]) -> [SKIP][482] ([Intel XE#2423] / [i915#2575])
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-463/igt@kms_writeback@writeback-invalid-parameters.html
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-434/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg2-set2:     [SKIP][483] ([Intel XE#1091] / [Intel XE#2849]) -> [SKIP][484] ([Intel XE#2423] / [i915#2575])
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-436/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-434/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-dg2-set2:     [SKIP][485] ([Intel XE#1130]) -> [SKIP][486] ([Intel XE#1126])
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfd.html
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_eudebug_online@interrupt-all-set-breakpoint:
    - shard-dg2-set2:     [SKIP][487] ([Intel XE#2905]) -> [SKIP][488] ([Intel XE#1130]) +9 other tests skip
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-436/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-434/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html

  * igt@xe_evict@evict-large-multi-vm-cm:
    - shard-dg2-set2:     [FAIL][489] ([Intel XE#1600]) -> [SKIP][490] ([Intel XE#1130])
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-435/igt@xe_evict@evict-large-multi-vm-cm.html
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-434/igt@xe_evict@evict-large-multi-vm-cm.html

  * igt@xe_exec_basic@many-userptr-invalidate-race:
    - shard-dg2-set2:     [DMESG-WARN][491] ([Intel XE#1727]) -> [SKIP][492] ([Intel XE#1130]) +2 other tests skip
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-436/igt@xe_exec_basic@many-userptr-invalidate-race.html
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-434/igt@xe_exec_basic@many-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:
    - shard-dg2-set2:     [SKIP][493] ([Intel XE#288]) -> [SKIP][494] ([Intel XE#1130]) +22 other tests skip
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-435/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-466/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     [SKIP][495] ([Intel XE#1130]) -> [SKIP][496] ([Intel XE#288]) +22 other tests skip
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-436/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     [SKIP][497] ([Intel XE#1130]) -> [SKIP][498] ([Intel XE#2360])
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-466/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-433/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_exec_sip_eudebug@breakpoint-writesip:
    - shard-dg2-set2:     [SKIP][499] ([Intel XE#1130]) -> [SKIP][500] ([Intel XE#2905]) +7 other tests skip
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@xe_exec_sip_eudebug@breakpoint-writesip.html
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-433/igt@xe_exec_sip_eudebug@breakpoint-writesip.html

  * igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate:
    - shard-dg2-set2:     [SKIP][501] ([Intel XE#1130]) -> [DMESG-WARN][502] ([Intel XE#3515])
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-466/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate.html
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-433/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:
    - shard-bmg:          [DMESG-WARN][503] ([Intel XE#3343] / [Intel XE#3468]) -> [DMESG-WARN][504] ([Intel XE#3343])
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early:
    - shard-bmg:          [DMESG-WARN][505] ([Intel XE#3467]) -> [DMESG-WARN][506] ([Intel XE#3467] / [Intel XE#3468]) +2 other tests dmesg-warn
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init:
    - shard-dg2-set2:     [DMESG-WARN][507] ([Intel XE#3467]) -> [SKIP][508] ([Intel XE#1130]) +3 other tests skip
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-463/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init.html
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-434/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:
    - shard-dg2-set2:     [SKIP][509] ([Intel XE#1130]) -> [DMESG-WARN][510] ([Intel XE#3343]) +2 other tests dmesg-warn
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-433/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html

  * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create:
    - shard-dg2-set2:     [SKIP][511] ([Intel XE#1130]) -> [DMESG-WARN][512] ([Intel XE#3467])
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-466/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-436/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html

  * igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc:
    - shard-bmg:          [DMESG-FAIL][513] ([Intel XE#3467]) -> [DMESG-FAIL][514] ([Intel XE#3467] / [Intel XE#3468])
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-8/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html

  * igt@xe_oa@disabled-read-error:
    - shard-dg2-set2:     [SKIP][515] ([Intel XE#1130]) -> [SKIP][516] ([Intel XE#2541]) +4 other tests skip
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-466/igt@xe_oa@disabled-read-error.html
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-436/igt@xe_oa@disabled-read-error.html

  * igt@xe_oa@whitelisted-registers-userspace-config:
    - shard-dg2-set2:     [SKIP][517] ([Intel XE#2541]) -> [SKIP][518] ([Intel XE#1130]) +9 other tests skip
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-435/igt@xe_oa@whitelisted-registers-userspace-config.html
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-434/igt@xe_oa@whitelisted-registers-userspace-config.html

  * igt@xe_pat@pat-index-xe2:
    - shard-dg2-set2:     [SKIP][519] ([Intel XE#1130]) -> [SKIP][520] ([Intel XE#2839] / [Intel XE#977])
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@xe_pat@pat-index-xe2.html
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-433/igt@xe_pat@pat-index-xe2.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     [FAIL][521] ([Intel XE#1173]) -> [SKIP][522] ([Intel XE#1061])
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-433/igt@xe_peer2peer@read.html
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-466/igt@xe_peer2peer@read.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][523] ([Intel XE#1130]) -> [SKIP][524] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-466/igt@xe_pm@d3cold-basic-exec.html
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-436/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@d3hot-mmap-system:
    - shard-dg2-set2:     [DMESG-WARN][525] ([Intel XE#3468]) -> [SKIP][526] ([Intel XE#1130]) +2 other tests skip
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-463/igt@xe_pm@d3hot-mmap-system.html
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-434/igt@xe_pm@d3hot-mmap-system.html

  * igt@xe_pm@s2idle-vm-bind-prefetch:
    - shard-bmg:          [DMESG-WARN][527] ([Intel XE#1616] / [Intel XE#3468]) -> [DMESG-FAIL][528] ([Intel XE#3468])
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-bmg-6/igt@xe_pm@s2idle-vm-bind-prefetch.html
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-bmg-2/igt@xe_pm@s2idle-vm-bind-prefetch.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][529] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][530] ([Intel XE#1130])
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-435/igt@xe_pm@s3-d3cold-basic-exec.html
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-466/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-dg2-set2:     [SKIP][531] ([Intel XE#1130]) -> [DMESG-WARN][532] ([Intel XE#3468])
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-434/igt@xe_pm@s4-multiple-execs.html
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-433/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-dg2-set2:     [SKIP][533] ([Intel XE#944]) -> [SKIP][534] ([Intel XE#1130]) +3 other tests skip
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-436/igt@xe_query@multigpu-query-uc-fw-version-guc.html
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-434/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-dg2-set2:     [SKIP][535] ([Intel XE#1130]) -> [SKIP][536] ([Intel XE#944]) +1 other test skip
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-466/igt@xe_query@multigpu-query-uc-fw-version-huc.html
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-436/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  * igt@xe_vm@large-split-misaligned-binds-33554432:
    - shard-dg2-set2:     [DMESG-WARN][537] -> [SKIP][538] ([Intel XE#1130]) +2 other tests skip
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/shard-dg2-436/igt@xe_vm@large-split-misaligned-binds-33554432.html
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/shard-dg2-434/igt@xe_vm@large-split-misaligned-binds-33554432.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159
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
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2550]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2687]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2687
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
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3184]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184
  [Intel XE#3226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3233
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343
  [Intel XE#3371]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3371
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3440]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3440
  [Intel XE#3453]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3453
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467
  [Intel XE#3468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468
  [Intel XE#3486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3486
  [Intel XE#3487]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3487
  [Intel XE#3499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3499
  [Intel XE#3515]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3515
  [Intel XE#3521]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3521
  [Intel XE#3539]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3539
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
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
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * Linux: xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed -> xe-pw-141501v3

  IGT_8118: 17707095f1e5d3c30f463b43022f01c0160579b6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed: 6992ee4b9cd5a553e6e429e58b97abedf546e3ed
  xe-pw-141501v3: 141501v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/index.html
