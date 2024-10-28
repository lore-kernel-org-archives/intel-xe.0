Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39AA5D5B158
	for <intel-xe@archiver.kernel.org>; Mon, 28 Oct 2024 21:46:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA02C10E581;
	Mon, 28 Oct 2024 21:46:10 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5704310E581;
 Mon, 28 Oct 2024 21:46:09 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6681436817402735098=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe/pmu=3A_PMU_interface_for?=
 =?utf-8?q?_Xe_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 28 Oct 2024 21:46:09 -0000
Message-ID: <173015196933.1357171.8068638778638334299@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241028192402.1068492-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20241028192402.1068492-1-vinay.belgaumkar@intel.com>
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

--===============6681436817402735098==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/pmu: PMU interface for Xe (rev3)
URL   : https://patchwork.freedesktop.org/series/139121/
State : failure

== Summary ==

CI Bug Log - changes from xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154_full -> xe-pw-139121v3_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-139121v3_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-139121v3_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-139121v3_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_atomic_transition@modeset-transition:
    - shard-adlp:         [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-8/igt@kms_atomic_transition@modeset-transition.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-adlp-8/igt@kms_atomic_transition@modeset-transition.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-bmg:          [PASS][3] -> [SKIP][4] +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_plane_multiple@tiling-none@pipe-a-edp-1:
    - shard-lnl:          [PASS][5] -> [DMESG-WARN][6] +1 other test dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-4/igt@kms_plane_multiple@tiling-none@pipe-a-edp-1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-lnl-4/igt@kms_plane_multiple@tiling-none@pipe-a-edp-1.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm:
    - shard-lnl:          [PASS][7] -> [FAIL][8] +2 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-6/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-lnl-1/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm.html

  * igt@xe_exec_fault_mode@many-userptr-invalidate-race:
    - shard-bmg:          [PASS][9] -> [FAIL][10] +1 other test fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-3/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-3/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html

  
#### Warnings ####

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:
    - shard-adlp:         [DMESG-FAIL][11] ([Intel XE#1033] / [Intel XE#1727]) -> [DMESG-WARN][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-9/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-bmg:          [SKIP][13] ([Intel XE#2327]) -> [SKIP][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-8/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-bmg:          [SKIP][15] ([Intel XE#1124]) -> [SKIP][16] +4 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          [SKIP][17] ([Intel XE#2887]) -> [SKIP][18] +3 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          [SKIP][19] ([Intel XE#2380]) -> [SKIP][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
    - shard-bmg:          [SKIP][21] ([Intel XE#2311]) -> [SKIP][22] +9 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
    - shard-bmg:          [FAIL][23] ([Intel XE#2333]) -> [SKIP][24] +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][25] ([Intel XE#2313]) -> [SKIP][26] +9 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-wc.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-wc.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-bmg:          [SKIP][27] ([Intel XE#346]) -> [SKIP][28]
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-3/igt@kms_joiner@invalid-modeset-big-joiner.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-bmg:          [SKIP][29] ([Intel XE#1489]) -> [SKIP][30] +8 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-3/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-psr-primary-render:
    - shard-bmg:          [SKIP][31] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][32] +3 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-4/igt@kms_psr@fbc-psr-primary-render.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@kms_psr@fbc-psr-primary-render.html

  * igt@xe_create@create-execqueues-noleak-shared:
    - shard-bmg:          [SKIP][33] ([Intel XE#1130]) -> [INCOMPLETE][34]
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@xe_create@create-execqueues-noleak-shared.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-4/igt@xe_create@create-execqueues-noleak-shared.html

  * igt@xe_exec_fault_mode@many-userptr-invalidate-race-imm:
    - shard-bmg:          [SKIP][35] ([Intel XE#1130]) -> [FAIL][36] +1 other test fail
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@xe_exec_fault_mode@many-userptr-invalidate-race-imm.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-1/igt@xe_exec_fault_mode@many-userptr-invalidate-race-imm.html

  
Known issues
------------

  Here are the changes found in xe-pw-139121v3_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-bmg:          [PASS][37] -> [SKIP][38] ([Intel XE#1885])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-4/igt@core_hotunplug@hotrebind-lateclose.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@fbdev@eof:
    - shard-bmg:          [PASS][39] -> [SKIP][40] ([Intel XE#2134]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-4/igt@fbdev@eof.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@fbdev@eof.html

  * igt@kms_addfb_basic@bad-pitch-999:
    - shard-bmg:          [PASS][41] -> [SKIP][42] ([Intel XE#2423]) +57 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-3/igt@kms_addfb_basic@bad-pitch-999.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@kms_addfb_basic@bad-pitch-999.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-lnl:          [PASS][43] -> [FAIL][44] ([Intel XE#1426]) +1 other test fail
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-lnl-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][45] ([Intel XE#1426])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-8/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-180:
    - shard-lnl:          [PASS][46] -> [FAIL][47] ([Intel XE#3106])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-5/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-lnl-3/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#316]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-435/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [PASS][49] -> [FAIL][50] ([Intel XE#1231] / [Intel XE#1242])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#610])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#1124]) +2 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#367])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-435/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#2191]) +2 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#2887])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-lnl-3/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#787]) +55 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-435/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-bmg:          [PASS][57] -> [SKIP][58] ([Intel XE#2890]) +6 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#455] / [Intel XE#787]) +15 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [PASS][60] -> [INCOMPLETE][61] ([Intel XE#1195] / [Intel XE#3113])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [PASS][62] -> [INCOMPLETE][63] ([Intel XE#1195] / [Intel XE#1727]) +2 other tests incomplete
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:
    - shard-dg2-set2:     [PASS][64] -> [INCOMPLETE][65] ([Intel XE#1195]) +1 other test incomplete
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:
    - shard-dg2-set2:     [PASS][66] -> [DMESG-WARN][67] ([Intel XE#3113]) +1 other test dmesg-warn
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][68] ([Intel XE#314])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-436/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-dg2-set2:     NOTRUN -> [SKIP][69] ([Intel XE#306])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-435/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#373]) +3 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_color@ctm-max@pipe-c-edp-1:
    - shard-lnl:          [PASS][71] -> [DMESG-WARN][72] ([Intel XE#2929]) +1 other test dmesg-warn
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-1/igt@kms_color@ctm-max@pipe-c-edp-1.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-lnl-1/igt@kms_color@ctm-max@pipe-c-edp-1.html

  * igt@kms_content_protection@atomic:
    - shard-dg2-set2:     NOTRUN -> [FAIL][73] ([Intel XE#1178]) +1 other test fail
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-435/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][74] ([Intel XE#1178])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-8/igt@kms_content_protection@atomic@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][75] ([Intel XE#308])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#1424])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-lnl-3/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#2423] / [i915#2575]) +22 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#309]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-lnl-3/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][79] -> [DMESG-WARN][80] ([Intel XE#877])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2-set2:     NOTRUN -> [SKIP][81] ([Intel XE#323])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([i915#3804])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-463/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][83] ([Intel XE#301]) +4 other tests fail
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1:
    - shard-lnl:          [PASS][84] -> [FAIL][85] ([Intel XE#886])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-6/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][86] ([Intel XE#301]) +8 other tests fail
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#2293]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][88] ([Intel XE#455]) +4 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#656]) +4 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][90] ([Intel XE#651]) +18 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][91] ([Intel XE#653]) +16 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][92] ([Intel XE#2927])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-435/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     [PASS][93] -> [FAIL][94] ([Intel XE#616]) +1 other test fail
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-463/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-434/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c:
    - shard-dg2-set2:     NOTRUN -> [SKIP][95] ([Intel XE#2763]) +5 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][96] ([Intel XE#2763] / [Intel XE#455]) +3 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
    - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#2763]) +11 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#870])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-463/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_rpm@i2c:
    - shard-bmg:          [PASS][99] -> [SKIP][100] ([Intel XE#2446]) +1 other test skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-4/igt@kms_pm_rpm@i2c.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@kms_pm_rpm@i2c.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][101] ([Intel XE#1489]) +2 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-463/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg2-set2:     NOTRUN -> [SKIP][102] ([Intel XE#1122]) +1 other test skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-435/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr-cursor-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][103] ([Intel XE#2850] / [Intel XE#929]) +9 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-435/igt@kms_psr@fbc-psr-cursor-plane-onoff.html

  * igt@kms_psr@fbc-psr-no-drrs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][104] ([Intel XE#2351] / [Intel XE#2890]) +3 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-434/igt@kms_psr@fbc-psr-no-drrs.html

  * igt@kms_psr@pr-sprite-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][105] ([Intel XE#2890]) +21 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-434/igt@kms_psr@pr-sprite-blt.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][106] ([Intel XE#327]) +1 other test skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [PASS][107] -> [FAIL][108] ([Intel XE#899])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@testdisplay:
    - shard-dg2-set2:     NOTRUN -> [SKIP][109] ([Intel XE#2423])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-434/igt@testdisplay.html

  * igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01:
    - shard-dg2-set2:     [PASS][110] -> [ABORT][111] ([Intel XE#2625]) +1 other test abort
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-464/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-432/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01.html

  * igt@xe_drm_fdinfo@utilization-single-full-load-isolation:
    - shard-lnl:          [PASS][112] -> [FAIL][113] ([Intel XE#2667])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-1/igt@xe_drm_fdinfo@utilization-single-full-load-isolation.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-lnl-5/igt@xe_drm_fdinfo@utilization-single-full-load-isolation.html

  * igt@xe_eudebug@basic-close:
    - shard-dg2-set2:     NOTRUN -> [SKIP][114] ([Intel XE#2905]) +5 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-435/igt@xe_eudebug@basic-close.html

  * igt@xe_evict@evict-small-external-cm:
    - shard-lnl:          NOTRUN -> [SKIP][115] ([Intel XE#688]) +1 other test skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-lnl-3/igt@xe_evict@evict-small-external-cm.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][116] ([Intel XE#1130]) +31 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-434/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm:
    - shard-lnl:          [PASS][117] -> [FAIL][118] ([Intel XE#3160])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-1/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-lnl-1/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html

  * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
    - shard-dg2-set2:     NOTRUN -> [SKIP][119] ([Intel XE#288]) +14 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-436/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][120] ([Intel XE#2360])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-435/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html

  * igt@xe_exec_reset@parallel-close-fd:
    - shard-dg2-set2:     NOTRUN -> [FAIL][121] ([Intel XE#1081])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-436/igt@xe_exec_reset@parallel-close-fd.html

  * igt@xe_exec_sip_eudebug@breakpoint-writesip:
    - shard-lnl:          NOTRUN -> [SKIP][122] ([Intel XE#2905]) +1 other test skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-lnl-3/igt@xe_exec_sip_eudebug@breakpoint-writesip.html

  * igt@xe_gt_freq@freq_reset_multiple:
    - shard-lnl:          [PASS][123] -> [DMESG-WARN][124] ([Intel XE#3184])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-4/igt@xe_gt_freq@freq_reset_multiple.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-lnl-4/igt@xe_gt_freq@freq_reset_multiple.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-adlp:         NOTRUN -> [SKIP][125] ([Intel XE#2229])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-adlp-8/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][126] ([Intel XE#2229])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-434/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
    - shard-lnl:          NOTRUN -> [SKIP][127] ([Intel XE#2229])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-lnl-8/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_module_load@force-load:
    - shard-dg2-set2:     NOTRUN -> [SKIP][128] ([Intel XE#378])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-436/igt@xe_module_load@force-load.html

  * igt@xe_module_load@reload-no-display:
    - shard-bmg:          [PASS][129] -> [FAIL][130] ([Intel XE#2136])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-3/igt@xe_module_load@reload-no-display.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@xe_module_load@reload-no-display.html

  * igt@xe_oa@non-privileged-access-vaddr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][131] ([Intel XE#2541]) +2 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-435/igt@xe_oa@non-privileged-access-vaddr.html

  * igt@xe_peer2peer@write:
    - shard-dg2-set2:     NOTRUN -> [SKIP][132] ([Intel XE#1061])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-434/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-mocs:
    - shard-lnl:          NOTRUN -> [SKIP][133] ([Intel XE#2284])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-lnl-3/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@s2idle-vm-bind-userptr:
    - shard-dg2-set2:     [PASS][134] -> [ABORT][135] ([Intel XE#1694] / [Intel XE#1794])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-464/igt@xe_pm@s2idle-vm-bind-userptr.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-userptr.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-adlp:         [PASS][136] -> [ABORT][137] ([Intel XE#1358] / [Intel XE#1607])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-2/igt@xe_pm@s4-d3hot-basic-exec.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-adlp:         [PASS][138] -> [ABORT][139] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-2/igt@xe_pm@s4-multiple-execs.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-lnl:          [PASS][140] -> [ABORT][141] ([Intel XE#1794])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-7/igt@xe_pm@s4-vm-bind-unbind-all.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-adlp:         [PASS][142] -> [FAIL][143] ([Intel XE#958])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-2/igt@xe_pm_residency@toggle-gt-c6.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-adlp-9/igt@xe_pm_residency@toggle-gt-c6.html
    - shard-lnl:          [PASS][144] -> [FAIL][145] ([Intel XE#958])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-6/igt@xe_pm_residency@toggle-gt-c6.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-lnl-7/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     NOTRUN -> [SKIP][146] ([Intel XE#944])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-436/igt@xe_query@multigpu-query-engines.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-lnl:          NOTRUN -> [SKIP][147] ([Intel XE#944])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-lnl-3/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_query@query-gt-list:
    - shard-bmg:          [PASS][148] -> [SKIP][149] ([Intel XE#1130]) +123 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-8/igt@xe_query@query-gt-list.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@xe_query@query-gt-list.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - shard-bmg:          [SKIP][150] ([Intel XE#1885]) -> [PASS][151]
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@core_hotunplug@unbind-rebind.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-8/igt@core_hotunplug@unbind-rebind.html

  * igt@fbdev@pan:
    - shard-bmg:          [SKIP][152] ([Intel XE#2134]) -> [PASS][153]
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@fbdev@pan.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-8/igt@fbdev@pan.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1:
    - shard-adlp:         [DMESG-FAIL][154] ([Intel XE#1033] / [Intel XE#1727] / [Intel XE#3194]) -> [PASS][155]
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-9/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1.html

  * igt@kms_async_flips@async-flip-with-page-flip-events:
    - shard-adlp:         [DMESG-WARN][156] ([Intel XE#3194]) -> [PASS][157] +2 other tests pass
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-adlp:         [FAIL][158] ([Intel XE#1426]) -> [PASS][159] +1 other test pass
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-9/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-adlp-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-dg2-set2:     [ABORT][160] ([Intel XE#2388]) -> [PASS][161]
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-432/igt@kms_cursor_crc@cursor-suspend.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-463/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [ABORT][162] -> [PASS][163]
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-432/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-463/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6.html

  * igt@kms_draw_crc@draw-method-blt:
    - shard-bmg:          [SKIP][164] ([Intel XE#2890]) -> [PASS][165] +8 other tests pass
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_draw_crc@draw-method-blt.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-8/igt@kms_draw_crc@draw-method-blt.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-dg2-set2:     [FAIL][166] ([Intel XE#2882]) -> [PASS][167]
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-436/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-464/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][168] ([Intel XE#301]) -> [PASS][169] +3 other tests pass
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-wf_vblank-ts-check@ac-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][170] -> [PASS][171] +6 other tests pass
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-433/igt@kms_flip@2x-wf_vblank-ts-check@ac-hdmi-a6-dp4.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-435/igt@kms_flip@2x-wf_vblank-ts-check@ac-hdmi-a6-dp4.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-lnl:          [FAIL][172] ([Intel XE#886]) -> [PASS][173] +9 other tests pass
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-7/igt@kms_flip@blocking-wf_vblank.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-lnl-1/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a1:
    - shard-adlp:         [FAIL][174] ([Intel XE#2882]) -> [PASS][175] +1 other test pass
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-6/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a1.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-adlp-6/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:
    - shard-dg2-set2:     [FAIL][176] ([Intel XE#301]) -> [PASS][177] +8 other tests pass
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6:
    - shard-dg2-set2:     [FAIL][178] ([Intel XE#3267]) -> [PASS][179]
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [ABORT][180] ([Intel XE#2625]) -> [PASS][181] +2 other tests pass
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-432/igt@kms_flip@flip-vs-suspend-interruptible.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
    - shard-adlp:         [DMESG-WARN][182] ([Intel XE#1033] / [Intel XE#1727]) -> [PASS][183] +1 other test pass
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-adlp-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling:
    - shard-bmg:          [SKIP][184] -> [PASS][185] +1 other test pass
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [FAIL][186] ([Intel XE#1430]) -> [PASS][187]
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-5/igt@kms_pm_dc@dc6-psr.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-bmg:          [SKIP][188] ([Intel XE#2446]) -> [PASS][189] +1 other test pass
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-4/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@legacy-planes-dpms@plane-68:
    - shard-lnl:          [DMESG-WARN][190] ([Intel XE#3184]) -> [PASS][191] +1 other test pass
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-5/igt@kms_pm_rpm@legacy-planes-dpms@plane-68.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-lnl-5/igt@kms_pm_rpm@legacy-planes-dpms@plane-68.html

  * igt@kms_properties@connector-properties-legacy:
    - shard-bmg:          [SKIP][192] ([Intel XE#2423]) -> [PASS][193] +55 other tests pass
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_properties@connector-properties-legacy.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-8/igt@kms_properties@connector-properties-legacy.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-lnl:          [FAIL][194] ([Intel XE#2948]) -> [PASS][195] +1 other test pass
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-5/igt@kms_psr@fbc-psr2-cursor-plane-move.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-lnl-3/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [FAIL][196] ([Intel XE#2883]) -> [PASS][197] +2 other tests pass
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-8/igt@kms_setmode@basic@pipe-b-edp-1.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-lnl-8/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
    - shard-lnl:          [FAIL][198] ([Intel XE#899]) -> [PASS][199]
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html

  * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
    - shard-lnl:          [FAIL][200] ([Intel XE#2142]) -> [PASS][201] +1 other test pass
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-6/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-lnl-1/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-dg2-set2:     [TIMEOUT][202] ([Intel XE#1473]) -> [PASS][203]
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-small.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-433/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-dg2-set2:     [FAIL][204] ([Intel XE#1000]) -> [PASS][205]
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-434/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_exec_balancer@many-cm-parallel-basic:
    - shard-bmg:          [DMESG-WARN][206] -> [PASS][207] +10 other tests pass
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-7/igt@xe_exec_balancer@many-cm-parallel-basic.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-7/igt@xe_exec_balancer@many-cm-parallel-basic.html
    - shard-adlp:         [DMESG-WARN][208] -> [PASS][209] +5 other tests pass
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-1/igt@xe_exec_balancer@many-cm-parallel-basic.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-adlp-6/igt@xe_exec_balancer@many-cm-parallel-basic.html

  * igt@xe_exec_basic@many-null:
    - shard-adlp:         [TIMEOUT][210] ([Intel XE#1033] / [Intel XE#1727]) -> [PASS][211]
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-6/igt@xe_exec_basic@many-null.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-adlp-4/igt@xe_exec_basic@many-null.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm:
    - shard-bmg:          [FAIL][212] -> [PASS][213] +1 other test pass
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-7/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-7/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm:
    - shard-lnl:          [FAIL][214] -> [PASS][215] +3 other tests pass
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-5/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-lnl-3/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm.html

  * igt@xe_exec_fault_mode@twice-invalid-fault:
    - shard-lnl:          [DMESG-WARN][216] ([Intel XE#3230]) -> [PASS][217]
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-4/igt@xe_exec_fault_mode@twice-invalid-fault.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-lnl-4/igt@xe_exec_fault_mode@twice-invalid-fault.html

  * igt@xe_exec_threads@threads-bal-mixed-userptr:
    - shard-dg2-set2:     [DMESG-WARN][218] -> [PASS][219] +5 other tests pass
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-433/igt@xe_exec_threads@threads-bal-mixed-userptr.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-435/igt@xe_exec_threads@threads-bal-mixed-userptr.html

  * igt@xe_exec_threads@threads-hang-rebind:
    - shard-adlp:         [DMESG-WARN][220] ([Intel XE#358]) -> [PASS][221] +7 other tests pass
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-2/igt@xe_exec_threads@threads-hang-rebind.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-adlp-9/igt@xe_exec_threads@threads-hang-rebind.html

  * igt@xe_exec_threads@threads-hang-shared-vm-rebind:
    - shard-dg2-set2:     [DMESG-WARN][222] ([Intel XE#358]) -> [PASS][223] +6 other tests pass
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-463/igt@xe_exec_threads@threads-hang-shared-vm-rebind.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-466/igt@xe_exec_threads@threads-hang-shared-vm-rebind.html

  * igt@xe_exec_threads@threads-hang-userptr-rebind-err:
    - shard-lnl:          [DMESG-WARN][224] -> [PASS][225] +12 other tests pass
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-2/igt@xe_exec_threads@threads-hang-userptr-rebind-err.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-lnl-2/igt@xe_exec_threads@threads-hang-userptr-rebind-err.html

  * igt@xe_exec_threads@threads-mixed-fd-basic:
    - shard-adlp:         [DMESG-WARN][226] ([Intel XE#3230]) -> [PASS][227] +1 other test pass
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-6/igt@xe_exec_threads@threads-mixed-fd-basic.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-adlp-6/igt@xe_exec_threads@threads-mixed-fd-basic.html
    - shard-bmg:          [DMESG-WARN][228] ([Intel XE#3230]) -> [PASS][229]
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-1/igt@xe_exec_threads@threads-mixed-fd-basic.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-1/igt@xe_exec_threads@threads-mixed-fd-basic.html

  * igt@xe_exec_threads@threads-mixed-shared-vm-basic:
    - shard-dg2-set2:     [DMESG-WARN][230] ([Intel XE#3230]) -> [PASS][231]
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-464/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-432/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html

  * igt@xe_live_ktest@xe_dma_buf:
    - shard-adlp:         [SKIP][232] ([Intel XE#1192]) -> [PASS][233] +1 other test pass
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-9/igt@xe_live_ktest@xe_dma_buf.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-adlp-1/igt@xe_live_ktest@xe_dma_buf.html
    - shard-bmg:          [SKIP][234] ([Intel XE#1192]) -> [PASS][235]
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-8/igt@xe_live_ktest@xe_dma_buf.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-2/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_live_ktest@xe_migrate:
    - shard-dg2-set2:     [SKIP][236] ([Intel XE#1192]) -> [PASS][237] +1 other test pass
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-463/igt@xe_live_ktest@xe_migrate.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-434/igt@xe_live_ktest@xe_migrate.html
    - shard-lnl:          [SKIP][238] ([Intel XE#1192]) -> [PASS][239] +1 other test pass
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-8/igt@xe_live_ktest@xe_migrate.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-lnl-8/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_module_load@many-reload:
    - shard-bmg:          [FAIL][240] ([Intel XE#2136]) -> [PASS][241]
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@xe_module_load@many-reload.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-8/igt@xe_module_load@many-reload.html

  * igt@xe_pm@s2idle-basic:
    - shard-dg2-set2:     [ABORT][242] ([Intel XE#1358] / [Intel XE#1794]) -> [PASS][243]
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-432/igt@xe_pm@s2idle-basic.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-436/igt@xe_pm@s2idle-basic.html

  * igt@xe_pm@s3-vm-bind-unbind-all:
    - shard-adlp:         [DMESG-WARN][244] ([Intel XE#569]) -> [PASS][245]
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-1/igt@xe_pm@s3-vm-bind-unbind-all.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-adlp-6/igt@xe_pm@s3-vm-bind-unbind-all.html

  * igt@xe_pm@s4-basic:
    - shard-lnl:          [ABORT][246] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][247]
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-2/igt@xe_pm@s4-basic.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-lnl-3/igt@xe_pm@s4-basic.html

  * igt@xe_spin_batch@spin-all:
    - shard-bmg:          [SKIP][248] ([Intel XE#1130]) -> [PASS][249] +121 other tests pass
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@xe_spin_batch@spin-all.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-4/igt@xe_spin_batch@spin-all.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-bmg:          [SKIP][250] ([Intel XE#2423]) -> [SKIP][251] ([Intel XE#2233])
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-adlp:         [DMESG-FAIL][252] ([Intel XE#1033] / [Intel XE#1727] / [Intel XE#3194]) -> [DMESG-WARN][253] ([Intel XE#3194])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-9/igt@kms_async_flips@alternate-sync-async-flip.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-bmg:          [SKIP][254] ([Intel XE#2385]) -> [SKIP][255] ([Intel XE#2423])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-8/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-bmg:          [SKIP][256] ([Intel XE#2423]) -> [FAIL][257] ([Intel XE#1426])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-8/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-bmg:          [SKIP][258] -> [SKIP][259] ([Intel XE#2327]) +1 other test skip
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-8/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-lnl:          [DMESG-FAIL][260] ([Intel XE#1725]) -> [DMESG-WARN][261] ([Intel XE#1725])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-7/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-lnl-2/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-bmg:          [SKIP][262] ([Intel XE#2327]) -> [SKIP][263] ([Intel XE#2890]) +4 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-3/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-bmg:          [SKIP][264] ([Intel XE#2890]) -> [SKIP][265] ([Intel XE#2327]) +3 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-1/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [FAIL][266] ([Intel XE#1231] / [Intel XE#1242]) -> [DMESG-FAIL][267] ([Intel XE#3194]) +1 other test dmesg-fail
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          [SKIP][268] -> [SKIP][269] ([Intel XE#1124]) +2 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][270] ([Intel XE#3194]) -> [FAIL][271] ([Intel XE#1231] / [Intel XE#1242])
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
    - shard-bmg:          [SKIP][272] ([Intel XE#2890]) -> [SKIP][273] ([Intel XE#1124]) +4 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-1/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-bmg:          [SKIP][274] -> [SKIP][275] ([Intel XE#610])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-8/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-bmg:          [SKIP][276] ([Intel XE#1124]) -> [SKIP][277] ([Intel XE#2890]) +4 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-bmg:          [SKIP][278] ([Intel XE#2314] / [Intel XE#2894]) -> [SKIP][279] ([Intel XE#2423])
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-8/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
    - shard-bmg:          [SKIP][280] ([Intel XE#367]) -> [SKIP][281] ([Intel XE#2423])
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-3/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-3-displays-1920x1080p:
    - shard-bmg:          [SKIP][282] ([Intel XE#2423]) -> [SKIP][283] ([Intel XE#367]) +1 other test skip
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-4/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:
    - shard-bmg:          [SKIP][284] ([Intel XE#2890]) -> [SKIP][285] ([Intel XE#2887]) +5 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-1/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-ccs:
    - shard-bmg:          [SKIP][286] -> [SKIP][287] ([Intel XE#2887]) +4 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-8/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:
    - shard-bmg:          [SKIP][288] ([Intel XE#2887]) -> [SKIP][289] ([Intel XE#2890]) +5 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][290] ([Intel XE#2652] / [Intel XE#787]) -> [SKIP][291] ([Intel XE#2890]) +1 other test skip
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-4/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-bmg:          [SKIP][292] ([Intel XE#2423]) -> [SKIP][293] ([Intel XE#2325]) +1 other test skip
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_chamelium_color@ctm-blue-to-red.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-8/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-bmg:          [SKIP][294] ([Intel XE#2423]) -> [SKIP][295] ([Intel XE#2252]) +6 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_chamelium_frames@hdmi-aspect-ratio.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-4/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
    - shard-bmg:          [SKIP][296] ([Intel XE#2252]) -> [SKIP][297] ([Intel XE#2423]) +8 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-4/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [SKIP][298] ([Intel XE#2423]) -> [FAIL][299] ([Intel XE#1178])
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_content_protection@atomic.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-8/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@mei-interface:
    - shard-bmg:          [SKIP][300] ([Intel XE#2423]) -> [SKIP][301] ([Intel XE#2341])
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_content_protection@mei-interface.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-1/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@type1:
    - shard-bmg:          [SKIP][302] ([Intel XE#2341]) -> [SKIP][303] ([Intel XE#2423])
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-4/igt@kms_content_protection@type1.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-bmg:          [SKIP][304] ([Intel XE#2423]) -> [SKIP][305] ([Intel XE#2321]) +1 other test skip
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-bmg:          [SKIP][306] ([Intel XE#2321]) -> [SKIP][307] ([Intel XE#2423])
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-max-size:
    - shard-bmg:          [SKIP][308] ([Intel XE#2423]) -> [SKIP][309] ([Intel XE#2320]) +2 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_cursor_crc@cursor-random-max-size.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-1/igt@kms_cursor_crc@cursor-random-max-size.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-bmg:          [SKIP][310] ([Intel XE#2320]) -> [SKIP][311] ([Intel XE#2423]) +3 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-3/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-bmg:          [SKIP][312] ([Intel XE#2286]) -> [SKIP][313] ([Intel XE#2423])
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-bmg:          [SKIP][314] ([Intel XE#2423]) -> [SKIP][315] ([Intel XE#2286]) +1 other test skip
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-bmg:          [DMESG-WARN][316] ([Intel XE#877]) -> [SKIP][317] ([Intel XE#2423])
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-bmg:          [SKIP][318] ([Intel XE#2244]) -> [SKIP][319] ([Intel XE#2890])
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-4/igt@kms_dsc@dsc-with-bpc.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-bmg:          [SKIP][320] ([Intel XE#2890]) -> [SKIP][321] ([Intel XE#2244])
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_dsc@dsc-with-bpc-formats.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-1/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_feature_discovery@display-3x:
    - shard-bmg:          [SKIP][322] ([Intel XE#2373]) -> [SKIP][323] ([Intel XE#2423])
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-3/igt@kms_feature_discovery@display-3x.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@kms_feature_discovery@display-3x.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [SKIP][324] ([Intel XE#2423]) -> [FAIL][325] ([Intel XE#301])
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@bo-too-big-interruptible@a-edp1:
    - shard-lnl:          [INCOMPLETE][326] ([Intel XE#1504]) -> [TIMEOUT][327] ([Intel XE#1504]) +1 other test timeout
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-8/igt@kms_flip@bo-too-big-interruptible@a-edp1.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-lnl-8/igt@kms_flip@bo-too-big-interruptible@a-edp1.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-lnl:          [FAIL][328] ([Intel XE#886]) -> [FAIL][329] ([Intel XE#3149] / [Intel XE#886])
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-6/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-bmg:          [SKIP][330] ([Intel XE#2890]) -> [SKIP][331] ([Intel XE#2293] / [Intel XE#2380])
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-bmg:          [SKIP][332] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][333] ([Intel XE#2890])
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-bmg:          [SKIP][334] -> [SKIP][335] ([Intel XE#2293] / [Intel XE#2380])
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][336] ([Intel XE#2311]) -> [SKIP][337] ([Intel XE#2890]) +13 other tests skip
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:
    - shard-bmg:          [SKIP][338] ([Intel XE#2890]) -> [SKIP][339] ([Intel XE#2311]) +15 other tests skip
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
    - shard-adlp:         [TIMEOUT][340] ([Intel XE#1033] / [Intel XE#1727]) -> [FAIL][341] ([Intel XE#1861])
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][342] -> [FAIL][343] ([Intel XE#2333]) +2 other tests fail
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][344] ([Intel XE#2890]) -> [FAIL][345] ([Intel XE#2333]) +5 other tests fail
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
    - shard-bmg:          [FAIL][346] ([Intel XE#2333]) -> [SKIP][347] ([Intel XE#2890]) +6 other tests skip
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-adlp:         [TIMEOUT][348] ([Intel XE#1033] / [Intel XE#1727]) -> [SKIP][349] ([Intel XE#656])
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-suspend:
    - shard-bmg:          [SKIP][350] -> [SKIP][351] ([Intel XE#2311]) +6 other tests skip
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][352] ([Intel XE#2890]) -> [SKIP][353] ([Intel XE#2313]) +6 other tests skip
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][354] ([Intel XE#2313]) -> [SKIP][355] ([Intel XE#2890]) +13 other tests skip
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][356] -> [SKIP][357] ([Intel XE#2313]) +14 other tests skip
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-bmg:          [SKIP][358] -> [SKIP][359] ([Intel XE#2927])
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_joiner@basic-ultra-joiner.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-8/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_plane@pixel-format-source-clamping:
    - shard-adlp:         [INCOMPLETE][360] ([Intel XE#1035] / [Intel XE#1195]) -> [INCOMPLETE][361] ([Intel XE#1035])
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-2/igt@kms_plane@pixel-format-source-clamping.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-adlp-3/igt@kms_plane@pixel-format-source-clamping.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          [SKIP][362] ([Intel XE#2493]) -> [SKIP][363] ([Intel XE#2423])
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-4/igt@kms_plane_multiple@tiling-yf.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:
    - shard-bmg:          [SKIP][364] ([Intel XE#2423]) -> [SKIP][365] ([Intel XE#2763]) +2 other tests skip
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
    - shard-bmg:          [SKIP][366] ([Intel XE#2763]) -> [SKIP][367] ([Intel XE#2423])
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html

  * igt@kms_pm_backlight@fade:
    - shard-bmg:          [SKIP][368] ([Intel XE#2890]) -> [SKIP][369] ([Intel XE#870])
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_pm_backlight@fade.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-1/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-bmg:          [SKIP][370] ([Intel XE#2392]) -> [SKIP][371] ([Intel XE#2890])
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-3/igt@kms_pm_dc@dc6-psr.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-bmg:          [SKIP][372] ([Intel XE#2446]) -> [SKIP][373] ([Intel XE#1439] / [Intel XE#3141])
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-8/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          [SKIP][374] -> [SKIP][375] ([Intel XE#1489]) +4 other tests skip
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-bmg:          [SKIP][376] ([Intel XE#2890]) -> [SKIP][377] ([Intel XE#2387]) +1 other test skip
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_psr2_su@page_flip-p010.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-8/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-bmg:          [SKIP][378] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][379] ([Intel XE#2890]) +6 other tests skip
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-3/igt@kms_psr@fbc-psr2-cursor-plane-move.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_psr@psr-cursor-plane-move:
    - shard-bmg:          [SKIP][380] -> [SKIP][381] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_psr@psr-cursor-plane-move.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-1/igt@kms_psr@psr-cursor-plane-move.html

  * igt@kms_psr@psr-cursor-plane-onoff:
    - shard-bmg:          [SKIP][382] ([Intel XE#2890]) -> [SKIP][383] ([Intel XE#2234] / [Intel XE#2850]) +6 other tests skip
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_psr@psr-cursor-plane-onoff.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-4/igt@kms_psr@psr-cursor-plane-onoff.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-bmg:          [SKIP][384] ([Intel XE#2329]) -> [SKIP][385] ([Intel XE#2423])
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-3/igt@kms_rotation_crc@bad-pixel-format.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-bmg:          [SKIP][386] ([Intel XE#2330]) -> [SKIP][387] ([Intel XE#2423])
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-bmg:          [SKIP][388] ([Intel XE#2423]) -> [SKIP][389] ([Intel XE#2330])
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-bmg:          [SKIP][390] ([Intel XE#2413]) -> [SKIP][391] ([Intel XE#2423])
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-3/igt@kms_scaling_modes@scaling-mode-full-aspect.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][392] ([Intel XE#2423]) -> [SKIP][393] ([Intel XE#2426])
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][394] ([Intel XE#362]) -> [SKIP][395] ([Intel XE#1500])
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@flip-suspend:
    - shard-bmg:          [SKIP][396] ([Intel XE#1499]) -> [SKIP][397] ([Intel XE#2423])
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-3/igt@kms_vrr@flip-suspend.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@kms_vrr@flip-suspend.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-bmg:          [SKIP][398] ([Intel XE#2423]) -> [SKIP][399] ([Intel XE#1499]) +1 other test skip
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-vrr.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-8/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@kms_writeback@writeback-check-output:
    - shard-bmg:          [SKIP][400] ([Intel XE#756]) -> [SKIP][401] ([Intel XE#2423])
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-8/igt@kms_writeback@writeback-check-output.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-bmg:          [SKIP][402] ([Intel XE#2423]) -> [SKIP][403] ([Intel XE#756])
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-1/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-bmg:          [SKIP][404] ([Intel XE#1091] / [Intel XE#2849]) -> [SKIP][405] ([Intel XE#2423])
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-3/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-bmg:          [SKIP][406] ([Intel XE#2504]) -> [SKIP][407] ([Intel XE#1130])
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-4/igt@xe_create@multigpu-create-massive-size.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_eudebug_online@interrupt-other:
    - shard-bmg:          [SKIP][408] ([Intel XE#1130]) -> [SKIP][409] ([Intel XE#2905]) +7 other tests skip
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@xe_eudebug_online@interrupt-other.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-4/igt@xe_eudebug_online@interrupt-other.html

  * igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram:
    - shard-bmg:          [SKIP][410] ([Intel XE#2905]) -> [SKIP][411] ([Intel XE#1130]) +6 other tests skip
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-4/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [TIMEOUT][412] ([Intel XE#1473]) -> [SKIP][413] ([Intel XE#1130])
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-4/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-bmg:          [SKIP][414] ([Intel XE#1130]) -> [TIMEOUT][415] ([Intel XE#1473]) +1 other test timeout
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-large.html
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-4/igt@xe_evict@evict-mixed-many-threads-large.html
    - shard-dg2-set2:     [FAIL][416] ([Intel XE#1000]) -> [TIMEOUT][417] ([Intel XE#1473])
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-436/igt@xe_evict@evict-mixed-many-threads-large.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-464/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:
    - shard-bmg:          [SKIP][418] ([Intel XE#1130]) -> [SKIP][419] ([Intel XE#2322]) +6 other tests skip
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:
    - shard-bmg:          [SKIP][420] ([Intel XE#2322]) -> [SKIP][421] ([Intel XE#1130]) +7 other tests skip
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-bmg:          [SKIP][422] ([Intel XE#1192]) -> [SKIP][423] ([Intel XE#2833])
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-3/igt@xe_live_ktest@xe_eudebug.html
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-8/igt@xe_live_ktest@xe_eudebug.html
    - shard-adlp:         [SKIP][424] -> [SKIP][425] ([Intel XE#455])
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-3/igt@xe_live_ktest@xe_eudebug.html
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-adlp-2/igt@xe_live_ktest@xe_eudebug.html
    - shard-dg2-set2:     [SKIP][426] -> [SKIP][427] ([Intel XE#455])
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-433/igt@xe_live_ktest@xe_eudebug.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-435/igt@xe_live_ktest@xe_eudebug.html

  * igt@xe_oa@unprivileged-single-ctx-counters:
    - shard-bmg:          [SKIP][428] ([Intel XE#2248]) -> [SKIP][429] ([Intel XE#1130])
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-8/igt@xe_oa@unprivileged-single-ctx-counters.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@xe_oa@unprivileged-single-ctx-counters.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-bmg:          [SKIP][430] ([Intel XE#2284]) -> [SKIP][431] ([Intel XE#1130]) +1 other test skip
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-8/igt@xe_pm@d3cold-mmap-system.html
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_query@multigpu-query-topology-l3-bank-mask:
    - shard-bmg:          [SKIP][432] ([Intel XE#1130]) -> [SKIP][433] ([Intel XE#944])
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@xe_query@multigpu-query-topology-l3-bank-mask.html
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-1/igt@xe_query@multigpu-query-topology-l3-bank-mask.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-bmg:          [SKIP][434] ([Intel XE#944]) -> [SKIP][435] ([Intel XE#1130]) +1 other test skip
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-3/igt@xe_query@multigpu-query-uc-fw-version-huc.html
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  
  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1081]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1242]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694
  [Intel XE#1725]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2329
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2385]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2385
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2388]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2388
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2667]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2667
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2890]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2929
  [Intel XE#2948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3106]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3106
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3160]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3160
  [Intel XE#3184]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184
  [Intel XE#3194]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3230]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230
  [Intel XE#3267]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3267
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804


Build changes
-------------

  * Linux: xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154 -> xe-pw-139121v3

  IGT_8086: 18939acec2446c6644644186b090d16e366af8bc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154: 24707cf2a7c47d4cd192c97e73d58aa4011de154
  xe-pw-139121v3: 139121v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/index.html

--===============6681436817402735098==
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
<tr><td><b>Series:</b></td><td>drm/xe/pmu: PMU interface for Xe (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139121/">https://patchwork.freedesktop.org/series/139121/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154_full -&gt; xe-pw-139121v3_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-139121v3_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-139121v3_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-139121v3_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@modeset-transition:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-8/igt@kms_atomic_transition@modeset-transition.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-adlp-8/igt@kms_atomic_transition@modeset-transition.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-none@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-4/igt@kms_plane_multiple@tiling-none@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-lnl-4/igt@kms_plane_multiple@tiling-none@pipe-a-edp-1.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-6/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-lnl-1/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-3/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-3/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-9/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-8/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html">SKIP</a> +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-wc.html">SKIP</a> +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-3/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-3/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</a> +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-4/igt@kms_psr@fbc-psr-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@kms_psr@fbc-psr-primary-render.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_create@create-execqueues-noleak-shared:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@xe_create@create-execqueues-noleak-shared.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-4/igt@xe_create@create-execqueues-noleak-shared.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@xe_exec_fault_mode@many-userptr-invalidate-race-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-1/igt@xe_exec_fault_mode@many-userptr-invalidate-race-imm.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-139121v3_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-4/igt@core_hotunplug@hotrebind-lateclose.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@core_hotunplug@hotrebind-lateclose.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-4/igt@fbdev@eof.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-999:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-3/igt@kms_addfb_basic@bad-pitch-999.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@kms_addfb_basic@bad-pitch-999.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +57 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-lnl-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-8/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-5/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-lnl-3/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3106">Intel XE#3106</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-435/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-435/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-lnl-3/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-435/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +55 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-436/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-435/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-1/igt@kms_color@ctm-max@pipe-c-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-lnl-1/igt@kms_color@ctm-max@pipe-c-edp-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2929">Intel XE#2929</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-435/igt@kms_content_protection@atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-8/igt@kms_content_protection@atomic@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-lnl-3/igt@kms_cursor_crc@cursor-sliding-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-lnl-3/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-463/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-6/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +8 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-435/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-463/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-434/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-463/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-4/igt@kms_pm_rpm@i2c.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@kms_pm_rpm@i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-463/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-435/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-435/igt@kms_psr@fbc-psr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-434/igt@kms_psr@fbc-psr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-434/igt@kms_psr@pr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-434/igt@testdisplay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-464/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-432/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@utilization-single-full-load-isolation:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-1/igt@xe_drm_fdinfo@utilization-single-full-load-isolation.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-lnl-5/igt@xe_drm_fdinfo@utilization-single-full-load-isolation.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2667">Intel XE#2667</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-close:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-435/igt@xe_eudebug@basic-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-cm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-lnl-3/igt@xe_evict@evict-small-external-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-434/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-1/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-lnl-1/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3160">Intel XE#3160</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-invalid-userptr-fault:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-436/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-435/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-close-fd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-436/igt@xe_exec_reset@parallel-close-fd.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081">Intel XE#1081</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-writesip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-lnl-3/igt@xe_exec_sip_eudebug@breakpoint-writesip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_reset_multiple:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-4/igt@xe_gt_freq@freq_reset_multiple.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-lnl-4/igt@xe_gt_freq@freq_reset_multiple.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184">Intel XE#3184</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-adlp-8/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-434/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-lnl-8/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-436/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-3/igt@xe_module_load@reload-no-display.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@xe_module_load@reload-no-display.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-access-vaddr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-435/igt@xe_oa@non-privileged-access-vaddr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-434/igt@xe_peer2peer@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-lnl-3/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-464/igt@xe_pm@s2idle-vm-bind-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694">Intel XE#1694</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-2/igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-2/igt@xe_pm@s4-multiple-execs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-7/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-2/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-adlp-9/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-6/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-lnl-7/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-436/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-lnl-3/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@query-gt-list:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-8/igt@xe_query@query-gt-list.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@xe_query@query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +123 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@core_hotunplug@unbind-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-8/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@pan:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@fbdev@pan.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-8/igt@fbdev@pan.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-9/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194">Intel XE#3194</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194">Intel XE#3194</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-9/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-adlp-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-432/igt@kms_cursor_crc@cursor-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2388">Intel XE#2388</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-463/igt@kms_cursor_crc@cursor-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-432/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-463/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_draw_crc@draw-method-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-8/igt@kms_draw_crc@draw-method-blt.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-436/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-464/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check@ac-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-433/igt@kms_flip@2x-wf_vblank-ts-check@ac-hdmi-a6-dp4.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-435/igt@kms_flip@2x-wf_vblank-ts-check@ac-hdmi-a6-dp4.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-7/igt@kms_flip@blocking-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-lnl-1/igt@kms_flip@blocking-wf_vblank.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-6/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-adlp-6/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3267">Intel XE#3267</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-432/igt@kms_flip@flip-vs-suspend-interruptible.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-adlp-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-5/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-4/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes-dpms@plane-68:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-5/igt@kms_pm_rpm@legacy-planes-dpms@plane-68.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184">Intel XE#3184</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-lnl-5/igt@kms_pm_rpm@legacy-planes-dpms@plane-68.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_properties@connector-properties-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-8/igt@kms_properties@connector-properties-legacy.html">PASS</a> +55 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-5/igt@kms_psr@fbc-psr2-cursor-plane-move.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948">Intel XE#2948</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-lnl-3/igt@kms_psr@fbc-psr2-cursor-plane-move.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-8/igt@kms_setmode@basic@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-lnl-8/igt@kms_setmode@basic@pipe-b-edp-1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-6/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142">Intel XE#2142</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-lnl-1/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-433/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-434/igt@xe_evict@evict-mixed-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-cm-parallel-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-7/igt@xe_exec_balancer@many-cm-parallel-basic.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-7/igt@xe_exec_balancer@many-cm-parallel-basic.html">PASS</a> +10 other tests pass</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-1/igt@xe_exec_balancer@many-cm-parallel-basic.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-adlp-6/igt@xe_exec_balancer@many-cm-parallel-basic.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-6/igt@xe_exec_basic@many-null.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-adlp-4/igt@xe_exec_basic@many-null.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-7/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-7/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-5/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-lnl-3/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-invalid-fault:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-4/igt@xe_exec_fault_mode@twice-invalid-fault.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-lnl-4/igt@xe_exec_fault_mode@twice-invalid-fault.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-433/igt@xe_exec_threads@threads-bal-mixed-userptr.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-435/igt@xe_exec_threads@threads-bal-mixed-userptr.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-rebind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-2/igt@xe_exec_threads@threads-hang-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-adlp-9/igt@xe_exec_threads@threads-hang-rebind.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-shared-vm-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-463/igt@xe_exec_threads@threads-hang-shared-vm-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-466/igt@xe_exec_threads@threads-hang-shared-vm-rebind.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-userptr-rebind-err:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-2/igt@xe_exec_threads@threads-hang-userptr-rebind-err.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-lnl-2/igt@xe_exec_threads@threads-hang-userptr-rebind-err.html">PASS</a> +12 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-fd-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-6/igt@xe_exec_threads@threads-mixed-fd-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-adlp-6/igt@xe_exec_threads@threads-mixed-fd-basic.html">PASS</a> +1 other test pass</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-1/igt@xe_exec_threads@threads-mixed-fd-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-1/igt@xe_exec_threads@threads-mixed-fd-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-shared-vm-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-464/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-432/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-9/igt@xe_live_ktest@xe_dma_buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-adlp-1/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> +1 other test pass</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-8/igt@xe_live_ktest@xe_dma_buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-2/igt@xe_live_ktest@xe_dma_buf.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-463/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-434/igt@xe_live_ktest@xe_migrate.html">PASS</a> +1 other test pass</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-8/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-lnl-8/igt@xe_live_ktest@xe_migrate.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@xe_module_load@many-reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-8/igt@xe_module_load@many-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-432/igt@xe_pm@s2idle-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-436/igt@xe_pm@s2idle-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-unbind-all:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-1/igt@xe_pm@s3-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-adlp-6/igt@xe_pm@s3-vm-bind-unbind-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-2/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-lnl-3/igt@xe_pm@s4-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-all:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@xe_spin_batch@spin-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-4/igt@xe_spin_batch@spin-all.html">PASS</a> +121 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233">Intel XE#2233</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-9/igt@kms_async_flips@alternate-sync-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194">Intel XE#3194</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194">Intel XE#3194</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-8/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2385">Intel XE#2385</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-8/igt@kms_atomic_transition@plane-all-modeset-transition.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-8/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-7/igt@kms_big_fb@linear-64bpp-rotate-180.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725">Intel XE#1725</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-lnl-2/igt@kms_big_fb@linear-64bpp-rotate-180.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725">Intel XE#1725</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-3/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-1/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194">Intel XE#3194</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194">Intel XE#3194</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-1/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-8/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-8/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-3/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-4/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-1/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-8/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-4/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-8/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-4/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm-disable:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-4/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-8/igt@kms_content_protection@atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-1/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-4/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-max-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_cursor_crc@cursor-random-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-1/igt@kms_cursor_crc@cursor-random-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-3/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-4/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-1/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-3/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373">Intel XE#2373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@bo-too-big-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-8/igt@kms_flip@bo-too-big-interruptible@a-edp1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504">Intel XE#1504</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-lnl-8/igt@kms_flip@bo-too-big-interruptible@a-edp1.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504">Intel XE#1504</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-6/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-8/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-2/igt@kms_plane@pixel-format-source-clamping.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-adlp-3/igt@kms_plane@pixel-format-source-clamping.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-4/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493">Intel XE#2493</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-1/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-3/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392">Intel XE#2392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-8/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-8/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-3/igt@kms_psr@fbc-psr2-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@kms_psr@fbc-psr2-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-1/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_psr@psr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-4/igt@kms_psr@psr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-3/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2329">Intel XE#2329</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-3/igt@kms_scaling_modes@scaling-mode-full-aspect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-full-aspect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-3/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-8/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-8/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-1/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-3/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-4/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504">Intel XE#2504</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-other:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@xe_eudebug_online@interrupt-other.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-4/igt@xe_eudebug_online@interrupt-other.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-4/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-4/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@xe_evict@evict-beng-mixed-many-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-4/igt@xe_evict@evict-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) +1 other test timeout</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-436/igt@xe_evict@evict-mixed-many-threads-large.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-464/igt@xe_evict@evict-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-3/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-8/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833">Intel XE#2833</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-3/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-adlp-2/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-433/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-dg2-435/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-8/igt@xe_oa@unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248">Intel XE#2248</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@xe_oa@unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-8/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology-l3-bank-mask:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@xe_query@multigpu-query-topology-l3-bank-mask.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-1/igt@xe_query@multigpu-query-topology-l3-bank-mask.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-3/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v3/shard-bmg-5/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154 -&gt; xe-pw-139121v3</li>
</ul>
<p>IGT_8086: 18939acec2446c6644644186b090d16e366af8bc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154: 24707cf2a7c47d4cd192c97e73d58aa4011de154<br />
  xe-pw-139121v3: 139121v3</p>

</body>
</html>

--===============6681436817402735098==--
