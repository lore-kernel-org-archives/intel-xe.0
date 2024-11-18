Return-Path: <intel-xe-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 154BCD49221
	for <intel-xe@archiver.kernel.org>; Mon, 18 Nov 2024 13:34:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCA2888647;
	Mon, 18 Nov 2024 13:34:11 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5783788647;
 Mon, 18 Nov 2024 13:34:10 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7494115288620469004=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/i915/psr=3A_Implement_WA_to?=
 =?utf-8?q?_help_reach_PC10_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 18 Nov 2024 13:34:10 -0000
Message-ID: <173193685035.1238019.10884693535072658499@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241106090058.819840-1-suraj.kandpal@intel.com>
In-Reply-To: <20241106090058.819840-1-suraj.kandpal@intel.com>
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

--===============7494115288620469004==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/psr: Implement WA to help reach PC10 (rev6)
URL   : https://patchwork.freedesktop.org/series/139512/
State : failure

== Summary ==

CI Bug Log - changes from xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f_full -> xe-pw-139512v6_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-139512v6_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-139512v6_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-139512v6_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_big_fb@linear-8bpp-rotate-0:
    - shard-adlp:         [PASS][1] -> ([PASS][2], [DMESG-WARN][3])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-adlp-2/igt@kms_big_fb@linear-8bpp-rotate-0.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-adlp-4/igt@kms_big_fb@linear-8bpp-rotate-0.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-adlp-3/igt@kms_big_fb@linear-8bpp-rotate-0.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][4]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-a-edp-1:
    - shard-lnl:          [PASS][5] -> [DMESG-WARN][6] +20 other tests dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-lnl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-a-edp-1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-a-edp-1.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-bmg:          [PASS][7] -> ([FAIL][8], [PASS][9]) +1 other test ( 1 fail, 1 pass )
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-2/igt@kms_cursor_crc@cursor-suspend.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-6/igt@kms_cursor_crc@cursor-suspend.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-7/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_legacy@torture-move@pipe-a:
    - shard-lnl:          [PASS][10] -> ([DMESG-WARN][11], [PASS][12]) +4 other tests ( 1 dmesg-warn, 1 pass )
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-lnl-5/igt@kms_cursor_legacy@torture-move@pipe-a.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-7/igt@kms_cursor_legacy@torture-move@pipe-a.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-2/igt@kms_cursor_legacy@torture-move@pipe-a.html

  * igt@kms_draw_crc@draw-method-mmap-wc@xrgb2101010-4tiled:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][13] +2 other tests dmesg-fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-1/igt@kms_draw_crc@draw-method-mmap-wc@xrgb2101010-4tiled.html

  * igt@kms_flip@basic-flip-vs-modeset@a-hdmi-a6:
    - shard-dg2-set2:     NOTRUN -> ([PASS][14], [DMESG-WARN][15]) +1 other test ( 1 dmesg-warn, 1 pass )
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@kms_flip@basic-flip-vs-modeset@a-hdmi-a6.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@kms_flip@basic-flip-vs-modeset@a-hdmi-a6.html

  * igt@kms_hdr@static-swap@pipe-a-dp-2:
    - shard-bmg:          [PASS][16] -> ([PASS][17], [DMESG-WARN][18]) +2 other tests ( 1 dmesg-warn, 1 pass )
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-4/igt@kms_hdr@static-swap@pipe-a-dp-2.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-5/igt@kms_hdr@static-swap@pipe-a-dp-2.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-1/igt@kms_hdr@static-swap@pipe-a-dp-2.html

  * igt@kms_plane_cursor@primary@pipe-c-dp-2-size-128:
    - shard-bmg:          [PASS][19] -> ([INCOMPLETE][20], [PASS][21]) +1 other test ( 1 incomplete, 1 pass )
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-1/igt@kms_plane_cursor@primary@pipe-c-dp-2-size-128.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-2/igt@kms_plane_cursor@primary@pipe-c-dp-2-size-128.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-3/igt@kms_plane_cursor@primary@pipe-c-dp-2-size-128.html

  * igt@kms_psr@fbc-psr2-cursor-render@edp-1:
    - shard-lnl:          [PASS][22] -> [FAIL][23] +21 other tests fail
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-lnl-6/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-5/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html

  * igt@kms_psr@psr2-sprite-plane-onoff:
    - shard-lnl:          [PASS][24] -> ([FAIL][25], [FAIL][26]) +17 other tests ( 2 fail )
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-lnl-5/igt@kms_psr@psr2-sprite-plane-onoff.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-7/igt@kms_psr@psr2-sprite-plane-onoff.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-4/igt@kms_psr@psr2-sprite-plane-onoff.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-lnl:          [PASS][27] -> [SKIP][28]
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-lnl-7/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@xe_module_load@unload:
    - shard-dg2-set2:     [PASS][29] -> [DMESG-WARN][30]
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@xe_module_load@unload.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@xe_module_load@unload.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-lnl:          [PASS][31] -> ([ABORT][32], [DMESG-WARN][33]) ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-lnl-5/igt@xe_pm@s4-multiple-execs.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-7/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_vm@large-split-binds-2147483648:
    - shard-bmg:          [PASS][34] -> [DMESG-WARN][35] +9 other tests dmesg-warn
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-5/igt@xe_vm@large-split-binds-2147483648.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-2/igt@xe_vm@large-split-binds-2147483648.html

  * igt@xe_vm@shared-pde2-page:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][36] +6 other tests dmesg-warn
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-4/igt@xe_vm@shared-pde2-page.html

  
#### Warnings ####

  * igt@core_hotunplug@hotunplug-rescan:
    - shard-bmg:          [INCOMPLETE][37] ([Intel XE#3468]) -> ([INCOMPLETE][38], [INCOMPLETE][39])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-2/igt@core_hotunplug@hotunplug-rescan.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-6/igt@core_hotunplug@hotunplug-rescan.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-4/igt@core_hotunplug@hotunplug-rescan.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][40] ([Intel XE#2136] / [Intel XE#2351]) -> [DMESG-WARN][41]
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][42] ([Intel XE#3442]) -> [SKIP][43]
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][44] -> ([SKIP][45], [SKIP][46]) ([Intel XE#455] / [Intel XE#787])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html

  * igt@kms_draw_crc@draw-method-mmap-wc@rgb565-4tiled:
    - shard-bmg:          [INCOMPLETE][47] ([Intel XE#3468]) -> ([INCOMPLETE][48], [DMESG-FAIL][49]) ([Intel XE#3468])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-4/igt@kms_draw_crc@draw-method-mmap-wc@rgb565-4tiled.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-5/igt@kms_draw_crc@draw-method-mmap-wc@rgb565-4tiled.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-1/igt@kms_draw_crc@draw-method-mmap-wc@rgb565-4tiled.html

  * igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3:
    - shard-bmg:          [DMESG-WARN][50] ([Intel XE#3468]) -> [INCOMPLETE][51]
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-1/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-1/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-lnl:          [DMESG-WARN][52] -> [FAIL][53] +5 other tests fail
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-lnl-3/igt@kms_psr@fbc-psr2-sprite-plane-move.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-1/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
    - shard-dg2-set2:     [SKIP][54] ([Intel XE#1130]) -> ([DMESG-WARN][55], [DMESG-WARN][56]) +1 other test ( 2 dmesg-warn )
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html

  * igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate:
    - shard-dg2-set2:     [SKIP][57] ([Intel XE#1130]) -> ([DMESG-WARN][58], [PASS][59])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate.html

  * igt@xe_vm@shared-pde2-page:
    - shard-dg2-set2:     [DMESG-WARN][60] -> ([SKIP][61], [DMESG-WARN][62]) ([Intel XE#1130])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-464/igt@xe_vm@shared-pde2-page.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@xe_vm@shared-pde2-page.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@xe_vm@shared-pde2-page.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run}:
    - shard-lnl:          [FAIL][63] ([Intel XE#3499]) -> [ABORT][64]
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-lnl-7/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-3/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html

  
Known issues
------------

  Here are the changes found in xe-pw-139512v6_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_getclient:
    - shard-dg2-set2:     [PASS][65] -> ([PASS][66], [SKIP][67]) ([Intel XE#2423])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-464/igt@core_getclient.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@core_getclient.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@core_getclient.html

  * igt@core_getversion@basic:
    - shard-dg2-set2:     [PASS][68] -> [FAIL][69] ([Intel XE#3440])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-433/igt@core_getversion@basic.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@core_getversion@basic.html

  * igt@core_hotunplug@hotrebind:
    - shard-dg2-set2:     [PASS][70] -> ([SKIP][71], [PASS][72]) ([Intel XE#1885])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-463/igt@core_hotunplug@hotrebind.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@core_hotunplug@hotrebind.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-436/igt@core_hotunplug@hotrebind.html

  * igt@core_hotunplug@hotreplug:
    - shard-dg2-set2:     [PASS][73] -> [SKIP][74] ([Intel XE#1885])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-436/igt@core_hotunplug@hotreplug.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@core_hotunplug@hotreplug.html

  * igt@fbdev@pan:
    - shard-dg2-set2:     [PASS][75] -> ([PASS][76], [SKIP][77]) ([Intel XE#2134])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-463/igt@fbdev@pan.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-436/igt@fbdev@pan.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@fbdev@pan.html

  * igt@fbdev@unaligned-read:
    - shard-dg2-set2:     NOTRUN -> [SKIP][78] ([Intel XE#2134])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@fbdev@unaligned-read.html

  * igt@fbdev@write:
    - shard-dg2-set2:     [PASS][79] -> [SKIP][80] ([Intel XE#2134])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-433/igt@fbdev@write.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@fbdev@write.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-adlp:         [PASS][81] -> [DMESG-WARN][82] ([Intel XE#1033]) +1 other test dmesg-warn
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-adlp-8/igt@kms_async_flips@invalid-async-flip.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-adlp-1/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_async_flips@test-cursor:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][83], [PASS][84]) ([Intel XE#2423] / [i915#2575]) +1 other test ( 1 pass, 1 skip )
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_async_flips@test-cursor.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@kms_async_flips@test-cursor.html

  * igt@kms_atomic@crtc-invalid-params-fence@pipe-a-dp-2:
    - shard-bmg:          [PASS][85] -> ([DMESG-WARN][86], [DMESG-WARN][87]) ([Intel XE#3468])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-5/igt@kms_atomic@crtc-invalid-params-fence@pipe-a-dp-2.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-2/igt@kms_atomic@crtc-invalid-params-fence@pipe-a-dp-2.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-3/igt@kms_atomic@crtc-invalid-params-fence@pipe-a-dp-2.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#2327])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-2/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-0:
    - shard-lnl:          [PASS][89] -> [DMESG-WARN][90] ([Intel XE#3466])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-lnl-6/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-4/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][91], [SKIP][92]) ([Intel XE#316])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [PASS][93] -> ([PASS][94], [DMESG-FAIL][95]) ([Intel XE#1033])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][96], [SKIP][97]) ([Intel XE#1124] / [Intel XE#2136])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][98], [SKIP][99]) ([Intel XE#1124])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#1124]) +3 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-1/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][101], [SKIP][102]) ([Intel XE#2423] / [Intel XE#367] / [i915#2575])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#367])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-2/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][104] ([Intel XE#2136] / [Intel XE#2351]) +9 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][105], [SKIP][106]) ([Intel XE#455] / [Intel XE#787]) +10 other tests ( 2 skip )
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#2887]) +2 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-3/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][108], [SKIP][109]) ([Intel XE#787]) +69 other tests ( 2 skip )
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-dp-4.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][110], [FAIL][111]) ([Intel XE#2136] / [Intel XE#616])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][112] ([Intel XE#616]) +7 other tests fail
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][113] ([Intel XE#787]) +104 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][114] ([Intel XE#455] / [Intel XE#787]) +14 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [PASS][115] -> [INCOMPLETE][116] ([Intel XE#1195] / [Intel XE#1727])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [PASS][117] -> [INCOMPLETE][118] ([Intel XE#1195] / [Intel XE#3113])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][119], [SKIP][120]) ([Intel XE#314]) +3 other tests ( 2 skip )
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-bmg:          NOTRUN -> [SKIP][121] ([Intel XE#2252]) +4 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-3/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_hpd@dp-hpd:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][122], [SKIP][123]) ([Intel XE#373])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@kms_chamelium_hpd@dp-hpd.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@kms_chamelium_hpd@dp-hpd.html

  * igt@kms_color@ctm-0-75@pipe-b-hdmi-a-3:
    - shard-bmg:          [PASS][124] -> ([PASS][125], [DMESG-WARN][126]) ([Intel XE#877]) +1 other test ( 1 dmesg-warn, 1 pass )
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-2/igt@kms_color@ctm-0-75@pipe-b-hdmi-a-3.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-7/igt@kms_color@ctm-0-75@pipe-b-hdmi-a-3.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-6/igt@kms_color@ctm-0-75@pipe-b-hdmi-a-3.html

  * igt@kms_content_protection@atomic@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> ([FAIL][127], [FAIL][128]) ([Intel XE#1178])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-433/igt@kms_content_protection@atomic@pipe-a-dp-4.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_content_protection@atomic@pipe-a-dp-4.html

  * igt@kms_content_protection@legacy@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][129] ([Intel XE#1178])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@kms_content_protection@legacy@pipe-a-dp-4.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> ([FAIL][130], [FAIL][131]) ([Intel XE#3304])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-offscreen-64x64@pipe-d-dp-2:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][132] ([Intel XE#3468])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-64x64@pipe-d-dp-2.html

  * igt@kms_cursor_crc@cursor-offscreen-max-size:
    - shard-bmg:          NOTRUN -> [SKIP][133] ([Intel XE#2320]) +1 other test skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-max-size.html

  * igt@kms_cursor_crc@cursor-random-128x128@pipe-a-dp-2:
    - shard-bmg:          [PASS][134] -> [DMESG-WARN][135] ([Intel XE#877]) +1 other test dmesg-warn
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-6/igt@kms_cursor_crc@cursor-random-128x128@pipe-a-dp-2.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-4/igt@kms_cursor_crc@cursor-random-128x128@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-sliding-64x64:
    - shard-dg2-set2:     NOTRUN -> [SKIP][136] ([Intel XE#2423] / [i915#2575]) +38 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-64x64.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-bmg:          NOTRUN -> [SKIP][137] ([Intel XE#2286]) +1 other test skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
    - shard-dg2-set2:     [PASS][138] -> [SKIP][139] ([Intel XE#2423] / [i915#2575]) +57 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-433/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html

  * igt@kms_draw_crc@fill-fb:
    - shard-dg2-set2:     [PASS][140] -> [SKIP][141] ([Intel XE#2136] / [Intel XE#2351]) +7 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-436/igt@kms_draw_crc@fill-fb.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_draw_crc@fill-fb.html

  * igt@kms_feature_discovery@display-1x:
    - shard-adlp:         [PASS][142] -> ([DMESG-WARN][143], [PASS][144]) ([Intel XE#3086]) +2 other tests ( 1 dmesg-warn, 1 pass )
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-adlp-8/igt@kms_feature_discovery@display-1x.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-adlp-2/igt@kms_feature_discovery@display-1x.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-adlp-6/igt@kms_feature_discovery@display-1x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-bmg:          NOTRUN -> [SKIP][145] ([Intel XE#2375])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-1/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-dg2-set2:     [PASS][146] -> ([FAIL][147], [SKIP][148]) ([Intel XE#2423] / [Intel XE#301] / [i915#2575])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          [PASS][149] -> ([FAIL][150], [FAIL][151]) ([Intel XE#3486])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][152] -> [FAIL][153] ([Intel XE#3321] / [Intel XE#3486])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][154] -> [FAIL][155] ([Intel XE#301]) +3 other tests fail
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@busy-flip:
    - shard-dg2-set2:     [PASS][156] -> ([PASS][157], [SKIP][158]) ([Intel XE#2423] / [i915#2575]) +54 other tests ( 1 pass, 1 skip )
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-463/igt@kms_flip@busy-flip.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-436/igt@kms_flip@busy-flip.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_flip@busy-flip.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-lnl:          [PASS][159] -> ([FAIL][160], [PASS][161]) ([Intel XE#886]) +1 other test ( 1 fail, 1 pass )
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@plain-flip-ts-check:
    - shard-bmg:          [PASS][162] -> [FAIL][163] ([Intel XE#2882]) +1 other test fail
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-1/igt@kms_flip@plain-flip-ts-check.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-1/igt@kms_flip@plain-flip-ts-check.html
    - shard-dg2-set2:     [PASS][164] -> [FAIL][165] ([Intel XE#886])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-434/igt@kms_flip@plain-flip-ts-check.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-433/igt@kms_flip@plain-flip-ts-check.html
    - shard-lnl:          [PASS][166] -> [FAIL][167] ([Intel XE#3149] / [Intel XE#886])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-lnl-2/igt@kms_flip@plain-flip-ts-check.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-2/igt@kms_flip@plain-flip-ts-check.html

  * igt@kms_flip@plain-flip-ts-check@a-hdmi-a6:
    - shard-dg2-set2:     [PASS][168] -> [FAIL][169] ([Intel XE#3477])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-434/igt@kms_flip@plain-flip-ts-check@a-hdmi-a6.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-433/igt@kms_flip@plain-flip-ts-check@a-hdmi-a6.html

  * igt@kms_flip@plain-flip-ts-check@c-edp1:
    - shard-lnl:          [PASS][170] -> [FAIL][171] ([Intel XE#886])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-lnl-2/igt@kms_flip@plain-flip-ts-check@c-edp1.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-2/igt@kms_flip@plain-flip-ts-check@c-edp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][172] ([Intel XE#455]) +5 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][173], [SKIP][174]) ([Intel XE#455]) +2 other tests ( 2 skip )
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt:
    - shard-bmg:          NOTRUN -> ([SKIP][175], [SKIP][176]) ([Intel XE#2311]) +1 other test ( 2 skip )
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][177], [SKIP][178]) ([Intel XE#651]) +4 other tests ( 2 skip )
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [FAIL][179] ([Intel XE#2333])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move:
    - shard-dg2-set2:     [PASS][180] -> [SKIP][181] ([Intel XE#2136]) +20 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     [PASS][182] -> ([SKIP][183], [PASS][184]) ([Intel XE#2136]) +16 other tests ( 1 pass, 1 skip )
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-rte:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][185] ([Intel XE#3468]) +2 other tests dmesg-fail
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [PASS][186] -> ([SKIP][187], [PASS][188]) ([Intel XE#2136] / [Intel XE#2351]) +8 other tests ( 1 pass, 1 skip )
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][189] ([Intel XE#2352])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][190] ([Intel XE#2136]) +44 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][191], [SKIP][192]) ([Intel XE#2136] / [Intel XE#651])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][193] ([Intel XE#2311]) +9 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][194], [SKIP][195]) ([Intel XE#658])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> ([SKIP][196], [SKIP][197]) ([Intel XE#2313])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][198], [SKIP][199]) ([Intel XE#2136] / [Intel XE#653]) +1 other test ( 2 skip )
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][200], [SKIP][201]) ([Intel XE#653]) +1 other test ( 2 skip )
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          NOTRUN -> [SKIP][202] ([Intel XE#2313]) +7 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][203] -> [SKIP][204] ([Intel XE#1503])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-2/igt@kms_hdr@invalid-hdr.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-1/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@static-swap:
    - shard-bmg:          [PASS][205] -> ([DMESG-WARN][206], [PASS][207]) ([Intel XE#3468]) +3 other tests ( 1 dmesg-warn, 1 pass )
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-4/igt@kms_hdr@static-swap.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-1/igt@kms_hdr@static-swap.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-5/igt@kms_hdr@static-swap.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][208], [SKIP][209]) ([Intel XE#2927])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_lease@lease-unleased-connector:
    - shard-adlp:         [PASS][210] -> [DMESG-WARN][211] ([Intel XE#3086]) +6 other tests dmesg-warn
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-adlp-6/igt@kms_lease@lease-unleased-connector.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-adlp-1/igt@kms_lease@lease-unleased-connector.html

  * igt@kms_plane_alpha_blend@constant-alpha-mid@pipe-a-dp-2:
    - shard-bmg:          [PASS][212] -> [DMESG-WARN][213] ([Intel XE#3468]) +2 other tests dmesg-warn
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-8/igt@kms_plane_alpha_blend@constant-alpha-mid@pipe-a-dp-2.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-3/igt@kms_plane_alpha_blend@constant-alpha-mid@pipe-a-dp-2.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][214] ([Intel XE#2763]) +2 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][215] ([Intel XE#2763] / [Intel XE#455])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][216], [SKIP][217]) ([Intel XE#2763]) +2 other tests ( 2 skip )
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][218], [SKIP][219]) ([Intel XE#2763] / [Intel XE#455])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
    - shard-bmg:          NOTRUN -> [SKIP][220] ([Intel XE#2763]) +4 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-lnl:          [PASS][221] -> ([FAIL][222], [FAIL][223]) ([Intel XE#2029])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-8/igt@kms_pm_dc@deep-pkgc.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-1/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-dg2-set2:     [PASS][224] -> [SKIP][225] ([Intel XE#2446]) +1 other test skip
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-436/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@modeset-stress-extra-wait:
    - shard-dg2-set2:     NOTRUN -> [SKIP][226] ([Intel XE#2446]) +1 other test skip
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_pm_rpm@modeset-stress-extra-wait.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-dg2-set2:     [PASS][227] -> ([PASS][228], [SKIP][229]) ([Intel XE#2446]) +1 other test ( 1 pass, 1 skip )
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-434/igt@kms_pm_rpm@system-suspend-modeset.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@kms_pm_rpm@system-suspend-modeset.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-lnl:          [PASS][230] -> ([SKIP][231], [SKIP][232]) ([Intel XE#1489]) +8 other tests ( 2 skip )
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][233] ([Intel XE#1489]) +1 other test skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-3/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-lnl:          [PASS][234] -> [SKIP][235] ([Intel XE#1489]) +7 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-lnl-7/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-3/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@fbc-psr-primary-page-flip:
    - shard-bmg:          NOTRUN -> [SKIP][236] ([Intel XE#2234] / [Intel XE#2850]) +3 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-2/igt@kms_psr@fbc-psr-primary-page-flip.html

  * igt@kms_psr@fbc-psr2-primary-blt@edp-1:
    - shard-lnl:          [PASS][237] -> [FAIL][238] ([Intel XE#3490]) +1 other test fail
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-lnl-2/igt@kms_psr@fbc-psr2-primary-blt@edp-1.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-2/igt@kms_psr@fbc-psr2-primary-blt@edp-1.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-lnl:          [PASS][239] -> ([FAIL][240], [FAIL][241]) ([Intel XE#3331]) +1 other test ( 2 fail )
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-lnl-8/igt@kms_psr@fbc-psr2-primary-render.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-8/igt@kms_psr@fbc-psr2-primary-render.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-4/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][242], [SKIP][243]) ([Intel XE#2850] / [Intel XE#929]) +3 other tests ( 2 skip )
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html

  * igt@kms_psr@psr2-cursor-blt@edp-1:
    - shard-lnl:          [PASS][244] -> [FAIL][245] ([Intel XE#3331]) +3 other tests fail
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-lnl-2/igt@kms_psr@psr2-cursor-blt@edp-1.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-3/igt@kms_psr@psr2-cursor-blt@edp-1.html

  * igt@kms_psr@psr2-sprite-blt:
    - shard-lnl:          [PASS][246] -> ([FAIL][247], [FAIL][248]) ([Intel XE#3490]) +1 other test ( 2 fail )
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-lnl-4/igt@kms_psr@psr2-sprite-blt.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-6/igt@kms_psr@psr2-sprite-blt.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-1/igt@kms_psr@psr2-sprite-blt.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-bmg:          NOTRUN -> [SKIP][249] ([Intel XE#3414]) +1 other test skip
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-2/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][250], [SKIP][251]) ([Intel XE#2423] / [Intel XE#455] / [i915#2575])
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_setmode@basic-clone-single-crtc.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [PASS][252] -> ([FAIL][253], [PASS][254]) ([Intel XE#2883]) +2 other tests ( 1 fail, 1 pass )
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-lnl-8/igt@kms_setmode@basic@pipe-b-edp-1.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-8/igt@kms_setmode@basic@pipe-b-edp-1.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-4/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
    - shard-lnl:          [PASS][255] -> ([PASS][256], [FAIL][257]) ([Intel XE#899])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-2/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html

  * igt@xe_eudebug_online@breakpoint-many-sessions-tiles:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][258], [SKIP][259]) ([Intel XE#2905]) +1 other test ( 2 skip )
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.html

  * igt@xe_eudebug_online@set-breakpoint:
    - shard-bmg:          NOTRUN -> [SKIP][260] ([Intel XE#2905]) +1 other test skip
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-1/igt@xe_eudebug_online@set-breakpoint.html

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][261], [INCOMPLETE][262]) ([Intel XE#1130] / [Intel XE#1195] / [Intel XE#1473])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-large.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-bmg:          [PASS][263] -> [TIMEOUT][264] ([Intel XE#1473])
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-8/igt@xe_evict@evict-beng-threads-large.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-5/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_exec_balancer@twice-virtual-basic:
    - shard-dg2-set2:     [PASS][265] -> ([PASS][266], [SKIP][267]) ([Intel XE#1130]) +99 other tests ( 1 pass, 1 skip )
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-464/igt@xe_exec_balancer@twice-virtual-basic.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@xe_exec_balancer@twice-virtual-basic.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@xe_exec_balancer@twice-virtual-basic.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:
    - shard-bmg:          NOTRUN -> [SKIP][268] ([Intel XE#2322]) +2 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> ([SKIP][269], [SKIP][270]) ([Intel XE#2322])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-imm:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][271], [SKIP][272]) ([Intel XE#288])
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-imm.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-imm.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][273] ([Intel XE#1130]) +64 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_exec_reset@cat-error:
    - shard-adlp:         [PASS][274] -> ([DMESG-WARN][275], [DMESG-WARN][276]) ([Intel XE#358])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-adlp-3/igt@xe_exec_reset@cat-error.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-adlp-9/igt@xe_exec_reset@cat-error.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-adlp-1/igt@xe_exec_reset@cat-error.html

  * igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate:
    - shard-lnl:          [PASS][277] -> ([PASS][278], [DMESG-WARN][279]) ([Intel XE#3371])
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-lnl-5/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-4/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-7/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate.html

  * igt@xe_exec_threads@threads-bal-userptr-rebind:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][280], [PASS][281]) ([Intel XE#1130]) +1 other test ( 1 pass, 1 skip )
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@xe_exec_threads@threads-bal-userptr-rebind.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@xe_exec_threads@threads-bal-userptr-rebind.html

  * igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate:
    - shard-bmg:          [PASS][282] -> ([PASS][283], [DMESG-FAIL][284]) ([Intel XE#3371])
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-6/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-4/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init:
    - shard-dg2-set2:     NOTRUN -> ([DMESG-WARN][285], [DMESG-WARN][286]) ([Intel XE#3343])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][287] ([Intel XE#3343])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html

  * igt@xe_media_fill@media-fill:
    - shard-bmg:          NOTRUN -> [SKIP][288] ([Intel XE#2459] / [Intel XE#2596])
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-3/igt@xe_media_fill@media-fill.html

  * igt@xe_module_load@reload-no-display:
    - shard-dg2-set2:     NOTRUN -> [FAIL][289] ([Intel XE#2136])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@xe_module_load@reload-no-display.html

  * igt@xe_oa@enable-disable@rcs-0:
    - shard-lnl:          NOTRUN -> [DMESG-WARN][290] ([Intel XE#3466])
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-8/igt@xe_oa@enable-disable@rcs-0.html

  * igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> ([FAIL][291], [FAIL][292]) ([Intel XE#1173])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@d3hot-basic-exec:
    - shard-dg2-set2:     NOTRUN -> ([DMESG-WARN][293], [DMESG-WARN][294]) ([Intel XE#3468])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@xe_pm@d3hot-basic-exec.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@xe_pm@d3hot-basic-exec.html

  * igt@xe_pm@s2idle-exec-after:
    - shard-dg2-set2:     [PASS][295] -> [SKIP][296] ([Intel XE#1130]) +108 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-433/igt@xe_pm@s2idle-exec-after.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@xe_pm@s2idle-exec-after.html

  * igt@xe_pm@s2idle-vm-bind-unbind-all:
    - shard-dg2-set2:     [PASS][297] -> [ABORT][298] ([Intel XE#1694] / [Intel XE#1794])
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-434/igt@xe_pm@s2idle-vm-bind-unbind-all.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@xe_pm@s2idle-vm-bind-unbind-all.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-adlp:         [PASS][299] -> ([PASS][300], [ABORT][301]) ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-adlp-2/igt@xe_pm@s4-multiple-execs.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-adlp-2/igt@xe_pm@s4-multiple-execs.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-lnl:          [PASS][302] -> ([ABORT][303], [PASS][304]) ([Intel XE#1607] / [Intel XE#1794])
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-lnl-6/igt@xe_pm@s4-vm-bind-prefetch.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-4/igt@xe_pm@s4-vm-bind-prefetch.html

  
#### Possible fixes ####

  * igt@core_getversion@all-cards:
    - shard-dg2-set2:     [FAIL][305] ([Intel XE#3440]) -> ([PASS][306], [PASS][307])
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@core_getversion@all-cards.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@core_getversion@all-cards.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@core_getversion@all-cards.html

  * igt@core_setmaster@master-drop-set-user:
    - shard-dg2-set2:     [FAIL][308] ([Intel XE#3339]) -> ([PASS][309], [PASS][310])
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@core_setmaster@master-drop-set-user.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-433/igt@core_setmaster@master-drop-set-user.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@core_setmaster@master-drop-set-user.html

  * igt@fbdev@info:
    - shard-dg2-set2:     [SKIP][311] ([Intel XE#2134]) -> ([PASS][312], [PASS][313]) +1 other test ( 2 pass )
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@fbdev@info.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@fbdev@info.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@fbdev@info.html

  * igt@fbdev@read:
    - shard-dg2-set2:     [SKIP][314] ([Intel XE#2134]) -> [PASS][315] +1 other test pass
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@fbdev@read.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@fbdev@read.html

  * igt@kms_3d:
    - shard-dg2-set2:     [SKIP][316] ([Intel XE#2423]) -> [PASS][317]
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_3d.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@kms_3d.html

  * igt@kms_atomic@plane-invalid-params-fence:
    - shard-dg2-set2:     [SKIP][318] ([Intel XE#2423] / [i915#2575]) -> [PASS][319] +57 other tests pass
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_atomic@plane-invalid-params-fence.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_atomic@plane-invalid-params-fence.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-adlp:         [FAIL][320] ([Intel XE#1426]) -> [PASS][321] +1 other test pass
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-adlp-1/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-adlp-6/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_color@degamma@pipe-a-dp-2:
    - shard-bmg:          [DMESG-WARN][322] -> ([PASS][323], [PASS][324]) +8 other tests ( 2 pass )
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-6/igt@kms_color@degamma@pipe-a-dp-2.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-7/igt@kms_color@degamma@pipe-a-dp-2.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-3/igt@kms_color@degamma@pipe-a-dp-2.html

  * igt@kms_cursor_edge_walk@64x64-top-edge:
    - shard-lnl:          [FAIL][325] ([Intel XE#2577] / [Intel XE#3106]) -> ([PASS][326], [PASS][327]) +1 other test ( 2 pass )
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-lnl-3/igt@kms_cursor_edge_walk@64x64-top-edge.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-1/igt@kms_cursor_edge_walk@64x64-top-edge.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-8/igt@kms_cursor_edge_walk@64x64-top-edge.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [DMESG-FAIL][328] ([Intel XE#3468]) -> ([PASS][329], [PASS][330]) +10 other tests ( 2 pass )
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@nonblocking-modeset-vs-cursor-atomic:
    - shard-bmg:          [DMESG-WARN][331] -> [PASS][332]
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-8/igt@kms_cursor_legacy@nonblocking-modeset-vs-cursor-atomic.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-3/igt@kms_cursor_legacy@nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@torture-bo@pipe-a:
    - shard-dg2-set2:     [DMESG-WARN][333] ([Intel XE#3184]) -> [PASS][334] +2 other tests pass
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-434/igt@kms_cursor_legacy@torture-bo@pipe-a.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@kms_cursor_legacy@torture-bo@pipe-a.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][335] ([Intel XE#2882]) -> ([PASS][336], [PASS][337])
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [FAIL][338] ([Intel XE#2882]) -> [PASS][339] +6 other tests pass
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-lnl:          [FAIL][340] ([Intel XE#886]) -> ([PASS][341], [PASS][342]) +1 other test ( 2 pass )
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][343] ([Intel XE#2953] / [Intel XE#3086]) -> [PASS][344] +1 other test pass
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-adlp-8/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-adlp-4/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend@c-dp2:
    - shard-bmg:          [DMESG-WARN][345] ([Intel XE#3451]) -> [PASS][346] +1 other test pass
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-6/igt@kms_flip@flip-vs-suspend@c-dp2.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-4/igt@kms_flip@flip-vs-suspend@c-dp2.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
    - shard-dg2-set2:     [SKIP][347] ([Intel XE#2136] / [Intel XE#2351]) -> [PASS][348] +6 other tests pass
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html

  * igt@kms_frontbuffer_tracking@basic:
    - shard-dg2-set2:     [SKIP][349] ([Intel XE#2351]) -> [PASS][350]
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_frontbuffer_tracking@basic.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][351] ([Intel XE#2136]) -> ([PASS][352], [PASS][353]) +14 other tests ( 2 pass )
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][354] ([Intel XE#2136]) -> [PASS][355] +15 other tests pass
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][356] ([Intel XE#2136] / [Intel XE#2351]) -> ([PASS][357], [PASS][358]) +1 other test ( 2 pass )
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [SKIP][359] ([Intel XE#455]) -> [PASS][360]
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-433/igt@kms_hdr@invalid-hdr.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane@planar-pixel-format-settings:
    - shard-adlp:         [DMESG-WARN][361] ([Intel XE#3086]) -> [PASS][362]
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-adlp-9/igt@kms_plane@planar-pixel-format-settings.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-adlp-8/igt@kms_plane@planar-pixel-format-settings.html

  * igt@kms_plane_alpha_blend@alpha-7efc@pipe-a-dp-2:
    - shard-bmg:          [DMESG-FAIL][363] -> ([PASS][364], [PASS][365])
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-6/igt@kms_plane_alpha_blend@alpha-7efc@pipe-a-dp-2.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-3/igt@kms_plane_alpha_blend@alpha-7efc@pipe-a-dp-2.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-7/igt@kms_plane_alpha_blend@alpha-7efc@pipe-a-dp-2.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers:
    - shard-dg2-set2:     [SKIP][366] ([Intel XE#2423] / [i915#2575]) -> ([PASS][367], [PASS][368]) +40 other tests ( 2 pass )
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20:
    - shard-lnl:          [DMESG-WARN][369] ([Intel XE#2566]) -> [PASS][370]
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-lnl-3/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-1/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:
    - shard-bmg:          [DMESG-WARN][371] ([Intel XE#2566]) -> [PASS][372]
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [FAIL][373] ([Intel XE#718]) -> ([PASS][374], [PASS][375])
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-lnl-5/igt@kms_pm_dc@dc5-dpms.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-7/igt@kms_pm_dc@dc5-dpms.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-4/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_rpm@cursor:
    - shard-dg2-set2:     [SKIP][376] ([Intel XE#2446]) -> [PASS][377]
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_pm_rpm@cursor.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_pm_rpm@cursor.html
    - shard-lnl:          [DMESG-WARN][378] ([Intel XE#3184]) -> [PASS][379]
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-lnl-7/igt@kms_pm_rpm@cursor.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-3/igt@kms_pm_rpm@cursor.html

  * igt@kms_pm_rpm@cursor-dpms:
    - shard-dg2-set2:     [SKIP][380] ([Intel XE#2446]) -> ([PASS][381], [PASS][382]) +1 other test ( 2 pass )
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_pm_rpm@cursor-dpms.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-433/igt@kms_pm_rpm@cursor-dpms.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_pm_rpm@cursor-dpms.html

  * igt@kms_pm_rpm@universal-planes:
    - shard-lnl:          [DMESG-WARN][383] ([Intel XE#2042]) -> [PASS][384]
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-lnl-3/igt@kms_pm_rpm@universal-planes.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-1/igt@kms_pm_rpm@universal-planes.html

  * igt@kms_rotation_crc@primary-x-tiled-reflect-x-180:
    - shard-lnl:          [DMESG-WARN][385] -> [PASS][386] +82 other tests pass
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-lnl-3/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-1/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-180:
    - shard-lnl:          [DMESG-WARN][387] ([Intel XE#3466]) -> [PASS][388]
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-lnl-3/igt@kms_rotation_crc@sprite-rotation-180.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-1/igt@kms_rotation_crc@sprite-rotation-180.html

  * igt@kms_vblank@wait-idle@pipe-a-dp-4:
    - shard-dg2-set2:     [FAIL][389] -> [PASS][390] +1 other test pass
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-463/igt@kms_vblank@wait-idle@pipe-a-dp-4.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-433/igt@kms_vblank@wait-idle@pipe-a-dp-4.html

  * igt@xe_drm_fdinfo@utilization-others-idle:
    - shard-bmg:          [INCOMPLETE][391] -> [PASS][392]
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-1/igt@xe_drm_fdinfo@utilization-others-idle.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-3/igt@xe_drm_fdinfo@utilization-others-idle.html

  * igt@xe_exec_balancer@once-parallel-rebind:
    - shard-dg2-set2:     [SKIP][393] ([Intel XE#1130]) -> ([PASS][394], [PASS][395]) +73 other tests ( 2 pass )
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@xe_exec_balancer@once-parallel-rebind.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@xe_exec_balancer@once-parallel-rebind.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-433/igt@xe_exec_balancer@once-parallel-rebind.html

  * igt@xe_exec_basic@many-null-rebind:
    - shard-dg2-set2:     [SKIP][396] ([Intel XE#1130]) -> [PASS][397] +110 other tests pass
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@xe_exec_basic@many-null-rebind.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@xe_exec_basic@many-null-rebind.html

  * igt@xe_exec_fault_mode@twice-rebind-prefetch:
    - shard-bmg:          [DMESG-WARN][398] ([Intel XE#3468]) -> [PASS][399] +10 other tests pass
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-6/igt@xe_exec_fault_mode@twice-rebind-prefetch.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-4/igt@xe_exec_fault_mode@twice-rebind-prefetch.html

  * igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate:
    - shard-adlp:         [DMESG-FAIL][400] ([Intel XE#3371]) -> ([PASS][401], [PASS][402])
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-adlp-8/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-adlp-6/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-adlp-2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate.html

  * igt@xe_fault_injection@vm-create-fail-xe_pt_create:
    - shard-bmg:          [DMESG-WARN][403] ([Intel XE#3467]) -> ([PASS][404], [PASS][405]) +1 other test ( 2 pass )
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-6/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-3/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-7/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
    - shard-bmg:          [INCOMPLETE][406] ([Intel XE#2998]) -> [PASS][407] +1 other test pass
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-1/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html

  * igt@xe_module_load@reload:
    - shard-adlp:         [DMESG-WARN][408] ([Intel XE#3086]) -> ([PASS][409], [PASS][410]) +1 other test ( 2 pass )
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-adlp-2/igt@xe_module_load@reload.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-adlp-4/igt@xe_module_load@reload.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-adlp-3/igt@xe_module_load@reload.html

  * igt@xe_pm@s2idle-vm-bind-unbind-all:
    - shard-lnl:          [DMESG-WARN][411] ([Intel XE#1616]) -> [PASS][412]
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-lnl-3/igt@xe_pm@s2idle-vm-bind-unbind-all.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-1/igt@xe_pm@s2idle-vm-bind-unbind-all.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-adlp:         [FAIL][413] -> [PASS][414]
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-adlp-1/igt@xe_sriov_flr@flr-vf1-clear.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-adlp-6/igt@xe_sriov_flr@flr-vf1-clear.html

  * igt@xe_vm@large-userptr-split-misaligned-binds-67108864:
    - shard-bmg:          [DMESG-WARN][415] ([Intel XE#3468]) -> ([PASS][416], [PASS][417]) +33 other tests ( 2 pass )
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-6/igt@xe_vm@large-userptr-split-misaligned-binds-67108864.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-3/igt@xe_vm@large-userptr-split-misaligned-binds-67108864.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-7/igt@xe_vm@large-userptr-split-misaligned-binds-67108864.html

  
#### Warnings ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-dg2-set2:     [SKIP][418] ([Intel XE#1885]) -> [DMESG-WARN][419] ([Intel XE#3468])
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@core_hotunplug@hotrebind-lateclose.html
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@core_hotunplug@hotreplug-lateclose:
    - shard-dg2-set2:     [DMESG-WARN][420] ([Intel XE#3468]) -> [SKIP][421] ([Intel XE#1885])
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-464/igt@core_hotunplug@hotreplug-lateclose.html
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@core_hotunplug@hotreplug-lateclose.html

  * igt@core_hotunplug@hotunplug-rescan:
    - shard-dg2-set2:     [DMESG-WARN][422] ([Intel XE#3468]) -> ([SKIP][423], [DMESG-WARN][424]) ([Intel XE#1885] / [Intel XE#3468])
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-434/igt@core_hotunplug@hotunplug-rescan.html
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@core_hotunplug@hotunplug-rescan.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@core_hotunplug@hotunplug-rescan.html

  * igt@core_hotunplug@unplug-rescan:
    - shard-dg2-set2:     [INCOMPLETE][425] ([Intel XE#1195]) -> [SKIP][426] ([Intel XE#1885])
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-436/igt@core_hotunplug@unplug-rescan.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@core_hotunplug@unplug-rescan.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2-set2:     [SKIP][427] ([Intel XE#623]) -> [SKIP][428] ([Intel XE#2423] / [i915#2575])
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-436/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:
    - shard-lnl:          [DMESG-FAIL][429] -> [FAIL][430] ([Intel XE#911]) +3 other tests fail
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-lnl:          [DMESG-WARN][431] ([Intel XE#3466]) -> [DMESG-FAIL][432] ([Intel XE#3466]) +3 other tests dmesg-fail
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-lnl-8/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-8/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][433] ([Intel XE#2136] / [Intel XE#2351]) -> ([SKIP][434], [SKIP][435]) ([Intel XE#316])
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-180:
    - shard-bmg:          [DMESG-WARN][436] ([Intel XE#3468]) -> ([DMESG-FAIL][437], [DMESG-FAIL][438]) ([Intel XE#3468])
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-4/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-1/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-5/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][439] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][440] ([Intel XE#316])
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [DMESG-WARN][441] -> [SKIP][442] ([Intel XE#2136])
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-464/igt@kms_big_fb@4-tiled-addfb-size-overflow.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          [FAIL][443] ([Intel XE#3162]) -> ([FAIL][444], [DMESG-FAIL][445]) ([Intel XE#3162] / [Intel XE#3466])
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-bmg:          [DMESG-FAIL][446] ([Intel XE#3468]) -> ([DMESG-WARN][447], [DMESG-WARN][448]) ([Intel XE#3468])
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-2/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-6/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-7/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][449] ([Intel XE#316]) -> [SKIP][450] ([Intel XE#2136])
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-433/igt@kms_big_fb@linear-64bpp-rotate-90.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@linear-8bpp-rotate-0:
    - shard-bmg:          [DMESG-FAIL][451] ([Intel XE#3468]) -> [DMESG-WARN][452] ([Intel XE#3468])
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-3/igt@kms_big_fb@linear-8bpp-rotate-0.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-4/igt@kms_big_fb@linear-8bpp-rotate-0.html

  * igt@kms_big_fb@linear-8bpp-rotate-180:
    - shard-bmg:          [DMESG-FAIL][453] ([Intel XE#3468]) -> ([DMESG-FAIL][454], [DMESG-WARN][455]) ([Intel XE#3468]) +4 other tests ( 1 dmesg-fail, 1 dmesg-warn )
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-3/igt@kms_big_fb@linear-8bpp-rotate-180.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-8/igt@kms_big_fb@linear-8bpp-rotate-180.html
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-5/igt@kms_big_fb@linear-8bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][456] ([Intel XE#2136]) -> ([SKIP][457], [SKIP][458]) ([Intel XE#316]) +4 other tests ( 2 skip )
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-433/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][459] ([Intel XE#316]) -> ([SKIP][460], [SKIP][461]) ([Intel XE#2136] / [Intel XE#316]) +2 other tests ( 2 skip )
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-463/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-436/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-bmg:          [DMESG-WARN][462] ([Intel XE#3468]) -> [DMESG-FAIL][463] ([Intel XE#3468]) +1 other test dmesg-fail
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-bmg:          [DMESG-WARN][464] ([Intel XE#3468]) -> ([DMESG-FAIL][465], [DMESG-WARN][466]) ([Intel XE#3468])
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-adlp:         [DMESG-FAIL][467] ([Intel XE#1033]) -> ([FAIL][468], [FAIL][469]) ([Intel XE#1874])
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0.html
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0.html
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][470] ([Intel XE#2136]) -> ([SKIP][471], [SKIP][472]) ([Intel XE#1124] / [Intel XE#2136]) +1 other test ( 2 skip )
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][473] ([Intel XE#2136] / [Intel XE#2351]) -> ([SKIP][474], [SKIP][475]) ([Intel XE#1124])
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-433/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][476] ([Intel XE#2136]) -> ([SKIP][477], [SKIP][478]) ([Intel XE#1124]) +2 other tests ( 2 skip )
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-433/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][479] ([Intel XE#1124]) -> [SKIP][480] ([Intel XE#2136] / [Intel XE#2351]) +2 other tests skip
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-464/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][481] ([Intel XE#607]) -> [SKIP][482] ([Intel XE#2136] / [Intel XE#2351])
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][483] ([Intel XE#2136]) -> [SKIP][484] ([Intel XE#610])
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][485] ([Intel XE#1124]) -> ([SKIP][486], [SKIP][487]) ([Intel XE#1124] / [Intel XE#2136] / [Intel XE#2351])
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     [SKIP][488] ([Intel XE#1124]) -> ([SKIP][489], [SKIP][490]) ([Intel XE#1124] / [Intel XE#2136]) +4 other tests ( 2 skip )
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][491] ([Intel XE#1124]) -> [SKIP][492] ([Intel XE#2136]) +3 other tests skip
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][493] ([Intel XE#2136]) -> [SKIP][494] ([Intel XE#1124]) +3 other tests skip
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][495] ([Intel XE#2136] / [Intel XE#2351]) -> ([SKIP][496], [SKIP][497]) ([Intel XE#1124] / [Intel XE#2136] / [Intel XE#2351])
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][498] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][499] ([Intel XE#1124]) +1 other test skip
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][500] ([Intel XE#607]) -> [SKIP][501] ([Intel XE#2136])
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][502] ([Intel XE#2136]) -> ([SKIP][503], [SKIP][504]) ([Intel XE#610])
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][505] ([Intel XE#2423] / [i915#2575]) -> [SKIP][506] ([Intel XE#367]) +2 other tests skip
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][507] ([Intel XE#2423] / [i915#2575]) -> ([SKIP][508], [SKIP][509]) ([Intel XE#367])
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-433/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][510] ([Intel XE#2423] / [i915#2575]) -> ([SKIP][511], [SKIP][512]) ([Intel XE#2191])
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][513] ([Intel XE#2191]) -> ([SKIP][514], [SKIP][515]) ([Intel XE#2191] / [Intel XE#2423] / [i915#2575])
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][516] ([Intel XE#2191]) -> [SKIP][517] ([Intel XE#2423] / [i915#2575])
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-433/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][518] ([Intel XE#367]) -> ([SKIP][519], [SKIP][520]) ([Intel XE#2423] / [Intel XE#367] / [i915#2575])
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-463/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-436/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][521] ([Intel XE#2423] / [i915#2575]) -> ([SKIP][522], [SKIP][523]) ([Intel XE#2423] / [Intel XE#367] / [i915#2575]) +1 other test ( 2 skip )
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][524] ([Intel XE#367]) -> [SKIP][525] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-433/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][526] ([Intel XE#2136]) -> ([SKIP][527], [SKIP][528]) ([Intel XE#455] / [Intel XE#787]) +5 other tests ( 2 skip )
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-433/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][529] ([Intel XE#2136]) -> [SKIP][530] ([Intel XE#455] / [Intel XE#787]) +11 other tests skip
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][531] ([Intel XE#2136]) -> [SKIP][532] ([Intel XE#2907])
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     [SKIP][533] ([Intel XE#2136]) -> ([SKIP][534], [SKIP][535]) ([Intel XE#2136] / [Intel XE#455] / [Intel XE#787]) +1 other test ( 2 skip )
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs.html
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs.html
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][536] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][537] ([Intel XE#2136] / [Intel XE#2351]) +1 other test skip
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-436/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][538] ([Intel XE#2136]) -> ([SKIP][539], [SKIP][540]) ([Intel XE#2136] / [Intel XE#2907])
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][541] ([Intel XE#455] / [Intel XE#787]) -> ([SKIP][542], [SKIP][543]) ([Intel XE#2136] / [Intel XE#2351] / [Intel XE#455] / [Intel XE#787])
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][544] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][545] ([Intel XE#2136]) +7 other tests skip
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs.html
   [545]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][546] ([Intel XE#2136] / [Intel XE#2351]) -> ([SKIP][547], [SKIP][548]) ([Intel XE#455] / [Intel XE#787]) +2 other tests ( 2 skip )
   [546]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html
   [547]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html
   [548]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][549] ([Intel XE#2907]) -> ([SKIP][550], [SKIP][551]) ([Intel XE#2136] / [Intel XE#2907])
   [549]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
   [550]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
   [551]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][552] ([Intel XE#2907]) -> [SKIP][553] ([Intel XE#2136])
   [552]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
   [553]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][554] ([Intel XE#455] / [Intel XE#787]) -> ([SKIP][555], [SKIP][556]) ([Intel XE#2136] / [Intel XE#455] / [Intel XE#787]) +8 other tests ( 2 skip )
   [554]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html
   [555]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html
   [556]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2-set2:     [SKIP][557] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][558] ([Intel XE#314])
   [557]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_cdclk@mode-transition-all-outputs.html
   [558]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-dg2-set2:     [SKIP][559] ([Intel XE#2423] / [i915#2575]) -> [SKIP][560] ([Intel XE#306])
   [559]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_chamelium_color@ctm-0-75.html
   [560]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-dg2-set2:     [SKIP][561] ([Intel XE#2423] / [i915#2575]) -> ([SKIP][562], [SKIP][563]) ([Intel XE#306])
   [561]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_chamelium_color@ctm-max.html
   [562]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_chamelium_color@ctm-max.html
   [563]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2-set2:     [SKIP][564] ([Intel XE#306]) -> ([SKIP][565], [SKIP][566]) ([Intel XE#2423] / [Intel XE#306] / [i915#2575])
   [564]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-464/igt@kms_chamelium_color@degamma.html
   [565]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_chamelium_color@degamma.html
   [566]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     [SKIP][567] ([Intel XE#2423] / [i915#2575]) -> ([SKIP][568], [SKIP][569]) ([Intel XE#2423] / [Intel XE#306] / [i915#2575])
   [567]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_chamelium_color@gamma.html
   [568]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_chamelium_color@gamma.html
   [569]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:
    - shard-dg2-set2:     [SKIP][570] ([Intel XE#373]) -> ([SKIP][571], [SKIP][572]) ([Intel XE#2423] / [Intel XE#373] / [i915#2575]) +7 other tests ( 2 skip )
   [570]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-463/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html
   [571]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-436/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html
   [572]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html

  * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
    - shard-dg2-set2:     [SKIP][573] ([Intel XE#2423] / [i915#2575]) -> ([SKIP][574], [SKIP][575]) ([Intel XE#2423] / [Intel XE#373] / [i915#2575]) +1 other test ( 2 skip )
   [573]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html
   [574]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html
   [575]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-dg2-set2:     [SKIP][576] ([Intel XE#2423] / [i915#2575]) -> [SKIP][577] ([Intel XE#373]) +6 other tests skip
   [576]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
   [577]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm:
    - shard-dg2-set2:     [SKIP][578] ([Intel XE#2423] / [i915#2575]) -> ([SKIP][579], [SKIP][580]) ([Intel XE#373]) +4 other tests ( 2 skip )
   [578]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-storm.html
   [579]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-storm.html
   [580]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd-storm.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     [SKIP][581] ([Intel XE#373]) -> [SKIP][582] ([Intel XE#2423] / [i915#2575]) +10 other tests skip
   [581]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-433/igt@kms_chamelium_hpd@vga-hpd.html
   [582]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2-set2:     [FAIL][583] ([Intel XE#1178]) -> [SKIP][584] ([Intel XE#2423] / [i915#2575])
   [583]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-464/igt@kms_content_protection@atomic-dpms.html
   [584]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg2-set2:     [SKIP][585] ([Intel XE#2423] / [i915#2575]) -> [SKIP][586] ([Intel XE#307])
   [585]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_content_protection@dp-mst-lic-type-1.html
   [586]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg2-set2:     [SKIP][587] ([Intel XE#2423] / [i915#2575]) -> ([SKIP][588], [SKIP][589]) ([Intel XE#2423] / [Intel XE#307] / [i915#2575])
   [587]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_content_protection@dp-mst-type-1.html
   [588]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_content_protection@dp-mst-type-1.html
   [589]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-dg2-set2:     [SKIP][590] ([Intel XE#2423] / [i915#2575]) -> [FAIL][591] ([Intel XE#1178])
   [590]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_content_protection@legacy.html
   [591]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     [SKIP][592] ([Intel XE#2423] / [i915#2575]) -> ([FAIL][593], [FAIL][594]) ([Intel XE#1178]) +1 other test ( 2 fail )
   [592]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_content_protection@lic-type-0.html
   [593]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@kms_content_protection@lic-type-0.html
   [594]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@lic-type-1:
    - shard-dg2-set2:     [SKIP][595] ([Intel XE#455]) -> [SKIP][596] ([Intel XE#2423] / [i915#2575]) +6 other tests skip
   [595]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-433/igt@kms_content_protection@lic-type-1.html
   [596]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_content_protection@lic-type-1.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     [SKIP][597] ([Intel XE#2423] / [i915#2575]) -> [SKIP][598] ([Intel XE#308]) +1 other test skip
   [597]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [598]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-offscreen-64x21:
    - shard-dg2-set2:     [INCOMPLETE][599] ([Intel XE#1195]) -> ([SKIP][600], [INCOMPLETE][601]) ([Intel XE#1195] / [Intel XE#2423] / [i915#2575])
   [599]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-464/igt@kms_cursor_crc@cursor-offscreen-64x21.html
   [600]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_cursor_crc@cursor-offscreen-64x21.html
   [601]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-64x21.html

  * igt@kms_cursor_crc@cursor-onscreen-max-size:
    - shard-dg2-set2:     [SKIP][602] ([Intel XE#2423] / [i915#2575]) -> ([SKIP][603], [SKIP][604]) ([Intel XE#455])
   [602]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen-max-size.html
   [603]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-433/igt@kms_cursor_crc@cursor-onscreen-max-size.html
   [604]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-max-size.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-dg2-set2:     [SKIP][605] ([Intel XE#308]) -> ([SKIP][606], [SKIP][607]) ([Intel XE#2423] / [Intel XE#308] / [i915#2575])
   [605]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-464/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
   [606]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
   [607]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-32x32:
    - shard-dg2-set2:     [SKIP][608] ([Intel XE#455]) -> ([SKIP][609], [SKIP][610]) ([Intel XE#2423] / [Intel XE#455] / [i915#2575]) +2 other tests ( 2 skip )
   [608]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-464/igt@kms_cursor_crc@cursor-sliding-32x32.html
   [609]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-32x32.html
   [610]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-dg2-set2:     [SKIP][611] ([Intel XE#2423] / [i915#2575]) -> [SKIP][612] ([Intel XE#455]) +1 other test skip
   [611]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-max-size.html
   [612]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [DMESG-WARN][613] ([Intel XE#877]) -> ([PASS][614], [DMESG-WARN][615]) ([Intel XE#877])
   [613]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [614]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [615]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     [SKIP][616] ([Intel XE#323]) -> ([SKIP][617], [SKIP][618]) ([Intel XE#2423] / [Intel XE#323] / [i915#2575])
   [616]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-464/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [617]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [618]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2-set2:     [SKIP][619] ([Intel XE#2423] / [i915#2575]) -> [SKIP][620] ([Intel XE#323])
   [619]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [620]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-dg2-set2:     [SKIP][621] ([Intel XE#455]) -> ([SKIP][622], [SKIP][623]) ([Intel XE#2136] / [Intel XE#2351] / [Intel XE#455]) +1 other test ( 2 skip )
   [621]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-434/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
   [622]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
   [623]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_draw_crc@draw-method-mmap-wc:
    - shard-bmg:          [INCOMPLETE][624] ([Intel XE#3468]) -> ([DMESG-FAIL][625], [INCOMPLETE][626]) ([Intel XE#3468])
   [624]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-4/igt@kms_draw_crc@draw-method-mmap-wc.html
   [625]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-1/igt@kms_draw_crc@draw-method-mmap-wc.html
   [626]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-5/igt@kms_draw_crc@draw-method-mmap-wc.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2-set2:     [SKIP][627] ([Intel XE#455]) -> ([SKIP][628], [SKIP][629]) ([Intel XE#2136] / [Intel XE#455]) +4 other tests ( 2 skip )
   [627]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-464/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [628]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [629]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg2-set2:     [SKIP][630] ([Intel XE#2136]) -> [SKIP][631] ([Intel XE#776])
   [630]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_fbcon_fbt@psr-suspend.html
   [631]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg2-set2:     [SKIP][632] ([Intel XE#2423] / [i915#2575]) -> ([SKIP][633], [SKIP][634]) ([Intel XE#1138])
   [632]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_feature_discovery@display-4x.html
   [633]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_feature_discovery@display-4x.html
   [634]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-433/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2-set2:     [SKIP][635] ([Intel XE#1135]) -> [SKIP][636] ([Intel XE#2423] / [i915#2575])
   [635]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-464/igt@kms_feature_discovery@psr1.html
   [636]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_feature_discovery@psr1.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg2-set2:     [SKIP][637] ([Intel XE#2423] / [i915#2575]) -> ([SKIP][638], [SKIP][639]) ([Intel XE#1135])
   [637]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_feature_discovery@psr2.html
   [638]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@kms_feature_discovery@psr2.html
   [639]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][640] ([Intel XE#3486]) -> ([FAIL][641], [PASS][642]) ([Intel XE#3486])
   [640]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3.html
   [641]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3.html
   [642]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][643] ([Intel XE#3486]) -> ([FAIL][644], [PASS][645]) ([Intel XE#3321] / [Intel XE#3486])
   [643]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html
   [644]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html
   [645]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-dg2-set2:     [DMESG-WARN][646] -> [SKIP][647] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [646]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-436/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html
   [647]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
    - shard-dg2-set2:     [INCOMPLETE][648] ([Intel XE#1195]) -> [SKIP][649] ([Intel XE#2136] / [Intel XE#2351]) +1 other test skip
   [648]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html
   [649]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-dg2-set2:     [SKIP][650] ([Intel XE#2136]) -> [SKIP][651] ([Intel XE#455]) +2 other tests skip
   [650]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
   [651]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
    - shard-dg2-set2:     [SKIP][652] ([Intel XE#455]) -> [SKIP][653] ([Intel XE#2136] / [Intel XE#2351])
   [652]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html
   [653]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-dg2-set2:     [SKIP][654] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][655] ([Intel XE#455]) +2 other tests skip
   [654]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
   [655]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][656] ([Intel XE#2136] / [Intel XE#2351]) -> ([SKIP][657], [SKIP][658]) ([Intel XE#2136] / [Intel XE#2351] / [Intel XE#455]) +1 other test ( 2 skip )
   [656]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [657]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [658]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     [SKIP][659] ([Intel XE#455]) -> [SKIP][660] ([Intel XE#2136]) +1 other test skip
   [659]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [660]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
    - shard-dg2-set2:     [SKIP][661] ([Intel XE#2136]) -> ([SKIP][662], [SKIP][663]) ([Intel XE#455]) +1 other test ( 2 skip )
   [661]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html
   [662]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html
   [663]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][664] ([Intel XE#651]) -> [SKIP][665] ([Intel XE#2136] / [Intel XE#2351]) +9 other tests skip
   [664]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html
   [665]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][666] ([Intel XE#2136]) -> [SKIP][667] ([Intel XE#651]) +16 other tests skip
   [666]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
   [667]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][668] ([Intel XE#2136] / [Intel XE#2351]) -> ([SKIP][669], [SKIP][670]) ([Intel XE#2136] / [Intel XE#2351] / [Intel XE#651]) +3 other tests ( 2 skip )
   [668]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render.html
   [669]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render.html
   [670]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][671] ([Intel XE#2136]) -> ([SKIP][672], [SKIP][673]) ([Intel XE#651]) +10 other tests ( 2 skip )
   [671]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html
   [672]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html
   [673]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-dg2-set2:     [SKIP][674] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][675] ([Intel XE#651]) +4 other tests skip
   [674]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-suspend.html
   [675]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:
    - shard-bmg:          [DMESG-FAIL][676] ([Intel XE#3468]) -> ([FAIL][677], [FAIL][678]) ([Intel XE#2333]) +2 other tests ( 2 fail )
   [676]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html
   [677]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html
   [678]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][679] ([Intel XE#2136] / [Intel XE#2351]) -> ([PASS][680], [SKIP][681]) ([Intel XE#2136] / [Intel XE#2351]) +2 other tests ( 1 pass, 1 skip )
   [679]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html
   [680]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html
   [681]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][682] ([Intel XE#2136]) -> ([PASS][683], [SKIP][684]) ([Intel XE#2136]) +5 other tests ( 1 pass, 1 skip )
   [682]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html
   [683]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html
   [684]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-rte:
    - shard-dg2-set2:     [ABORT][685] ([Intel XE#3468]) -> ([SKIP][686], [ABORT][687]) ([Intel XE#2136] / [Intel XE#3468])
   [685]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-rte.html
   [686]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-rte.html
   [687]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-move:
    - shard-dg2-set2:     [SKIP][688] ([Intel XE#651]) -> [SKIP][689] ([Intel XE#2136]) +8 other tests skip
   [688]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-move.html
   [689]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
    - shard-dg2-set2:     [SKIP][690] ([Intel XE#651]) -> ([SKIP][691], [SKIP][692]) ([Intel XE#2136] / [Intel XE#651]) +10 other tests ( 2 skip )
   [690]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html
   [691]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html
   [692]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][693] ([Intel XE#651]) -> ([SKIP][694], [SKIP][695]) ([Intel XE#2136] / [Intel XE#2351] / [Intel XE#651]) +7 other tests ( 2 skip )
   [693]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html
   [694]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html
   [695]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][696] ([Intel XE#2136] / [Intel XE#2351]) -> ([SKIP][697], [SKIP][698]) ([Intel XE#651]) +4 other tests ( 2 skip )
   [696]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html
   [697]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html
   [698]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-blt:
    - shard-dg2-set2:     [SKIP][699] ([Intel XE#2136]) -> ([SKIP][700], [SKIP][701]) ([Intel XE#2136] / [Intel XE#651]) +2 other tests ( 2 skip )
   [699]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-blt.html
   [700]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-blt.html
   [701]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][702] ([Intel XE#653]) -> ([SKIP][703], [SKIP][704]) ([Intel XE#2136] / [Intel XE#653]) +13 other tests ( 2 skip )
   [702]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
   [703]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
   [704]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][705] ([Intel XE#2136]) -> ([SKIP][706], [SKIP][707]) ([Intel XE#653]) +14 other tests ( 2 skip )
   [705]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html
   [706]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html
   [707]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][708] ([Intel XE#653]) -> [SKIP][709] ([Intel XE#2136] / [Intel XE#2351]) +5 other tests skip
   [708]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
   [709]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][710] ([Intel XE#2136] / [Intel XE#2351]) -> ([SKIP][711], [SKIP][712]) ([Intel XE#653]) +2 other tests ( 2 skip )
   [710]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html
   [711]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html
   [712]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear:
    - shard-dg2-set2:     [SKIP][713] ([Intel XE#2136]) -> [SKIP][714] ([Intel XE#653]) +17 other tests skip
   [713]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html
   [714]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2-set2:     [SKIP][715] ([Intel XE#2136] / [Intel XE#2351]) -> ([SKIP][716], [SKIP][717]) ([Intel XE#658])
   [715]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [716]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [717]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][718] ([Intel XE#653]) -> [SKIP][719] ([Intel XE#2136]) +14 other tests skip
   [718]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
   [719]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][720] ([Intel XE#2136] / [Intel XE#2351]) -> ([SKIP][721], [SKIP][722]) ([Intel XE#2136] / [Intel XE#2351] / [Intel XE#653]) +3 other tests ( 2 skip )
   [720]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html
   [721]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html
   [722]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][723] ([Intel XE#2136]) -> ([SKIP][724], [SKIP][725]) ([Intel XE#2136] / [Intel XE#653]) +3 other tests ( 2 skip )
   [723]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
   [724]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
   [725]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][726] ([Intel XE#653]) -> ([SKIP][727], [SKIP][728]) ([Intel XE#2136] / [Intel XE#2351] / [Intel XE#653]) +4 other tests ( 2 skip )
   [726]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render.html
   [727]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render.html
   [728]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][729] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][730] ([Intel XE#653]) +5 other tests skip
   [729]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff.html
   [730]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2-set2:     [SKIP][731] ([Intel XE#2423] / [i915#2575]) -> ([SKIP][732], [SKIP][733]) ([Intel XE#605])
   [731]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_getfb@getfb-reject-ccs.html
   [732]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-433/igt@kms_getfb@getfb-reject-ccs.html
   [733]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-bmg:          [DMESG-FAIL][734] ([Intel XE#3468]) -> [INCOMPLETE][735] ([Intel XE#3468])
   [734]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-1/igt@kms_hdr@static-toggle-suspend.html
   [735]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-1/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-dg2-set2:     [SKIP][736] ([Intel XE#346]) -> ([SKIP][737], [SKIP][738]) ([Intel XE#2136] / [Intel XE#346])
   [736]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-434/igt@kms_joiner@basic-big-joiner.html
   [737]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_joiner@basic-big-joiner.html
   [738]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-dg2-set2:     [SKIP][739] ([Intel XE#2927]) -> ([SKIP][740], [SKIP][741]) ([Intel XE#2136] / [Intel XE#2927])
   [739]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-463/igt@kms_joiner@basic-ultra-joiner.html
   [740]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-436/igt@kms_joiner@basic-ultra-joiner.html
   [741]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-dg2-set2:     [SKIP][742] ([Intel XE#2925]) -> [SKIP][743] ([Intel XE#2136])
   [742]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-433/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [743]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-dg2-set2:     [INCOMPLETE][744] ([Intel XE#1195]) -> ([INCOMPLETE][745], [INCOMPLETE][746]) ([Intel XE#1195] / [Intel XE#3468])
   [744]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-435/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [745]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-433/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [746]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-436/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_plane_cursor@primary:
    - shard-dg2-set2:     [FAIL][747] ([Intel XE#616]) -> [SKIP][748] ([Intel XE#2423] / [i915#2575])
   [747]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-436/igt@kms_plane_cursor@primary.html
   [748]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_plane_cursor@primary.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2-set2:     [FAIL][749] ([Intel XE#361]) -> ([FAIL][750], [SKIP][751]) ([Intel XE#2423] / [Intel XE#361] / [i915#2575])
   [749]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size.html
   [750]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size.html
   [751]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20:
    - shard-dg2-set2:     [SKIP][752] ([Intel XE#2423] / [i915#2575]) -> [SKIP][753] ([Intel XE#2763] / [Intel XE#455])
   [752]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20.html
   [753]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][754] ([Intel XE#2423] / [i915#2575]) -> ([SKIP][755], [SKIP][756]) ([Intel XE#2763] / [Intel XE#455])
   [754]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
   [755]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
   [756]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-dg2-set2:     [SKIP][757] ([Intel XE#2136]) -> [SKIP][758] ([Intel XE#870])
   [757]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_pm_backlight@bad-brightness.html
   [758]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-dg2-set2:     [SKIP][759] ([Intel XE#2136]) -> ([SKIP][760], [SKIP][761]) ([Intel XE#2136] / [Intel XE#870])
   [759]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_pm_backlight@basic-brightness.html
   [760]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@kms_pm_backlight@basic-brightness.html
   [761]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg2-set2:     [SKIP][762] ([Intel XE#2938]) -> ([SKIP][763], [SKIP][764]) ([Intel XE#2136] / [Intel XE#2938])
   [762]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-464/igt@kms_pm_backlight@brightness-with-dpms.html
   [763]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_pm_backlight@brightness-with-dpms.html
   [764]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg2-set2:     [SKIP][765] ([Intel XE#870]) -> [SKIP][766] ([Intel XE#2136])
   [765]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-436/igt@kms_pm_backlight@fade-with-suspend.html
   [766]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2-set2:     [SKIP][767] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][768] ([Intel XE#1122])
   [767]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [768]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@kms_pm_dc@dc3co-vpb-simulation.html
    - shard-lnl:          [SKIP][769] ([Intel XE#736]) -> [SKIP][770] ([Intel XE#1909])
   [769]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-lnl-4/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [770]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-6/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - shard-dg2-set2:     [DMESG-WARN][771] ([Intel XE#3468]) -> [ABORT][772] ([Intel XE#3468])
   [771]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-463/igt@kms_pm_rpm@basic-pci-d3-state.html
   [772]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-436/igt@kms_pm_rpm@basic-pci-d3-state.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-dg2-set2:     [SKIP][773] ([Intel XE#2446]) -> [ABORT][774] ([Intel XE#3468])
   [773]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_pm_rpm@dpms-non-lpsp.html
   [774]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@drm-resources-equal:
    - shard-dg2-set2:     [ABORT][775] ([Intel XE#3468]) -> ([SKIP][776], [DMESG-FAIL][777]) ([Intel XE#2446] / [Intel XE#3468])
   [775]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-464/igt@kms_pm_rpm@drm-resources-equal.html
   [776]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_pm_rpm@drm-resources-equal.html
   [777]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@kms_pm_rpm@drm-resources-equal.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][778] ([Intel XE#1489]) -> [SKIP][779] ([Intel XE#2136]) +4 other tests skip
   [778]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-436/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html
   [779]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][780] ([Intel XE#2136]) -> ([SKIP][781], [SKIP][782]) ([Intel XE#1489]) +2 other tests ( 2 skip )
   [780]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html
   [781]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html
   [782]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][783] ([Intel XE#1489]) -> ([SKIP][784], [SKIP][785]) ([Intel XE#1489] / [Intel XE#2136]) +6 other tests ( 2 skip )
   [783]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-464/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html
   [784]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html
   [785]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html
    - shard-lnl:          [SKIP][786] ([Intel XE#2893]) -> ([SKIP][787], [SKIP][788]) ([Intel XE#1489]) +13 other tests ( 2 skip )
   [786]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-lnl-1/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html
   [787]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-7/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html
   [788]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-6/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-lnl:          [DMESG-WARN][789] -> [SKIP][790] ([Intel XE#1489]) +1 other test skip
   [789]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html
   [790]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
    - shard-lnl:          [SKIP][791] ([Intel XE#2893]) -> [SKIP][792] ([Intel XE#1489]) +9 other tests skip
   [791]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-lnl-2/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html
   [792]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-2/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][793] ([Intel XE#2136]) -> ([SKIP][794], [SKIP][795]) ([Intel XE#1489] / [Intel XE#2136]) +1 other test ( 2 skip )
   [793]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html
   [794]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html
   [795]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][796] ([Intel XE#2136]) -> [SKIP][797] ([Intel XE#1489]) +5 other tests skip
   [796]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html
   [797]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-dg2-set2:     [SKIP][798] ([Intel XE#2136]) -> ([SKIP][799], [SKIP][800]) ([Intel XE#1122])
   [798]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [799]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [800]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-dg2-set2:     [SKIP][801] ([Intel XE#2136]) -> ([SKIP][802], [SKIP][803]) ([Intel XE#1122] / [Intel XE#2136])
   [801]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_psr2_su@page_flip-xrgb8888.html
   [802]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@kms_psr2_su@page_flip-xrgb8888.html
   [803]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-sprite-render:
    - shard-dg2-set2:     [SKIP][804] ([Intel XE#2850] / [Intel XE#929]) -> ([SKIP][805], [SKIP][806]) ([Intel XE#2136] / [Intel XE#2351] / [Intel XE#2850] / [Intel XE#929]) +1 other test ( 2 skip )
   [804]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-464/igt@kms_psr@fbc-pr-sprite-render.html
   [805]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@kms_psr@fbc-pr-sprite-render.html
   [806]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_psr@fbc-pr-sprite-render.html

  * igt@kms_psr@fbc-psr-cursor-plane-onoff:
    - shard-dg2-set2:     [SKIP][807] ([Intel XE#2136]) -> ([SKIP][808], [SKIP][809]) ([Intel XE#2850] / [Intel XE#929]) +4 other tests ( 2 skip )
   [807]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_psr@fbc-psr-cursor-plane-onoff.html
   [808]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@kms_psr@fbc-psr-cursor-plane-onoff.html
   [809]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_psr@fbc-psr-cursor-plane-onoff.html

  * igt@kms_psr@fbc-psr-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][810] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][811] ([Intel XE#2136] / [Intel XE#2351]) +4 other tests skip
   [810]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-436/igt@kms_psr@fbc-psr-sprite-plane-move.html
   [811]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-plane-move.html

  * igt@kms_psr@fbc-psr-sprite-render:
    - shard-dg2-set2:     [SKIP][812] ([Intel XE#2136]) -> ([SKIP][813], [SKIP][814]) ([Intel XE#2136] / [Intel XE#2850] / [Intel XE#929]) +1 other test ( 2 skip )
   [812]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-render.html
   [813]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-render.html
   [814]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@kms_psr@fbc-psr-sprite-render.html

  * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
    - shard-dg2-set2:     [SKIP][815] ([Intel XE#2136]) -> [SKIP][816] ([Intel XE#2850] / [Intel XE#929]) +8 other tests skip
   [815]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html
   [816]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html

  * igt@kms_psr@fbc-psr2-primary-blt:
    - shard-dg2-set2:     [SKIP][817] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][818] ([Intel XE#2136]) +4 other tests skip
   [817]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-464/igt@kms_psr@fbc-psr2-primary-blt.html
   [818]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_psr@fbc-psr2-primary-blt.html

  * igt@kms_psr@pr-sprite-blt:
    - shard-dg2-set2:     [SKIP][819] ([Intel XE#2850] / [Intel XE#929]) -> ([SKIP][820], [SKIP][821]) ([Intel XE#2136] / [Intel XE#2850] / [Intel XE#929]) +6 other tests ( 2 skip )
   [819]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-464/igt@kms_psr@pr-sprite-blt.html
   [820]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_psr@pr-sprite-blt.html
   [821]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@kms_psr@pr-sprite-blt.html

  * igt@kms_psr@pr-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][822] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][823] ([Intel XE#2850] / [Intel XE#929])
   [822]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_psr@pr-sprite-plane-onoff.html
   [823]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_psr@pr-sprite-plane-onoff.html

  * igt@kms_psr@psr-cursor-plane-move:
    - shard-dg2-set2:     [SKIP][824] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][825] ([Intel XE#2351])
   [824]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-436/igt@kms_psr@psr-cursor-plane-move.html
   [825]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_psr@psr-cursor-plane-move.html

  * igt@kms_psr@psr-cursor-render:
    - shard-dg2-set2:     [SKIP][826] ([Intel XE#2136] / [Intel XE#2351]) -> ([SKIP][827], [SKIP][828]) ([Intel XE#2136] / [Intel XE#2351] / [Intel XE#2850] / [Intel XE#929])
   [826]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_psr@psr-cursor-render.html
   [827]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@kms_psr@psr-cursor-render.html
   [828]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_psr@psr-cursor-render.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-dg2-set2:     [SKIP][829] ([Intel XE#2850] / [Intel XE#929]) -> ([SKIP][830], [SKIP][831]) ([Intel XE#2351] / [Intel XE#2850] / [Intel XE#929])
   [829]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-464/igt@kms_psr@psr-primary-page-flip.html
   [830]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@kms_psr@psr-primary-page-flip.html
   [831]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr@psr2-primary-blt:
    - shard-dg2-set2:     [SKIP][832] ([Intel XE#2136] / [Intel XE#2351]) -> ([SKIP][833], [SKIP][834]) ([Intel XE#2850] / [Intel XE#929]) +1 other test ( 2 skip )
   [832]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_psr@psr2-primary-blt.html
   [833]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_psr@psr2-primary-blt.html
   [834]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@kms_psr@psr2-primary-blt.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg2-set2:     [SKIP][835] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][836] ([Intel XE#2939])
   [835]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [836]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-dg2-set2:     [SKIP][837] ([Intel XE#3414]) -> ([SKIP][838], [SKIP][839]) ([Intel XE#2423] / [Intel XE#3414] / [i915#2575]) +1 other test ( 2 skip )
   [837]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-434/igt@kms_rotation_crc@primary-rotation-90.html
   [838]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_rotation_crc@primary-rotation-90.html
   [839]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2-set2:     [SKIP][840] ([Intel XE#2423] / [i915#2575]) -> [SKIP][841] ([Intel XE#1127])
   [840]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [841]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-dg2-set2:     [SKIP][842] ([Intel XE#2423] / [i915#2575]) -> ([SKIP][843], [SKIP][844]) ([Intel XE#2423] / [Intel XE#3414] / [i915#2575])
   [842]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
   [843]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
   [844]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-dg2-set2:     [SKIP][845] ([Intel XE#3414]) -> [SKIP][846] ([Intel XE#2423] / [i915#2575])
   [845]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-433/igt@kms_rotation_crc@sprite-rotation-270.html
   [846]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][847] ([Intel XE#2426]) -> ([SKIP][848], [FAIL][849]) ([Intel XE#1729] / [Intel XE#2426])
   [847]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html
   [848]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html
   [849]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html
    - shard-dg2-set2:     [SKIP][850] ([Intel XE#2423] / [i915#2575]) -> ([FAIL][851], [SKIP][852]) ([Intel XE#1729] / [Intel XE#362])
   [850]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern.html
   [851]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html
   [852]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][853] ([Intel XE#2423] / [i915#2575]) -> [SKIP][854] ([Intel XE#362])
   [853]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [854]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [FAIL][855] ([Intel XE#899]) -> ([FAIL][856], [PASS][857]) ([Intel XE#899])
   [855]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [856]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-2/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [857]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@kms_vblank@accuracy-idle:
    - shard-dg2-set2:     [SKIP][858] ([Intel XE#2423] / [i915#2575]) -> ([SKIP][859], [PASS][860]) ([Intel XE#2423] / [i915#2575]) +22 other tests ( 1 pass, 1 skip )
   [858]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_vblank@accuracy-idle.html
   [859]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_vblank@accuracy-idle.html
   [860]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@kms_vblank@accuracy-idle.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-dg2-set2:     [DMESG-WARN][861] ([Intel XE#3468]) -> ([DMESG-WARN][862], [SKIP][863]) ([Intel XE#2423] / [Intel XE#3468] / [i915#2575])
   [861]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-434/igt@kms_vblank@ts-continuation-suspend.html
   [862]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@kms_vblank@ts-continuation-suspend.html
   [863]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vrr@cmrr:
    - shard-dg2-set2:     [SKIP][864] ([Intel XE#2423] / [i915#2575]) -> ([SKIP][865], [SKIP][866]) ([Intel XE#2168])
   [864]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_vrr@cmrr.html
   [865]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@kms_vrr@cmrr.html
   [866]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@lobf:
    - shard-dg2-set2:     [SKIP][867] ([Intel XE#2168]) -> ([SKIP][868], [SKIP][869]) ([Intel XE#2168] / [Intel XE#2423] / [i915#2575])
   [867]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-434/igt@kms_vrr@lobf.html
   [868]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@kms_vrr@lobf.html
   [869]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_vrr@lobf.html

  * igt@kms_writeback@writeback-check-output:
    - shard-dg2-set2:     [SKIP][870] ([Intel XE#2423] / [i915#2575]) -> ([SKIP][871], [SKIP][872]) ([Intel XE#756])
   [870]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_writeback@writeback-check-output.html
   [871]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_writeback@writeback-check-output.html
   [872]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-433/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2-set2:     [SKIP][873] ([Intel XE#2423] / [i915#2575]) -> ([SKIP][874], [SKIP][875]) ([Intel XE#2423] / [Intel XE#756] / [i915#2575])
   [873]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_writeback@writeback-fb-id.html
   [874]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@kms_writeback@writeback-fb-id.html
   [875]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-dg2-set2:     [SKIP][876] ([Intel XE#756]) -> [SKIP][877] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [876]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-433/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
   [877]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-dg2-set2:     [SKIP][878] ([Intel XE#756]) -> ([SKIP][879], [SKIP][880]) ([Intel XE#2423] / [Intel XE#756] / [i915#2575])
   [878]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-464/igt@kms_writeback@writeback-invalid-parameters.html
   [879]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_writeback@writeback-invalid-parameters.html
   [880]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-dg2-set2:     [SKIP][881] ([Intel XE#2423] / [i915#2575]) -> [SKIP][882] ([Intel XE#756])
   [881]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_writeback@writeback-pixel-formats.html
   [882]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_writeback@writeback-pixel-formats.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg2-set2:     [SKIP][883] ([Intel XE#2423] / [i915#2575]) -> [SKIP][884] ([Intel XE#1091] / [Intel XE#2849])
   [883]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [884]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_copy_basic@mem-copy-linear-0x3fff:
    - shard-dg2-set2:     [SKIP][885] ([Intel XE#1123]) -> ([SKIP][886], [SKIP][887]) ([Intel XE#1123] / [Intel XE#1130])
   [885]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
   [886]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
   [887]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@xe_copy_basic@mem-copy-linear-0x3fff.html

  * igt@xe_copy_basic@mem-set-linear-0x369:
    - shard-dg2-set2:     [SKIP][888] ([Intel XE#1130]) -> [SKIP][889] ([Intel XE#1126])
   [888]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0x369.html
   [889]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0x369.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-dg2-set2:     [SKIP][890] ([Intel XE#1130]) -> ([SKIP][891], [SKIP][892]) ([Intel XE#1126] / [Intel XE#1130])
   [890]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfd.html
   [891]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfd.html
   [892]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-dg2-set2:     [SKIP][893] ([Intel XE#1130]) -> [SKIP][894] ([Intel XE#944]) +1 other test skip
   [893]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@xe_create@multigpu-create-massive-size.html
   [894]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_eudebug@basic-vm-bind-extended-discovery:
    - shard-dg2-set2:     [SKIP][895] ([Intel XE#1130]) -> ([SKIP][896], [SKIP][897]) ([Intel XE#2905]) +6 other tests ( 2 skip )
   [895]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@xe_eudebug@basic-vm-bind-extended-discovery.html
   [896]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-433/igt@xe_eudebug@basic-vm-bind-extended-discovery.html
   [897]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@xe_eudebug@basic-vm-bind-extended-discovery.html

  * igt@xe_eudebug@sysfs-toggle:
    - shard-dg2-set2:     [SKIP][898] ([Intel XE#1130]) -> [SKIP][899] ([Intel XE#2905]) +5 other tests skip
   [898]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@xe_eudebug@sysfs-toggle.html
   [899]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@xe_eudebug@sysfs-toggle.html

  * igt@xe_eudebug_online@resume-dss:
    - shard-dg2-set2:     [SKIP][900] ([Intel XE#2905]) -> [SKIP][901] ([Intel XE#1130]) +7 other tests skip
   [900]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-433/igt@xe_eudebug_online@resume-dss.html
   [901]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@xe_eudebug_online@resume-dss.html

  * igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram:
    - shard-dg2-set2:     [SKIP][902] ([Intel XE#1130]) -> ([SKIP][903], [SKIP][904]) ([Intel XE#1130] / [Intel XE#2905]) +2 other tests ( 2 skip )
   [902]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram.html
   [903]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram.html
   [904]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - shard-dg2-set2:     [FAIL][905] ([Intel XE#1600]) -> ([FAIL][906], [PASS][907]) ([Intel XE#1600])
   [905]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-435/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [906]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [907]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][908] ([Intel XE#1473]) -> [DMESG-WARN][909] ([Intel XE#3468])
   [908]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-8/igt@xe_evict@evict-mixed-many-threads-small.html
   [909]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict@evict-threads-large:
    - shard-bmg:          [DMESG-WARN][910] ([Intel XE#3468]) -> ([DMESG-WARN][911], [INCOMPLETE][912]) ([Intel XE#1473] / [Intel XE#3468])
   [910]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-4/igt@xe_evict@evict-threads-large.html
   [911]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-1/igt@xe_evict@evict-threads-large.html
   [912]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-5/igt@xe_evict@evict-threads-large.html

  * igt@xe_exec_basic@many-bindexecqueue-userptr-rebind:
    - shard-bmg:          [DMESG-WARN][913] ([Intel XE#3468]) -> ([PASS][914], [DMESG-WARN][915]) ([Intel XE#3468]) +2 other tests ( 1 dmesg-warn, 1 pass )
   [913]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-5/igt@xe_exec_basic@many-bindexecqueue-userptr-rebind.html
   [914]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-2/igt@xe_exec_basic@many-bindexecqueue-userptr-rebind.html
   [915]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-3/igt@xe_exec_basic@many-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm:
    - shard-dg2-set2:     [SKIP][916] ([Intel XE#1130]) -> ([SKIP][917], [SKIP][918]) ([Intel XE#1130] / [Intel XE#288]) +5 other tests ( 2 skip )
   [916]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm.html
   [917]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm.html
   [918]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-imm:
    - shard-dg2-set2:     [SKIP][919] ([Intel XE#288]) -> [SKIP][920] ([Intel XE#1130]) +18 other tests skip
   [919]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-433/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html
   [920]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-rebind:
    - shard-dg2-set2:     [SKIP][921] ([Intel XE#1130]) -> ([SKIP][922], [SKIP][923]) ([Intel XE#288]) +9 other tests ( 2 skip )
   [921]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@xe_exec_fault_mode@once-bindexecqueue-rebind.html
   [922]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@xe_exec_fault_mode@once-bindexecqueue-rebind.html
   [923]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-433/igt@xe_exec_fault_mode@once-bindexecqueue-rebind.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch:
    - shard-bmg:          [DMESG-WARN][924] -> [DMESG-WARN][925] ([Intel XE#3468])
   [924]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-8/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch.html
   [925]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-5/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:
    - shard-dg2-set2:     [SKIP][926] ([Intel XE#288]) -> ([SKIP][927], [SKIP][928]) ([Intel XE#1130] / [Intel XE#288]) +18 other tests ( 2 skip )
   [926]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-463/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html
   [927]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-436/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html
   [928]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][929] ([Intel XE#1130]) -> [SKIP][930] ([Intel XE#288]) +19 other tests skip
   [929]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
   [930]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
    - shard-dg2-set2:     [SKIP][931] ([Intel XE#1130]) -> ([SKIP][932], [SKIP][933]) ([Intel XE#2360])
   [931]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html
   [932]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-433/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html
   [933]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-dg2-set2:     [SKIP][934] ([Intel XE#2360]) -> [SKIP][935] ([Intel XE#1130])
   [934]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-436/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
   [935]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
    - shard-dg2-set2:     [SKIP][936] ([Intel XE#2360]) -> ([SKIP][937], [SKIP][938]) ([Intel XE#1130] / [Intel XE#2360])
   [936]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-463/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html
   [937]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html
   [938]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-436/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html

  * igt@xe_exec_sip_eudebug@breakpoint-writesip:
    - shard-dg2-set2:     [SKIP][939] ([Intel XE#2905]) -> ([SKIP][940], [SKIP][941]) ([Intel XE#1130] / [Intel XE#2905]) +6 other tests ( 2 skip )
   [939]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-464/igt@xe_exec_sip_eudebug@breakpoint-writesip.html
   [940]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@xe_exec_sip_eudebug@breakpoint-writesip.html
   [941]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@xe_exec_sip_eudebug@breakpoint-writesip.html

  * igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:
    - shard-dg2-set2:     [DMESG-WARN][942] ([Intel XE#3467]) -> [SKIP][943] ([Intel XE#1130]) +2 other tests skip
   [942]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-464/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html
   [943]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:
    - shard-dg2-set2:     [SKIP][944] ([Intel XE#1130]) -> ([SKIP][945], [DMESG-WARN][946]) ([Intel XE#1130] / [Intel XE#3343]) +1 other test ( 1 dmesg-warn, 1 skip )
   [944]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html
   [945]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html
   [946]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:
    - shard-dg2-set2:     [DMESG-WARN][947] ([Intel XE#3343]) -> [SKIP][948] ([Intel XE#1130])
   [947]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-436/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html
   [948]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html

  * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create:
    - shard-dg2-set2:     [SKIP][949] ([Intel XE#1130]) -> ([DMESG-WARN][950], [DMESG-WARN][951]) ([Intel XE#3467]) +1 other test ( 2 dmesg-warn )
   [949]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html
   [950]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html
   [951]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html

  * igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind:
    - shard-dg2-set2:     [DMESG-WARN][952] ([Intel XE#3467]) -> ([SKIP][953], [DMESG-WARN][954]) ([Intel XE#1130] / [Intel XE#3467]) +2 other tests ( 1 dmesg-warn, 1 skip )
   [952]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-434/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html
   [953]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html
   [954]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     [SKIP][955] ([Intel XE#1130]) -> ([SKIP][956], [SKIP][957]) ([Intel XE#255])
   [955]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@xe_huc_copy@huc_copy.html
   [956]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-433/igt@xe_huc_copy@huc_copy.html
   [957]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@xe_huc_copy@huc_copy.html

  * igt@xe_intel_bb@simple-bb:
    - shard-dg2-set2:     [SKIP][958] ([Intel XE#1130]) -> ([SKIP][959], [PASS][960]) ([Intel XE#1130]) +32 other tests ( 1 pass, 1 skip )
   [958]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@xe_intel_bb@simple-bb.html
   [959]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@xe_intel_bb@simple-bb.html
   [960]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@xe_intel_bb@simple-bb.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-lnl:          [SKIP][961] ([Intel XE#1192] / [Intel XE#3026]) -> [SKIP][962] ([Intel XE#2833])
   [961]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-lnl-3/igt@xe_live_ktest@xe_eudebug.html
   [962]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-1/igt@xe_live_ktest@xe_eudebug.html

  * igt@xe_media_fill@media-fill:
    - shard-dg2-set2:     [SKIP][963] ([Intel XE#560]) -> [SKIP][964] ([Intel XE#1130])
   [963]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-436/igt@xe_media_fill@media-fill.html
   [964]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@xe_media_fill@media-fill.html

  * igt@xe_oa@buffer-fill:
    - shard-dg2-set2:     [SKIP][965] ([Intel XE#1130]) -> ([SKIP][966], [SKIP][967]) ([Intel XE#2541]) +3 other tests ( 2 skip )
   [965]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@xe_oa@buffer-fill.html
   [966]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@xe_oa@buffer-fill.html
   [967]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-433/igt@xe_oa@buffer-fill.html

  * igt@xe_oa@oa-regs-whitelisted:
    - shard-dg2-set2:     [SKIP][968] ([Intel XE#1130]) -> [SKIP][969] ([Intel XE#2541]) +3 other tests skip
   [968]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@xe_oa@oa-regs-whitelisted.html
   [969]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@xe_oa@oa-regs-whitelisted.html

  * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
    - shard-dg2-set2:     [SKIP][970] ([Intel XE#1130]) -> ([SKIP][971], [SKIP][972]) ([Intel XE#1130] / [Intel XE#2541]) +2 other tests ( 2 skip )
   [970]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html
   [971]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html
   [972]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html

  * igt@xe_oa@polling-small-buf:
    - shard-dg2-set2:     [SKIP][973] ([Intel XE#2541]) -> [SKIP][974] ([Intel XE#1130]) +3 other tests skip
   [973]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-464/igt@xe_oa@polling-small-buf.html
   [974]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@xe_oa@polling-small-buf.html

  * igt@xe_oa@privileged-forked-access-vaddr:
    - shard-dg2-set2:     [SKIP][975] ([Intel XE#2541]) -> ([SKIP][976], [SKIP][977]) ([Intel XE#1130] / [Intel XE#2541]) +5 other tests ( 2 skip )
   [975]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-463/igt@xe_oa@privileged-forked-access-vaddr.html
   [976]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@xe_oa@privileged-forked-access-vaddr.html
   [977]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-436/igt@xe_oa@privileged-forked-access-vaddr.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-dg2-set2:     [SKIP][978] ([Intel XE#1130]) -> [SKIP][979] ([Intel XE#1337])
   [978]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@xe_pat@display-vs-wb-transient.html
   [979]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-dg2-set2:     [SKIP][980] ([Intel XE#979]) -> ([SKIP][981], [SKIP][982]) ([Intel XE#1130] / [Intel XE#979])
   [980]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-463/igt@xe_pat@pat-index-xelpg.html
   [981]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-436/igt@xe_pat@pat-index-xelpg.html
   [982]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     [FAIL][983] ([Intel XE#1173]) -> [SKIP][984] ([Intel XE#1061])
   [983]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-436/igt@xe_peer2peer@read.html
   [984]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@xe_peer2peer@read.html

  * igt@xe_peer2peer@write:
    - shard-dg2-set2:     [SKIP][985] ([Intel XE#1061]) -> ([FAIL][986], [FAIL][987]) ([Intel XE#1173])
   [985]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@xe_peer2peer@write.html
   [986]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@xe_peer2peer@write.html
   [987]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-basic:
    - shard-dg2-set2:     [SKIP][988] ([Intel XE#1130]) -> [SKIP][989] ([Intel XE#2284] / [Intel XE#366])
   [988]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@xe_pm@d3cold-basic.html
   [989]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][990] ([Intel XE#1130]) -> ([SKIP][991], [SKIP][992]) ([Intel XE#2284] / [Intel XE#366]) +1 other test ( 2 skip )
   [990]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@xe_pm@d3cold-basic-exec.html
   [991]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-433/igt@xe_pm@d3cold-basic-exec.html
   [992]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     [SKIP][993] ([Intel XE#2284] / [Intel XE#366]) -> ([SKIP][994], [SKIP][995]) ([Intel XE#1130] / [Intel XE#2284] / [Intel XE#366])
   [993]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-434/igt@xe_pm@d3cold-mmap-vram.html
   [994]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@xe_pm@d3cold-mmap-vram.html
   [995]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@d3cold-mocs:
    - shard-dg2-set2:     [SKIP][996] ([Intel XE#1130]) -> [SKIP][997] ([Intel XE#2284])
   [996]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@xe_pm@d3cold-mocs.html
   [997]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@s3-basic-exec:
    - shard-dg2-set2:     [DMESG-WARN][998] ([Intel XE#569]) -> ([DMESG-WARN][999], [SKIP][1000]) ([Intel XE#1130] / [Intel XE#569])
   [998]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-464/igt@xe_pm@s3-basic-exec.html
   [999]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@xe_pm@s3-basic-exec.html
   [1000]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-dg2-set2:     [SKIP][1001] ([Intel XE#1130]) -> ([SKIP][1002], [DMESG-WARN][1003]) ([Intel XE#1130] / [Intel XE#569])
   [1001]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@xe_pm@s3-d3hot-basic-exec.html
   [1002]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@xe_pm@s3-d3hot-basic-exec.html
   [1003]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@xe_pm@s3-d3hot-basic-exec.html

  * igt@xe_pm@s4-exec-after:
    - shard-dg2-set2:     [DMESG-WARN][1004] ([Intel XE#3468]) -> [SKIP][1005] ([Intel XE#1130]) +1 other test skip
   [1004]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-436/igt@xe_pm@s4-exec-after.html
   [1005]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@xe_pm@s4-exec-after.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-dg2-set2:     [SKIP][1006] ([Intel XE#1130]) -> ([DMESG-WARN][1007], [DMESG-WARN][1008]) ([Intel XE#3468])
   [1006]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@xe_pm@s4-multiple-execs.html
   [1007]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@xe_pm@s4-multiple-execs.html
   [1008]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm_residency@gt-c6-freeze:
    - shard-dg2-set2:     [DMESG-WARN][1009] ([Intel XE#3088]) -> [SKIP][1010] ([Intel XE#1130])
   [1009]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-436/igt@xe_pm_residency@gt-c6-freeze.html
   [1010]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@xe_pm_residency@gt-c6-freeze.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-adlp:         [FAIL][1011] ([Intel XE#958]) -> ([PASS][1012], [FAIL][1013]) ([Intel XE#958])
   [1011]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-adlp-9/igt@xe_pm_residency@toggle-gt-c6.html
   [1012]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-adlp-8/igt@xe_pm_residency@toggle-gt-c6.html
   [1013]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-adlp-6/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_query@multigpu-query-config:
    - shard-dg2-set2:     [SKIP][1014] ([Intel XE#1130]) -> ([SKIP][1015], [SKIP][1016]) ([Intel XE#944]) +1 other test ( 2 skip )
   [1014]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@xe_query@multigpu-query-config.html
   [1015]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@xe_query@multigpu-query-config.html
   [1016]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-433/igt@xe_query@multigpu-query-config.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-dg2-set2:     [SKIP][1017] ([Intel XE#944]) -> [SKIP][1018] ([Intel XE#1130]) +1 other test skip
   [1017]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-464/igt@xe_query@multigpu-query-invalid-extension.html
   [1018]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-dg2-set2:     [SKIP][1019] ([Intel XE#944]) -> ([SKIP][1020], [SKIP][1021]) ([Intel XE#1130] / [Intel XE#944]) +2 other tests ( 2 skip )
   [1019]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-464/igt@xe_query@multigpu-query-mem-usage.html
   [1020]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@xe_query@multigpu-query-mem-usage.html
   [1021]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_query@multigpu-query-topology-l3-bank-mask:
    - shard-dg2-set2:     [SKIP][1022] ([Intel XE#1130]) -> ([SKIP][1023], [SKIP][1024]) ([Intel XE#1130] / [Intel XE#944])
   [1022]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@xe_query@multigpu-query-topology-l3-bank-mask.html
   [1023]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@xe_query@multigpu-query-topology-l3-bank-mask.html
   [1024]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@xe_query@multigpu-query-topology-l3-bank-mask.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-dg2-set2:     [SKIP][1025] ([Intel XE#1130]) -> [SKIP][1026] ([Intel XE#3342])
   [1025]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@xe_sriov_flr@flr-vf1-clear.html
   [1026]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@xe_sriov_flr@flr-vf1-clear.html

  * igt@xe_vm@large-split-misaligned-binds-67108864:
    - shard-dg2-set2:     [DMESG-WARN][1027] -> [SKIP][1028] ([Intel XE#1130]) +3 other tests skip
   [1027]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-464/igt@xe_vm@large-split-misaligned-binds-67108864.html
   [1028]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@xe_vm@large-split-misaligned-binds-67108864.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-dg2-set2:     [SKIP][1029] ([Intel XE#1130]) -> ([ABORT][1030], [ABORT][1031]) ([Intel XE#3075] / [Intel XE#3084])
   [1029]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@xe_wedged@wedged-mode-toggle.html
   [1030]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@xe_wedged@wedged-mode-toggle.html
   [1031]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@xe_wedged@wedged-mode-toggle.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

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
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
  [Intel XE#1694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#1909]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1909
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#2577]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2577
  [Intel XE#2596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#2998]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2998
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3026]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3026
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#3075]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3075
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084
  [Intel XE#3086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086
  [Intel XE#3088]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3088
  [Intel XE#3106]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3106
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3162
  [Intel XE#3184]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3331
  [Intel XE#3339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3339
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343
  [Intel XE#3371]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3371
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3440]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3440
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#3451]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3451
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3466
  [Intel XE#3467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467
  [Intel XE#3468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468
  [Intel XE#3477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3477
  [Intel XE#3486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3486
  [Intel XE#3490]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3490
  [Intel XE#3499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3499
  [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#736]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/736
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * Linux: xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f -> xe-pw-139512v6

  IGT_8114: 8114
  xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f: 57639ceec0f66f06f4a8a8ac3b9551b7b493c33f
  xe-pw-139512v6: 139512v6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/index.html

--===============7494115288620469004==
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
<tr><td><b>Series:</b></td><td>drm/i915/psr: Implement WA to help reach PC1=
0 (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/139512/">https://patchwork.freedesktop.org/series/139512/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-139512v6/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-139512v6/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b=
493c33f_full -&gt; xe-pw-139512v6_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-139512v6_full absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-139512v6_full, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1395=
12v6_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-adlp-2/igt@kms_big=
_fb@linear-8bpp-rotate-0.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-adlp-4/igt@kms_big_fb@linear-=
8bpp-rotate-0.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-139512v6/shard-adlp-3/igt@kms_big_fb@linear-8bpp-rotate-0.htm=
l">DMESG-WARN</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4=
-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-lnl-6/igt@kms_ccs@=
crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-a-edp-1.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-l=
nl-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-a-edp-1.html=
">DMESG-WARN</a> +20 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-2/igt@kms_curs=
or_crc@cursor-suspend.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-6/igt@kms_cursor_crc@cursor-=
suspend.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-139512v6/shard-bmg-7/igt@kms_cursor_crc@cursor-suspend.html">PASS</=
a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-move@pipe-a:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-lnl-5/igt@kms_curs=
or_legacy@torture-move@pipe-a.html">PASS</a> -&gt; (<a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-7/igt@kms_cursor_leg=
acy@torture-move@pipe-a.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-2/igt@kms_cursor_legacy@to=
rture-move@pipe-a.html">PASS</a>) +4 other tests ( 1 dmesg-warn, 1 pass )</=
li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-wc@xrgb2101010-4tiled:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139512v6/shard-bmg-1/igt@kms_draw_crc@draw-method-mmap=
-wc@xrgb2101010-4tiled.html">DMESG-FAIL</a> +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@kms_flip@basic-flip-vs-mod=
eset@a-hdmi-a6.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-139512v6/shard-dg2-463/igt@kms_flip@basic-flip-vs-modeset@a-=
hdmi-a6.html">DMESG-WARN</a>) +1 other test ( 1 dmesg-warn, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-4/igt@kms_hdr@=
static-swap@pipe-a-dp-2.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-5/igt@kms_hdr@static-swap@=
pipe-a-dp-2.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-139512v6/shard-bmg-1/igt@kms_hdr@static-swap@pipe-a-dp-2.html">=
DMESG-WARN</a>) +2 other tests ( 1 dmesg-warn, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-c-dp-2-size-128:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-1/igt@kms_plan=
e_cursor@primary@pipe-c-dp-2-size-128.html">PASS</a> -&gt; (<a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-2/igt@kms_pl=
ane_cursor@primary@pipe-c-dp-2-size-128.html">INCOMPLETE</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-3/igt@kms_=
plane_cursor@primary@pipe-c-dp-2-size-128.html">PASS</a>) +1 other test ( 1=
 incomplete, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-render@edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-lnl-6/igt@kms_psr@=
fbc-psr2-cursor-render@edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-5/igt@kms_psr@fbc-psr2=
-cursor-render@edp-1.html">FAIL</a> +21 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-lnl-5/igt@kms_psr@=
psr2-sprite-plane-onoff.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-7/igt@kms_psr@psr2-sprite-=
plane-onoff.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-139512v6/shard-lnl-4/igt@kms_psr@psr2-sprite-plane-onoff.html">=
FAIL</a>) +17 other tests ( 2 fail )</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-lnl-7/igt@kms_psr_=
stress_test@flip-primary-invalidate-overlay.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-3/igt@k=
ms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@unload:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@xe_mod=
ule_load@unload.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@xe_module_load@unload.html"=
>DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-lnl-5/igt@xe_pm@s4=
-multiple-execs.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-139512v6/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html=
">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139=
512v6/shard-lnl-7/igt@xe_pm@s4-multiple-execs.html">DMESG-WARN</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#135=
8</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607=
">Intel XE#1607</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-binds-2147483648:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-5/igt@xe_vm@la=
rge-split-binds-2147483648.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-2/igt@xe_vm@large-split-=
binds-2147483648.html">DMESG-WARN</a> +9 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_vm@shared-pde2-page:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139512v6/shard-bmg-4/igt@xe_vm@shared-pde2-page.html">=
DMESG-WARN</a> +6 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunplug-rescan:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-2/igt@core_hot=
unplug@hotunplug-rescan.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-6/ig=
t@core_hotunplug@hotunplug-rescan.html">INCOMPLETE</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-4/igt@core_hotun=
plug@hotunplug-rescan.html">INCOMPLETE</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_cc=
s@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#=
2351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
139512v6/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.=
html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-436/igt@kms_cc=
s@crc-primary-suspend-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3442">Intel XE#3442</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2=
-466/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_cc=
s@crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP</a> -&gt; (<a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@k=
ms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@km=
s_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE=
#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-wc@rgb565-4tiled:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-4/igt@kms_draw=
_crc@draw-method-mmap-wc@rgb565-4tiled.html">INCOMPLETE</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -=
&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/s=
hard-bmg-5/igt@kms_draw_crc@draw-method-mmap-wc@rgb565-4tiled.html">INCOMPL=
ETE</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v=
6/shard-bmg-1/igt@kms_draw_crc@draw-method-mmap-wc@rgb565-4tiled.html">DMES=
G-FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-1/igt@kms_hdr@=
static-toggle-suspend@pipe-a-hdmi-a-3.html">DMESG-WARN</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/sha=
rd-bmg-1/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3.html">INCOMPLETE=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-lnl-3/igt@kms_psr@=
fbc-psr2-sprite-plane-move.html">DMESG-WARN</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-1/igt@kms_psr@fbc-=
psr2-sprite-plane-move.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@xe_exe=
c_basic@multigpu-once-basic-defer-bind.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; (=
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-d=
g2-435/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html">DMESG-WARN</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shar=
d-dg2-463/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html">DMESG-WARN=
</a>) +1 other test ( 2 dmesg-warn )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@xe_exe=
c_threads@threads-bal-mixed-shared-vm-userptr-invalidate.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE=
#1130</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-139512v6/shard-dg2-434/igt@xe_exec_threads@threads-bal-mixed-shared-vm-us=
erptr-invalidate.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@xe_exec_threads@threads-b=
al-mixed-shared-vm-userptr-invalidate.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@shared-pde2-page:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-464/igt@xe_vm@=
shared-pde2-page.html">DMESG-WARN</a> -&gt; (<a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@xe_vm@shared-pde2-p=
age.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-139512v6/shard-dg2-434/igt@xe_vm@shared-pde2-page.html">DMESG-WARN</a>)=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Inte=
l XE#1130</a>)</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run}:<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-lnl-7/igt@xe_fault=
_injection@vm-bind-fail-xe_pt_update_ops_run.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3499">Intel XE#3499</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/sh=
ard-lnl-3/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html">AB=
ORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-139512v6_full that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_getclient:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-464/igt@core_g=
etclient.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-139512v6/shard-dg2-434/igt@core_getclient.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2=
-466/igt@core_getclient.html">SKIP</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@core_getversion@basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-433/igt@core_g=
etversion@basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@core_getversion@basic.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
440">Intel XE#3440</a>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotrebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-463/igt@core_h=
otunplug@hotrebind.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@core_hotunplug@hotrebin=
d.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-139512v6/shard-dg2-436/igt@core_hotunplug@hotrebind.html">PASS</a>) (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1=
885</a>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-436/igt@core_h=
otunplug@hotreplug.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@core_hotunplug@hotreplug=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1885">Intel XE#1885</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@pan:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-463/igt@fbdev@=
pan.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-139512v6/shard-dg2-436/igt@fbdev@pan.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@f=
bdev@pan.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@unaligned-read:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@fbdev@unaligned-read.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/21=
34">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-433/igt@fbdev@=
write.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-139512v6/shard-dg2-466/igt@fbdev@write.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-adlp-8/igt@kms_asy=
nc_flips@invalid-async-flip.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-adlp-1/igt@kms_async_flips@=
invalid-async-flip.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +1 other test dmesg-w=
arn</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_async_flips@test-curso=
r.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-139512v6/shard-dg2-434/igt@kms_async_flips@test-cursor.html">PASS</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel X=
E#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/2575">i915#2575</a>) +1 other test ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@crtc-invalid-params-fence@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-5/igt@kms_atom=
ic@crtc-invalid-params-fence@pipe-a-dp-2.html">PASS</a> -&gt; (<a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-2/igt@kms=
_atomic@crtc-invalid-params-fence@pipe-a-dp-2.html">DMESG-WARN</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-3/ig=
t@kms_atomic@crtc-invalid-params-fence@pipe-a-dp-2.html">DMESG-WARN</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel X=
E#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139512v6/shard-bmg-2/igt@kms_big_fb@4-tiled-64bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-lnl-6/igt@kms_big_=
fb@4-tiled-8bpp-rotate-0.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-4/igt@kms_big_fb@4-tiled-8=
bpp-rotate-0.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3466">Intel XE#3466</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@kms_big_fb@x-tiled-64bpp-r=
otate-90.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-139512v6/shard-dg2-434/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-adlp-4/igt@kms_big=
_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">PASS</a> -&=
gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/sh=
ard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-=
flip.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-139512v6/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotat=
e-0-hflip-async-flip.html">DMESG-FAIL</a>) (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_big_fb@y-tiled-8bpp-ro=
tate-90.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-139512v6/shard-dg2-434/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html">=
SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
124">Intel XE#1124</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-=
stride-32bpp-rotate-0.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-=
stride-32bpp-rotate-0.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139512v6/shard-bmg-1/igt@kms_big_fb@yf-tiled-64bpp-rot=
ate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_bw@connected-linear-ti=
ling-1-displays-2160x1440p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@kms_bw@connected-line=
ar-tiling-1-displays-2160x1440p.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i9=
15#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139512v6/shard-bmg-2/igt@kms_bw@linear-tiling-3-displa=
ys-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_ccs@bad-rotation-90-4-t=
iled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +9 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_ccs@crc-primary-basic-=
y-tiled-gen12-rc-ccs@pipe-d-dp-4.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@kms_ccs@crc-pri=
mary-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#=
787</a>) +10 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139512v6/shard-bmg-3/igt@kms_ccs@crc-primary-basic-yf-=
tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@kms_ccs@crc-primary-suspen=
d-y-tiled-gen12-mc-ccs@pipe-b-dp-4.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@kms_ccs@crc-p=
rimary-suspend-y-tiled-gen12-mc-ccs@pipe-b-dp-4.html">SKIP</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)=
 +69 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-=
basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@kms_ccs@crc-sprite-p=
lanes-basic-4-tiled-dg2-rc-ccs-cc.html">FAIL</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-=
6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-b=
asic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +7 ot=
her tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-=
6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-b=
asic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +104 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-=
4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +14 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-434/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE=
#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-434/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg=
2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1195">Intel XE#1195</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@kms_cdclk@mode-transition@=
pipe-d-dp-4.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-139512v6/shard-dg2-434/igt@kms_cdclk@mode-transition@pipe-d-dp-=
4.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/314">Intel XE#314</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139512v6/shard-bmg-3/igt@kms_chamelium_edid@dp-edid-re=
solution-list.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2252">Intel XE#2252</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@kms_chamelium_hpd@dp-hpd.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
39512v6/shard-dg2-463/igt@kms_chamelium_hpd@dp-hpd.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-2/igt@kms_colo=
r@ctm-0-75@pipe-b-hdmi-a-3.html">PASS</a> -&gt; (<a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-7/igt@kms_color@ctm-0-7=
5@pipe-b-hdmi-a-3.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-139512v6/shard-bmg-6/igt@kms_color@ctm-0-75@pipe-b-hdmi-a=
-3.html">DMESG-WARN</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/877">Intel XE#877</a>) +1 other test ( 1 dmesg-warn, 1 pass )=
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-139512v6/shard-dg2-433/igt@kms_content_protection@ato=
mic@pipe-a-dp-4.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_content_protection@atomic@pi=
pe-a-dp-4.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@kms_content_protection@lega=
cy@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_content_protection@lic=
-type-0@pipe-a-dp-4.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@kms_content_protection@lic-t=
ype-0@pipe-a-dp-4.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-64x64@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139512v6/shard-bmg-1/igt@kms_cursor_crc@cursor-offscre=
en-64x64@pipe-d-dp-2.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-max-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139512v6/shard-bmg-3/igt@kms_cursor_crc@cursor-offscre=
en-max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x128@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-6/igt@kms_curs=
or_crc@cursor-random-128x128@pipe-a-dp-2.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-4/igt@kms_=
cursor_crc@cursor-random-128x128@pipe-a-dp-2.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</=
a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x64:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_cursor_crc@cursor-slidi=
ng-64x64.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +38 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139512v6/shard-bmg-2/igt@kms_cursor_legacy@basic-busy-=
flip-before-cursor-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-433/igt@kms_cu=
rsor_legacy@cursor-vs-flip-atomic-transitions.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/=
igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#=
2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/2575">i915#2575</a>) +57 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@fill-fb:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-436/igt@kms_dr=
aw_crc@fill-fb.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_draw_crc@fill-fb.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/213=
6">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2351">Intel XE#2351</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-1x:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-adlp-8/igt@kms_fea=
ture_discovery@display-1x.html">PASS</a> -&gt; (<a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-adlp-2/igt@kms_feature_disco=
very@display-1x.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-139512v6/shard-adlp-6/igt@kms_feature_discovery@displ=
ay-1x.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3086">Intel XE#3086</a>) +2 other tests ( 1 dmesg-warn, 1 pass )=
</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139512v6/shard-bmg-1/igt@kms_feature_discovery@dp-mst.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2375">Intel XE#2375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-434/igt@kms_fl=
ip@2x-flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; (<a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt=
@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/=
igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#24=
23</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301=
">Intel XE#301</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-2/igt@kms_flip=
@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">PASS</a> -&gt=
; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shar=
d-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3=
.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-139512v6/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@=
bd-dp2-hdmi-a3.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3486">Intel XE#3486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-434/igt@kms_fl=
ip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/sha=
rd-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-=
dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3321">Intel XE#3321</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3486">Intel XE#3486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-434/igt@kms_fl=
ip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/sha=
rd-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-=
dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/301">Intel XE#301</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@busy-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-463/igt@kms_fl=
ip@busy-flip.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-139512v6/shard-dg2-436/igt@kms_flip@busy-flip.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/s=
hard-dg2-466/igt@kms_flip@busy-flip.html">SKIP</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575=
</a>) +54 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-lnl-7/igt@kms_flip=
@flip-vs-absolute-wf_vblank-interruptible.html">PASS</a> -&gt; (<a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-7/igt@km=
s_flip@flip-vs-absolute-wf_vblank-interruptible.html">FAIL</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-4/igt@km=
s_flip@flip-vs-absolute-wf_vblank-interruptible.html">PASS</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>)=
 +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-1/igt@kms_flip=
@plain-flip-ts-check.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-1/igt@kms_flip@plain-flip-ts-c=
heck.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2882">Intel XE#2882</a>) +1 other test fail</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-434/igt@kms_fl=
ip@plain-flip-ts-check.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-433/igt@kms_flip@plain-flip-=
ts-check.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/886">Intel XE#886</a>)</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-lnl-2/igt@kms_flip=
@plain-flip-ts-check.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-2/igt@kms_flip@plain-flip-ts-c=
heck.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3149">Intel XE#3149</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/886">Intel XE#886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-434/igt@kms_fl=
ip@plain-flip-ts-check@a-hdmi-a6.html">PASS</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-433/igt@kms_flip@p=
lain-flip-ts-check@a-hdmi-a6.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3477">Intel XE#3477</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-lnl-2/igt@kms_flip=
@plain-flip-ts-check@c-edp1.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-2/igt@kms_flip@plain-fl=
ip-ts-check@c-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/886">Intel XE#886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64=
bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#45=
5</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling=
@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_flip_scaled_crc@flip-6=
4bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode.html">SKIP</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard=
-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downs=
caling@pipe-a-valid-mode.html">SKIP</a>) (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests ( 2 ski=
p )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-139512v6/shard-bmg-1/igt@kms_frontbuffer_tracking@drr=
s-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-5/igt@kms_frontbuffer_t=
racking@drrs-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +=
1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@kms_frontbuffer_tracking@d=
rrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@kms_frontbu=
ffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651<=
/a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139512v6/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-=
1p-primscrn-cur-indfb-draw-blt.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-433/igt@kms_fr=
ontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-4=
66/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">In=
tel XE#2136</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-463/igt@kms_fr=
ontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html">PASS</a> -&g=
t; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/sha=
rd-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-rend=
er.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-139512v6/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-=
indfb-draw-render.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +16 other tests ( 1 pass, 1=
 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-rte:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139512v6/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-=
2p-rte.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3468">Intel XE#3468</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html">PASS</a> -&gt; =
(<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-=
dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139=
512v6/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-=
draw-blt.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +8 other tests ( 1 pas=
s, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139512v6/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-=
tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2352">Intel XE#2352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:<=
/p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_frontbuffer_tracking@fb=
cdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +44 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:<=
/p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@kms_frontbuffer_tracking@f=
bcdrrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_fro=
ntbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a>)=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Inte=
l XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139512v6/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +9 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@kms_frontbuffer_tracking@f=
bcdrrs-tiling-y.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs=
-tiling-y.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-139512v6/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc=
psr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-5/igt@kms_frontbu=
ffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE=
#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@kms_frontbuffer_tracking@f=
bcpsr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_frontbuff=
er_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Int=
el XE#653</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@kms_frontbuffer_tracking@f=
bcpsr-2p-primscrn-spr-indfb-onoff.html">SKIP</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@kms_frontbuffe=
r_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html">SKIP</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +=
1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139512v6/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-=
2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +7 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-2/igt@kms_hdr@=
invalid-hdr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-139512v6/shard-bmg-1/igt@kms_hdr@invalid-hdr.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Int=
el XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-4/igt@kms_hdr@=
static-swap.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-139512v6/shard-bmg-1/igt@kms_hdr@static-swap.html">DMESG-=
WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512=
v6/shard-bmg-5/igt@kms_hdr@static-swap.html">PASS</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +3 oth=
er tests ( 1 dmesg-warn, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@kms_joiner@invalid-modeset=
-ultra-joiner.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-139512v6/shard-dg2-463/igt@kms_joiner@invalid-modeset-ultra-j=
oiner.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-unleased-connector:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-adlp-6/igt@kms_lea=
se@lease-unleased-connector.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-adlp-1/igt@kms_lease@lease-=
unleased-connector.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) +6 other tests dmesg-=
warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-mid@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-8/igt@kms_plan=
e_alpha_blend@constant-alpha-mid@pipe-a-dp-2.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-3/ig=
t@kms_plane_alpha_blend@constant-alpha-mid@pipe-a-dp-2.html">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Inte=
l XE#3468</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@kms_plane_scaling@planes-do=
wnscale-factor-0-25-upscale-20x20@pipe-b.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@kms_plane_scaling@planes-do=
wnscale-factor-0-25-upscale-20x20@pipe-d.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#45=
5</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@p=
ipe-c:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_plane_scaling@planes-d=
ownscale-factor-0-25-upscale-factor-0-25@pipe-c.html">SKIP</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@=
kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c.h=
tml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2763">Intel XE#2763</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@p=
ipe-d:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@kms_plane_scaling@planes-d=
ownscale-factor-0-25-upscale-factor-0-25@pipe-d.html">SKIP</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@=
kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.h=
tml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2763">Intel XE#2763</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139512v6/shard-bmg-2/igt@kms_plane_scaling@planes-upsc=
ale-factor-0-25-downscale-factor-0-75.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +4 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-lnl-3/igt@kms_pm_d=
c@deep-pkgc.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-139512v6/shard-lnl-8/igt@kms_pm_dc@deep-pkgc.html">FAIL</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/sha=
rd-lnl-1/igt@kms_pm_dc@deep-pkgc.html">FAIL</a>) (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2029">Intel XE#2029</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-436/igt@kms_pm=
_rpm@dpms-mode-unset-lpsp.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_pm_rpm@dpms-m=
ode-unset-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2446">Intel XE#2446</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-stress-extra-wait:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_pm_rpm@modeset-stress-e=
xtra-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2446">Intel XE#2446</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-434/igt@kms_pm=
_rpm@system-suspend-modeset.html">PASS</a> -&gt; (<a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@kms_pm_rpm@sys=
tem-suspend-modeset.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_pm_rpm@system-suspend-mo=
deset.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2446">Intel XE#2446</a>) +1 other test ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:</=
p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-lnl-3/igt@kms_psr2=
_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html">PASS</a> -&=
gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/sh=
ard-lnl-8/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-full=
y-sf.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-139512v6/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-contin=
uous-exceed-fully-sf.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +8 other tests ( 2 skip =
)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139512v6/shard-bmg-3/igt@kms_psr2_sf@psr2-cursor-plane=
-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-lnl-7/igt@kms_psr2=
_sf@psr2-overlay-primary-update-sf-dmg-area.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-3/igt@k=
ms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489=
</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-page-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139512v6/shard-bmg-2/igt@kms_psr@fbc-psr-primary-page-=
flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-blt@edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-lnl-2/igt@kms_psr@=
fbc-psr2-primary-blt@edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-2/igt@kms_psr@fbc-psr2-p=
rimary-blt@edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3490">Intel XE#3490</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-lnl-8/igt@kms_psr@=
fbc-psr2-primary-render.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-8/igt@kms_psr@fbc-psr2-pri=
mary-render.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-139512v6/shard-lnl-4/igt@kms_psr@fbc-psr2-primary-render.html">=
FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
331">Intel XE#3331</a>) +1 other test ( 2 fail )</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-pl=
ane-onoff.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-139512v6/shard-dg2-463/igt@kms_psr@fbc-psr2-sprite-plane-onoff.ht=
ml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/929">Intel XE#929</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-blt@edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-lnl-2/igt@kms_psr@=
psr2-cursor-blt@edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-3/igt@kms_psr@psr2-cursor-blt=
@edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3331">Intel XE#3331</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-lnl-4/igt@kms_psr@=
psr2-sprite-blt.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-139512v6/shard-lnl-6/igt@kms_psr@psr2-sprite-blt.html=
">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1395=
12v6/shard-lnl-1/igt@kms_psr@psr2-sprite-blt.html">FAIL</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/3490">Intel XE#3490</a>) =
+1 other test ( 2 fail )</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139512v6/shard-bmg-2/igt@kms_rotation_crc@primary-rota=
tion-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3414">Intel XE#3414</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_setmode@basic-clone-si=
ngle-crtc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-139512v6/shard-dg2-434/igt@kms_setmode@basic-clone-single-crtc.ht=
ml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-lnl-8/igt@kms_setm=
ode@basic@pipe-b-edp-1.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-8/igt@kms_setmode@basic@pip=
e-b-edp-1.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-139512v6/shard-lnl-4/igt@kms_setmode@basic@pipe-b-edp-1.html">PAS=
S</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883=
">Intel XE#2883</a>) +2 other tests ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-lnl-6/igt@kms_univ=
ersal_plane@cursor-fb-leak@pipe-c-edp-1.html">PASS</a> -&gt; (<a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-2/igt@kms_=
universal_plane@cursor-fb-leak@pipe-c-edp-1.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-4/igt@kms_un=
iversal_plane@cursor-fb-leak@pipe-c-edp-1.html">FAIL</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@breakpoint-many-sessions-tiles:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@xe_eudebug_online@breakpoi=
nt-many-sessions-tiles.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@xe_eudebug_online@breakpo=
int-many-sessions-tiles.html">SKIP</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test ( 2 ski=
p )</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139512v6/shard-bmg-1/igt@xe_eudebug_online@set-breakpo=
int.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@xe_evict@evict-beng-mixed-=
many-threads-large.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@xe_evict@evict-beng-mixed-man=
y-threads-large.html">INCOMPLETE</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-8/igt@xe_evict=
@evict-beng-threads-large.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-5/igt@xe_evict@evict-beng=
-threads-large.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-virtual-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-464/igt@xe_exe=
c_balancer@twice-virtual-basic.html">PASS</a> -&gt; (<a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@xe_exec_bal=
ancer@twice-virtual-basic.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@xe_exec_balancer@twice=
-virtual-basic.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1130">Intel XE#1130</a>) +99 other tests ( 1 pass, 1 sk=
ip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139512v6/shard-bmg-2/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-basic-defer-mmap.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +2 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-invalidate-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-139512v6/shard-bmg-5/igt@xe_exec_basic@multigpu-many-=
execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html">SKIP</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg=
-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-invalidate-race.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2322">Intel XE#2322</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@xe_exec_fault_mode@many-ex=
ecqueues-bindexecqueue-imm.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@xe_exec_fault_mode@ma=
ny-execqueues-bindexecqueue-imm.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@xe_exec_mix_modes@exec-simp=
le-batch-store-lr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +64 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cat-error:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-adlp-3/igt@xe_exec=
_reset@cat-error.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-139512v6/shard-adlp-9/igt@xe_exec_reset@cat-error.ht=
ml">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-139512v6/shard-adlp-1/igt@xe_exec_reset@cat-error.html">DMESG-WARN</a>)=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel=
 XE#358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-lnl-5/igt@xe_exec_=
threads@threads-bal-mixed-shared-vm-userptr-invalidate.html">PASS</a> -&gt;=
 (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard=
-lnl-4/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
39512v6/shard-lnl-7/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr=
-invalidate.html">DMESG-WARN</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3371">Intel XE#3371</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@xe_exec_threads@threads-ba=
l-userptr-rebind.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@xe_exec_threads@threads-bal-use=
rptr-rebind.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test ( 1 pass, 1 skip )<=
/li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-2/igt@xe_exec_=
threads@threads-mixed-shared-vm-userptr-invalidate.html">PASS</a> -&gt; (<a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg=
-6/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/=
shard-bmg-4/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate.=
html">DMESG-FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3371">Intel XE#3371</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@xe_fault_injection@inject-=
fault-probe-function-xe_guc_log_init.html">DMESG-WARN</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@xe_fa=
ult_injection@inject-fault-probe-function-xe_guc_log_init.html">DMESG-WARN<=
/a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">=
Intel XE#3343</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139512v6/shard-bmg-3/igt@xe_fault_injection@inject-fau=
lt-probe-function-xe_guc_relay_init.html">DMESG-WARN</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139512v6/shard-bmg-3/igt@xe_media_fill@media-fill.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2459">Intel XE#2459</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2596">Intel XE#2596</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@xe_module_load@reload-no-di=
splay.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@enable-disable@rcs-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139512v6/shard-lnl-8/igt@xe_oa@enable-disable@rcs-0.ht=
ml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3466">Intel XE#3466</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@xe_peer2peer@write@write-g=
pua-vram01-gpub-system-p2p.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@xe_peer2peer@write@wr=
ite-gpua-vram01-gpub-system-p2p.html">FAIL</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@xe_pm@d3hot-basic-exec.htm=
l">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-139512v6/shard-dg2-434/igt@xe_pm@d3hot-basic-exec.html">DMESG-WARN</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel=
 XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-exec-after:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-433/igt@xe_pm@=
s2idle-exec-after.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@xe_pm@s2idle-exec-after.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1130">Intel XE#1130</a>) +108 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-unbind-all:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-434/igt@xe_pm@=
s2idle-vm-bind-unbind-all.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@xe_pm@s2idle-vm-b=
ind-unbind-all.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1694">Intel XE#1694</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-adlp-2/igt@xe_pm@s=
4-multiple-execs.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-139512v6/shard-adlp-2/igt@xe_pm@s4-multiple-execs.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-13=
9512v6/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html">ABORT</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607"=
>Intel XE#1607</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-lnl-6/igt@xe_pm@s4=
-vm-bind-prefetch.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-139512v6/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.=
html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-139512v6/shard-lnl-4/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#160=
7</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794=
">Intel XE#1794</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_getversion@all-cards:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@core_g=
etversion@all-cards.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3440">Intel XE#3440</a>) -&gt; (<a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@core_get=
version@all-cards.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@core_getversion@all-cards.html=
">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@core_s=
etmaster@master-drop-set-user.html">FAIL</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3339">Intel XE#3339</a>) -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-433/=
igt@core_setmaster@master-drop-set-user.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@core_set=
master@master-drop-set-user.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@fbdev@=
info.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2134">Intel XE#2134</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@fbdev@info.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/sha=
rd-dg2-435/igt@fbdev@info.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@fbdev@=
read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2134">Intel XE#2134</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@fbdev@read.html">PASS</a=
> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_3d:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_3d=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2423">Intel XE#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@kms_3d.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-invalid-params-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_at=
omic@plane-invalid-params-fence.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/s=
hard-dg2-435/igt@kms_atomic@plane-invalid-params-fence.html">PASS</a> +57 o=
ther tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-adlp-1/igt@kms_ato=
mic_transition@plane-toggle-modeset-transition.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/=
shard-adlp-6/igt@kms_atomic_transition@plane-toggle-modeset-transition.html=
">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-6/igt@kms_colo=
r@degamma@pipe-a-dp-2.html">DMESG-WARN</a> -&gt; (<a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-7/igt@kms_color@degamm=
a@pipe-a-dp-2.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-139512v6/shard-bmg-3/igt@kms_color@degamma@pipe-a-dp-2.html">=
PASS</a>) +8 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@64x64-top-edge:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-lnl-3/igt@kms_curs=
or_edge_walk@64x64-top-edge.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2577">Intel XE#2577</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3106">Intel XE#3106</a>) -&gt=
; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shar=
d-lnl-1/igt@kms_cursor_edge_walk@64x64-top-edge.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-8/igt@km=
s_cursor_edge_walk@64x64-top-edge.html">PASS</a>) +1 other test ( 2 pass )<=
/li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-6/igt@kms_curs=
or_legacy@flip-vs-cursor-atomic.html">DMESG-FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; (<=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bm=
g-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-3/igt@km=
s_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a>) +10 other tests ( 2 p=
ass )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-8/igt@kms_curs=
or_legacy@nonblocking-modeset-vs-cursor-atomic.html">DMESG-WARN</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bm=
g-3/igt@kms_cursor_legacy@nonblocking-modeset-vs-cursor-atomic.html">PASS</=
a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-bo@pipe-a:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-434/igt@kms_cu=
rsor_legacy@torture-bo@pipe-a.html">DMESG-WARN</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3184">Intel XE#3184</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-4=
64/igt@kms_cursor_legacy@torture-bo@pipe-a.html">PASS</a> +2 other tests pa=
ss</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-2/igt@kms_flip=
@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#=
2882</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-139512v6/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@=
ab-dp2-hdmi-a3.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-139512v6/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-=
interruptible@ab-dp2-hdmi-a3.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-6/igt@kms_flip=
@2x-plain-flip-fb-recreate-interruptible.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-=
bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">PASS</a> +=
6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-lnl-3/igt@kms_flip=
@flip-vs-absolute-wf_vblank.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; (<a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-8/igt@kms_=
flip@flip-vs-absolute-wf_vblank.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-1/igt@kms_flip@flip-vs-a=
bsolute-wf_vblank.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-adlp-8/igt@kms_fli=
p@flip-vs-suspend@b-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6=
/shard-adlp-4/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">PASS</a> +1 othe=
r test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-6/igt@kms_flip=
@flip-vs-suspend@c-dp2.html">DMESG-WARN</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3451">Intel XE#3451</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-4/igt@km=
s_flip@flip-vs-suspend@c-dp2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_fl=
ip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel X=
E#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2351">Intel XE#2351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-x=
tile-to-32bpp-xtile-downscaling.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_=
frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#21=
36</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
39512v6/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indf=
b-draw-blt.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-1p-prims=
crn-pri-indfb-draw-blt.html">PASS</a>) +14 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE=
#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-139512v6/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-in=
dfb-draw-render.html">PASS</a> +15 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351"=
>Intel XE#2351</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-prims=
crn-spr-indfb-onoff.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc=
-2p-primscrn-spr-indfb-onoff.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-433/igt@kms_hd=
r@invalid-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@kms_hdr@invalid-h=
dr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@planar-pixel-format-settings:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-adlp-9/igt@kms_pla=
ne@planar-pixel-format-settings.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-adl=
p-8/igt@kms_plane@planar-pixel-format-settings.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-7efc@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-6/igt@kms_plan=
e_alpha_blend@alpha-7efc@pipe-a-dp-2.html">DMESG-FAIL</a> -&gt; (<a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-3/igt@k=
ms_plane_alpha_blend@alpha-7efc@pipe-a-dp-2.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-7/igt@kms_pl=
ane_alpha_blend@alpha-7efc@pipe-a-dp-2.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_pl=
ane_scaling@plane-upscale-factor-0-25-with-modifiers.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#242=
3</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
2575">i915#2575</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-139512v6/shard-dg2-463/igt@kms_plane_scaling@plane-upscale-fact=
or-0-25-with-modifiers.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_plane_scaling@plane-u=
pscale-factor-0-25-with-modifiers.html">PASS</a>) +40 other tests ( 2 pass =
)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-lnl-3/igt@kms_plan=
e_scaling@planes-downscale-factor-0-75-upscale-20x20.html">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566">Intel =
XE#2566</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-139512v6/shard-lnl-1/igt@kms_plane_scaling@planes-downscale-factor-0-75-=
upscale-20x20.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-6/igt@kms_plan=
e_scaling@planes-unity-scaling-downscale-factor-0-5.html">DMESG-WARN</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566">Intel X=
E#2566</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-139512v6/shard-bmg-4/igt@kms_plane_scaling@planes-unity-scaling-downscale=
-factor-0-5.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-lnl-5/igt@kms_pm_d=
c@dc5-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/718">Intel XE#718</a>) -&gt; (<a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-7/igt@kms_pm_dc@dc5-dpms.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-13=
9512v6/shard-lnl-4/igt@kms_pm_dc@dc5-dpms.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_pm=
_rpm@cursor.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_pm_rpm@cursor=
.html">PASS</a></li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-lnl-7/igt@kms_pm_r=
pm@cursor.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3184">Intel XE#3184</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-3/igt@kms_pm_rpm@curs=
or.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_pm=
_rpm@cursor-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; (<a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-433/igt@kms_pm_rpm@=
cursor-dpms.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_pm_rpm@cursor-dpms.html">PASS</a=
>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-lnl-3/igt@kms_pm_r=
pm@universal-planes.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2042">Intel XE#2042</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-1/igt@kms_p=
m_rpm@universal-planes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-x-tiled-reflect-x-180:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-lnl-3/igt@kms_rota=
tion_crc@primary-x-tiled-reflect-x-180.html">DMESG-WARN</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-1/ig=
t@kms_rotation_crc@primary-x-tiled-reflect-x-180.html">PASS</a> +82 other t=
ests pass</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-180:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-lnl-3/igt@kms_rota=
tion_crc@sprite-rotation-180.html">DMESG-WARN</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3466">Intel XE#3466</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-1/=
igt@kms_rotation_crc@sprite-rotation-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-idle@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-463/igt@kms_vb=
lank@wait-idle@pipe-a-dp-4.html">FAIL</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-433/igt@kms_vblank@wait-=
idle@pipe-a-dp-4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@utilization-others-idle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-1/igt@xe_drm_f=
dinfo@utilization-others-idle.html">INCOMPLETE</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-3/igt@xe_drm_fd=
info@utilization-others-idle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-parallel-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@xe_exe=
c_balancer@once-parallel-rebind.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/=
igt@xe_exec_balancer@once-parallel-rebind.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-433/igt@xe_exe=
c_balancer@once-parallel-rebind.html">PASS</a>) +73 other tests ( 2 pass )<=
/li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@xe_exe=
c_basic@many-null-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@xe_e=
xec_basic@many-null-rebind.html">PASS</a> +110 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-rebind-prefetch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-6/igt@xe_exec_=
fault_mode@twice-rebind-prefetch.html">DMESG-WARN</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bm=
g-4/igt@xe_exec_fault_mode@twice-rebind-prefetch.html">PASS</a> +10 other t=
ests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-adlp-8/igt@xe_exec=
_threads@threads-mixed-shared-vm-userptr-invalidate.html">DMESG-FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3371">Intel X=
E#3371</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-139512v6/shard-adlp-6/igt@xe_exec_threads@threads-mixed-shared-vm-userpt=
r-invalidate.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-139512v6/shard-adlp-2/igt@xe_exec_threads@threads-mixed-shared=
-vm-userptr-invalidate.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_pt_create:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-6/igt@xe_fault=
_injection@vm-create-fail-xe_pt_create.html">DMESG-WARN</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) -=
&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/s=
hard-bmg-3/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shar=
d-bmg-7/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html">PASS</a>) =
+1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-1/igt@xe_live_=
ktest@xe_bo@xe_bo_shrink_kunit.html">INCOMPLETE</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2998">Intel XE#2998</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-=
2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">PASS</a> +1 other test p=
ass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-adlp-2/igt@xe_modu=
le_load@reload.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) -&gt; (<a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-adlp-4/igt@xe_modul=
e_load@reload.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-139512v6/shard-adlp-3/igt@xe_module_load@reload.html">PASS</a=
>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-unbind-all:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-lnl-3/igt@xe_pm@s2=
idle-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1616">Intel XE#1616</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-1/igt@x=
e_pm@s2idle-vm-bind-unbind-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-adlp-1/igt@xe_srio=
v_flr@flr-vf1-clear.html">FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-139512v6/shard-adlp-6/igt@xe_sriov_flr@flr-vf1-cle=
ar.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-split-misaligned-binds-67108864:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-6/igt@xe_vm@la=
rge-userptr-split-misaligned-binds-67108864.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468=
</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139=
512v6/shard-bmg-3/igt@xe_vm@large-userptr-split-misaligned-binds-67108864.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
39512v6/shard-bmg-7/igt@xe_vm@large-userptr-split-misaligned-binds-67108864=
.html">PASS</a>) +33 other tests ( 2 pass )</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@core_h=
otunplug@hotrebind-lateclose.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@=
core_hotunplug@hotrebind-lateclose.html">DMESG-WARN</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotreplug-lateclose:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-464/igt@core_h=
otunplug@hotreplug-lateclose.html">DMESG-WARN</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-46=
6/igt@core_hotunplug@hotreplug-lateclose.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotunplug-rescan:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-434/igt@core_h=
otunplug@hotunplug-rescan.html">DMESG-WARN</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/=
igt@core_hotunplug@hotunplug-rescan.html">SKIP</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@core_hotunpl=
ug@hotunplug-rescan.html">DMESG-WARN</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@unplug-rescan:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-436/igt@core_h=
otunplug@unplug-rescan.html">INCOMPLETE</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@=
core_hotunplug@unplug-rescan.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-436/igt@kms_ad=
dfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-=
466/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#242=
3</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear=
:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-lnl-3/igt@kms_asyn=
c_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html">DMESG-FA=
IL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139=
512v6/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe=
-a-edp-1-linear.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/911">Intel XE#911</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-lnl-8/igt@kms_atom=
ic_transition@modeset-transition-nonblocking-fencing.html">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3466">Intel =
XE#3466</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-139512v6/shard-lnl-8/igt@kms_atomic_transition@modeset-transition-nonblo=
cking-fencing.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3466">Intel XE#3466</a>) +3 other tests dmesg-fail<=
/li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_bi=
g_fb@4-tiled-16bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&g=
t; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/sha=
rd-dg2-435/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/=
igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-4/igt@kms_big_=
fb@4-tiled-32bpp-rotate-180.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; (<a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-1/=
igt@kms_big_fb@4-tiled-32bpp-rotate-180.html">DMESG-FAIL</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-5/igt@kms_=
big_fb@4-tiled-32bpp-rotate-180.html">DMESG-FAIL</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_bi=
g_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard=
-dg2-435/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-464/igt@kms_bi=
g_fb@4-tiled-addfb-size-overflow.html">DMESG-WARN</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_=
big_fb@4-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-lnl-5/igt@kms_big_=
fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3162">Intel XE=
#3162</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-139512v6/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-=
hflip-async-flip.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-139512v6/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-=
32bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3162">Intel XE#3162</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3466">Intel XE#346=
6</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-2/igt@kms_big_=
fb@linear-32bpp-rotate-180.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; (<a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-6/i=
gt@kms_big_fb@linear-32bpp-rotate-180.html">DMESG-WARN</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-7/igt@kms_bi=
g_fb@linear-32bpp-rotate-180.html">DMESG-WARN</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-433/igt@kms_bi=
g_fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms=
_big_fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-3/igt@kms_big_=
fb@linear-8bpp-rotate-0.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-4/igt@k=
ms_big_fb@linear-8bpp-rotate-0.html">DMESG-WARN</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-3/igt@kms_big_=
fb@linear-8bpp-rotate-180.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-8/ig=
t@kms_big_fb@linear-8bpp-rotate-180.html">DMESG-FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-5/igt@kms_big_=
fb@linear-8bpp-rotate-180.html">DMESG-WARN</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +4 other test=
s ( 1 dmesg-fail, 1 dmesg-warn )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_bi=
g_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/=
igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-433/igt@kms_big_=
fb@x-tiled-16bpp-rotate-270.html">SKIP</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +4 other tests ( 2 =
skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-463/igt@kms_bi=
g_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; (<a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-436/igt@k=
ms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_big_fb@x-t=
iled-8bpp-rotate-270.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other tes=
ts ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-8/igt@kms_big_=
fb@x-tiled-max-hw-stride-32bpp-rotate-0.html">DMESG-WARN</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/s=
hard-bmg-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html">DMESG-=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/34=
68">Intel XE#3468</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-3/igt@kms_big_=
fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">DMESG-WARN</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">In=
tel XE#3468</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-139512v6/shard-bmg-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rot=
ate-0-hflip-async-flip.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-4/igt@kms_big_fb@x-tiled-ma=
x-hw-stride-32bpp-rotate-0-hflip-async-flip.html">DMESG-WARN</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-adlp-4/igt@kms_big=
_fb@x-tiled-max-hw-stride-64bpp-rotate-0.html">DMESG-FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)=
 -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6=
/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0.html">FAI=
L</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/=
shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0.html">FAIL=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874"=
>Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_bi=
g_fb@y-tiled-32bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/=
igt@kms_big_fb@y-tiled-32bpp-rotate-180.html">SKIP</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_big_=
fb@y-tiled-32bpp-rotate-180.html">SKIP</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 =
other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_bi=
g_fb@y-tiled-32bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&=
gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/sh=
ard-dg2-435/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-433/=
igt@kms_big_fb@y-tiled-32bpp-rotate-270.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_bi=
g_fb@y-tiled-64bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; (<a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@=
kms_big_fb@y-tiled-64bpp-rotate-0.html">SKIP</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-433/igt@kms_big_fb@y-t=
iled-64bpp-rotate-0.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests ( 2 skip )=
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-464/igt@kms_bi=
g_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@=
kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a=
>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-433/igt@kms_bi=
g_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2=
-466/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2=
136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
51">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_bi=
g_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/=
igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-434/igt@kms_bi=
g_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel =
XE#1124</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-139512v6/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotat=
e-0-hflip-async-flip.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-s=
tride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#213=
6</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351=
">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-463/igt@kms_bi=
g_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124=
</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139=
512v6/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-h=
flip.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-139512v6/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rota=
te-180-hflip.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1124">Intel XE#1124</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +4 other tests ( 2=
 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-436/igt@kms_bi=
g_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Inte=
l XE#1124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-139512v6/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rota=
te-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +3 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_bi=
g_fb@yf-tiled-16bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@=
kms_big_fb@yf-tiled-16bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_bi=
g_fb@yf-tiled-16bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&=
gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/sh=
ard-dg2-464/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/=
igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2=
136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
51">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_bi=
g_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/sh=
ard-dg2-435/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#112=
4</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-436/igt@kms_bi=
g_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg=
2-466/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE=
#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_bi=
g_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; (<a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-43=
5/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@km=
s_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_bw=
@connected-linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">=
i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-139512v6/shard-dg2-435/igt@kms_bw@connected-linear-tiling-1-displays-2=
560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_bw=
@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">=
i915#2575</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-139512v6/shard-dg2-433/igt@kms_bw@connected-linear-tiling-2-displays-=
2160x1440p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_bw@connected-linear-tiling-2-disp=
lays-2160x1440p.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_bw=
@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">=
i915#2575</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-139512v6/shard-dg2-435/igt@kms_bw@connected-linear-tiling-3-displays-=
1920x1080p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-139512v6/shard-dg2-463/igt@kms_bw@connected-linear-tiling-3-disp=
lays-1920x1080p.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-434/igt@kms_bw=
@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)=
 -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6=
/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139=
512v6/shard-dg2-464/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440=
p.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2191">Intel XE#2191</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-433/igt@kms_bw=
@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/=
shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-463/igt@kms_bw=
@linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; (<a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-4=
66/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-436/=
igt@kms_bw@linear-tiling-1-displays-2160x1440p.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Inte=
l XE#367</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_bw=
@linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575=
</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139=
512v6/shard-dg2-466/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html">SK=
IP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6=
/shard-dg2-464/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html">SKIP</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">In=
tel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/367">Intel XE#367</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-433/igt@kms_bw=
@linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-46=
6/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575=
">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_cc=
s@bad-aux-stride-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; (<=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg=
2-433/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html">SKIP</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-43=
5/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">In=
tel XE#787</a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_cc=
s@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/=
igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787=
</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_cc=
s@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464=
/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_cc=
s@bad-rotation-90-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; (<a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2=
-466/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/=
igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Inte=
l XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/787">Intel XE#787</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-436/igt@kms_cc=
s@bad-rotation-90-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512=
v6/shard-dg2-466/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136"=
>Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_cc=
s@crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; (<a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-=
464/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/=
igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Inte=
l XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-463/igt@kms_cc=
s@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel=
 XE#787</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-139512v6/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl=
-rc-ccs-cc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-139512v6/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-4-ti=
led-mtl-rc-ccs-cc.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel X=
E#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-433/igt@kms_cc=
s@crc-primary-rotation-180-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel =
XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-139512v6/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12=
-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2136">Intel XE#2136</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_cc=
s@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351"=
>Intel XE#2351</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-139512v6/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-y-ti=
led-gen12-rc-ccs-cc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_ccs@crc-primary-rotation=
-180-y-tiled-gen12-rc-ccs-cc.html">SKIP</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2 oth=
er tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-463/igt@kms_cc=
s@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) -&gt=
; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shar=
d-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shar=
d-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">In=
tel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466=
/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-434/igt@kms_cc=
s@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</=
a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-13951=
2v6/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v=
6/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html">SKI=
P</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136=
">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_cd=
clk@mode-transition-all-outputs.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/s=
hard-dg2-435/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#31=
4</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_ch=
amelium_color@ctm-0-75.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-=
464/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_ch=
amelium_color@ctm-max.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; (<a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-=
435/igt@kms_chamelium_color@ctm-max.html">SKIP</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@kms_chameliu=
m_color@ctm-max.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-464/igt@kms_ch=
amelium_color@degamma.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; (<a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_cham=
elium_color@degamma.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@kms_chamelium_color@degamma.=
html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/306">Intel XE#306</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_ch=
amelium_color@gamma.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; (<a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-46=
6/igt@kms_chamelium_color@gamma.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@kms_chamelium_co=
lor@gamma.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/306">Intel XE#306</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-463/igt@kms_ch=
amelium_edid@hdmi-edid-stress-resolution-4k.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt=
; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shar=
d-dg2-436/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/sh=
ard-dg2-466/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html">SKI=
P</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423=
">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/373">Intel XE#373</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/2575">i915#2575</a>) +7 other tests ( 2 skip )</l=
i>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm-disable:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_ch=
amelium_hpd@dp-hpd-storm-disable.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)=
 -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6=
/shard-dg2-466/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html">SKIP</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg=
2-464/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">=
Intel XE#373</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/2575">i915#2575</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_ch=
amelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v=
6/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel=
 XE#373</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_ch=
amelium_hpd@hdmi-hpd-storm.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt;=
 (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard=
-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-storm.html">SKIP</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@km=
s_chamelium_hpd@hdmi-hpd-storm.html">SKIP</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +4 other tests (=
 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-433/igt@kms_ch=
amelium_hpd@vga-hpd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_chameli=
um_hpd@vga-hpd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +10 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-464/igt@kms_co=
ntent_protection@atomic-dpms.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@=
kms_content_protection@atomic-dpms.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_co=
ntent_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v=
6/shard-dg2-464/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel=
 XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_co=
ntent_protection@dp-mst-type-1.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -=
&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/s=
hard-dg2-466/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-46=
4/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE=
#307</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_co=
ntent_protection@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2=
-463/igt@kms_content_protection@legacy.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_co=
ntent_protection@lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt=
; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shar=
d-dg2-463/igt@kms_content_protection@lic-type-0.html">FAIL</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@=
kms_content_protection@lic-type-0.html">FAIL</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other te=
st ( 2 fail )</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-433/igt@kms_co=
ntent_protection@lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms=
_content_protection@lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +=
6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_cu=
rsor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6=
/shard-dg2-464/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel X=
E#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-64x21:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-464/igt@kms_cu=
rsor_crc@cursor-offscreen-64x21.html">INCOMPLETE</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; (<=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg=
2-466/igt@kms_cursor_crc@cursor-offscreen-64x21.html">SKIP</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@=
kms_cursor_crc@cursor-offscreen-64x21.html">INCOMPLETE</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel =
XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-max-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_cu=
rsor_crc@cursor-onscreen-max-size.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>=
) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v=
6/shard-dg2-433/igt@kms_cursor_crc@cursor-onscreen-max-size.html">SKIP</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-=
dg2-435/igt@kms_cursor_crc@cursor-onscreen-max-size.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-464/igt@kms_cu=
rsor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; (<a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2=
-434/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-46=
6/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">=
Intel XE#308</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x32:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-464/igt@kms_cu=
rsor_crc@cursor-sliding-32x32.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; (<a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@=
kms_cursor_crc@cursor-sliding-32x32.html">SKIP</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_cursor_c=
rc@cursor-sliding-32x32.html">SKIP</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575=
</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_cu=
rsor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/=
shard-dg2-435/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#=
455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-3/igt@kms_curs=
or_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">I=
ntel XE#877</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-139512v6/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-=
transitions-varying-size.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-4/igt@kms_cursor_legacy@cursorb=
-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-464/igt@kms_cu=
rsor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/323">Intel XE#323</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_cursor_legacy@short-busy-fl=
ip-before-cursor-atomic-transitions-varying-size.html">SKIP</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt=
@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying=
-size.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/323">Intel XE#323</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_cu=
rsor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575=
">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-139512v6/shard-dg2-435/igt@kms_cursor_legacy@short-busy-flip-before-=
cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-434/igt@kms_di=
rtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; (<a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_di=
rtyfb@psr-dirtyfb-ioctl.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@kms_dirtyfb@psr-dirtyfb-=
ioctl.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test=
 ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-4/igt@kms_draw=
_crc@draw-method-mmap-wc.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-1/ig=
t@kms_draw_crc@draw-method-mmap-wc.html">DMESG-FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-5/igt@kms_draw_=
crc@draw-method-mmap-wc.html">INCOMPLETE</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-464/igt@kms_ds=
c@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; (<a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466=
/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@km=
s_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455=
</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_fb=
con_fbt@psr-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@kms_fbcon=
_fbt@psr-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_fe=
ature_discovery@display-4x.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt;=
 (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard=
-dg2-435/igt@kms_feature_discovery@display-4x.html">SKIP</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-433/igt@km=
s_feature_discovery@display-4x.html">SKIP</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-464/igt@kms_fe=
ature_discovery@psr1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1135">Intel XE#1135</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_feat=
ure_discovery@psr1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_fe=
ature_discovery@psr2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; (<a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-4=
63/igt@kms_feature_discovery@psr2.html">SKIP</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_feature_di=
scovery@psr2.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-2/igt@kms_flip=
@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3486">Intel XE#=
3486</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-139512v6/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@=
ac-dp2-hdmi-a3.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-139512v6/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-=
interruptible@ac-dp2-hdmi-a3.html">PASS</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3486">Intel XE#3486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-2/igt@kms_flip=
@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3486">Intel XE#=
3486</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-139512v6/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@=
bc-dp2-hdmi-a3.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-139512v6/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-=
interruptible@bc-dp2-hdmi-a3.html">PASS</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3486">Intel XE#3486</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset-vs-hang:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-436/igt@kms_fl=
ip@2x-flip-vs-modeset-vs-hang.html">DMESG-WARN</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_fli=
p@2x-flip-vs-modeset-vs-hang.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-433/igt@kms_fl=
ip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html">INCOMPLETE<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">I=
ntel XE#1195</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-139512v6/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-=
64bpp-xtile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_fl=
ip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel=
 XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-139512v6/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64b=
pp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-433/igt@kms_fl=
ip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE=
#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
139512v6/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-y=
ftile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_fl=
ip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Inte=
l XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2351">Intel XE#2351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_fl=
ip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel X=
E#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2351">Intel XE#2351</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-=
ytile-to-32bpp-ytile-downscaling.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_flip_scaled=
_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351"=
>Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/455">Intel XE#455</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-433/igt@kms_fl=
ip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">=
Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-139512v6/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-=
32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling=
:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_fl=
ip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">In=
tel XE#2136</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-139512v6/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-=
32bpp-ytilercccs-downscaling.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@kms_flip_scaled_crc=
@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</=
a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512=
v6/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-on=
off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1395=
12v6/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-=
onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/651">Intel XE#651</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel X=
E#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2351">Intel XE#2351</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2=
p-scndscrn-pri-indfb-draw-render.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_frontbuffer=
_tracking@drrs-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351"=
>Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/651">Intel XE#651</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel X=
E#2136</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-139512v6/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri=
-shrfb-draw-render.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs=
-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +10 other te=
sts ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/s=
hard-dg2-464/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#65=
1</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html">DMESG-FAIL</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#34=
68</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
39512v6/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-=
move.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-139512v6/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-=
indfb-move.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2333">Intel XE#2333</a>) +2 other tests ( 2 fail )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351"=
>Intel XE#2351</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-139512v6/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-prims=
crn-cur-indfb-onoff.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc=
-2p-primscrn-cur-indfb-onoff.html">SKIP</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +2=
 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136=
</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139=
512v6/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgfl=
ip-blt.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-139512v6/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-=
shrfb-pgflip-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +5 other tests ( 1 pass, 1 s=
kip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-463/igt@kms_fr=
ontbuffer_tracking@fbc-2p-rte.html">ABORT</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/=
igt@kms_frontbuffer_tracking@fbc-2p-rte.html">SKIP</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-436/igt@kms_fron=
tbuffer_tracking@fbc-2p-rte.html">ABORT</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-433/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1395=
12v6/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-ind=
fb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2136">Intel XE#2136</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-1p-rte.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/=
igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html">SKIP</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@kms_=
frontbuffer_tracking@fbcdrrs-1p-rte.html">SKIP</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</=
a>) +10 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-434/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE=
#651</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-139512v6/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pr=
i-shrfb-draw-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrr=
s-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a>) (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Inte=
l XE#651</a>) +7 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351"=
>Intel XE#2351</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-rgb1=
01010-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcd=
rrs-rgb101010-draw-mmap-wc.html">SKIP</a>) (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other tests ( 2 s=
kip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-rgb565-draw-blt.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&g=
t; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/sha=
rd-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-blt.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/sh=
ard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-blt.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136"=
>Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/651">Intel XE#651</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-434/igt@kms_fr=
ontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#=
653</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
139512v6/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-=
indfb-draw-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-139512v6/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-1=
p-primscrn-spr-indfb-draw-blt.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +13=
 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#21=
36</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
39512v6/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-i=
ndfb-onoff.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-pr=
imscrn-cur-indfb-onoff.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +14 other tests ( 2 skip=
 )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-433/igt@kms_fr=
ontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#=
653</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
39512v6/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-i=
ndfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +5 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#21=
36</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/235=
1">Intel XE#2351</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-=
scndscrn-spr-indfb-onoff.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@kms_frontbuffer_trackin=
g@fbcpsr-2p-scndscrn-spr-indfb-onoff.html">SKIP</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other t=
ests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@fbcpsr-tiling-linear.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-d=
g2-464/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#=
653</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a=
>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512=
v6/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shar=
d-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#6=
58</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1395=
12v6/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-d=
raw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2136">Intel XE#2136</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351"=
>Intel XE#2351</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-139512v6/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-prims=
crn-indfb-msflip-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_frontbuffer_tracking@ps=
r-2p-primscrn-indfb-msflip-blt.html">SKIP</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel =
XE#653</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136=
</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139=
512v6/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plfl=
ip-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-139512v6/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-=
shrfb-plflip-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +3 other tests (=
 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-463/igt@kms_fr=
ontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#=
653</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
139512v6/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-ind=
fb-draw-render.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-s=
cndscrn-spr-indfb-draw-render.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel X=
E#653</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351"=
>Intel XE#2351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-scndsc=
rn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/653">Intel XE#653</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_ge=
tfb@getfb-reject-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; (<a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-4=
33/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_getfb@getf=
b-reject-ccs.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/605">Intel XE#605</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-1/igt@kms_hdr@=
static-toggle-suspend.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-1/igt@kms=
_hdr@static-toggle-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-434/igt@kms_jo=
iner@basic-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; (<a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_join=
er@basic-big-joiner.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@kms_joiner@basic-big-joiner.=
html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-463/igt@kms_jo=
iner@basic-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>) -&gt; (<a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-436/igt@kms_=
joiner@basic-ultra-joiner.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_joiner@basic-ultra=
-joiner.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-433/igt@kms_jo=
iner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-d=
g2-466/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE=
#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-435/igt@kms_pi=
pe_crc_basic@suspend-read-crc.html">INCOMPLETE</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; (<a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-=
433/igt@kms_pipe_crc_basic@suspend-read-crc.html">INCOMPLETE</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-436/=
igt@kms_pipe_crc_basic@suspend-read-crc.html">INCOMPLETE</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Inte=
l XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-436/igt@kms_pl=
ane_cursor@primary.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_plane_cu=
rsor@primary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-464/igt@kms_pl=
ane_scaling@intel-max-src-size.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) -&gt; (<a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt=
@kms_plane_scaling@intel-max-src-size.html">FAIL</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_plane_=
scaling@intel-max-src-size.html">SKIP</a>) (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#25=
75</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_pl=
ane_scaling@planes-downscale-factor-0-25-upscale-20x20.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2=
423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-139512v6/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-=
factor-0-25-upscale-20x20.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_pl=
ane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Inte=
l XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/2575">i915#2575</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_plane_scaling@planes-dow=
nscale-factor-0-25-upscale-factor-0-25.html">SKIP</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@kms_plane=
_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel =
XE#2763</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_pm=
_backlight@bad-brightness.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@kms=
_pm_backlight@bad-brightness.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_pm=
_backlight@basic-brightness.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; (<a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@=
kms_pm_backlight@basic-brightness.html">SKIP</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_pm_backlig=
ht@basic-brightness.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-464/igt@kms_pm=
_backlight@brightness-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a>) -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/=
igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@kms_pm=
_backlight@brightness-with-dpms.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-436/igt@kms_pm=
_backlight@fade-with-suspend.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@km=
s_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_pm=
_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg=
2-463/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-lnl-4/igt@kms_pm_d=
c@dc3co-vpb-simulation.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/736">Intel XE#736</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-6/igt@kms_pm_dc@=
dc3co-vpb-simulation.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1909">Intel XE#1909</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-463/igt@kms_pm=
_rpm@basic-pci-d3-state.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-436/igt=
@kms_pm_rpm@basic-pci-d3-state.html">ABORT</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_pm=
_rpm@dpms-non-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@kms_pm_rpm=
@dpms-non-lpsp.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@drm-resources-equal:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-464/igt@kms_pm=
_rpm@drm-resources-equal.html">ABORT</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; (<a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@km=
s_pm_rpm@drm-resources-equal.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@kms_pm_rpm@drm-reso=
urces-equal.html">DMESG-FAIL</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2446">Intel XE#2446</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-436/igt@kms_ps=
r2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel =
XE#1489</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-139512v6/shard-dg2-466/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continu=
ous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_ps=
r2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) =
-&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/=
shard-dg2-435/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-13951=
2v6/shard-dg2-434/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.h=
tml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1489">Intel XE#1489</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-464/igt@kms_ps=
r2_sf@fbc-pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; (<a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-=
466/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/=
igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html">SKIP</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Inte=
l XE#2136</a>) +6 other tests ( 2 skip )</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-lnl-1/igt@kms_psr2=
_sf@fbc-pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>) -&gt; (<a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-7/=
igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html">SKIP</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-6/igt@kms_=
psr2_sf@fbc-pr-plane-move-sf-dmg-area.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +13 oth=
er tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-lnl-3/igt@kms_psr2=
_sf@fbc-psr2-plane-move-sf-dmg-area.html">DMESG-WARN</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-1/igt@kms=
_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 ot=
her test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-lnl-2/igt@kms_psr2=
_sf@pr-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-l=
nl-2/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE=
#1489</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_ps=
r2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE=
#2136</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-139512v6/shard-dg2-464/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous=
-exceed-fully-sf.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_psr2_sf@psr2-overlay-plane-=
move-continuous-exceed-fully-sf.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)=
 +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_ps=
r2_sf@psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/s=
hard-dg2-435/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
89">Intel XE#1489</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_ps=
r2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; (<a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@k=
ms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_psr2_su@fron=
tbuffer-xrgb8888.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_ps=
r2_su@page_flip-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; (<a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@kms=
_psr2_su@page_flip-xrgb8888.html">SKIP</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_psr2_su@page_fli=
p-xrgb8888.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1122">Intel XE#1122</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-464/igt@kms_ps=
r@fbc-pr-sprite-render.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; (<a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-4=
34/igt@kms_psr@fbc-pr-sprite-render.html">SKIP</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_psr@fbc-=
pr-sprite-render.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel =
XE#929</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_ps=
r@fbc-psr-cursor-plane-onoff.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; (<a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt=
@kms_psr@fbc-psr-cursor-plane-onoff.html">SKIP</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@kms_psr@fbc-=
psr-cursor-plane-onoff.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +4 other t=
ests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-436/igt@kms_ps=
r@fbc-psr-sprite-plane-move.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-d=
g2-466/igt@kms_psr@fbc-psr-sprite-plane-move.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel =
XE#2351</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_ps=
r@fbc-psr-sprite-render.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; (<a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_=
psr@fbc-psr-sprite-render.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@kms_psr@fbc-psr-sprite=
-render.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other te=
st ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_ps=
r@fbc-psr2-cursor-plane-onoff.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt=
@kms_psr@fbc-psr2-cursor-plane-onoff.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</=
a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-464/igt@kms_ps=
r@fbc-psr2-primary-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-46=
6/igt@kms_psr@fbc-psr2-primary-blt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +4 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-464/igt@kms_ps=
r@pr-sprite-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; (<a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@=
kms_psr@pr-sprite-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@kms_psr@pr-sprite-blt.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +6 other tests ( 2 skip=
 )</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_ps=
r@pr-sprite-plane-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2=
-435/igt@kms_psr@pr-sprite-plane-onoff.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-436/igt@kms_ps=
r@psr-cursor-plane-move.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-4=
66/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_ps=
r@psr-cursor-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; (<a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-46=
4/igt@kms_psr@psr-cursor-render.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_psr@psr-curs=
or-render.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-464/igt@kms_ps=
r@psr-primary-page-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; (<a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-=
434/igt@kms_psr@psr-primary-page-flip.html">SKIP</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_psr@ps=
r-primary-page-flip.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_ps=
r@psr2-primary-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; (<a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435=
/igt@kms_psr@psr2-primary-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@kms_psr@psr2-prima=
ry-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test ( 2 skip )</=
li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_ps=
r_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel=
 XE#2351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-139512v6/shard-dg2-464/igt@kms_psr_stress_test@flip-primary-invalidate-=
overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2939">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-434/igt@kms_ro=
tation_crc@primary-rotation-90.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/=
igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@kms_rot=
ation_crc@primary-rotation-90.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i9=
15#2575</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_ro=
tation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#257=
5</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139=
512v6/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/11=
27">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_ro=
tation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2=
575</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
139512v6/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
39512v6/shard-dg2-464/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.ht=
ml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-433/igt@kms_ro=
tation_crc@sprite-rotation-270.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/=
igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2=
575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-7/igt@kms_tile=
d_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&gt; (<a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-7/igt@k=
ms_tiled_display@basic-test-pattern.html">SKIP</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-1/igt@kms_tiled_disp=
lay@basic-test-pattern.html">FAIL</a>) (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_ti=
led_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -=
&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/s=
hard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-46=
3/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE=
#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_ti=
led_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i=
915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-139512v6/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-ch=
amelium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-lnl-6/igt@kms_univ=
ersal_plane@cursor-fb-leak@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; (<=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-ln=
l-2/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">FAIL</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-=
4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">PASS</a>) (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#89=
9</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@accuracy-idle:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_vb=
lank@accuracy-idle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; (<a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466=
/igt@kms_vblank@accuracy-idle.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@kms_vblank@accurac=
y-idle.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +22 other tests ( 1 pass=
, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-434/igt@kms_vb=
lank@ts-continuation-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; (<a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-4=
64/igt@kms_vblank@ts-continuation-suspend.html">DMESG-WARN</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@=
kms_vblank@ts-continuation-suspend.html">SKIP</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2=
575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_vr=
r@cmrr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; (<a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@kms_vrr=
@cmrr.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-139512v6/shard-dg2-435/igt@kms_vrr@cmrr.html">SKIP</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-434/igt@kms_vr=
r@lobf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2168">Intel XE#2168</a>) -&gt; (<a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@kms_vrr@lobf.html">SK=
IP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6=
/shard-dg2-466/igt@kms_vrr@lobf.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">=
i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_wr=
iteback@writeback-check-output.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -=
&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/s=
hard-dg2-435/igt@kms_writeback@writeback-check-output.html">SKIP</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-43=
3/igt@kms_writeback@writeback-check-output.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_wr=
iteback@writeback-fb-id.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; (<=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg=
2-464/igt@kms_writeback@writeback-fb-id.html">SKIP</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@kms_writ=
eback@writeback-fb-id.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-433/igt@kms_wr=
iteback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466=
/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">=
i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-464/igt@kms_wr=
iteback@writeback-invalid-parameters.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; (<a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-4=
66/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/=
igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Inte=
l XE#756</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@kms_wr=
iteback@writeback-pixel-formats.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/s=
hard-dg2-435/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#75=
6</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@sriov_=
basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i9=
15#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-139512v6/shard-dg2-464/igt@sriov_basic@enable-vfs-bind-unbind-each-numvf=
s-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1091">Intel XE#1091</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-434/igt@xe_cop=
y_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/=
igt@xe_copy_basic@mem-copy-linear-0x3fff.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@xe_copy=
_basic@mem-copy-linear-0x3fff.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</=
li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x369:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@xe_cop=
y_basic@mem-set-linear-0x369.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@=
xe_copy_basic@mem-set-linear-0x369.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@xe_cop=
y_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; (<a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@=
xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@xe_copy_basic@=
mem-set-linear-0xfd.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@xe_cre=
ate@multigpu-create-massive-size.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/=
igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 ot=
her test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-extended-discovery:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@xe_eud=
ebug@basic-vm-bind-extended-discovery.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; (<=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg=
2-433/igt@xe_eudebug@basic-vm-bind-extended-discovery.html">SKIP</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-43=
5/igt@xe_eudebug@basic-vm-bind-extended-discovery.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905=
</a>) +6 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@sysfs-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@xe_eud=
ebug@sysfs-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@xe_eudebug@=
sysfs-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2905">Intel XE#2905</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@resume-dss:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-433/igt@xe_eud=
ebug_online@resume-dss.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@xe_eud=
ebug_online@resume-dss.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@xe_eud=
ebug_online@writes-caching-vram-bb-sram-target-sram.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130=
</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139=
512v6/shard-dg2-466/igt@xe_eudebug_online@writes-caching-vram-bb-sram-targe=
t-sram.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-139512v6/shard-dg2-464/igt@xe_eudebug_online@writes-caching-vram-bb-=
sram-target-sram.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +2 other tests=
 ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-435/igt@xe_evi=
ct@evict-beng-large-multi-vm-cm.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1600">Intel XE#1600</a>) -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/=
igt@xe_evict@evict-beng-large-multi-vm-cm.html">FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@xe_evi=
ct@evict-beng-large-multi-vm-cm.html">PASS</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1600">Intel XE#1600</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-8/igt@xe_evict=
@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg=
-3/igt@xe_evict@evict-mixed-many-threads-small.html">DMESG-WARN</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#346=
8</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-4/igt@xe_evict=
@evict-threads-large.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; (<a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-1/igt@xe_=
evict@evict-threads-large.html">DMESG-WARN</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-bmg-5/igt@xe_evict@evict-thr=
eads-large.html">INCOMPLETE</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-5/igt@xe_exec_=
basic@many-bindexecqueue-userptr-rebind.html">DMESG-WARN</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) =
-&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/=
shard-bmg-2/igt@xe_exec_basic@many-bindexecqueue-userptr-rebind.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/sh=
ard-bmg-3/igt@xe_exec_basic@many-bindexecqueue-userptr-rebind.html">DMESG-W=
ARN</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/34=
68">Intel XE#3468</a>) +2 other tests ( 1 dmesg-warn, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@xe_exe=
c_fault_mode@many-execqueues-userptr-invalidate-race-imm.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE=
#1130</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-139512v6/shard-dg2-464/igt@xe_exec_fault_mode@many-execqueues-userptr-inv=
alidate-race-imm.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@xe_exec_fault_mode@many-execque=
ues-userptr-invalidate-race-imm.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +=
5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-433/igt@xe_exe=
c_fault_mode@once-bindexecqueue-imm.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466=
/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)=
 +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@xe_exe=
c_fault_mode@once-bindexecqueue-rebind.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; (=
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-d=
g2-435/igt@xe_exec_fault_mode@once-bindexecqueue-rebind.html">SKIP</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-=
433/igt@xe_exec_fault_mode@once-bindexecqueue-rebind.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288=
</a>) +9 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-bmg-8/igt@xe_exec_=
fault_mode@once-bindexecqueue-userptr-invalidate-prefetch.html">DMESG-WARN<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512=
v6/shard-bmg-5/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate=
-prefetch.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-463/igt@xe_exe=
c_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#=
288</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
139512v6/shard-dg2-436/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-r=
ebind-prefetch.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-139512v6/shard-dg2-466/igt@xe_exec_fault_mode@twice-bindexec=
queue-userptr-rebind-prefetch.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +18=
 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@xe_exe=
c_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shar=
d-dg2-435/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Int=
el XE#288</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@xe_exe=
c_mix_modes@exec-simple-batch-store-dma-fence.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) =
-&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/=
shard-dg2-433/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-13951=
2v6/shard-dg2-435/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.h=
tml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-436/igt@xe_exe=
c_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/=
shard-dg2-466/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-463/igt@xe_exe=
c_mix_modes@exec-spinner-interrupted-lr.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) -&gt; =
(<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-=
dg2-466/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html">SKIP</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg=
2-436/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html">SKIP</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE=
#1130</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-writesip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-464/igt@xe_exe=
c_sip_eudebug@breakpoint-writesip.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; (<a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-43=
4/igt@xe_exec_sip_eudebug@breakpoint-writesip.html">SKIP</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@xe=
_exec_sip_eudebug@breakpoint-writesip.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#290=
5</a>) +6 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-464/igt@xe_fau=
lt_injection@inject-fault-probe-function-wait_for_lmem_ready.html">DMESG-WA=
RN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467=
">Intel XE#3467</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-139512v6/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe=
-function-wait_for_lmem_ready.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +2 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@xe_fau=
lt_injection@inject-fault-probe-function-xe_guc_ct_init.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#=
1130</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-139512v6/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-=
xe_guc_ct_init.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-139512v6/shard-dg2-464/igt@xe_fault_injection@inject-fault-p=
robe-function-xe_guc_ct_init.html">DMESG-WARN</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343=
</a>) +1 other test ( 1 dmesg-warn, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-436/igt@xe_fau=
lt_injection@inject-fault-probe-function-xe_guc_relay_init.html">DMESG-WARN=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">=
Intel XE#3343</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-139512v6/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-f=
unction-xe_guc_relay_init.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@xe_fau=
lt_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130=
</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139=
512v6/shard-dg2-463/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_c=
reate.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-139512v6/shard-dg2-435/igt@xe_fault_injection@vm-bind-fail-vm_b=
ind_ioctl_ops_create.html">DMESG-WARN</a>) (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) +1 other test ( 2 =
dmesg-warn )</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-434/igt@xe_fau=
lt_injection@vm-create-fail-xe_exec_queue_create_bind.html">DMESG-WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel=
 XE#3467</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-139512v6/shard-dg2-466/igt@xe_fault_injection@vm-create-fail-xe_exec_q=
ueue_create_bind.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@xe_fault_injection@vm-create-fa=
il-xe_exec_queue_create_bind.html">DMESG-WARN</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467=
</a>) +2 other tests ( 1 dmesg-warn, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@xe_huc=
_copy@huc_copy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-433/igt@xe_huc_copy@h=
uc_copy.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-139512v6/shard-dg2-435/igt@xe_huc_copy@huc_copy.html">SKIP</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#=
255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@simple-bb:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@xe_int=
el_bb@simple-bb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; (<a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@xe_intel_bb@=
simple-bb.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-139512v6/shard-dg2-464/igt@xe_intel_bb@simple-bb.html">PASS</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel=
 XE#1130</a>) +32 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-lnl-3/igt@xe_live_=
ktest@xe_eudebug.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1192">Intel XE#1192</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3026">Intel XE#3026</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-lnl-1/ig=
t@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2833">Intel XE#2833</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-436/igt@xe_med=
ia_fill@media-fill.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/560">Intel XE#560</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@xe_media_fil=
l@media-fill.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-fill:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@xe_oa@=
buffer-fill.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1130">Intel XE#1130</a>) -&gt; (<a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@xe_oa@buffer-fil=
l.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-139512v6/shard-dg2-433/igt@xe_oa@buffer-fill.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>=
) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@xe_oa@=
oa-regs-whitelisted.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@xe_oa@oa-=
regs-whitelisted.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2541">Intel XE#2541</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-sample-oa:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@xe_oa@=
oa-unit-exclusive-stream-sample-oa.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; (<a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-4=
64/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html">SKIP</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@=
xe_oa@oa-unit-exclusive-stream-sample-oa.html">SKIP</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#=
2541</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling-small-buf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-464/igt@xe_oa@=
polling-small-buf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@xe_oa@polli=
ng-small-buf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1130">Intel XE#1130</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@privileged-forked-access-vaddr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-463/igt@xe_oa@=
privileged-forked-access-vaddr.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/=
igt@xe_oa@privileged-forked-access-vaddr.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-436/igt@xe_oa@p=
rivileged-forked-access-vaddr.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +=
5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@xe_pat=
@display-vs-wb-transient.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@xe_p=
at@display-vs-wb-transient.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-463/igt@xe_pat=
@pat-index-xelpg.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-436/igt@xe_pat@pat-in=
dex-xelpg.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-139512v6/shard-dg2-466/igt@xe_pat@pat-index-xelpg.html">SKIP</a>)=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Inte=
l XE#1130</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-436/igt@xe_pee=
r2peer@read.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1173">Intel XE#1173</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@xe_peer2peer@read=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1061">Intel XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@xe_pee=
r2peer@write.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1061">Intel XE#1061</a>) -&gt; (<a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@xe_peer2peer@wr=
ite.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-139512v6/shard-dg2-435/igt@xe_peer2peer@write.html">FAIL</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@xe_pm@=
d3cold-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@xe_pm@d3cold-bas=
ic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@xe_pm@=
d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; (<a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-433/igt@xe_pm@d3co=
ld-basic-exec.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-139512v6/shard-dg2-435/igt@xe_pm@d3cold-basic-exec.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284"=
>Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/366">Intel XE#366</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-434/igt@xe_pm@=
d3cold-mmap-vram.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; (<a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt=
@xe_pm@d3cold-mmap-vram.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@xe_pm@d3cold-mmap-vram.h=
tml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1130">Intel XE#1130</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@xe_pm@=
d3cold-mocs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@xe_pm@d3cold-mocs=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-464/igt@xe_pm@=
s3-basic-exec.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; (<a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@xe_pm@s3-b=
asic-exec.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@xe_pm@s3-basic-exec.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">I=
ntel XE#1130</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@xe_pm@=
s3-d3hot-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; (<a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@xe_pm@s3=
-d3hot-basic-exec.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-139512v6/shard-dg2-464/igt@xe_pm@s3-d3hot-basic-exec.html=
">DMESG-WARN</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1130">Intel XE#1130</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-436/igt@xe_pm@=
s4-exec-after.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@xe_pm@s4-=
exec-after.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@xe_pm@=
s4-multiple-execs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; (<a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@xe_pm@s4-m=
ultiple-execs.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@xe_pm@s4-multiple-execs.html=
">DMESG-WARN</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-436/igt@xe_pm_=
residency@gt-c6-freeze.html">DMESG-WARN</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3088">Intel XE#3088</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@=
xe_pm_residency@gt-c6-freeze.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-adlp-9/igt@xe_pm_r=
esidency@toggle-gt-c6.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/958">Intel XE#958</a>) -&gt; (<a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-adlp-8/igt@xe_pm_res=
idency@toggle-gt-c6.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-139512v6/shard-adlp-6/igt@xe_pm_residency@toggle-gt-c6.=
html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/958">Intel XE#958</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-config:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@xe_que=
ry@multigpu-query-config.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; (<a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@xe_=
query@multigpu-query-config.html">SKIP</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-433/igt@xe_query@multigpu-qu=
ery-config.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/944">Intel XE#944</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-464/igt@xe_que=
ry@multigpu-query-invalid-extension.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466=
/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-464/igt@xe_que=
ry@multigpu-query-mem-usage.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; (<a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt@xe=
_query@multigpu-query-mem-usage.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@xe_query@multigp=
u-query-mem-usage.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests =
( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology-l3-bank-mask:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@xe_que=
ry@multigpu-query-topology-l3-bank-mask.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; =
(<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-=
dg2-466/igt@xe_query@multigpu-query-topology-l3-bank-mask.html">SKIP</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg=
2-464/igt@xe_query@multigpu-query-topology-l3-bank-mask.html">SKIP</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE=
#1130</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@xe_sri=
ov_flr@flr-vf1-clear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-463/igt@xe_sriov=
_flr@flr-vf1-clear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-misaligned-binds-67108864:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-464/igt@xe_vm@=
large-split-misaligned-binds-67108864.html">DMESG-WARN</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-466/igt=
@xe_vm@large-split-misaligned-binds-67108864.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +=
3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f/shard-dg2-466/igt@xe_wed=
ged@wedged-mode-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; (<a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-435/igt@xe_we=
dged@wedged-mode-toggle.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-139512v6/shard-dg2-434/igt@xe_wedged@wedged-mode-t=
oggle.html">ABORT</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3075">Intel XE#3075</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3084">Intel XE#3084</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f -&gt; xe-pw-139=
512v6</li>
</ul>
<p>IGT_8114: 8114<br />
  xe-2245-57639ceec0f66f06f4a8a8ac3b9551b7b493c33f: 57639ceec0f66f06f4a8a8a=
c3b9551b7b493c33f<br />
  xe-pw-139512v6: 139512v6</p>

</body>
</html>

--===============7494115288620469004==--
