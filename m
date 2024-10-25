Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA7EDD149E8
	for <intel-xe@archiver.kernel.org>; Fri, 25 Oct 2024 20:04:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95BF510E0FD;
	Fri, 25 Oct 2024 20:04:11 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21FBD10E0FD;
 Fri, 25 Oct 2024 20:04:10 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5697144132233050651=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_mm/migrate=3A_Add_migrate=5Fdev?=
 =?utf-8?q?ice=5Fpfns?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 25 Oct 2024 20:04:10 -0000
Message-ID: <172988665012.1334310.2380907840460066400@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241023233944.1798835-1-matthew.brost@intel.com>
In-Reply-To: <20241023233944.1798835-1-matthew.brost@intel.com>
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

--===============5697144132233050651==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: mm/migrate: Add migrate_device_pfns
URL   : https://patchwork.freedesktop.org/series/140403/
State : failure

== Summary ==

CI Bug Log - changes from xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88_full -> xe-pw-140403v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-140403v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-140403v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-140403v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@core_getversion@basic:
    - shard-bmg:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-bmg-5/igt@core_getversion@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-bmg-5/igt@core_getversion@basic.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp2:
    - shard-bmg:          [PASS][3] -> [INCOMPLETE][4] +2 other tests incomplete
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-bmg-6/igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp2.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-bmg-6/igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp2.html

  * igt@kms_properties@connector-properties-legacy:
    - shard-bmg:          [PASS][5] -> [SKIP][6] +19 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-bmg-5/igt@kms_properties@connector-properties-legacy.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-bmg-5/igt@kms_properties@connector-properties-legacy.html

  * igt@xe_exec_balancer@many-cm-parallel-basic:
    - shard-adlp:         [PASS][7] -> [DMESG-WARN][8] +7 other tests dmesg-warn
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-adlp-8/igt@xe_exec_balancer@many-cm-parallel-basic.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-adlp-6/igt@xe_exec_balancer@many-cm-parallel-basic.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-imm:
    - shard-bmg:          [PASS][9] -> [DMESG-WARN][10] +14 other tests dmesg-warn
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-bmg-7/igt@xe_exec_fault_mode@many-bindexecqueue-imm.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-bmg-4/igt@xe_exec_fault_mode@many-bindexecqueue-imm.html

  * igt@xe_exec_fault_mode@many-invalid-fault:
    - shard-lnl:          [PASS][11] -> [DMESG-WARN][12] +10 other tests dmesg-warn
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-lnl-4/igt@xe_exec_fault_mode@many-invalid-fault.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-6/igt@xe_exec_fault_mode@many-invalid-fault.html

  * igt@xe_exec_threads@threads-bal-mixed-fd-basic:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][13]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-adlp-1/igt@xe_exec_threads@threads-bal-mixed-fd-basic.html

  * igt@xe_exec_threads@threads-bal-mixed-userptr:
    - shard-dg2-set2:     [PASS][14] -> [DMESG-WARN][15] +5 other tests dmesg-warn
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-dg2-466/igt@xe_exec_threads@threads-bal-mixed-userptr.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-dg2-436/igt@xe_exec_threads@threads-bal-mixed-userptr.html

  
#### Warnings ####

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-bmg:          [SKIP][16] ([Intel XE#1124]) -> [SKIP][17]
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-bmg:          [SKIP][18] ([Intel XE#2252]) -> [SKIP][19] +2 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-bmg-5/igt@kms_chamelium_hpd@vga-hpd-fast.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-bmg-5/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_cursor_crc@cursor-onscreen-64x21:
    - shard-bmg:          [SKIP][20] ([Intel XE#2320]) -> [SKIP][21] +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-64x21.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-64x21.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-bmg:          [SKIP][22] ([Intel XE#2244]) -> [SKIP][23]
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-bmg-5/igt@kms_dsc@dsc-with-formats.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-bmg-5/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_feature_discovery@display-4x:
    - shard-bmg:          [SKIP][24] ([Intel XE#1138]) -> [SKIP][25]
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-bmg-5/igt@kms_feature_discovery@display-4x.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-bmg-5/igt@kms_feature_discovery@display-4x.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [FAIL][26] ([Intel XE#2333]) -> [SKIP][27] +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][28] ([Intel XE#2311]) -> [SKIP][29]
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-blt.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][30] ([Intel XE#2313]) -> [SKIP][31]
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          [SKIP][32] ([Intel XE#2938]) -> [SKIP][33]
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-bmg-5/igt@kms_pm_backlight@brightness-with-dpms.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-bmg-5/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - shard-bmg:          [SKIP][34] ([Intel XE#1489]) -> [SKIP][35]
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-bmg-5/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-bmg-5/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-bmg:          [SKIP][36] ([Intel XE#1499]) -> [SKIP][37]
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-bmg-5/igt@kms_vrr@flip-basic-fastset.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-bmg-5/igt@kms_vrr@flip-basic-fastset.html

  * igt@xe_wedged@basic-wedged:
    - shard-dg2-set2:     [DMESG-WARN][38] ([Intel XE#2919]) -> [ABORT][39]
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-dg2-433/igt@xe_wedged@basic-wedged.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-dg2-466/igt@xe_wedged@basic-wedged.html

  
Known issues
------------

  Here are the changes found in xe-pw-140403v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@intel_hwmon@hwmon-read:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#1125])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-8/igt@intel_hwmon@hwmon-read.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking:
    - shard-lnl:          [PASS][41] -> [FAIL][42] ([Intel XE#1701]) +1 other test fail
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-lnl-1/igt@kms_atomic_transition@modeset-transition-nonblocking.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-7/igt@kms_atomic_transition@modeset-transition-nonblocking.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#1124]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-adlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-bmg:          [PASS][44] -> [SKIP][45] ([Intel XE#2890])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#316]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-adlp-1/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#1124]) +2 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-8/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#2191])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-8/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][49] ([Intel XE#2191])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-adlp-1/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#367])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-8/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-adlp-1/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][52] ([Intel XE#787]) +2 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-adlp-1/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#2887]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-8/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][54] ([Intel XE#2907])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-adlp-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#2669]) +3 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-8/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [PASS][56] -> [INCOMPLETE][57] ([Intel XE#1195] / [Intel XE#1727])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [PASS][58] -> [DMESG-WARN][59] ([Intel XE#3113])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [PASS][60] -> [INCOMPLETE][61] ([Intel XE#1195] / [Intel XE#2692])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [PASS][62] -> [INCOMPLETE][63] ([Intel XE#1195]) +3 other tests incomplete
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_cdclk@plane-scaling:
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#1152]) +3 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-8/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
    - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#373]) +2 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-adlp-1/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html

  * igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
    - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#373]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-8/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-adlp:         NOTRUN -> [SKIP][67] ([Intel XE#307])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-adlp-1/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#2321])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-8/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#309]) +2 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-adlp:         NOTRUN -> [SKIP][70] ([Intel XE#309])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-adlp-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-adlp:         [PASS][71] -> [FAIL][72] ([Intel XE#1475])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-adlp-2/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-adlp-1/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-adlp:         NOTRUN -> [SKIP][73] ([Intel XE#323])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-adlp-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions:
    - shard-lnl:          NOTRUN -> [FAIL][74] ([Intel XE#1541])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-8/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions.html

  * igt@kms_display_modes@extended-mode-basic@pipe-c-dp-2-pipe-a-hdmi-a-3:
    - shard-bmg:          [PASS][75] -> [DMESG-WARN][76] ([Intel XE#877]) +1 other test dmesg-warn
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-bmg-3/igt@kms_display_modes@extended-mode-basic@pipe-c-dp-2-pipe-a-hdmi-a-3.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-bmg-1/igt@kms_display_modes@extended-mode-basic@pipe-c-dp-2-pipe-a-hdmi-a-3.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#2244])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-8/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-adlp:         NOTRUN -> [SKIP][78] ([Intel XE#310])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-adlp-1/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          [PASS][79] -> [FAIL][80] ([Intel XE#301]) +3 other tests fail
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
    - shard-bmg:          [PASS][81] -> [FAIL][82] ([Intel XE#2882]) +1 other test fail
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-bmg-4/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#1421])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-8/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@blocking-wf_vblank@a-hdmi-a1:
    - shard-adlp:         [PASS][84] -> [FAIL][85] ([Intel XE#2882]) +1 other test fail
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-adlp-2/igt@kms_flip@blocking-wf_vblank@a-hdmi-a1.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-adlp-3/igt@kms_flip@blocking-wf_vblank@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-bmg:          [PASS][86] -> [INCOMPLETE][87] ([Intel XE#2635])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-bmg-6/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-bmg-6/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:
    - shard-dg2-set2:     [PASS][88] -> [FAIL][89] ([Intel XE#301]) +6 other tests fail
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1:
    - shard-lnl:          [PASS][90] -> [FAIL][91] ([Intel XE#886]) +4 other tests fail
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-lnl-5/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-2/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#1397] / [Intel XE#1745]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][93] ([Intel XE#1397]) +1 other test skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-adlp:         NOTRUN -> [SKIP][94] ([Intel XE#455]) +5 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#1401] / [Intel XE#1745])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][96] ([Intel XE#1401])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:
    - shard-adlp:         [PASS][97] -> [FAIL][98] ([Intel XE#1874]) +1 other test fail
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][99] ([Intel XE#651]) +2 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#651]) +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-adlp:         NOTRUN -> [SKIP][101] ([Intel XE#656]) +7 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][102] ([Intel XE#656]) +4 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][103] ([Intel XE#3012])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-adlp-1/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#2934])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-8/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b:
    - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#2763]) +3 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-8/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-bmg:          [PASS][106] -> [SKIP][107] ([Intel XE#2446]) +1 other test skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-bmg-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-bmg-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
    - shard-lnl:          NOTRUN -> [SKIP][108] ([Intel XE#2893])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-8/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-adlp:         NOTRUN -> [SKIP][109] ([Intel XE#1489]) +1 other test skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-adlp-1/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr@fbc-pr-sprite-plane-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][110] ([Intel XE#1406]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-8/igt@kms_psr@fbc-pr-sprite-plane-onoff.html

  * igt@kms_psr@pr-cursor-plane-onoff:
    - shard-adlp:         NOTRUN -> [SKIP][111] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-adlp-1/igt@kms_psr@pr-cursor-plane-onoff.html

  * igt@kms_psr@psr2-cursor-plane-onoff:
    - shard-lnl:          [PASS][112] -> [FAIL][113] ([Intel XE#2948]) +1 other test fail
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-lnl-7/igt@kms_psr@psr2-cursor-plane-onoff.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-5/igt@kms_psr@psr2-cursor-plane-onoff.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-lnl:          NOTRUN -> [SKIP][114] ([Intel XE#1437])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-8/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [PASS][115] -> [FAIL][116] ([Intel XE#899])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@xe_eudebug_online@debugger-reopen:
    - shard-adlp:         NOTRUN -> [SKIP][117] ([Intel XE#2905]) +1 other test skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-adlp-1/igt@xe_eudebug_online@debugger-reopen.html

  * igt@xe_eudebug_online@resume-dss:
    - shard-lnl:          NOTRUN -> [SKIP][118] ([Intel XE#2905]) +1 other test skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-8/igt@xe_eudebug_online@resume-dss.html

  * igt@xe_evict@evict-beng-small-multi-vm:
    - shard-adlp:         NOTRUN -> [SKIP][119] ([Intel XE#261] / [Intel XE#688]) +2 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-adlp-1/igt@xe_evict@evict-beng-small-multi-vm.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-lnl:          NOTRUN -> [SKIP][120] ([Intel XE#688]) +1 other test skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-8/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [PASS][121] -> [INCOMPLETE][122] ([Intel XE#1473])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-bmg-7/igt@xe_evict@evict-mixed-many-threads-small.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html
    - shard-dg2-set2:     [PASS][123] -> [TIMEOUT][124] ([Intel XE#1473]) +1 other test timeout
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-dg2-463/igt@xe_evict@evict-mixed-many-threads-small.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr:
    - shard-bmg:          [PASS][125] -> [SKIP][126] ([Intel XE#1130]) +39 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-bmg-5/igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-bmg-5/igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][127] ([Intel XE#1392]) +1 other test skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-adlp-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:
    - shard-lnl:          NOTRUN -> [SKIP][128] ([Intel XE#1392])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html

  * igt@xe_exec_compute_mode@many-userptr-invalidate-race:
    - shard-lnl:          [PASS][129] -> [DMESG-WARN][130] ([Intel XE#2687])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-lnl-4/igt@xe_exec_compute_mode@many-userptr-invalidate-race.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-6/igt@xe_exec_compute_mode@many-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm:
    - shard-adlp:         NOTRUN -> [SKIP][131] ([Intel XE#288]) +4 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-adlp-1/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm.html

  * igt@xe_exec_fault_mode@twice-invalid-fault:
    - shard-lnl:          [PASS][132] -> [DMESG-WARN][133] ([Intel XE#3230]) +1 other test dmesg-warn
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-lnl-7/igt@xe_exec_fault_mode@twice-invalid-fault.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-5/igt@xe_exec_fault_mode@twice-invalid-fault.html

  * igt@xe_exec_reset@cm-close-fd-no-exec:
    - shard-bmg:          [PASS][134] -> [DMESG-WARN][135] ([Intel XE#3230])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-bmg-6/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-bmg-1/igt@xe_exec_reset@cm-close-fd-no-exec.html

  * igt@xe_exec_threads@threads-hang-rebind:
    - shard-adlp:         [PASS][136] -> [DMESG-WARN][137] ([Intel XE#358]) +6 other tests dmesg-warn
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-adlp-2/igt@xe_exec_threads@threads-hang-rebind.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-adlp-9/igt@xe_exec_threads@threads-hang-rebind.html

  * igt@xe_exec_threads@threads-hang-shared-vm-rebind:
    - shard-dg2-set2:     [PASS][138] -> [DMESG-WARN][139] ([Intel XE#358]) +6 other tests dmesg-warn
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-dg2-463/igt@xe_exec_threads@threads-hang-shared-vm-rebind.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-dg2-433/igt@xe_exec_threads@threads-hang-shared-vm-rebind.html

  * igt@xe_exec_threads@threads-mixed-shared-vm-basic:
    - shard-dg2-set2:     [PASS][140] -> [DMESG-WARN][141] ([Intel XE#3230]) +1 other test dmesg-warn
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-dg2-435/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-dg2-434/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html

  * igt@xe_live_ktest@xe_bo:
    - shard-adlp:         [PASS][142] -> [SKIP][143] ([Intel XE#1192]) +1 other test skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-adlp-3/igt@xe_live_ktest@xe_bo.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-adlp-3/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_migrate:
    - shard-dg2-set2:     [PASS][144] -> [SKIP][145] ([Intel XE#1192])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-dg2-433/igt@xe_live_ktest@xe_migrate.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-dg2-436/igt@xe_live_ktest@xe_migrate.html
    - shard-lnl:          [PASS][146] -> [SKIP][147] ([Intel XE#1192])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-lnl-5/igt@xe_live_ktest@xe_migrate.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-2/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_oa@stress-open-close:
    - shard-adlp:         NOTRUN -> [SKIP][148] ([Intel XE#2541]) +1 other test skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-adlp-1/igt@xe_oa@stress-open-close.html

  * igt@xe_oa@unprivileged-single-ctx-counters:
    - shard-lnl:          NOTRUN -> [SKIP][149] ([Intel XE#2248])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-8/igt@xe_oa@unprivileged-single-ctx-counters.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-lnl:          NOTRUN -> [SKIP][150] ([Intel XE#584])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-8/igt@xe_pm@s3-multiple-execs.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-lnl:          [PASS][151] -> [ABORT][152] ([Intel XE#1607] / [Intel XE#1794])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-lnl-6/igt@xe_pm@s4-vm-bind-prefetch.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_query@multigpu-query-topology:
    - shard-adlp:         NOTRUN -> [SKIP][153] ([Intel XE#944])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-adlp-1/igt@xe_query@multigpu-query-topology.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1:
    - shard-adlp:         [DMESG-FAIL][154] ([Intel XE#1033] / [Intel XE#1727] / [Intel XE#3194]) -> [PASS][155]
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1.html

  * igt@kms_atomic_transition@plane-all-transition-fencing:
    - shard-adlp:         [DMESG-WARN][156] ([Intel XE#3086]) -> [PASS][157]
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-adlp-1/igt@kms_atomic_transition@plane-all-transition-fencing.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-adlp-2/igt@kms_atomic_transition@plane-all-transition-fencing.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-adlp:         [FAIL][158] ([Intel XE#1426]) -> [PASS][159] +1 other test pass
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-adlp-4/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-adlp-2/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_color@ctm-red-to-blue:
    - shard-lnl:          [DMESG-WARN][160] ([Intel XE#2929]) -> [PASS][161]
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-lnl-1/igt@kms_color@ctm-red-to-blue.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-7/igt@kms_color@ctm-red-to-blue.html

  * igt@kms_cursor_legacy@torture-bo:
    - shard-dg2-set2:     [DMESG-WARN][162] ([Intel XE#3184]) -> [PASS][163]
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-dg2-436/igt@kms_cursor_legacy@torture-bo.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-dg2-466/igt@kms_cursor_legacy@torture-bo.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][164] ([Intel XE#301]) -> [PASS][165] +2 other tests pass
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][166] ([Intel XE#301]) -> [PASS][167]
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html

  * igt@kms_flip@wf_vblank-ts-check@b-edp1:
    - shard-lnl:          [FAIL][168] ([Intel XE#886]) -> [PASS][169] +5 other tests pass
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-lnl-7/igt@kms_flip@wf_vblank-ts-check@b-edp1.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-5/igt@kms_flip@wf_vblank-ts-check@b-edp1.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [FAIL][170] ([Intel XE#1430]) -> [PASS][171]
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-lnl-8/igt@kms_pm_dc@dc6-dpms.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html
    - shard-adlp:         [FAIL][172] ([Intel XE#718]) -> [PASS][173]
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-adlp-2/igt@kms_pm_dc@dc6-dpms.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-adlp:         [DMESG-WARN][174] -> [PASS][175]
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-adlp-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-adlp-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_sequence@queue-busy:
    - shard-lnl:          [FAIL][176] ([Intel XE#2467]) -> [PASS][177] +1 other test pass
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-lnl-5/igt@kms_sequence@queue-busy.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-2/igt@kms_sequence@queue-busy.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:
    - shard-lnl:          [FAIL][178] ([Intel XE#899]) -> [PASS][179]
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html

  * igt@kms_vrr@flip-suspend@pipe-a-edp-1:
    - shard-lnl:          [FAIL][180] ([Intel XE#2443]) -> [PASS][181] +3 other tests pass
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-lnl-1/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-7/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html

  * igt@xe_ccs@suspend-resume:
    - shard-lnl:          [INCOMPLETE][182] ([Intel XE#1616] / [Intel XE#2771]) -> [PASS][183]
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-lnl-2/igt@xe_ccs@suspend-resume.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-8/igt@xe_ccs@suspend-resume.html

  * igt@xe_ccs@suspend-resume@tile4-compressed-compfmt0-system-system:
    - shard-lnl:          [INCOMPLETE][184] ([Intel XE#2771]) -> [PASS][185]
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-lnl-2/igt@xe_ccs@suspend-resume@tile4-compressed-compfmt0-system-system.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-8/igt@xe_ccs@suspend-resume@tile4-compressed-compfmt0-system-system.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:
    - shard-dg2-set2:     [DMESG-WARN][186] -> [PASS][187] +1 other test pass
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-dg2-466/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-dg2-434/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html

  * igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate:
    - shard-lnl:          [FAIL][188] ([Intel XE#2754]) -> [PASS][189]
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-lnl-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-4/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-bmg:          [INCOMPLETE][190] ([Intel XE#2105]) -> [PASS][191]
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-bmg-1/igt@xe_exec_reset@parallel-gt-reset.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-bmg-5/igt@xe_exec_reset@parallel-gt-reset.html
    - shard-dg2-set2:     [TIMEOUT][192] ([Intel XE#2105]) -> [PASS][193]
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-dg2-433/igt@xe_exec_reset@parallel-gt-reset.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-dg2-435/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_oa@rc6-disable:
    - shard-lnl:          [DMESG-WARN][194] -> [PASS][195] +1 other test pass
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-lnl-2/igt@xe_oa@rc6-disable.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-4/igt@xe_oa@rc6-disable.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-adlp:         [ABORT][196] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][197]
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-adlp-1/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          [FAIL][198] ([Intel XE#958]) -> [PASS][199]
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-lnl-3/igt@xe_pm_residency@toggle-gt-c6.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-1/igt@xe_pm_residency@toggle-gt-c6.html

  
#### Warnings ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-adlp:         [DMESG-FAIL][200] ([Intel XE#1033] / [Intel XE#1727] / [Intel XE#3194]) -> [DMESG-WARN][201] ([Intel XE#3194])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-adlp:         [FAIL][202] ([Intel XE#1231] / [Intel XE#1242]) -> [DMESG-FAIL][203] ([Intel XE#3194]) +1 other test dmesg-fail
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][204] ([Intel XE#3194]) -> [FAIL][205] ([Intel XE#1231] / [Intel XE#1242]) +1 other test fail
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
    - shard-bmg:          [SKIP][206] ([Intel XE#1124]) -> [SKIP][207] ([Intel XE#2890]) +1 other test skip
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-bmg-5/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-bmg-5/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:
    - shard-bmg:          [SKIP][208] ([Intel XE#2887]) -> [SKIP][209] ([Intel XE#2890]) +3 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-bmg-5/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-bmg-5/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank:
    - shard-lnl:          [FAIL][210] ([Intel XE#2422] / [Intel XE#886]) -> [FAIL][211] ([Intel XE#886])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-lnl-4/igt@kms_flip@flip-vs-blocking-wf-vblank.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-6/igt@kms_flip@flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1:
    - shard-lnl:          [FAIL][212] ([Intel XE#2422]) -> [FAIL][213] ([Intel XE#886])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-lnl-4/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-6/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][214] ([Intel XE#2311]) -> [SKIP][215] ([Intel XE#2890]) +2 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-linear:
    - shard-bmg:          [FAIL][216] ([Intel XE#2333]) -> [SKIP][217] ([Intel XE#2890]) +1 other test skip
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:
    - shard-bmg:          [SKIP][218] ([Intel XE#2313]) -> [SKIP][219] ([Intel XE#2890]) +6 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_psr@pr-sprite-render:
    - shard-bmg:          [SKIP][220] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][221] ([Intel XE#2890]) +2 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-bmg-5/igt@kms_psr@pr-sprite-render.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-bmg-5/igt@kms_psr@pr-sprite-render.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [SKIP][222] ([Intel XE#362]) -> [FAIL][223] ([Intel XE#1729])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][224] ([Intel XE#2509]) -> [SKIP][225] ([Intel XE#2426])
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-sram:
    - shard-bmg:          [SKIP][226] ([Intel XE#2905]) -> [SKIP][227] ([Intel XE#1130])
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-bmg-5/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-sram.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-bmg-5/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-sram.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind:
    - shard-bmg:          [SKIP][228] ([Intel XE#2322]) -> [SKIP][229] ([Intel XE#1130])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-bmg:          [SKIP][230] ([Intel XE#944]) -> [SKIP][231] ([Intel XE#1130])
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-bmg-5/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-bmg-5/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1242]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1541
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
  [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2105]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2422
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2467
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2635]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2687]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2687
  [Intel XE#2692]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2692
  [Intel XE#2754]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2754
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2771
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2890]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2919]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919
  [Intel XE#2929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2929
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#3086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3184]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184
  [Intel XE#3194]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3230]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230
  [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958


Build changes
-------------

  * Linux: xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88 -> xe-pw-140403v1

  IGT_8082: c8379ec8b26f3c21bae5473706b23da78bd26ffa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88: 0cd3ccdcf9525b9d2f822df5f8d16b552753cf88
  xe-pw-140403v1: 140403v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/index.html

--===============5697144132233050651==
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
<tr><td><b>Series:</b></td><td>mm/migrate: Add migrate_device_pfns</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140403/">https://patchwork.freedesktop.org/series/140403/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88_full -&gt; xe-pw-140403v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-140403v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-140403v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-140403v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_getversion@basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-bmg-5/igt@core_getversion@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-bmg-5/igt@core_getversion@basic.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-bmg-6/igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-bmg-6/igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp2.html">INCOMPLETE</a> +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-bmg-5/igt@kms_properties@connector-properties-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-bmg-5/igt@kms_properties@connector-properties-legacy.html">SKIP</a> +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-cm-parallel-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-adlp-8/igt@xe_exec_balancer@many-cm-parallel-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-adlp-6/igt@xe_exec_balancer@many-cm-parallel-basic.html">DMESG-WARN</a> +7 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-imm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-bmg-7/igt@xe_exec_fault_mode@many-bindexecqueue-imm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-bmg-4/igt@xe_exec_fault_mode@many-bindexecqueue-imm.html">DMESG-WARN</a> +14 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-invalid-fault:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-lnl-4/igt@xe_exec_fault_mode@many-invalid-fault.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-6/igt@xe_exec_fault_mode@many-invalid-fault.html">DMESG-WARN</a> +10 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-fd-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-adlp-1/igt@xe_exec_threads@threads-bal-mixed-fd-basic.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-dg2-466/igt@xe_exec_threads@threads-bal-mixed-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-dg2-436/igt@xe_exec_threads@threads-bal-mixed-userptr.html">DMESG-WARN</a> +5 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-bmg-5/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-bmg-5/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-64x21:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-64x21.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-bmg-5/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-bmg-5/igt@kms_dsc@dsc-with-formats.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-bmg-5/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-bmg-5/igt@kms_feature_discovery@display-4x.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-bmg-5/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-bmg-5/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-bmg-5/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-bmg-5/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-bmg-5/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-bmg-5/igt@kms_vrr@flip-basic-fastset.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-dg2-433/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919">Intel XE#2919</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-dg2-466/igt@xe_wedged@basic-wedged.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-140403v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-8/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125">Intel XE#1125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-lnl-1/igt@kms_atomic_transition@modeset-transition-nonblocking.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-7/igt@kms_atomic_transition@modeset-transition-nonblocking.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701">Intel XE#1701</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-adlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-adlp-1/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-8/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-8/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-adlp-1/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-8/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-adlp-1/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-adlp-1/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-8/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-adlp-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-8/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2692">Intel XE#2692</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +3 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-8/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152">Intel XE#1152</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-adlp-1/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-8/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-adlp-1/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-8/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-adlp-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-adlp-2/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-adlp-1/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-adlp-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-8/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1541">Intel XE#1541</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic@pipe-c-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-bmg-3/igt@kms_display_modes@extended-mode-basic@pipe-c-dp-2-pipe-a-hdmi-a-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-bmg-1/igt@kms_display_modes@extended-mode-basic@pipe-c-dp-2-pipe-a-hdmi-a-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-8/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-adlp-1/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-bmg-4/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-8/igt@kms_flip@2x-modeset-vs-vblank-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-adlp-2/igt@kms_flip@blocking-wf_vblank@a-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-adlp-3/igt@kms_flip@blocking-wf_vblank@a-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-bmg-6/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-bmg-6/igt@kms_flip@flip-vs-absolute-wf_vblank.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635">Intel XE#2635</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-lnl-5/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-2/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-adlp-1/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-8/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934">Intel XE#2934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-8/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-bmg-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-bmg-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-8/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-adlp-1/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-plane-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-8/igt@kms_psr@fbc-pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-plane-onoff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-adlp-1/igt@kms_psr@pr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-lnl-7/igt@kms_psr@psr2-cursor-plane-onoff.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-5/igt@kms_psr@psr2-cursor-plane-onoff.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948">Intel XE#2948</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-8/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437">Intel XE#1437</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@debugger-reopen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-adlp-1/igt@xe_eudebug_online@debugger-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@resume-dss:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-8/igt@xe_eudebug_online@resume-dss.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-multi-vm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-adlp-1/igt@xe_evict@evict-beng-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-8/igt@xe_evict@evict-beng-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-bmg-7/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-dg2-463/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-bmg-5/igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-bmg-5/igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-adlp-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-lnl-4/igt@xe_exec_compute_mode@many-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-6/igt@xe_exec_compute_mode@many-userptr-invalidate-race.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2687">Intel XE#2687</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-adlp-1/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-invalid-fault:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-lnl-7/igt@xe_exec_fault_mode@twice-invalid-fault.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-5/igt@xe_exec_fault_mode@twice-invalid-fault.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-close-fd-no-exec:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-bmg-6/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-bmg-1/igt@xe_exec_reset@cm-close-fd-no-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-rebind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-adlp-2/igt@xe_exec_threads@threads-hang-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-adlp-9/igt@xe_exec_threads@threads-hang-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>) +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-shared-vm-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-dg2-463/igt@xe_exec_threads@threads-hang-shared-vm-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-dg2-433/igt@xe_exec_threads@threads-hang-shared-vm-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>) +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-shared-vm-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-dg2-435/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-dg2-434/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-adlp-3/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-adlp-3/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-dg2-433/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-dg2-436/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-lnl-5/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@stress-open-close:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-adlp-1/igt@xe_oa@stress-open-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-8/igt@xe_oa@unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248">Intel XE#2248</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-multiple-execs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-8/igt@xe_pm@s3-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#584</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-lnl-6/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-adlp-1/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194">Intel XE#3194</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-fencing:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-adlp-1/igt@kms_atomic_transition@plane-all-transition-fencing.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-adlp-2/igt@kms_atomic_transition@plane-all-transition-fencing.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-adlp-4/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-adlp-2/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-lnl-1/igt@kms_color@ctm-red-to-blue.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2929">Intel XE#2929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-7/igt@kms_color@ctm-red-to-blue.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-bo:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-dg2-436/igt@kms_cursor_legacy@torture-bo.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184">Intel XE#3184</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-dg2-466/igt@kms_cursor_legacy@torture-bo.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-lnl-7/igt@kms_flip@wf_vblank-ts-check@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-5/igt@kms_flip@wf_vblank-ts-check@b-edp1.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-lnl-8/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html">PASS</a></li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-adlp-2/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-adlp-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-adlp-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_sequence@queue-busy:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-lnl-5/igt@kms_sequence@queue-busy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2467">Intel XE#2467</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-2/igt@kms_sequence@queue-busy.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-lnl-1/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443">Intel XE#2443</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-7/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-lnl-2/igt@xe_ccs@suspend-resume.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616">Intel XE#1616</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2771">Intel XE#2771</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-8/igt@xe_ccs@suspend-resume.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume@tile4-compressed-compfmt0-system-system:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-lnl-2/igt@xe_ccs@suspend-resume@tile4-compressed-compfmt0-system-system.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2771">Intel XE#2771</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-8/igt@xe_ccs@suspend-resume@tile4-compressed-compfmt0-system-system.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-dg2-466/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-dg2-434/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-lnl-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2754">Intel XE#2754</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-4/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-bmg-1/igt@xe_exec_reset@parallel-gt-reset.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105">Intel XE#2105</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-bmg-5/igt@xe_exec_reset@parallel-gt-reset.html">PASS</a></li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-dg2-433/igt@xe_exec_reset@parallel-gt-reset.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105">Intel XE#2105</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-dg2-435/igt@xe_exec_reset@parallel-gt-reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_oa@rc6-disable:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-lnl-2/igt@xe_oa@rc6-disable.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-4/igt@xe_oa@rc6-disable.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-adlp-1/igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-lnl-3/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-1/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194">Intel XE#3194</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194">Intel XE#3194</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194">Intel XE#3194</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194">Intel XE#3194</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-bmg-5/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-bmg-5/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-bmg-5/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-bmg-5/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-lnl-4/igt@kms_flip@flip-vs-blocking-wf-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2422">Intel XE#2422</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-6/igt@kms_flip@flip-vs-blocking-wf-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-lnl-4/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2422">Intel XE#2422</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-lnl-6/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-linear:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-bmg-5/igt@kms_psr@pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-bmg-5/igt@kms_psr@pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-sram:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-bmg-5/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-sram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-bmg-5/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-sram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88/shard-bmg-5/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140403v1/shard-bmg-5/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88 -&gt; xe-pw-140403v1</li>
</ul>
<p>IGT_8082: c8379ec8b26f3c21bae5473706b23da78bd26ffa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2114-0cd3ccdcf9525b9d2f822df5f8d16b552753cf88: 0cd3ccdcf9525b9d2f822df5f8d16b552753cf88<br />
  xe-pw-140403v1: 140403v1</p>

</body>
</html>

--===============5697144132233050651==--
