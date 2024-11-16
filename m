Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CD98D68BD0
	for <intel-xe@archiver.kernel.org>; Sat, 16 Nov 2024 02:41:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF01510E038;
	Sat, 16 Nov 2024 02:41:54 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E884110E038;
 Sat, 16 Nov 2024 02:41:53 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8038558362618046281=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe=3A_Drop_useless_d3cold_a?=
 =?utf-8?q?llowed_message_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 16 Nov 2024 02:41:53 -0000
Message-ID: <173172491395.380828.14762529823992553704@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241115192155.2050987-1-matthew.brost@intel.com>
In-Reply-To: <20241115192155.2050987-1-matthew.brost@intel.com>
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

--===============8038558362618046281==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Drop useless d3cold allowed message (rev2)
URL   : https://patchwork.freedesktop.org/series/141426/
State : failure

== Summary ==

CI Bug Log - changes from xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf_full -> xe-pw-141426v2_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-141426v2_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-141426v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-141426v2_full:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@hotreplug:
    - shard-adlp:         [PASS][1] -> [ABORT][2] +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-adlp-9/igt@core_hotunplug@hotreplug.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-adlp-2/igt@core_hotunplug@hotreplug.html
    - shard-bmg:          [PASS][3] -> [INCOMPLETE][4] +8 other tests incomplete
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-1/igt@core_hotunplug@hotreplug.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-3/igt@core_hotunplug@hotreplug.html

  * igt@core_hotunplug@hotunplug-rescan:
    - shard-lnl:          [PASS][5] -> [ABORT][6] +2 other tests abort
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-lnl-4/igt@core_hotunplug@hotunplug-rescan.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-7/igt@core_hotunplug@hotunplug-rescan.html

  * igt@kms_addfb_basic@basic:
    - shard-lnl:          NOTRUN -> [DMESG-WARN][7]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-6/igt@kms_addfb_basic@basic.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][8] -> [DMESG-WARN][9] +37 other tests dmesg-warn
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_cursor_crc@cursor-onscreen-64x64@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][10] +2 other tests dmesg-fail
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-64x64@pipe-a-dp-2.html

  * igt@kms_flip@flip-vs-suspend@c-hdmi-a6:
    - shard-dg2-set2:     [PASS][11] -> [DMESG-FAIL][12] +2 other tests dmesg-fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-433/igt@kms_flip@flip-vs-suspend@c-hdmi-a6.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-435/igt@kms_flip@flip-vs-suspend@c-hdmi-a6.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@d-hdmi-a3:
    - shard-bmg:          [PASS][13] -> [DMESG-WARN][14] +224 other tests dmesg-warn
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-4/igt@kms_flip@plain-flip-ts-check-interruptible@d-hdmi-a3.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-1/igt@kms_flip@plain-flip-ts-check-interruptible@d-hdmi-a3.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x:
    - shard-bmg:          [PASS][15] -> [DMESG-FAIL][16] +59 other tests dmesg-fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-8/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-6/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format:
    - shard-bmg:          [PASS][17] -> [SKIP][18] +4 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-1/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-3/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-dg2-set2:     [PASS][19] -> [ABORT][20] +2 other tests abort
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-464/igt@kms_pm_rpm@dpms-non-lpsp.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-435/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][21] +11 other tests dmesg-warn
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-464/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@xe_ccs@block-multicopy-inplace:
    - shard-lnl:          [PASS][22] -> [DMESG-WARN][23] +49 other tests dmesg-warn
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-lnl-8/igt@xe_ccs@block-multicopy-inplace.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-6/igt@xe_ccs@block-multicopy-inplace.html

  * igt@xe_evict@evict-threads-large-multi-vm:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][24] +13 other tests dmesg-warn
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-1/igt@xe_evict@evict-threads-large-multi-vm.html

  * igt@xe_exec_fault_mode@many-userptr-invalidate:
    - shard-lnl:          [PASS][25] -> [DMESG-FAIL][26] +7 other tests dmesg-fail
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-lnl-4/igt@xe_exec_fault_mode@many-userptr-invalidate.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-1/igt@xe_exec_fault_mode@many-userptr-invalidate.html

  * igt@xe_spin_batch@spin-fixed-duration-with-preempter:
    - shard-lnl:          [PASS][27] -> [FAIL][28]
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-lnl-8/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-3/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-adlp:         [PASS][29] -> [FAIL][30]
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-adlp-4/igt@xe_sriov_flr@flr-vf1-clear.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-adlp-1/igt@xe_sriov_flr@flr-vf1-clear.html

  
#### Warnings ####

  * igt@core_hotunplug@hotunplug-rescan:
    - shard-adlp:         [DMESG-WARN][31] ([Intel XE#3086]) -> [ABORT][32]
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-adlp-3/igt@core_hotunplug@hotunplug-rescan.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-adlp-1/igt@core_hotunplug@hotunplug-rescan.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-lnl:          [FAIL][33] ([Intel XE#1701]) -> [DMESG-WARN][34] +1 other test dmesg-warn
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-lnl-1/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-1/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs:
    - shard-bmg:          [SKIP][35] ([Intel XE#2887]) -> [SKIP][36]
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-bmg:          [SKIP][37] ([Intel XE#2325]) -> [SKIP][38]
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-7/igt@kms_chamelium_color@ctm-0-50.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-3/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42:
    - shard-bmg:          [SKIP][39] ([Intel XE#2320]) -> [SKIP][40]
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-128x42.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-3/igt@kms_cursor_crc@cursor-onscreen-128x42.html

  * igt@kms_cursor_edge_walk@128x128-left-edge:
    - shard-bmg:          [INCOMPLETE][41] -> [DMESG-FAIL][42]
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-3/igt@kms_cursor_edge_walk@128x128-left-edge.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-6/igt@kms_cursor_edge_walk@128x128-left-edge.html

  * igt@kms_cursor_edge_walk@128x128-left-edge@pipe-d-dp-2:
    - shard-bmg:          [INCOMPLETE][43] -> [DMESG-WARN][44]
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-3/igt@kms_cursor_edge_walk@128x128-left-edge@pipe-d-dp-2.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-6/igt@kms_cursor_edge_walk@128x128-left-edge@pipe-d-dp-2.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          [FAIL][45] ([Intel XE#1695]) -> [DMESG-FAIL][46]
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-7/igt@kms_fbcon_fbt@fbc-suspend.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-6/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][47] ([Intel XE#2882]) -> [DMESG-WARN][48] +1 other test dmesg-warn
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][49] -> [DMESG-WARN][50]
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [FAIL][51] ([Intel XE#2333]) -> [DMESG-FAIL][52] +20 other tests dmesg-fail
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render:
    - shard-bmg:          [FAIL][53] ([Intel XE#2333]) -> [SKIP][54]
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][55] ([Intel XE#2311]) -> [SKIP][56]
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][57] ([Intel XE#2313]) -> [SKIP][58]
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-b-dp-2:
    - shard-bmg:          [FAIL][59] ([Intel XE#2333]) -> [INCOMPLETE][60]
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-6/igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-b-dp-2.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-4/igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-b-dp-2.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:
    - shard-bmg:          [SKIP][61] ([Intel XE#1489]) -> [SKIP][62]
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-6/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-3/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr@psr2-cursor-render:
    - shard-bmg:          [SKIP][63] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][64]
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-7/igt@kms_psr@psr2-cursor-render.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-3/igt@kms_psr@psr2-cursor-render.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run}:
    - shard-dg2-set2:     [PASS][65] -> [DMESG-WARN][66] +5 other tests dmesg-warn
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-435/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-435/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html

  * {igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc}:
    - shard-bmg:          [FAIL][67] -> [DMESG-FAIL][68] +3 other tests dmesg-fail
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-6/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-4/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html

  * {igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind}:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][69]
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-463/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html
    - shard-bmg:          [PASS][70] -> [DMESG-WARN][71]
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-7/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-1/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html

  
New tests
---------

  New tests have been introduced between xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf_full and xe-pw-141426v2_full:

### New IGT tests (11) ###

  * igt@kms_concurrent@multi-plane-atomic-lowres@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.68] s

  * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen:
    - Statuses : 2 pass(s) 2 skip(s)
    - Exec time: [0.0, 2.09] s

  * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen:
    - Statuses : 2 pass(s) 2 skip(s)
    - Exec time: [0.0, 2.21] s

  * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:
    - Statuses : 2 pass(s) 2 skip(s)
    - Exec time: [0.0, 9.95] s

  * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd:
    - Statuses : 2 pass(s) 2 skip(s)
    - Exec time: [0.0, 9.36] s

  * igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen:
    - Statuses : 2 pass(s) 2 skip(s)
    - Exec time: [0.0, 9.86] s

  * igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd:
    - Statuses : 2 pass(s) 2 skip(s)
    - Exec time: [0.0, 10.12] s

  * igt@xe_exec_queue_property@basic-get-property:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_queue_property@invalid-exec-queue:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@xe_exec_queue_property@non-zero-reserved:
    - Statuses : 4 pass(s)
    - Exec time: [0.00] s

  

Known issues
------------

  Here are the changes found in xe-pw-141426v2_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@unaligned-read:
    - shard-bmg:          [PASS][72] -> [SKIP][73] ([Intel XE#2134])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-2/igt@fbdev@unaligned-read.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-3/igt@fbdev@unaligned-read.html

  * igt@kms_async_flips@async-flip-with-page-flip-events:
    - shard-adlp:         [PASS][74] -> [DMESG-WARN][75] ([Intel XE#1033]) +3 other tests dmesg-warn
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:
    - shard-lnl:          NOTRUN -> [FAIL][76] ([Intel XE#911]) +3 other tests fail
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#2550]) +23 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-463/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:
    - shard-lnl:          [PASS][78] -> [FAIL][79] ([Intel XE#1426]) +1 other test fail
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-lnl-4/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-3/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-0:
    - shard-bmg:          [PASS][80] -> [INCOMPLETE][81] ([Intel XE#3225])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-5/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-2/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#1407])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-16bpp-rotate-180:
    - shard-bmg:          [PASS][83] -> [SKIP][84] ([Intel XE#2136] / [Intel XE#2231]) +2 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-7/igt@kms_big_fb@linear-16bpp-rotate-180.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-3/igt@kms_big_fb@linear-16bpp-rotate-180.html
    - shard-dg2-set2:     [PASS][85] -> [SKIP][86] ([Intel XE#2136]) +3 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-464/igt@kms_big_fb@linear-16bpp-rotate-180.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-434/igt@kms_big_fb@linear-16bpp-rotate-180.html

  * igt@kms_big_fb@linear-8bpp-rotate-0:
    - shard-adlp:         [PASS][87] -> [DMESG-WARN][88] ([Intel XE#358])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-adlp-3/igt@kms_big_fb@linear-8bpp-rotate-0.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-adlp-3/igt@kms_big_fb@linear-8bpp-rotate-0.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#316])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-436/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-180:
    - shard-lnl:          [PASS][90] -> [INCOMPLETE][91] ([Intel XE#3225]) +1 other test incomplete
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-lnl-7/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-6/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#1124]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][93] ([Intel XE#1124]) +8 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#1124]) +4 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-1/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][95] ([Intel XE#2191])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][96] ([Intel XE#787]) +110 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-435/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-d-dp-5:
    - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#455] / [Intel XE#787]) +32 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-466/igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-d-dp-5.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#2907])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-435/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#2652] / [Intel XE#787]) +17 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-2/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#2887]) +6 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-5/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [PASS][101] -> [INCOMPLETE][102] ([Intel XE#1195]) +9 other tests incomplete
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][103] ([Intel XE#2669]) +3 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#2887]) +7 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-5:
    - shard-dg2-set2:     NOTRUN -> [SKIP][105] ([Intel XE#1152]) +3 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-466/igt@kms_cdclk@plane-scaling@pipe-b-dp-5.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#306])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-7/igt@kms_chamelium_color@ctm-negative.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][107] ([Intel XE#306])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-435/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][108] ([Intel XE#373]) +4 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-464/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
    - shard-adlp:         NOTRUN -> [SKIP][109] ([Intel XE#373])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-adlp-1/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html

  * igt@kms_chamelium_edid@vga-edid-read:
    - shard-lnl:          NOTRUN -> [SKIP][110] ([Intel XE#373]) +4 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-4/igt@kms_chamelium_edid@vga-edid-read.html

  * igt@kms_chamelium_hpd@dp-hpd:
    - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#2252]) +2 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-5/igt@kms_chamelium_hpd@dp-hpd.html

  * igt@kms_color@ctm-0-75:
    - shard-bmg:          [PASS][112] -> [DMESG-WARN][113] ([Intel XE#877]) +3 other tests dmesg-warn
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-8/igt@kms_color@ctm-0-75.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-4/igt@kms_color@ctm-0-75.html

  * igt@kms_content_protection@legacy:
    - shard-lnl:          NOTRUN -> [SKIP][114] ([Intel XE#3278])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-3/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][115] ([Intel XE#1178]) +2 other tests fail
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-433/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][116] ([Intel XE#308])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-435/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-offscreen-64x21:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][117] ([Intel XE#1195]) +2 other tests incomplete
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-436/igt@kms_cursor_crc@cursor-offscreen-64x21.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-lnl:          NOTRUN -> [SKIP][118] ([Intel XE#2321])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-3/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-256x256:
    - shard-bmg:          [PASS][119] -> [SKIP][120] ([Intel XE#3007]) +17 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-256x256.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-256x256.html

  * igt@kms_cursor_crc@cursor-sliding-64x21:
    - shard-lnl:          NOTRUN -> [SKIP][121] ([Intel XE#1424]) +1 other test skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-1/igt@kms_cursor_crc@cursor-sliding-64x21.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][122] ([Intel XE#309]) +2 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-2/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2-set2:     NOTRUN -> [SKIP][123] ([Intel XE#323])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-464/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-lnl:          NOTRUN -> [SKIP][124] ([Intel XE#307])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-6/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2-set2:     NOTRUN -> [SKIP][125] ([Intel XE#703])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-433/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2-set2:     NOTRUN -> [SKIP][126] ([Intel XE#1135])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-466/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][127] ([Intel XE#1421]) +1 other test skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-5/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [PASS][128] -> [INCOMPLETE][129] ([Intel XE#1195] / [Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-dp4:
    - shard-dg2-set2:     [PASS][130] -> [INCOMPLETE][131] ([Intel XE#1195] / [Intel XE#2597])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible@b-dp4.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible@b-dp4.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][132] ([Intel XE#1397]) +1 other test skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][133] ([Intel XE#2293] / [Intel XE#2380])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][134] ([Intel XE#2293])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][135] ([Intel XE#1401] / [Intel XE#1745])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][136] ([Intel XE#1401])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][137] ([Intel XE#1397] / [Intel XE#1745]) +1 other test skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         [PASS][138] -> [DMESG-FAIL][139] ([Intel XE#1033] / [Intel XE#324]) +3 other tests dmesg-fail
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html

  * igt@kms_force_connector_basic@force-connector-state:
    - shard-lnl:          NOTRUN -> [SKIP][140] ([Intel XE#352]) +1 other test skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-3/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][141] ([Intel XE#651]) +4 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][142] ([Intel XE#2311]) +5 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
    - shard-dg2-set2:     NOTRUN -> [SKIP][143] ([Intel XE#651]) +18 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][144] ([Intel XE#2136]) +2 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
    - shard-adlp:         [PASS][145] -> [DMESG-FAIL][146] ([Intel XE#1033]) +7 other tests dmesg-fail
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [PASS][147] -> [SKIP][148] ([Intel XE#2136] / [Intel XE#2351]) +1 other test skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [FAIL][149] ([Intel XE#2333]) +4 other tests fail
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][150] ([Intel XE#2313]) +11 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][151] ([Intel XE#653]) +26 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][152] ([Intel XE#656])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-adlp-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][153] ([Intel XE#656]) +17 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][154] ([Intel XE#2502])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-4/igt@kms_getfb@getfb-reject-ccs.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][155] ([Intel XE#605])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-464/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-bmg:          [PASS][156] -> [DMESG-WARN][157] ([Intel XE#3426])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-6/igt@kms_hdr@bpc-switch-suspend.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-6/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][158] -> [SKIP][159] ([Intel XE#1503])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-2/igt@kms_hdr@invalid-hdr.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-6/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][160] ([Intel XE#2934])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1:
    - shard-adlp:         [PASS][161] -> [FAIL][162] ([Intel XE#1874])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-adlp-2/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-adlp-1/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-dg2-set2:     NOTRUN -> [SKIP][163] ([Intel XE#2423] / [i915#2575]) +4 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c:
    - shard-lnl:          NOTRUN -> [SKIP][164] ([Intel XE#2763]) +11 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-7/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][165] ([Intel XE#2763]) +2 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-436/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][166] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-436/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-bmg:          NOTRUN -> [SKIP][167] ([Intel XE#870])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-8/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg2-set2:     NOTRUN -> [SKIP][168] ([Intel XE#3309])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-463/igt@kms_pm_dc@dc5-retention-flops.html
    - shard-lnl:          NOTRUN -> [SKIP][169] ([Intel XE#3309])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-5/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-lnl:          NOTRUN -> [SKIP][170] ([Intel XE#1439])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-4/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-lnl:          NOTRUN -> [SKIP][171] ([Intel XE#2893])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-8/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][172] ([Intel XE#1489]) +1 other test skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-1/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][173] ([Intel XE#1489]) +4 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-464/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][174] ([Intel XE#2850] / [Intel XE#929]) +11 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-463/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@pr-primary-page-flip:
    - shard-lnl:          NOTRUN -> [SKIP][175] ([Intel XE#1406]) +2 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-5/igt@kms_psr@pr-primary-page-flip.html

  * igt@kms_psr@psr-basic:
    - shard-bmg:          NOTRUN -> [SKIP][176] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-2/igt@kms_psr@psr-basic.html

  * igt@kms_rotation_crc@cursor-rotation-180:
    - shard-bmg:          [PASS][177] -> [SKIP][178] ([Intel XE#829]) +1 other test skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-6/igt@kms_rotation_crc@cursor-rotation-180.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-3/igt@kms_rotation_crc@cursor-rotation-180.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-dg2-set2:     [PASS][179] -> [SKIP][180] ([Intel XE#2423] / [i915#2575]) +14 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-434/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-434/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-lnl:          NOTRUN -> [SKIP][181] ([Intel XE#1127])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     NOTRUN -> [FAIL][182] ([Intel XE#1729])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-lnl:          [PASS][183] -> [FAIL][184] ([Intel XE#899]) +2 other tests fail
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-lnl-2/igt@kms_universal_plane@cursor-fb-leak.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][185] -> [FAIL][186] ([Intel XE#2159]) +1 other test fail
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     NOTRUN -> [SKIP][187] ([Intel XE#455]) +7 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-433/igt@kms_vrr@flipline.html

  * igt@kms_vrr@max-min:
    - shard-lnl:          [PASS][188] -> [FAIL][189] ([Intel XE#1522]) +1 other test fail
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-lnl-4/igt@kms_vrr@max-min.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-8/igt@kms_vrr@max-min.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-bmg:          NOTRUN -> [SKIP][190] ([Intel XE#1091] / [Intel XE#2849])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-3/igt@sriov_basic@enable-vfs-autoprobe-off.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][191] ([Intel XE#1091] / [Intel XE#2849])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-434/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_copy_basic@mem-copy-linear-0x3fff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][192] ([Intel XE#1123])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-463/igt@xe_copy_basic@mem-copy-linear-0x3fff.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][193] ([Intel XE#1126])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
    - shard-adlp:         NOTRUN -> [SKIP][194] ([Intel XE#2905])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-adlp-1/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html

  * igt@xe_eudebug@multiple-sessions:
    - shard-dg2-set2:     NOTRUN -> [SKIP][195] ([Intel XE#2905]) +9 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-433/igt@xe_eudebug@multiple-sessions.html
    - shard-bmg:          NOTRUN -> [SKIP][196] ([Intel XE#2905])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-7/igt@xe_eudebug@multiple-sessions.html

  * igt@xe_eudebug_online@interrupt-other-debuggable:
    - shard-lnl:          NOTRUN -> [SKIP][197] ([Intel XE#2905]) +4 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-5/igt@xe_eudebug_online@interrupt-other-debuggable.html

  * igt@xe_evict@evict-beng-large-cm:
    - shard-lnl:          NOTRUN -> [SKIP][198] ([Intel XE#688]) +5 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-8/igt@xe_evict@evict-beng-large-cm.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     [PASS][199] -> [TIMEOUT][200] ([Intel XE#1473] / [Intel XE#402])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-435/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-bmg:          [PASS][201] -> [TIMEOUT][202] ([Intel XE#1473])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-4/igt@xe_evict@evict-beng-threads-large.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-5/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_evict@evict-large-external-cm:
    - shard-bmg:          [PASS][203] -> [SKIP][204] ([Intel XE#1130]) +27 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-8/igt@xe_evict@evict-large-external-cm.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-3/igt@xe_evict@evict-large-external-cm.html

  * igt@xe_evict@evict-large-multi-vm-cm:
    - shard-dg2-set2:     NOTRUN -> [FAIL][205] ([Intel XE#1600])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-435/igt@xe_evict@evict-large-multi-vm-cm.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd (NEW):
    - shard-bmg:          NOTRUN -> [SKIP][206] ([Intel XE#1130]) +2 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-3/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html

  * igt@xe_exec_basic@many-execqueues-many-vm-rebind:
    - shard-lnl:          [PASS][207] -> [INCOMPLETE][208] ([Intel XE#2594])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-lnl-1/igt@xe_exec_basic@many-execqueues-many-vm-rebind.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-8/igt@xe_exec_basic@many-execqueues-many-vm-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][209] ([Intel XE#2322]) +1 other test skip
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-4/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][210] ([Intel XE#1392]) +3 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-5/igt@xe_exec_basic@multigpu-no-exec-userptr.html

  * igt@xe_exec_basic@multigpu-once-null:
    - shard-adlp:         NOTRUN -> [SKIP][211] ([Intel XE#1392])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-adlp-2/igt@xe_exec_basic@multigpu-once-null.html

  * igt@xe_exec_basic@twice-userptr:
    - shard-dg2-set2:     [PASS][212] -> [SKIP][213] ([Intel XE#1130]) +19 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-466/igt@xe_exec_basic@twice-userptr.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-434/igt@xe_exec_basic@twice-userptr.html

  * igt@xe_exec_compute_mode@many-userptr-rebind:
    - shard-dg2-set2:     NOTRUN -> [SKIP][214] ([Intel XE#1130]) +4 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-434/igt@xe_exec_compute_mode@many-userptr-rebind.html

  * igt@xe_exec_fault_mode@twice-userptr-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][215] ([Intel XE#288]) +16 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-433/igt@xe_exec_fault_mode@twice-userptr-prefetch.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
    - shard-dg2-set2:     NOTRUN -> [SKIP][216] ([Intel XE#2360])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-464/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html

  * igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate:
    - shard-dg2-set2:     [PASS][217] -> [DMESG-FAIL][218] ([Intel XE#3371])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-463/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-435/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][219] ([Intel XE#255])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-464/igt@xe_huc_copy@huc_copy.html

  * igt@xe_live_ktest@xe_mocs:
    - shard-bmg:          [PASS][220] -> [SKIP][221] ([Intel XE#1192])
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-8/igt@xe_live_ktest@xe_mocs.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-7/igt@xe_live_ktest@xe_mocs.html

  * igt@xe_mmap@vram:
    - shard-lnl:          NOTRUN -> [SKIP][222] ([Intel XE#1416])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-8/igt@xe_mmap@vram.html

  * igt@xe_oa@oa-regs-whitelisted:
    - shard-dg2-set2:     NOTRUN -> [SKIP][223] ([Intel XE#2541]) +3 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-435/igt@xe_oa@oa-regs-whitelisted.html

  * igt@xe_pm@d3cold-basic:
    - shard-lnl:          NOTRUN -> [SKIP][224] ([Intel XE#2284] / [Intel XE#366])
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-6/igt@xe_pm@d3cold-basic.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][225] ([Intel XE#2284] / [Intel XE#366])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-435/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@s2idle-multiple-execs:
    - shard-bmg:          [PASS][226] -> [DMESG-WARN][227] ([Intel XE#1616])
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-7/igt@xe_pm@s2idle-multiple-execs.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-5/igt@xe_pm@s2idle-multiple-execs.html

  * igt@xe_pm@s3-basic-exec:
    - shard-dg2-set2:     [PASS][228] -> [DMESG-WARN][229] ([Intel XE#569]) +1 other test dmesg-warn
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-466/igt@xe_pm@s3-basic-exec.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-436/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-bmg:          [PASS][230] -> [DMESG-WARN][231] ([Intel XE#569]) +1 other test dmesg-warn
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-4/igt@xe_pm@s3-d3hot-basic-exec.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-8/igt@xe_pm@s3-d3hot-basic-exec.html

  * igt@xe_pm@s4-mocs:
    - shard-bmg:          [PASS][232] -> [DMESG-WARN][233] ([Intel XE#2280])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-1/igt@xe_pm@s4-mocs.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-6/igt@xe_pm@s4-mocs.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-adlp:         [PASS][234] -> [ABORT][235] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-adlp-2/igt@xe_pm@s4-multiple-execs.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-dg2-set2:     [PASS][236] -> [DMESG-WARN][237] ([Intel XE#2280]) +1 other test dmesg-warn
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-464/igt@xe_pm@s4-vm-bind-userptr.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-435/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_pm_residency@gt-c6-freeze:
    - shard-dg2-set2:     [PASS][238] -> [DMESG-WARN][239] ([Intel XE#3088]) +1 other test dmesg-warn
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-463/igt@xe_pm_residency@gt-c6-freeze.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-464/igt@xe_pm_residency@gt-c6-freeze.html

  * igt@xe_query@multigpu-query-engines:
    - shard-lnl:          NOTRUN -> [SKIP][240] ([Intel XE#944]) +1 other test skip
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-4/igt@xe_query@multigpu-query-engines.html

  * igt@xe_query@multigpu-query-invalid-size:
    - shard-bmg:          NOTRUN -> [SKIP][241] ([Intel XE#944])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-7/igt@xe_query@multigpu-query-invalid-size.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][242] ([Intel XE#944])
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-433/igt@xe_query@multigpu-query-invalid-size.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-adlp:         NOTRUN -> [SKIP][243] ([Intel XE#944])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-adlp-8/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-lnl:          NOTRUN -> [SKIP][244] ([Intel XE#3342]) +1 other test skip
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-3/igt@xe_sriov_flr@flr-vf1-clear.html

  * igt@xe_wedged@basic-wedged:
    - shard-lnl:          NOTRUN -> [DMESG-WARN][245] ([Intel XE#2919] / [Intel XE#3119])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-8/igt@xe_wedged@basic-wedged.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-dg2-set2:     NOTRUN -> [ABORT][246] ([Intel XE#3421])
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-436/igt@xe_wedged@wedged-at-any-timeout.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-adlp:         [DMESG-WARN][247] ([Intel XE#1033]) -> [PASS][248] +2 other tests pass
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-adlp-6/igt@kms_async_flips@async-flip-suspend-resume.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-adlp-9/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-dg2-set2:     [DMESG-WARN][249] ([Intel XE#877]) -> [PASS][250]
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-463/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-464/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         [FAIL][251] ([Intel XE#1242]) -> [PASS][252] +1 other test pass
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-adlp:         [FAIL][253] ([Intel XE#1874]) -> [PASS][254] +6 other tests pass
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [FAIL][255] ([Intel XE#1231] / [Intel XE#1242]) -> [PASS][256] +1 other test pass
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][257] ([Intel XE#1195] / [Intel XE#1727]) -> [PASS][258] +1 other test pass
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][259] ([Intel XE#1195] / [Intel XE#3113]) -> [PASS][260]
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][261] ([Intel XE#1195]) -> [PASS][262] +4 other tests pass
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_color@ctm-0-25@pipe-b-edp-1:
    - shard-lnl:          [DMESG-WARN][263] ([Intel XE#2929]) -> [PASS][264] +1 other test pass
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-lnl-6/igt@kms_color@ctm-0-25@pipe-b-edp-1.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-5/igt@kms_color@ctm-0-25@pipe-b-edp-1.html

  * igt@kms_cursor_edge_walk@256x256-right-edge:
    - shard-lnl:          [FAIL][265] ([Intel XE#2577]) -> [PASS][266] +1 other test pass
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-lnl-5/igt@kms_cursor_edge_walk@256x256-right-edge.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-7/igt@kms_cursor_edge_walk@256x256-right-edge.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][267] -> [PASS][268] +4 other tests pass
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-lnl:          [FAIL][269] ([Intel XE#886]) -> [PASS][270] +8 other tests pass
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-lnl-1/igt@kms_flip@blocking-wf_vblank.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-2/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip@dpms-vs-vblank-race-interruptible:
    - shard-bmg:          [INCOMPLETE][271] ([Intel XE#2635]) -> [PASS][272]
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-3/igt@kms_flip@dpms-vs-vblank-race-interruptible.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-8/igt@kms_flip@dpms-vs-vblank-race-interruptible.html

  * igt@kms_flip@dpms-vs-vblank-race-interruptible@b-hdmi-a3:
    - shard-bmg:          [INCOMPLETE][273] -> [PASS][274] +2 other tests pass
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-3/igt@kms_flip@dpms-vs-vblank-race-interruptible@b-hdmi-a3.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-8/igt@kms_flip@dpms-vs-vblank-race-interruptible@b-hdmi-a3.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank:
    - shard-bmg:          [FAIL][275] ([Intel XE#2882]) -> [PASS][276] +2 other tests pass
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-1/igt@kms_flip@flip-vs-blocking-wf-vblank.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-5/igt@kms_flip@flip-vs-blocking-wf-vblank.html
    - shard-dg2-set2:     [FAIL][277] ([Intel XE#886]) -> [PASS][278]
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-435/igt@kms_flip@flip-vs-blocking-wf-vblank.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-436/igt@kms_flip@flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@b-hdmi-a6:
    - shard-dg2-set2:     [FAIL][279] -> [PASS][280] +2 other tests pass
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-435/igt@kms_flip@flip-vs-blocking-wf-vblank@b-hdmi-a6.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-436/igt@kms_flip@flip-vs-blocking-wf-vblank@b-hdmi-a6.html

  * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6:
    - shard-dg2-set2:     [FAIL][281] ([Intel XE#301]) -> [PASS][282]
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-adlp:         [DMESG-WARN][283] ([Intel XE#2953] / [Intel XE#3086]) -> [PASS][284]
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-adlp-3/igt@kms_flip@flip-vs-suspend.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-adlp-6/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:
    - shard-lnl:          [FAIL][285] -> [PASS][286] +1 other test pass
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         [DMESG-FAIL][287] ([Intel XE#324]) -> [PASS][288] +1 other test pass
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-adlp-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:
    - shard-adlp:         [FAIL][289] ([Intel XE#1861]) -> [PASS][290] +1 other test pass
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-2:
    - shard-bmg:          [SKIP][291] -> [PASS][292]
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-6/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-2.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-6/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-2.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-bmg:          [SKIP][293] ([Intel XE#3012]) -> [PASS][294]
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-2/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-lnl:          [DMESG-WARN][295] ([Intel XE#3184]) -> [PASS][296]
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-lnl-8/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-4/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-dg2-set2:     [TIMEOUT][297] ([Intel XE#1473]) -> [PASS][298]
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-small.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate:
    - shard-lnl:          [DMESG-WARN][299] -> [PASS][300]
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-lnl-1/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-4/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate.html

  * igt@xe_exec_threads@threads-basic:
    - shard-dg2-set2:     [INCOMPLETE][301] ([Intel XE#1169] / [Intel XE#1195]) -> [PASS][302]
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-436/igt@xe_exec_threads@threads-basic.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-436/igt@xe_exec_threads@threads-basic.html

  * igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate:
    - shard-bmg:          [DMESG-WARN][303] -> [PASS][304]
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-8/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-2/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html

  * igt@xe_pm@s2idle-basic:
    - shard-adlp:         [DMESG-WARN][305] ([Intel XE#3086]) -> [PASS][306] +2 other tests pass
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-adlp-3/igt@xe_pm@s2idle-basic.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-adlp-3/igt@xe_pm@s2idle-basic.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-lnl:          [ABORT][307] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][308]
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-5/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-adlp:         [ABORT][309] ([Intel XE#1607] / [Intel XE#1794]) -> [PASS][310]
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-adlp-1/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          [FAIL][311] ([Intel XE#958]) -> [PASS][312]
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-lnl-3/igt@xe_pm_residency@toggle-gt-c6.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-1/igt@xe_pm_residency@toggle-gt-c6.html

  
#### Warnings ####

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-bmg:          [SKIP][313] ([Intel XE#2385]) -> [SKIP][314] ([Intel XE#3007])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-2/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-3/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
    - shard-dg2-set2:     [SKIP][315] ([Intel XE#455]) -> [SKIP][316] ([Intel XE#2423] / [i915#2575])
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-436/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-434/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][317] ([Intel XE#316]) -> [INCOMPLETE][318] ([Intel XE#1195] / [Intel XE#402])
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-436/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-463/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-adlp:         [FAIL][319] ([Intel XE#1874]) -> [DMESG-FAIL][320] ([Intel XE#1033]) +4 other tests dmesg-fail
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-adlp-3/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-adlp-1/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-bmg:          [SKIP][321] ([Intel XE#2327]) -> [SKIP][322] ([Intel XE#2136] / [Intel XE#2231])
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-6/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-3/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html
    - shard-dg2-set2:     [SKIP][323] ([Intel XE#316]) -> [SKIP][324] ([Intel XE#2136])
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-464/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-434/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [FAIL][325] ([Intel XE#1231] / [Intel XE#1242]) -> [DMESG-FAIL][326] ([Intel XE#1033]) +1 other test dmesg-fail
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         [FAIL][327] ([Intel XE#3052]) -> [DMESG-FAIL][328] ([Intel XE#1033])
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [FAIL][329] ([Intel XE#1231] / [Intel XE#1242] / [Intel XE#3052]) -> [DMESG-FAIL][330] ([Intel XE#1033])
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          [SKIP][331] ([Intel XE#1124]) -> [SKIP][332] ([Intel XE#2136] / [Intel XE#2231]) +3 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-3/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-3/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
    - shard-dg2-set2:     [SKIP][333] ([Intel XE#1124]) -> [SKIP][334] ([Intel XE#2136] / [Intel XE#2351]) +2 other tests skip
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-435/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-434/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:
    - shard-bmg:          [SKIP][335] ([Intel XE#2887]) -> [SKIP][336] ([Intel XE#2136] / [Intel XE#2231]) +1 other test skip
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-8/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-3/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][337] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][338] ([Intel XE#2136])
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html

  * igt@kms_chamelium_hpd@dp-hpd-fast:
    - shard-dg2-set2:     [SKIP][339] ([Intel XE#373]) -> [SKIP][340] ([Intel XE#2423] / [i915#2575])
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-464/igt@kms_chamelium_hpd@dp-hpd-fast.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-434/igt@kms_chamelium_hpd@dp-hpd-fast.html
    - shard-bmg:          [SKIP][341] ([Intel XE#2252]) -> [SKIP][342] ([Intel XE#3007])
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-7/igt@kms_chamelium_hpd@dp-hpd-fast.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-3/igt@kms_chamelium_hpd@dp-hpd-fast.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [FAIL][343] ([Intel XE#1178]) -> [INCOMPLETE][344] ([Intel XE#2715]) +1 other test incomplete
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-4/igt@kms_content_protection@atomic.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-4/igt@kms_content_protection@atomic.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-bmg:          [SKIP][345] ([Intel XE#2320]) -> [SKIP][346] ([Intel XE#3007])
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-1/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-3/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-adlp:         [DMESG-FAIL][347] ([Intel XE#324]) -> [DMESG-FAIL][348] ([Intel XE#1033] / [Intel XE#324]) +1 other test dmesg-fail
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][349] ([Intel XE#2312]) -> [SKIP][350] ([Intel XE#2311]) +1 other test skip
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][351] ([Intel XE#651]) -> [SKIP][352] ([Intel XE#2136] / [Intel XE#2351]) +1 other test skip
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render:
    - shard-bmg:          [SKIP][353] ([Intel XE#2311]) -> [SKIP][354] ([Intel XE#2136] / [Intel XE#2231]) +5 other tests skip
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:
    - shard-adlp:         [FAIL][355] ([Intel XE#1861]) -> [DMESG-FAIL][356] ([Intel XE#1033]) +2 other tests dmesg-fail
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [FAIL][357] ([Intel XE#2333]) -> [SKIP][358] ([Intel XE#2136] / [Intel XE#2231]) +2 other tests skip
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-stridechange:
    - shard-dg2-set2:     [SKIP][359] ([Intel XE#651]) -> [SKIP][360] ([Intel XE#2136]) +2 other tests skip
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-stridechange.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-stridechange.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-bmg:          [FAIL][361] ([Intel XE#2333]) -> [INCOMPLETE][362] ([Intel XE#2050])
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-6/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-4/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][363] ([Intel XE#2312]) -> [SKIP][364] ([Intel XE#2313])
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-render:
    - shard-bmg:          [SKIP][365] ([Intel XE#2313]) -> [SKIP][366] ([Intel XE#2136] / [Intel XE#2231]) +3 other tests skip
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html
    - shard-dg2-set2:     [SKIP][367] ([Intel XE#653]) -> [SKIP][368] ([Intel XE#2136]) +3 other tests skip
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-dg2-set2:     [FAIL][369] ([Intel XE#3312] / [Intel XE#3404]) -> [SKIP][370] ([Intel XE#2423] / [i915#2575])
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-434/igt@kms_hdr@brightness-with-hdr.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-434/igt@kms_hdr@brightness-with-hdr.html
    - shard-bmg:          [FAIL][371] ([Intel XE#3312]) -> [SKIP][372] ([Intel XE#3007])
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-bmg:          [SKIP][373] ([Intel XE#346]) -> [SKIP][374] ([Intel XE#2136] / [Intel XE#2231])
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-3/igt@kms_joiner@invalid-modeset-big-joiner.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-3/igt@kms_joiner@invalid-modeset-big-joiner.html
    - shard-dg2-set2:     [SKIP][375] ([Intel XE#346]) -> [SKIP][376] ([Intel XE#2136])
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-436/igt@kms_joiner@invalid-modeset-big-joiner.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-434/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-bmg:          [SKIP][377] ([Intel XE#2763]) -> [SKIP][378] ([Intel XE#3007])
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-5/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-3/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     [SKIP][379] ([Intel XE#908]) -> [SKIP][380] ([Intel XE#2136] / [Intel XE#2351])
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-464/igt@kms_pm_dc@dc6-dpms.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-434/igt@kms_pm_dc@dc6-dpms.html
    - shard-bmg:          [FAIL][381] ([Intel XE#1430]) -> [SKIP][382] ([Intel XE#2136] / [Intel XE#2231])
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-4/igt@kms_pm_dc@dc6-dpms.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-3/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-adlp:         [FAIL][383] ([Intel XE#3325]) -> [SKIP][384] ([Intel XE#734])
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-adlp-4/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_psr2_sf@psr2-cursor-plane-update-sf:
    - shard-bmg:          [SKIP][385] ([Intel XE#1489]) -> [SKIP][386] ([Intel XE#2136] / [Intel XE#2231])
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-8/igt@kms_psr2_sf@psr2-cursor-plane-update-sf.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-3/igt@kms_psr2_sf@psr2-cursor-plane-update-sf.html
    - shard-dg2-set2:     [SKIP][387] ([Intel XE#1489]) -> [SKIP][388] ([Intel XE#2136])
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-434/igt@kms_psr2_sf@psr2-cursor-plane-update-sf.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-434/igt@kms_psr2_sf@psr2-cursor-plane-update-sf.html

  * igt@kms_psr@fbc-pr-dpms:
    - shard-dg2-set2:     [SKIP][389] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][390] ([Intel XE#2136]) +2 other tests skip
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-436/igt@kms_psr@fbc-pr-dpms.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-434/igt@kms_psr@fbc-pr-dpms.html

  * igt@kms_psr@fbc-psr2-suspend:
    - shard-bmg:          [SKIP][391] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][392] ([Intel XE#2136] / [Intel XE#2231]) +2 other tests skip
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-8/igt@kms_psr@fbc-psr2-suspend.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-3/igt@kms_psr@fbc-psr2-suspend.html

  * igt@xe_copy_basic@mem-copy-linear-0xfd:
    - shard-dg2-set2:     [SKIP][393] ([Intel XE#1123]) -> [SKIP][394] ([Intel XE#1130])
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-464/igt@xe_copy_basic@mem-copy-linear-0xfd.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0xfd.html

  * igt@xe_eudebug@basic-vm-access:
    - shard-bmg:          [SKIP][395] ([Intel XE#2905]) -> [SKIP][396] ([Intel XE#1130]) +1 other test skip
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-8/igt@xe_eudebug@basic-vm-access.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-3/igt@xe_eudebug@basic-vm-access.html
    - shard-dg2-set2:     [SKIP][397] ([Intel XE#2905]) -> [SKIP][398] ([Intel XE#1130]) +1 other test skip
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-433/igt@xe_eudebug@basic-vm-access.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-434/igt@xe_eudebug@basic-vm-access.html

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-bmg:          [TIMEOUT][399] ([Intel XE#1473]) -> [INCOMPLETE][400] ([Intel XE#1473])
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-large.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-6/igt@xe_evict@evict-mixed-many-threads-large.html
    - shard-dg2-set2:     [TIMEOUT][401] ([Intel XE#1473]) -> [INCOMPLETE][402] ([Intel XE#1195] / [Intel XE#1473])
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-large.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-464/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_exec_fault_mode@twice-invalid-fault:
    - shard-dg2-set2:     [SKIP][403] ([Intel XE#288]) -> [SKIP][404] ([Intel XE#1130]) +3 other tests skip
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-464/igt@xe_exec_fault_mode@twice-invalid-fault.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-434/igt@xe_exec_fault_mode@twice-invalid-fault.html

  * igt@xe_live_ktest@xe_bo:
    - shard-dg2-set2:     [TIMEOUT][405] ([Intel XE#2961] / [Intel XE#3191]) -> [INCOMPLETE][406] ([Intel XE#1195]) +1 other test incomplete
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-466/igt@xe_live_ktest@xe_bo.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-433/igt@xe_live_ktest@xe_bo.html

  * igt@xe_oa@oa-unit-concurrent-oa-buffer-read:
    - shard-dg2-set2:     [SKIP][407] ([Intel XE#2541]) -> [SKIP][408] ([Intel XE#1130])
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-464/igt@xe_oa@oa-unit-concurrent-oa-buffer-read.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-434/igt@xe_oa@oa-unit-concurrent-oa-buffer-read.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     [SKIP][409] ([Intel XE#944]) -> [SKIP][410] ([Intel XE#1130])
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-435/igt@xe_query@multigpu-query-engines.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-434/igt@xe_query@multigpu-query-engines.html
    - shard-bmg:          [SKIP][411] ([Intel XE#944]) -> [SKIP][412] ([Intel XE#1130])
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-6/igt@xe_query@multigpu-query-engines.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-3/igt@xe_query@multigpu-query-engines.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
  [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1242]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1522
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
  [Intel XE#1695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1695
  [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2385]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2385
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2502]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2502
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#2550]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550
  [Intel XE#2577]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2577
  [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2635]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2715]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2919]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919
  [Intel XE#2929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2929
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#2961]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2961
  [Intel XE#3007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#3052]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3052
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086
  [Intel XE#3088]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3088
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3119]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3119
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3184]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184
  [Intel XE#3191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3191
  [Intel XE#3225]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3225
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3312
  [Intel XE#3325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3325
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3371]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3371
  [Intel XE#3404]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3404
  [Intel XE#3421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3421
  [Intel XE#3426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3426
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#734]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * IGT: IGT_8111 -> IGT_8114
  * Linux: xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf -> xe-pw-141426v2

  IGT_8111: 67422a7b55b0278cf0d1bfdc0899ee637ed7d588 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8114: 8114
  xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf: 36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf
  xe-pw-141426v2: 141426v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/index.html

--===============8038558362618046281==
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
<tr><td><b>Series:</b></td><td>drm/xe: Drop useless d3cold allowed message (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/141426/">https://patchwork.freedesktop.org/series/141426/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf_full -&gt; xe-pw-141426v2_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-141426v2_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-141426v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-141426v2_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-adlp-9/igt@core_hotunplug@hotreplug.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-adlp-2/igt@core_hotunplug@hotreplug.html">ABORT</a> +1 other test abort</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-1/igt@core_hotunplug@hotreplug.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-3/igt@core_hotunplug@hotreplug.html">INCOMPLETE</a> +8 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotunplug-rescan:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-lnl-4/igt@core_hotunplug@hotunplug-rescan.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-7/igt@core_hotunplug@hotunplug-rescan.html">ABORT</a> +2 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-6/igt@kms_addfb_basic@basic.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html">DMESG-WARN</a> +37 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-64x64@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-64x64@pipe-a-dp-2.html">DMESG-FAIL</a> +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-433/igt@kms_flip@flip-vs-suspend@c-hdmi-a6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-435/igt@kms_flip@flip-vs-suspend@c-hdmi-a6.html">DMESG-FAIL</a> +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@d-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-4/igt@kms_flip@plain-flip-ts-check-interruptible@d-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-1/igt@kms_flip@plain-flip-ts-check-interruptible@d-hdmi-a3.html">DMESG-WARN</a> +224 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-8/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-6/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x.html">DMESG-FAIL</a> +59 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-1/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-3/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-464/igt@kms_pm_rpm@dpms-non-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-435/igt@kms_pm_rpm@dpms-non-lpsp.html">ABORT</a> +2 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-464/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">DMESG-WARN</a> +11 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-multicopy-inplace:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-lnl-8/igt@xe_ccs@block-multicopy-inplace.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-6/igt@xe_ccs@block-multicopy-inplace.html">DMESG-WARN</a> +49 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large-multi-vm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-1/igt@xe_evict@evict-threads-large-multi-vm.html">DMESG-WARN</a> +13 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-lnl-4/igt@xe_exec_fault_mode@many-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-1/igt@xe_exec_fault_mode@many-userptr-invalidate.html">DMESG-FAIL</a> +7 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-fixed-duration-with-preempter:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-lnl-8/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-3/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-adlp-4/igt@xe_sriov_flr@flr-vf1-clear.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-adlp-1/igt@xe_sriov_flr@flr-vf1-clear.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunplug-rescan:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-adlp-3/igt@core_hotunplug@hotunplug-rescan.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-adlp-1/igt@core_hotunplug@hotunplug-rescan.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-lnl-1/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701">Intel XE#1701</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-1/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-7/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-3/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-3/igt@kms_cursor_crc@cursor-onscreen-128x42.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@128x128-left-edge:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-3/igt@kms_cursor_edge_walk@128x128-left-edge.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-6/igt@kms_cursor_edge_walk@128x128-left-edge.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@128x128-left-edge@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-3/igt@kms_cursor_edge_walk@128x128-left-edge@pipe-d-dp-2.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-6/igt@kms_cursor_edge_walk@128x128-left-edge@pipe-d-dp-2.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-7/igt@kms_fbcon_fbt@fbc-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1695">Intel XE#1695</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-6/igt@kms_fbcon_fbt@fbc-suspend.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">DMESG-FAIL</a> +20 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-6/igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-b-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-4/igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-b-dp-2.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-6/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-3/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-7/igt@kms_psr@psr2-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-3/igt@kms_psr@psr2-cursor-render.html">SKIP</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run}:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-435/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-435/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html">DMESG-WARN</a> +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>{igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc}:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-6/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-4/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html">DMESG-FAIL</a> +3 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>{igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind}:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-463/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html">DMESG-WARN</a></li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-7/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-1/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf_full and xe-pw-141426v2_full:</p>
<h3>New IGT tests (11)</h3>
<ul>
<li>
<p>igt@kms_concurrent@multi-plane-atomic-lowres@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.68] s</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen:</p>
<ul>
<li>Statuses : 2 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 2.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen:</p>
<ul>
<li>Statuses : 2 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 2.21] s</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:</p>
<ul>
<li>Statuses : 2 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 9.95] s</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd:</p>
<ul>
<li>Statuses : 2 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 9.36] s</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen:</p>
<ul>
<li>Statuses : 2 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 9.86] s</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd:</p>
<ul>
<li>Statuses : 2 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 10.12] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_queue_property@basic-get-property:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_queue_property@invalid-exec-queue:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_queue_property@non-zero-reserved:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-141426v2_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@unaligned-read:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-2/igt@fbdev@unaligned-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-3/igt@fbdev@unaligned-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/911">Intel XE#911</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-463/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550">Intel XE#2550</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-lnl-4/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-3/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-5/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-2/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3225">Intel XE#3225</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-7/igt@kms_big_fb@linear-16bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-3/igt@kms_big_fb@linear-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) +2 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-464/igt@kms_big_fb@linear-16bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-434/igt@kms_big_fb@linear-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-adlp-3/igt@kms_big_fb@linear-8bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-adlp-3/igt@kms_big_fb@linear-8bpp-rotate-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-436/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-lnl-7/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-6/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3225">Intel XE#3225</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-1/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-435/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +110 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-d-dp-5:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-466/igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-d-dp-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-435/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-2/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-5/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +9 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-5:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-466/igt@kms_cdclk@plane-scaling@pipe-b-dp-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152">Intel XE#1152</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-7/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-435/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-464/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-adlp-1/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@vga-edid-read:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-4/igt@kms_chamelium_edid@vga-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-5/igt@kms_chamelium_hpd@dp-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-8/igt@kms_color@ctm-0-75.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-4/igt@kms_color@ctm-0-75.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-3/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278">Intel XE#3278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-433/igt@kms_content_protection@srm@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-435/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-64x21:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-436/igt@kms_cursor_crc@cursor-offscreen-64x21.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-3/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x256:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-256x256.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-256x256.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-1/igt@kms_cursor_crc@cursor-sliding-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-2/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-464/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-6/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-433/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-466/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-5/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible@b-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible@b-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +3 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-3/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/352">Intel XE#352</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +7 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-adlp-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-4/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2502">Intel XE#2502</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-464/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">Intel XE#605</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-6/igt@kms_hdr@bpc-switch-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-6/igt@kms_hdr@bpc-switch-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3426">Intel XE#3426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-2/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-6/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934">Intel XE#2934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-adlp-2/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-adlp-1/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-7/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-436/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-436/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-8/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-463/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309">Intel XE#3309</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-5/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309">Intel XE#3309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-4/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-8/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-1/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-464/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-463/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-page-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-5/igt@kms_psr@pr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-2/igt@kms_psr@psr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@cursor-rotation-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-6/igt@kms_rotation_crc@cursor-rotation-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-3/igt@kms_rotation_crc@cursor-rotation-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-434/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-434/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-lnl-2/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159">Intel XE#2159</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-433/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-lnl-4/igt@kms_vrr@max-min.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-8/igt@kms_vrr@max-min.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1522">Intel XE#1522</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-3/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-434/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-463/igt@xe_copy_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-metadata-discovery:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-adlp-1/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@multiple-sessions:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-433/igt@xe_eudebug@multiple-sessions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +9 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-7/igt@xe_eudebug@multiple-sessions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-other-debuggable:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-5/igt@xe_eudebug_online@interrupt-other-debuggable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-cm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-8/igt@xe_evict@evict-beng-large-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-435/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-4/igt@xe_evict@evict-beng-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-5/igt@xe_evict@evict-beng-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-external-cm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-8/igt@xe_evict@evict-large-external-cm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-3/igt@xe_evict@evict-large-external-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-435/igt@xe_evict@evict-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600">Intel XE#1600</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd (NEW):</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-3/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-rebind:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-lnl-1/igt@xe_exec_basic@many-execqueues-many-vm-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-8/igt@xe_exec_basic@many-execqueues-many-vm-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594">Intel XE#2594</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-4/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-5/igt@xe_exec_basic@multigpu-no-exec-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-adlp-2/igt@xe_exec_basic@multigpu-once-null.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-466/igt@xe_exec_basic@twice-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-434/igt@xe_exec_basic@twice-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-434/igt@xe_exec_compute_mode@many-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-433/igt@xe_exec_fault_mode@twice-userptr-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-464/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-463/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-435/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3371">Intel XE#3371</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-464/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-8/igt@xe_live_ktest@xe_mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-7/igt@xe_live_ktest@xe_mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-8/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416">Intel XE#1416</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-435/igt@xe_oa@oa-regs-whitelisted.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-6/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-435/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-multiple-execs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-7/igt@xe_pm@s2idle-multiple-execs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-5/igt@xe_pm@s2idle-multiple-execs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616">Intel XE#1616</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-466/igt@xe_pm@s3-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-436/igt@xe_pm@s3-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-4/igt@xe_pm@s3-d3hot-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-8/igt@xe_pm@s3-d3hot-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-1/igt@xe_pm@s4-mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-6/igt@xe_pm@s4-mocs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280">Intel XE#2280</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-adlp-2/igt@xe_pm@s4-multiple-execs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-464/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-435/igt@xe_pm@s4-vm-bind-userptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280">Intel XE#2280</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-463/igt@xe_pm_residency@gt-c6-freeze.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-464/igt@xe_pm_residency@gt-c6-freeze.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3088">Intel XE#3088</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-4/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-7/igt@xe_query@multigpu-query-invalid-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-433/igt@xe_query@multigpu-query-invalid-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-adlp-8/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-3/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-8/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919">Intel XE#2919</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3119">Intel XE#3119</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-436/igt@xe_wedged@wedged-at-any-timeout.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3421">Intel XE#3421</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-adlp-6/igt@kms_async_flips@async-flip-suspend-resume.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-adlp-9/igt@kms_async_flips@async-flip-suspend-resume.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-463/igt@kms_big_fb@linear-64bpp-rotate-180.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-464/igt@kms_big_fb@linear-64bpp-rotate-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-lnl-6/igt@kms_color@ctm-0-25@pipe-b-edp-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2929">Intel XE#2929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-5/igt@kms_color@ctm-0-25@pipe-b-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-right-edge:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-lnl-5/igt@kms_cursor_edge_walk@256x256-right-edge.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2577">Intel XE#2577</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-7/igt@kms_cursor_edge_walk@256x256-right-edge.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-lnl-1/igt@kms_flip@blocking-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-2/igt@kms_flip@blocking-wf_vblank.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-3/igt@kms_flip@dpms-vs-vblank-race-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635">Intel XE#2635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-8/igt@kms_flip@dpms-vs-vblank-race-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race-interruptible@b-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-3/igt@kms_flip@dpms-vs-vblank-race-interruptible@b-hdmi-a3.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-8/igt@kms_flip@dpms-vs-vblank-race-interruptible@b-hdmi-a3.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-1/igt@kms_flip@flip-vs-blocking-wf-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-5/igt@kms_flip@flip-vs-blocking-wf-vblank.html">PASS</a> +2 other tests pass</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-435/igt@kms_flip@flip-vs-blocking-wf-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-436/igt@kms_flip@flip-vs-blocking-wf-vblank.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-435/igt@kms_flip@flip-vs-blocking-wf-vblank@b-hdmi-a6.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-436/igt@kms_flip@flip-vs-blocking-wf-vblank@b-hdmi-a6.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-adlp-3/igt@kms_flip@flip-vs-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-adlp-6/igt@kms_flip@flip-vs-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-adlp-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-6/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-2.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-6/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-2/igt@kms_joiner@basic-force-big-joiner.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-lnl-8/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184">Intel XE#3184</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-4/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-lnl-1/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-4/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-436/igt@xe_exec_threads@threads-basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-436/igt@xe_exec_threads@threads-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-8/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-2/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-adlp-3/igt@xe_pm@s2idle-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-adlp-3/igt@xe_pm@s2idle-basic.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-5/igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-adlp-1/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-lnl-3/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-lnl-1/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-2/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2385">Intel XE#2385</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-3/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-436/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-434/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-436/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-463/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-adlp-3/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-adlp-1/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +4 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-6/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-3/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-464/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-434/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3052">Intel XE#3052</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3052">Intel XE#3052</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-3/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-3/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) +3 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-435/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-434/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-8/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-3/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-fast:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-464/igt@kms_chamelium_hpd@dp-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-434/igt@kms_chamelium_hpd@dp-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-7/igt@kms_chamelium_hpd@dp-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-3/igt@kms_chamelium_hpd@dp-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-4/igt@kms_content_protection@atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-4/igt@kms_content_protection@atomic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715">Intel XE#2715</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x32:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-1/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-3/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-stridechange:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-stridechange.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-stridechange.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-6/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-4/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050">Intel XE#2050</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) +3 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-434/igt@kms_hdr@brightness-with-hdr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3312">Intel XE#3312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3404">Intel XE#3404</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-434/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3312">Intel XE#3312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-3/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-3/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-436/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-434/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-5/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-3/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-464/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-434/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-4/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-3/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3325">Intel XE#3325</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-adlp-4/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/734">Intel XE#734</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-update-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-8/igt@kms_psr2_sf@psr2-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-3/igt@kms_psr2_sf@psr2-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-434/igt@kms_psr2_sf@psr2-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-434/igt@kms_psr2_sf@psr2-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-436/igt@kms_psr@fbc-pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-434/igt@kms_psr@fbc-pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-8/igt@kms_psr@fbc-psr2-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-3/igt@kms_psr@fbc-psr2-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-464/igt@xe_copy_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-8/igt@xe_eudebug@basic-vm-access.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-3/igt@xe_eudebug@basic-vm-access.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-433/igt@xe_eudebug@basic-vm-access.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-434/igt@xe_eudebug@basic-vm-access.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-6/igt@xe_evict@evict-mixed-many-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-464/igt@xe_evict@evict-mixed-many-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-invalid-fault:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-464/igt@xe_exec_fault_mode@twice-invalid-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-434/igt@xe_exec_fault_mode@twice-invalid-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-466/igt@xe_live_ktest@xe_bo.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2961">Intel XE#2961</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3191">Intel XE#3191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-433/igt@xe_live_ktest@xe_bo.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-concurrent-oa-buffer-read:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-464/igt@xe_oa@oa-unit-concurrent-oa-buffer-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-434/igt@xe_oa@oa-unit-concurrent-oa-buffer-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-dg2-435/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-dg2-434/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf/shard-bmg-6/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v2/shard-bmg-3/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8111 -&gt; IGT_8114</li>
<li>Linux: xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf -&gt; xe-pw-141426v2</li>
</ul>
<p>IGT_8111: 67422a7b55b0278cf0d1bfdc0899ee637ed7d588 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8114: 8114<br />
  xe-2235-36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf: 36fec0eb87867bca47f8829c9e5dbf5b3e2b3aaf<br />
  xe-pw-141426v2: 141426v2</p>

</body>
</html>

--===============8038558362618046281==--
