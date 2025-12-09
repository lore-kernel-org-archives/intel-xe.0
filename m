Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83DF9D3B98A
	for <intel-xe@archiver.kernel.org>; Tue,  9 Dec 2025 18:34:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32EC710E117;
	Tue,  9 Dec 2025 18:34:03 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 326EC10E117;
 Tue,  9 Dec 2025 18:34:02 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4434574540061258795=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/i915/display=3A_DC3CO_?=
 =?utf-8?q?support?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dibin Moolakadan Subrahmanian" <dibin.moolakadan.subrahmanian@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 09 Dec 2025 18:34:02 -0000
Message-ID: <176530524219.70977.7165633940991513644@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251209113332.2770263-1-dibin.moolakadan.subrahmanian@intel.com>
In-Reply-To: <20251209113332.2770263-1-dibin.moolakadan.subrahmanian@intel.com>
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

--===============4434574540061258795==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: DC3CO support
URL   : https://patchwork.freedesktop.org/series/158688/
State : failure

== Summary ==

CI Bug Log - changes from xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f_FULL -> xe-pw-158688v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-158688v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-158688v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-158688v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_system_allocator@many-stride-new-madvise:
    - shard-bmg:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-3/igt@xe_exec_system_allocator@many-stride-new-madvise.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-2/igt@xe_exec_system_allocator@many-stride-new-madvise.html

  
Known issues
------------

  Here are the changes found in xe-pw-158688v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotrebind:
    - shard-bmg:          [PASS][3] -> [SKIP][4] ([Intel XE#6779])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-3/igt@core_hotunplug@hotrebind.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-2/igt@core_hotunplug@hotrebind.html

  * igt@device_reset@unbind-reset-rebind:
    - shard-bmg:          [PASS][5] -> [SKIP][6] ([Intel XE#6815])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-3/igt@device_reset@unbind-reset-rebind.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-2/igt@device_reset@unbind-reset-rebind.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [PASS][7] -> [FAIL][8] ([Intel XE#1231])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#1124]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-3/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2887])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-3/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [PASS][11] -> [INCOMPLETE][12] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345] / [Intel XE#6168])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][13] -> [INCOMPLETE][14] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#6168])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2252])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-3/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html

  * igt@kms_colorop@plane-xr30-xr30-ctm_3x4_overdrive:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#6704])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-6/igt@kms_colorop@plane-xr30-xr30-ctm_3x4_overdrive.html

  * igt@kms_cursor_crc@cursor-sliding-64x21:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2320])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding-64x21.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][18] -> [DMESG-WARN][19] ([Intel XE#5354])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-4/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-8/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-bmg:          [PASS][20] -> [INCOMPLETE][21] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-8/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-lnl:          [PASS][22] -> [FAIL][23] ([Intel XE#301] / [Intel XE#3149])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2293])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2311]) +2 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-linear:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#4141]) +3 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2313])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-bmg:          [PASS][28] -> [ABORT][29] ([Intel XE#6740]) +1 other test abort
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-4/igt@kms_hdr@bpc-switch-dpms.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-8/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-d:
    - shard-adlp:         [PASS][30] -> [DMESG-WARN][31] ([Intel XE#2953] / [Intel XE#4173]) +5 other tests dmesg-warn
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-adlp-9/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-d.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-adlp-2/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-d.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-6/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_psr@psr2-sprite-plane-move:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-6/igt@kms_psr@psr2-sprite-plane-move.html

  * igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-3:
    - shard-bmg:          [PASS][34] -> [INCOMPLETE][35] ([Intel XE#4488]) +1 other test incomplete
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-5/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-3.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-2/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-3.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2504])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-6/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_exec_system_allocator@many-64k-mmap-new-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#5007]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-3/igt@xe_exec_system_allocator@many-64k-mmap-new-huge-nomemset.html

  * igt@xe_exec_system_allocator@process-many-mmap-shared-nomemset:
    - shard-bmg:          [PASS][38] -> [SKIP][39] ([Intel XE#6557] / [Intel XE#6703]) +6 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-3/igt@xe_exec_system_allocator@process-many-mmap-shared-nomemset.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-2/igt@xe_exec_system_allocator@process-many-mmap-shared-nomemset.html

  * igt@xe_exec_system_allocator@twice-mmap-free-madvise:
    - shard-bmg:          [PASS][40] -> [SKIP][41] ([Intel XE#6703]) +119 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-3/igt@xe_exec_system_allocator@twice-mmap-free-madvise.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-2/igt@xe_exec_system_allocator@twice-mmap-free-madvise.html

  * igt@xe_exec_system_allocator@twice-mmap-huge:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#4943]) +3 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-3/igt@xe_exec_system_allocator@twice-mmap-huge.html

  * igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#6281])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-6/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html

  * igt@xe_pm@s2idle-multiple-execs:
    - shard-adlp:         [PASS][44] -> [DMESG-WARN][45] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#4504])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-adlp-4/igt@xe_pm@s2idle-multiple-execs.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-adlp-9/igt@xe_pm@s2idle-multiple-execs.html

  
#### Possible fixes ####

  * igt@core_getversion@all-cards:
    - shard-bmg:          [FAIL][46] -> [PASS][47]
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-2/igt@core_getversion@all-cards.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-1/igt@core_getversion@all-cards.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-bmg:          [DMESG-FAIL][48] ([Intel XE#5545]) -> [PASS][49] +1 other test pass
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:
    - shard-adlp:         [FAIL][50] ([Intel XE#3908]) -> [PASS][51] +1 other test pass
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-adlp-3/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-adlp-4/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [FAIL][52] ([Intel XE#1231]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:
    - shard-bmg:          [SKIP][54] ([Intel XE#367]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-6/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-4/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html

  * igt@kms_color@invalid-gamma-lut-sizes:
    - shard-adlp:         [DMESG-WARN][56] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][57] +1 other test pass
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-adlp-6/igt@kms_color@invalid-gamma-lut-sizes.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-adlp-4/igt@kms_color@invalid-gamma-lut-sizes.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-bmg:          [FAIL][58] ([Intel XE#5299]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [FAIL][60] ([Intel XE#4633]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [FAIL][62] ([Intel XE#301]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][64] ([Intel XE#6766]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html

  * igt@kms_flip_tiling@flip-change-tiling:
    - shard-adlp:         [FAIL][66] ([Intel XE#1874]) -> [PASS][67] +2 other tests pass
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-bmg:          [ABORT][68] ([Intel XE#6740]) -> [PASS][69] +1 other test pass
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-5/igt@kms_hdr@bpc-switch-suspend.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-6/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - shard-dg2-set2:     [FAIL][70] ([Intel XE#4741]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-dg2-435/igt@kms_pm_rpm@basic-pci-d3-state.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-dg2-464/igt@kms_pm_rpm@basic-pci-d3-state.html

  * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
    - shard-lnl:          [FAIL][72] ([Intel XE#2142]) -> [PASS][73] +1 other test pass
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-lnl-5/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-lnl-4/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html

  * igt@xe_exec_system_allocator@many-64k-mmap-file-nomemset:
    - shard-bmg:          [SKIP][74] ([Intel XE#6703]) -> [PASS][75] +44 other tests pass
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-2/igt@xe_exec_system_allocator@many-64k-mmap-file-nomemset.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-1/igt@xe_exec_system_allocator@many-64k-mmap-file-nomemset.html

  * igt@xe_exec_system_allocator@partial-atomic-munmap-cpu-fault:
    - shard-bmg:          [SKIP][76] ([Intel XE#6557] / [Intel XE#6703]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-2/igt@xe_exec_system_allocator@partial-atomic-munmap-cpu-fault.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-1/igt@xe_exec_system_allocator@partial-atomic-munmap-cpu-fault.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:
    - shard-lnl:          [FAIL][78] ([Intel XE#5625]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-lnl-2/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-lnl-3/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html

  * igt@xe_module_load@load:
    - shard-dg2-set2:     ([PASS][80], [PASS][81], [PASS][82], [PASS][83], [PASS][84], [PASS][85], [PASS][86], [PASS][87], [PASS][88], [PASS][89], [PASS][90], [PASS][91], [PASS][92], [PASS][93], [PASS][94], [PASS][95], [PASS][96], [PASS][97], [PASS][98], [PASS][99], [PASS][100], [PASS][101], [PASS][102], [PASS][103], [PASS][104], [SKIP][105]) ([Intel XE#378]) -> ([PASS][106], [PASS][107], [PASS][108], [PASS][109], [PASS][110], [PASS][111], [PASS][112], [PASS][113], [PASS][114], [PASS][115], [PASS][116], [PASS][117], [PASS][118], [PASS][119], [PASS][120], [PASS][121], [PASS][122], [PASS][123], [PASS][124], [PASS][125], [PASS][126], [PASS][127], [PASS][128], [PASS][129], [PASS][130])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-dg2-434/igt@xe_module_load@load.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-dg2-433/igt@xe_module_load@load.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-dg2-464/igt@xe_module_load@load.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-dg2-464/igt@xe_module_load@load.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-dg2-463/igt@xe_module_load@load.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-dg2-463/igt@xe_module_load@load.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-dg2-463/igt@xe_module_load@load.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-dg2-432/igt@xe_module_load@load.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-dg2-432/igt@xe_module_load@load.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-dg2-434/igt@xe_module_load@load.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-dg2-434/igt@xe_module_load@load.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-dg2-434/igt@xe_module_load@load.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-dg2-432/igt@xe_module_load@load.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-dg2-432/igt@xe_module_load@load.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-dg2-435/igt@xe_module_load@load.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-dg2-433/igt@xe_module_load@load.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-dg2-433/igt@xe_module_load@load.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-dg2-435/igt@xe_module_load@load.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-dg2-435/igt@xe_module_load@load.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-dg2-436/igt@xe_module_load@load.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-dg2-435/igt@xe_module_load@load.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-dg2-436/igt@xe_module_load@load.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-dg2-436/igt@xe_module_load@load.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-dg2-464/igt@xe_module_load@load.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-dg2-464/igt@xe_module_load@load.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-dg2-436/igt@xe_module_load@load.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-dg2-432/igt@xe_module_load@load.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-dg2-433/igt@xe_module_load@load.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-dg2-432/igt@xe_module_load@load.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-dg2-436/igt@xe_module_load@load.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-dg2-434/igt@xe_module_load@load.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-dg2-434/igt@xe_module_load@load.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-dg2-433/igt@xe_module_load@load.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-dg2-436/igt@xe_module_load@load.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-dg2-436/igt@xe_module_load@load.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-dg2-436/igt@xe_module_load@load.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-dg2-464/igt@xe_module_load@load.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-dg2-464/igt@xe_module_load@load.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-dg2-432/igt@xe_module_load@load.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-dg2-432/igt@xe_module_load@load.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-dg2-464/igt@xe_module_load@load.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-dg2-433/igt@xe_module_load@load.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-dg2-463/igt@xe_module_load@load.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-dg2-435/igt@xe_module_load@load.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-dg2-435/igt@xe_module_load@load.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-dg2-435/igt@xe_module_load@load.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-dg2-434/igt@xe_module_load@load.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-dg2-434/igt@xe_module_load@load.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-dg2-463/igt@xe_module_load@load.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-dg2-463/igt@xe_module_load@load.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-dg2-463/igt@xe_module_load@load.html

  * igt@xe_pmu@engine-activity-single-load-idle:
    - shard-dg2-set2:     [FAIL][131] ([Intel XE#6812]) -> [PASS][132] +1 other test pass
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-dg2-433/igt@xe_pmu@engine-activity-single-load-idle.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-dg2-433/igt@xe_pmu@engine-activity-single-load-idle.html

  * igt@xe_vm@bind-array-enobufs:
    - shard-dg2-set2:     [FAIL][133] ([Intel XE#6774]) -> [PASS][134]
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-dg2-434/igt@xe_vm@bind-array-enobufs.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-dg2-432/igt@xe_vm@bind-array-enobufs.html

  
#### Warnings ####

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-bmg:          [SKIP][135] ([Intel XE#2327]) -> [SKIP][136] ([Intel XE#6703])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-3/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-2/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-bmg:          [SKIP][137] ([Intel XE#1124]) -> [SKIP][138] ([Intel XE#6703]) +1 other test skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-bmg:          [SKIP][139] ([Intel XE#610]) -> [SKIP][140] ([Intel XE#6703])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-3/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-2/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
    - shard-bmg:          [SKIP][141] ([Intel XE#367]) -> [SKIP][142] ([Intel XE#6703])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-3/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-2/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:
    - shard-bmg:          [SKIP][143] ([Intel XE#6703]) -> [SKIP][144] ([Intel XE#2887]) +1 other test skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-2/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-1/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          [SKIP][145] ([Intel XE#2887]) -> [SKIP][146] ([Intel XE#6703]) +4 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_chamelium_frames@hdmi-frame-dump:
    - shard-bmg:          [SKIP][147] ([Intel XE#2252]) -> [SKIP][148] ([Intel XE#6703]) +1 other test skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-3/igt@kms_chamelium_frames@hdmi-frame-dump.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-2/igt@kms_chamelium_frames@hdmi-frame-dump.html

  * igt@kms_colorop@plane-xr30-xr30-ctm_3x4_bt709_enc_dec:
    - shard-bmg:          [SKIP][149] ([Intel XE#6704]) -> [SKIP][150] ([Intel XE#6703]) +1 other test skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-3/igt@kms_colorop@plane-xr30-xr30-ctm_3x4_bt709_enc_dec.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-2/igt@kms_colorop@plane-xr30-xr30-ctm_3x4_bt709_enc_dec.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-bmg:          [SKIP][151] ([Intel XE#2390]) -> [SKIP][152] ([Intel XE#6703])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-3/igt@kms_content_protection@dp-mst-type-1.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-2/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@mei-interface:
    - shard-bmg:          [SKIP][153] ([Intel XE#2341]) -> [SKIP][154] ([Intel XE#6703])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-3/igt@kms_content_protection@mei-interface.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-2/igt@kms_content_protection@mei-interface.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-bmg:          [SKIP][155] ([Intel XE#2320]) -> [SKIP][156] ([Intel XE#6703])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-3/igt@kms_cursor_crc@cursor-onscreen-256x85.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-bmg:          [SKIP][157] ([Intel XE#6703]) -> [SKIP][158] ([Intel XE#2321])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-2/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-1/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][159] ([Intel XE#4210]) -> [SKIP][160] ([Intel XE#6703])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-3/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-2/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-bmg:          [SKIP][161] ([Intel XE#4354]) -> [SKIP][162] ([Intel XE#6703])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-3/igt@kms_dp_link_training@non-uhbr-mst.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-2/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-bmg:          [FAIL][163] ([Intel XE#6793]) -> [SKIP][164] ([Intel XE#4354])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-6/igt@kms_dp_link_training@uhbr-sst.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-4/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_feature_discovery@psr1:
    - shard-bmg:          [SKIP][165] ([Intel XE#2374]) -> [SKIP][166] ([Intel XE#6557] / [Intel XE#6703])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-3/igt@kms_feature_discovery@psr1.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-2/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][167] ([Intel XE#301]) -> [FAIL][168] ([Intel XE#301] / [Intel XE#3149])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [DMESG-WARN][169] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#6766]) -> [DMESG-WARN][170] ([Intel XE#6766]) +1 other test dmesg-warn
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-bmg:          [SKIP][171] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][172] ([Intel XE#6703])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-bmg:          [SKIP][173] ([Intel XE#6703]) -> [SKIP][174] ([Intel XE#2293] / [Intel XE#2380])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][175] ([Intel XE#2311]) -> [SKIP][176] ([Intel XE#6557] / [Intel XE#6703])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
    - shard-bmg:          [SKIP][177] ([Intel XE#6703]) -> [SKIP][178] ([Intel XE#2311]) +2 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-slowdraw:
    - shard-bmg:          [SKIP][179] ([Intel XE#6557] / [Intel XE#6703]) -> [SKIP][180] ([Intel XE#2311])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-slowdraw.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-slowdraw.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][181] ([Intel XE#6703]) -> [SKIP][182] ([Intel XE#4141]) +1 other test skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-stridechange:
    - shard-bmg:          [SKIP][183] ([Intel XE#4141]) -> [SKIP][184] ([Intel XE#6703]) +3 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-stridechange.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-stridechange.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][185] ([Intel XE#2311]) -> [SKIP][186] ([Intel XE#6703]) +3 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][187] ([Intel XE#6703]) -> [SKIP][188] ([Intel XE#2313]) +2 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][189] ([Intel XE#2313]) -> [SKIP][190] ([Intel XE#6703]) +4 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-bmg:          [SKIP][191] ([Intel XE#2352]) -> [SKIP][192] ([Intel XE#6703])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][193] ([Intel XE#5021]) -> [SKIP][194] ([Intel XE#6557] / [Intel XE#6703])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-y.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-bmg:          [SKIP][195] ([Intel XE#2392]) -> [SKIP][196] ([Intel XE#6703])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-3/igt@kms_pm_dc@dc6-psr.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-2/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:
    - shard-bmg:          [SKIP][197] ([Intel XE#1406] / [Intel XE#1489]) -> [SKIP][198] ([Intel XE#1406] / [Intel XE#6703]) +1 other test skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-3/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-2/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr@fbc-psr-primary-render:
    - shard-bmg:          [SKIP][199] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) -> [SKIP][200] ([Intel XE#1406] / [Intel XE#6703]) +2 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-3/igt@kms_psr@fbc-psr-primary-render.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-2/igt@kms_psr@fbc-psr-primary-render.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][201] ([Intel XE#1500]) -> [SKIP][202] ([Intel XE#362])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@flip-dpms:
    - shard-bmg:          [SKIP][203] ([Intel XE#1499]) -> [SKIP][204] ([Intel XE#6703])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-3/igt@kms_vrr@flip-dpms.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-2/igt@kms_vrr@flip-dpms.html

  * igt@xe_eudebug@basic-vm-bind-extended-discovery:
    - shard-bmg:          [SKIP][205] ([Intel XE#4837]) -> [SKIP][206] ([Intel XE#6703]) +1 other test skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-3/igt@xe_eudebug@basic-vm-bind-extended-discovery.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-2/igt@xe_eudebug@basic-vm-bind-extended-discovery.html

  * igt@xe_eudebug_online@pagefault-read:
    - shard-bmg:          [SKIP][207] ([Intel XE#4837] / [Intel XE#6665]) -> [SKIP][208] ([Intel XE#6703])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-3/igt@xe_eudebug_online@pagefault-read.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-2/igt@xe_eudebug_online@pagefault-read.html

  * igt@xe_eudebug_online@reset-with-attention:
    - shard-bmg:          [SKIP][209] ([Intel XE#6703]) -> [SKIP][210] ([Intel XE#4837] / [Intel XE#6665])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-2/igt@xe_eudebug_online@reset-with-attention.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-1/igt@xe_eudebug_online@reset-with-attention.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind:
    - shard-bmg:          [SKIP][211] ([Intel XE#2322]) -> [SKIP][212] ([Intel XE#6703]) +1 other test skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.html

  * igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset:
    - shard-bmg:          [SKIP][213] ([Intel XE#4943]) -> [SKIP][214] ([Intel XE#6703]) +4 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-3/igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-new-huge-nomemset:
    - shard-bmg:          [SKIP][215] ([Intel XE#6703]) -> [SKIP][216] ([Intel XE#4943])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-new-huge-nomemset.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-new-huge-nomemset.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-bmg:          [SKIP][217] ([Intel XE#6703]) -> [SKIP][218] ([Intel XE#2248])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-2/igt@xe_oa@oa-tlb-invalidate.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-1/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-bmg:          [SKIP][219] ([Intel XE#6703]) -> [SKIP][220] ([Intel XE#2284])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-2/igt@xe_pm@d3cold-multiple-execs.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-1/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:
    - shard-bmg:          [SKIP][221] ([Intel XE#4733]) -> [SKIP][222] ([Intel XE#6703])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-3/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-2/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-bmg:          [SKIP][223] ([Intel XE#6703]) -> [SKIP][224] ([Intel XE#944])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-2/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-1/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-bmg:          [SKIP][225] ([Intel XE#944]) -> [SKIP][226] ([Intel XE#6703])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-3/igt@xe_query@multigpu-query-uc-fw-version-huc.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-2/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4210]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4210
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4488
  [Intel XE#4504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4504
  [Intel XE#4633]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4741]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4741
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5299]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299
  [Intel XE#5354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#6168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168
  [Intel XE#6281]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281
  [Intel XE#6557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557
  [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
  [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
  [Intel XE#6704]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6704
  [Intel XE#6740]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740
  [Intel XE#6766]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6766
  [Intel XE#6774]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6774
  [Intel XE#6779]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6779
  [Intel XE#6793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6793
  [Intel XE#6812]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6812
  [Intel XE#6815]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6815
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f -> xe-pw-158688v1

  IGT_8659: 8659
  xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f: 48deab361d3b570e2210875fdc8ffb29627d054f
  xe-pw-158688v1: 158688v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/index.html

--===============4434574540061258795==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: DC3CO support</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/158688/">https://patchwork.freedesktop.org/series/158688/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-158688v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-158688v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4208-48deab361d3b570e2210875fdc8ffb296=
27d054f_FULL -&gt; xe-pw-158688v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-158688v1_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-158688v1_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1586=
88v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_system_allocator@many-stride-new-madvise:<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-3/igt@xe_exec_=
system_allocator@many-stride-new-madvise.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-2/igt@xe_e=
xec_system_allocator@many-stride-new-madvise.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-158688v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-3/igt@core_hot=
unplug@hotrebind.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-158688v1/shard-bmg-2/igt@core_hotunplug@hotrebind.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/6779">Intel XE#6779</a>)</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-3/igt@device_r=
eset@unbind-reset-rebind.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-2/igt@device_reset@unbind-=
reset-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/6815">Intel XE#6815</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-adlp-6/igt@kms_big=
_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-a=
dlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158688v1/shard-bmg-3/igt@kms_big_fb@yf-tiled-32bpp-rot=
ate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158688v1/shard-bmg-3/igt@kms_ccs@bad-rotation-90-4-til=
ed-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-dg2-464/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4345">Intel XE#4345</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/6168">Intel XE#6168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-dg=
2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/6168">Intel XE#6168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158688v1/shard-bmg-3/igt@kms_chamelium_edid@hdmi-edid-=
stress-resolution-non-4k.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_colorop@plane-xr30-xr30-ctm_3x4_overdrive:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158688v1/shard-bmg-6/igt@kms_colorop@plane-xr30-xr30-c=
tm_3x4_overdrive.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/6704">Intel XE#6704</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158688v1/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding=
-64x21.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-4/igt@kms_curs=
or_legacy@cursor-vs-flip-atomic-transitions-varying-size.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shar=
d-bmg-8/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-siz=
e.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/5354">Intel XE#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-8/igt@kms_flip=
@2x-flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-6/igt@kms_flip@2x=
-flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597=
</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-lnl-8/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@c-edp1.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-lnl-5/ig=
t@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#30=
1</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149=
">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158688v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bp=
p-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#=
2293</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158688v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs=
-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +2 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-linear:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158688v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-=
tiling-linear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4141">Intel XE#4141</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158688v1/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-=
2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-4/igt@kms_hdr@=
bpc-switch-dpms.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158688v1/shard-bmg-8/igt@kms_hdr@bpc-switch-dpms.html"=
>ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
6740">Intel XE#6740</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@p=
ipe-d:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-adlp-9/igt@kms_pla=
ne_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-d.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158=
688v1/shard-adlp-2/igt@kms_plane_scaling@planes-downscale-factor-0-75-upsca=
le-factor-0-25@pipe-d.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +5 o=
ther tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158688v1/shard-bmg-6/igt@kms_pm_rpm@modeset-lpsp.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3141">Intel XE#3141</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-plane-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158688v1/shard-bmg-6/igt@kms_psr@psr2-sprite-plane-mov=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-5/igt@kms_vbla=
nk@ts-continuation-dpms-rpm@pipe-d-hdmi-a-3.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-2/igt@k=
ms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-3.html">INCOMPLETE</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4488">Intel XE=
#4488</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158688v1/shard-bmg-6/igt@xe_create@multigpu-create-mas=
sive-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2504">Intel XE#2504</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-new-huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158688v1/shard-bmg-3/igt@xe_exec_system_allocator@many=
-64k-mmap-new-huge-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/5007">Intel XE#5007</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-shared-nomemset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-3/igt@xe_exec_=
system_allocator@process-many-mmap-shared-nomemset.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-=
2/igt@xe_exec_system_allocator@process-many-mmap-shared-nomemset.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">=
Intel XE#6557</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/6703">Intel XE#6703</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-free-madvise:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-3/igt@xe_exec_=
system_allocator@twice-mmap-free-madvise.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-2/igt@xe_e=
xec_system_allocator@twice-mmap-free-madvise.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +=
119 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158688v1/shard-bmg-3/igt@xe_exec_system_allocator@twic=
e-mmap-huge.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4943">Intel XE#4943</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158688v1/shard-bmg-6/igt@xe_fault_injection@exec-queue=
-create-fail-xe_pxp_exec_queue_add.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/6281">Intel XE#6281</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-adlp-4/igt@xe_pm@s=
2idle-multiple-execs.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-158688v1/shard-adlp-9/igt@xe_pm@s2idle-multiple-e=
xecs.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4173">Intel XE#4173</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4504">Intel XE#4504</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_getversion@all-cards:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-2/igt@core_get=
version@all-cards.html">FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-158688v1/shard-bmg-1/igt@core_getversion@all-cards.h=
tml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-2/igt@kms_atom=
ic_transition@plane-all-modeset-transition-fencing.html">DMESG-FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE=
#5545</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-158688v1/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transitio=
n-fencing.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-adlp-3/igt@kms_ato=
mic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908">Intel=
 XE#3908</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-158688v1/shard-adlp-4/igt@kms_atomic_transition@plane-all-modeset-trans=
ition@pipe-a-hdmi-a-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-adlp-2/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel X=
E#1231</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-158688v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0=
-hflip-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-6/igt@kms_bw@c=
onnected-linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shar=
d-bmg-4/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@invalid-gamma-lut-sizes:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-adlp-6/igt@kms_col=
or@invalid-gamma-lut-sizes.html">DMESG-WARN</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/=
shard-adlp-4/igt@kms_color@invalid-gamma-lut-sizes.html">PASS</a> +1 other =
test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-1/igt@kms_curs=
or_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/5299">Intel XE#5299</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/sha=
rd-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-6/igt@kms_curs=
or_legacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4633">Intel XE#4633</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-4/ig=
t@kms_cursor_legacy@flip-vs-cursor-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-lnl-8/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shar=
d-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-adlp-1/igt@kms_fli=
p@flip-vs-suspend-interruptible@b-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/6766">Intel XE#6766</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1=
/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-adlp-6/igt@kms_fli=
p_tiling@flip-change-tiling.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-adlp-2/igt@km=
s_flip_tiling@flip-change-tiling.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-5/igt@kms_hdr@=
bpc-switch-suspend.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/6740">Intel XE#6740</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-6/igt@kms_hdr@bpc=
-switch-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-dg2-435/igt@kms_pm=
_rpm@basic-pci-d3-state.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4741">Intel XE#4741</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-dg2-464/igt@kms_p=
m_rpm@basic-pci-d3-state.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-lnl-5/igt@kms_vrr@=
seamless-rr-switch-virtual@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2142">Intel XE#2142</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-l=
nl-4/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">PASS</a> +1 =
other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-file-nomemset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-2/igt@xe_exec_=
system_allocator@many-64k-mmap-file-nomemset.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/sh=
ard-bmg-1/igt@xe_exec_system_allocator@many-64k-mmap-file-nomemset.html">PA=
SS</a> +44 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@partial-atomic-munmap-cpu-fault:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-2/igt@xe_exec_=
system_allocator@partial-atomic-munmap-cpu-fault.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">In=
tel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-158688v1/shard-bmg-1/igt@xe_exec_system_allocator@partial-atomic-mun=
map-cpu-fault.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-lnl-2/igt@xe_exec_=
system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625">Intel XE=
#5625</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-158688v1/shard-lnl-3/igt@xe_exec_system_allocator@pat-index-madvise-pat-id=
x-uc-single-vma.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-dg2-434/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-dg2-433/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-dg2-4=
64/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard=
-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f=
/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb2962=
7d054f/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8f=
fb29627d054f/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e22108=
75fdc8ffb29627d054f/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570=
e2210875fdc8ffb29627d054f/shard-dg2-432/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361=
d3b570e2210875fdc8ffb29627d054f/shard-dg2-434/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48d=
eab361d3b570e2210875fdc8ffb29627d054f/shard-dg2-434/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-42=
08-48deab361d3b570e2210875fdc8ffb29627d054f/shard-dg2-434/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-dg2-432/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-dg2-432/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-dg2-435=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-d=
g2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/s=
hard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d=
054f/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875fdc8ffb=
29627d054f/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e2210875f=
dc8ffb29627d054f/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b570e22=
10875fdc8ffb29627d054f/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab361d3b=
570e2210875fdc8ffb29627d054f/shard-dg2-436/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-48deab=
361d3b570e2210875fdc8ffb29627d054f/shard-dg2-436/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4208-=
48deab361d3b570e2210875fdc8ffb29627d054f/shard-dg2-464/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-dg2-464/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-dg2-436/igt@xe_m=
odule_load@load.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-dg2-432/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-158688v1/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-dg2-43=
2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-158688v1/shard-dg2-436/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
8688v1/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-dg2-434/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-158688v1/shard-dg2-433/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/sh=
ard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-dg2-436/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-158688v1/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-dg2-4=
64/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-158688v1/shard-dg2-464/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
58688v1/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-dg2-432/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-158688v1/shard-dg2-464/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/s=
hard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-dg2-463/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-158688v1/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-dg2-=
435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-158688v1/shard-dg2-435/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
158688v1/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-dg2-434/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-158688v1/shard-dg2-463/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/=
shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-dg2-463/igt@xe_module_=
load@load.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-single-load-idle:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-dg2-433/igt@xe_pmu=
@engine-activity-single-load-idle.html">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/6812">Intel XE#6812</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-dg2-433=
/igt@xe_pmu@engine-activity-single-load-idle.html">PASS</a> +1 other test p=
ass</li>
</ul>
</li>
<li>
<p>igt@xe_vm@bind-array-enobufs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-dg2-434/igt@xe_vm@=
bind-array-enobufs.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/6774">Intel XE#6774</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-dg2-432/igt@xe_vm@bind=
-array-enobufs.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-3/igt@kms_big_=
fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-2/igt@kms=
_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-3/igt@kms_big_=
fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE=
#1124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-158688v1/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-h=
flip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-3/igt@kms_big_=
fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-2/igt@k=
ms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-3/igt@kms_bw@l=
inear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-2/ig=
t@kms_bw@linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-2/igt@kms_ccs@=
crc-primary-basic-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-=
1/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-3/igt@kms_ccs@=
crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1=
/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/6703">Intel XE#6703</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-frame-dump:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-3/igt@kms_cham=
elium_frames@hdmi-frame-dump.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-2/igt@km=
s_chamelium_frames@hdmi-frame-dump.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_colorop@plane-xr30-xr30-ctm_3x4_bt709_enc_dec:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-3/igt@kms_colo=
rop@plane-xr30-xr30-ctm_3x4_bt709_enc_dec.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/6704">Intel XE#6704</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard=
-bmg-2/igt@kms_colorop@plane-xr30-xr30-ctm_3x4_bt709_enc_dec.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Inte=
l XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-3/igt@kms_cont=
ent_protection@dp-mst-type-1.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-2/igt@km=
s_content_protection@dp-mst-type-1.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-3/igt@kms_cont=
ent_protection@mei-interface.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-2/igt@km=
s_content_protection@mei-interface.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-3/igt@kms_curs=
or_crc@cursor-onscreen-256x85.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-2/igt@k=
ms_cursor_crc@cursor-onscreen-256x85.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-2/igt@kms_curs=
or_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-=
1/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-3/igt@kms_dirt=
yfb@fbc-dirtyfb-ioctl.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4210">Intel XE#4210</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-2/igt@kms_dirty=
fb@fbc-dirtyfb-ioctl.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-3/igt@kms_dp_l=
ink_training@non-uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-2/igt@kms_d=
p_link_training@non-uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-6/igt@kms_dp_l=
ink_training@uhbr-sst.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/6793">Intel XE#6793</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-4/igt@kms_dp_li=
nk_training@uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-3/igt@kms_feat=
ure_discovery@psr1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2374">Intel XE#2374</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-2/igt@kms_feature_=
discovery@psr1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/6557">Intel XE#6557</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-lnl-8/igt@kms_flip=
@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-lnl-5=
/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">I=
ntel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-adlp-1/igt@kms_fli=
p@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6766"=
>Intel XE#6766</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-158688v1/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible.=
html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/6766">Intel XE#6766</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-3/igt@kms_flip=
_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel =
XE#2293</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2380">Intel XE#2380</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-158688v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-yt=
ile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-2/igt@kms_flip=
_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel =
XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-158688v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bp=
p-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#231=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158=
688v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-d=
raw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6557">Intel XE#6557</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@drrs-rgb565-draw-render.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-=
bmg-1/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel =
XE#2311</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-slowdraw:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@drrs-slowdraw.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/sh=
ard-bmg-1/igt@kms_frontbuffer_tracking@drrs-slowdraw.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#231=
1</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1=
/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4141">Intel XE#4141</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-stridechange:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbc-stridechange.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-2/i=
gt@kms_frontbuffer_tracking@fbc-stridechange.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +=
3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel =
XE#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-158688v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-sp=
r-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel =
XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-158688v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr=
-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1586=
88v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-=
onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/6703">Intel XE#6703</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-2/ig=
t@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-3/igt@kms_plan=
e_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-2/igt@kms_plan=
e_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-3/igt@kms_pm_d=
c@dc6-psr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2392">Intel XE#2392</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-2/igt@kms_pm_dc@dc6-psr.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-3/igt@kms_psr2=
_sf@psr2-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel X=
E#1489</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-158688v1/shard-bmg-2/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous=
-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-3/igt@kms_psr@=
fbc-psr-primary-render.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1586=
88v1/shard-bmg-2/igt@kms_psr@fbc-psr-primary-render.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703"=
>Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-dg2-464/igt@kms_ti=
led_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/s=
hard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/36=
2">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-3/igt@kms_vrr@=
flip-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-2/igt@kms_vrr@flip-dpms.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-extended-discovery:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-3/igt@xe_eudeb=
ug@basic-vm-bind-extended-discovery.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-2=
/igt@xe_eudebug@basic-vm-bind-extended-discovery.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a=
>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@pagefault-read:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-3/igt@xe_eudeb=
ug_online@pagefault-read.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bm=
g-2/igt@xe_eudebug_online@pagefault-read.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@reset-with-attention:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-2/igt@xe_eudeb=
ug_online@reset-with-attention.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-1/ig=
t@xe_eudebug_online@reset-with-attention.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6=
665</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-3/igt@xe_exec_=
basic@multigpu-many-execqueues-many-vm-rebind.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/s=
hard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/67=
03">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-3/igt@xe_exec_=
system_allocator@threads-many-mmap-new-huge-nomemset.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#494=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158=
688v1/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-mmap-new-huge-n=
omemset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6703">Intel XE#6703</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-new-huge=
-nomemset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-2/igt@xe_exec_=
system_allocator@threads-shared-vm-many-stride-mmap-new-huge-nomemset.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6=
703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-158688v1/shard-bmg-1/igt@xe_exec_system_allocator@threads-sha=
red-vm-many-stride-mmap-new-huge-nomemset.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-2/igt@xe_oa@oa=
-tlb-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-1/igt@xe_oa@oa-tlb-in=
validate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2248">Intel XE#2248</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-2/igt@xe_pm@d3=
cold-multiple-execs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-1/igt@xe_pm@d3col=
d-multiple-execs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-3/igt@xe_pxp@p=
xp-stale-bo-bind-post-termination-irq.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg=
-2/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#670=
3</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-2/igt@xe_query=
@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard=
-bmg-1/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel=
 XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f/shard-bmg-3/igt@xe_query=
@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158688v1/shard-bmg-2/ig=
t@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</l=
i>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f -&gt; xe-pw-158=
688v1</li>
</ul>
<p>IGT_8659: 8659<br />
  xe-4208-48deab361d3b570e2210875fdc8ffb29627d054f: 48deab361d3b570e2210875=
fdc8ffb29627d054f<br />
  xe-pw-158688v1: 158688v1</p>

</body>
</html>

--===============4434574540061258795==--
