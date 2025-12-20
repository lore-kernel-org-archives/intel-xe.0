Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D0BAD78797
	for <intel-xe@archiver.kernel.org>; Sat, 20 Dec 2025 13:25:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E973910E14A;
	Sat, 20 Dec 2025 13:25:33 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A12FF10E14A;
 Sat, 20 Dec 2025 13:25:32 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6452651537228558146=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Survivability_mode_fixes_?=
 =?utf-8?q?=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 20 Dec 2025 13:25:32 -0000
Message-ID: <176623713261.108914.10336440856876553544@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251219105224.871930-4-riana.tauro@intel.com>
In-Reply-To: <20251219105224.871930-4-riana.tauro@intel.com>
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

--===============6452651537228558146==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Survivability mode fixes (rev3)
URL   : https://patchwork.freedesktop.org/series/159096/
State : failure

== Summary ==

CI Bug Log - changes from xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea_FULL -> xe-pw-159096v3_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-159096v3_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-159096v3_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-159096v3_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_edge_walk@256x256-right-edge:
    - shard-bmg:          [PASS][1] -> [FAIL][2] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-4/igt@kms_cursor_edge_walk@256x256-right-edge.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-2/igt@kms_cursor_edge_walk@256x256-right-edge.html

  * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:
    - shard-bmg:          [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-10/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html

  
Known issues
------------

  Here are the changes found in xe-pw-159096v3_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotunplug-rescan:
    - shard-bmg:          [PASS][5] -> [SKIP][6] ([Intel XE#6779]) +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-8/igt@core_hotunplug@hotunplug-rescan.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@core_hotunplug@hotunplug-rescan.html

  * igt@fbdev@info:
    - shard-bmg:          [PASS][7] -> [SKIP][8] ([Intel XE#2134])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-4/igt@fbdev@info.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@fbdev@info.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#1124]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-10/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          [PASS][10] -> [SKIP][11] ([Intel XE#2314] / [Intel XE#2894])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2887]) +2 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-4/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2652] / [Intel XE#787]) +7 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-2/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2252]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-4/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2320])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-4/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][16] -> [SKIP][17] ([Intel XE#2291])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2244])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-10/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2316])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
    - shard-bmg:          [PASS][20] -> [SKIP][21] ([Intel XE#2316]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-1/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-4/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [PASS][22] -> [FAIL][23] ([Intel XE#301]) +1 other test fail
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2293] / [Intel XE#2380])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2293]) +3 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-modesetfrombusy:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2311]) +2 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#4141]) +3 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2312]) +5 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2313]) +2 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2350])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-4/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-bmg:          [PASS][31] -> [ABORT][32] ([Intel XE#6740]) +1 other test abort
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-4/igt@kms_hdr@bpc-switch-suspend.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-1/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#6886]) +11 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-9/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#2392])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-4/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#6693])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#1406] / [Intel XE#1489]) +2 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-4/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#1406] / [Intel XE#6703]) +10 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr@psr-no-drrs:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +4 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-4/igt@kms_psr@psr-no-drrs.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2413])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-4/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_vrr@lobf:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2168])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-10/igt@kms_vrr@lobf.html

  * igt@xe_eudebug@discovery-empty:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#4837]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-4/igt@xe_eudebug@discovery-empty.html

  * igt@xe_eudebug_online@breakpoint-many-sessions-single-tile:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#4837] / [Intel XE#6665])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-4/igt@xe_eudebug_online@breakpoint-many-sessions-single-tile.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [PASS][43] -> [INCOMPLETE][44] ([Intel XE#6321])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-10/igt@xe_evict@evict-mixed-many-threads-small.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_basic@many-bindexecqueue-rebind:
    - shard-bmg:          [PASS][45] -> [SKIP][46] ([Intel XE#6703]) +355 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-8/igt@xe_exec_basic@many-bindexecqueue-rebind.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@xe_exec_basic@many-bindexecqueue-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2322]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-10/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html

  * igt@xe_exec_multi_queue@many-execs-priority:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#6874]) +3 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-4/igt@xe_exec_multi_queue@many-execs-priority.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free-huge:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#4943]) +4 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-4/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free-huge.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-prefetch:
    - shard-bmg:          [PASS][50] -> [SKIP][51] ([Intel XE#6557] / [Intel XE#6703]) +6 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-8/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-prefetch.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-prefetch.html

  * igt@xe_module_load@force-load:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#2457])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-10/igt@xe_module_load@force-load.html

  * igt@xe_pm@s3-exec-after:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#6703]) +308 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@xe_pm@s3-exec-after.html

  * igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0:
    - shard-lnl:          [PASS][54] -> [FAIL][55] ([Intel XE#6251])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-lnl-5/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-lnl-3/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0.html

  * igt@xe_sriov_auto_provisioning@selfconfig-basic:
    - shard-bmg:          NOTRUN -> [FAIL][56] ([Intel XE#5937]) +1 other test fail
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-10/igt@xe_sriov_auto_provisioning@selfconfig-basic.html

  
#### Possible fixes ####

  * igt@core_setmaster@master-drop-set-user:
    - shard-bmg:          [FAIL][57] ([Intel XE#4674]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-5/igt@core_setmaster@master-drop-set-user.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-9/igt@core_setmaster@master-drop-set-user.html

  * igt@fbdev@nullptr:
    - shard-bmg:          [SKIP][59] ([Intel XE#2134]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-5/igt@fbdev@nullptr.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-8/igt@fbdev@nullptr.html

  * igt@kms_addfb_basic@unused-pitches:
    - shard-bmg:          [SKIP][61] ([Intel XE#6557] / [Intel XE#6703]) -> [PASS][62] +5 other tests pass
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-2/igt@kms_addfb_basic@unused-pitches.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-2/igt@kms_addfb_basic@unused-pitches.html

  * igt@kms_feature_discovery@display-2x:
    - shard-bmg:          [SKIP][63] ([Intel XE#2373]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-4/igt@kms_feature_discovery@display-2x.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-2/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-bmg:          [SKIP][65] ([Intel XE#2316]) -> [PASS][66] +3 other tests pass
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-2/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [FAIL][67] ([Intel XE#3321]) -> [PASS][68] +1 other test pass
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
    - shard-bmg:          [DMESG-FAIL][69] ([Intel XE#5545]) -> [PASS][70] +1 other test pass
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-bmg:          [INCOMPLETE][71] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][72] +1 other test pass
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-9/igt@kms_flip@2x-flip-vs-suspend.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-8/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-2:
    - shard-bmg:          [ABORT][73] ([Intel XE#6740]) -> [PASS][74] +2 other tests pass
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-3/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-2.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-10/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-2.html

  * igt@kms_pm_rpm@i2c:
    - shard-bmg:          [SKIP][75] ([Intel XE#6693]) -> [PASS][76] +2 other tests pass
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-2/igt@kms_pm_rpm@i2c.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-2/igt@kms_pm_rpm@i2c.html

  * igt@xe_exec_basic@many-execqueues-null-defer-bind:
    - shard-bmg:          [SKIP][77] ([Intel XE#6703]) -> [PASS][78] +539 other tests pass
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-2/igt@xe_exec_basic@many-execqueues-null-defer-bind.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-2/igt@xe_exec_basic@many-execqueues-null-defer-bind.html

  * igt@xe_live_ktest@xe_bo:
    - shard-bmg:          [SKIP][79] ([Intel XE#2229]) -> [PASS][80] +1 other test pass
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-5/igt@xe_live_ktest@xe_bo.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-9/igt@xe_live_ktest@xe_bo.html

  * igt@xe_module_load@many-reload:
    - shard-bmg:          [FAIL][81] ([Intel XE#6913]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-5/igt@xe_module_load@many-reload.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-9/igt@xe_module_load@many-reload.html

  * igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_enhance0:
    - shard-lnl:          [FAIL][83] ([Intel XE#6251]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-lnl-5/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_enhance0.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-lnl-3/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_enhance0.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-bmg:          [SKIP][85] ([Intel XE#2327]) -> [SKIP][86] ([Intel XE#6703]) +2 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-4/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-bmg:          [SKIP][87] ([Intel XE#6703]) -> [SKIP][88] ([Intel XE#2327]) +5 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-5/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-8/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-bmg:          [SKIP][89] ([Intel XE#2328]) -> [SKIP][90] ([Intel XE#6703])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-8/igt@kms_big_fb@y-tiled-addfb.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-bmg:          [SKIP][91] ([Intel XE#6703]) -> [SKIP][92] ([Intel XE#1124]) +7 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-9/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          [SKIP][93] ([Intel XE#1124]) -> [SKIP][94] ([Intel XE#6703]) +7 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-bmg:          [SKIP][95] ([Intel XE#6703]) -> [SKIP][96] ([Intel XE#607])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-9/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-bmg:          [SKIP][97] ([Intel XE#2314] / [Intel XE#2894]) -> [SKIP][98] ([Intel XE#6703])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-8/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-bmg:          [SKIP][99] ([Intel XE#6703]) -> [SKIP][100] ([Intel XE#2314] / [Intel XE#2894])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-9/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-3-displays-1920x1080p:
    - shard-bmg:          [SKIP][101] ([Intel XE#6703]) -> [SKIP][102] ([Intel XE#367]) +1 other test skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-2/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-2/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-bmg:          [SKIP][103] ([Intel XE#367]) -> [SKIP][104] ([Intel XE#6703])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-4/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][105] ([Intel XE#2652] / [Intel XE#787]) -> [SKIP][106] ([Intel XE#6703]) +1 other test skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-8/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
    - shard-bmg:          [SKIP][107] ([Intel XE#6703]) -> [SKIP][108] ([Intel XE#3432])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          [SKIP][109] ([Intel XE#2887]) -> [SKIP][110] ([Intel XE#6703]) +10 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs:
    - shard-bmg:          [SKIP][111] ([Intel XE#6703]) -> [SKIP][112] ([Intel XE#2887]) +13 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-9/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-bmg:          [SKIP][113] ([Intel XE#6703]) -> [SKIP][114] ([Intel XE#2724])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-2/igt@kms_cdclk@mode-transition.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-2/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-bmg:          [SKIP][115] ([Intel XE#2724]) -> [SKIP][116] ([Intel XE#6703])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-8/igt@kms_cdclk@mode-transition-all-outputs.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@degamma:
    - shard-bmg:          [SKIP][117] ([Intel XE#2325]) -> [SKIP][118] ([Intel XE#6703]) +1 other test skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-8/igt@kms_chamelium_color@degamma.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:
    - shard-bmg:          [SKIP][119] ([Intel XE#2252]) -> [SKIP][120] ([Intel XE#6703]) +3 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-4/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:
    - shard-bmg:          [SKIP][121] ([Intel XE#6703]) -> [SKIP][122] ([Intel XE#2252]) +8 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-5/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-8/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html

  * igt@kms_content_protection@dp-mst-suspend-resume:
    - shard-bmg:          [SKIP][123] ([Intel XE#6743]) -> [SKIP][124] ([Intel XE#6703])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-2/igt@kms_content_protection@dp-mst-suspend-resume.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@kms_content_protection@dp-mst-suspend-resume.html

  * igt@kms_content_protection@mei-interface:
    - shard-bmg:          [SKIP][125] ([Intel XE#6703]) -> [SKIP][126] ([Intel XE#2341])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-5/igt@kms_content_protection@mei-interface.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-8/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@type1:
    - shard-bmg:          [SKIP][127] ([Intel XE#2341]) -> [SKIP][128] ([Intel XE#6703])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-4/igt@kms_content_protection@type1.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@kms_content_protection@type1.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          [FAIL][129] ([Intel XE#6707]) -> [SKIP][130] ([Intel XE#6703])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-8/igt@kms_content_protection@uevent.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-bmg:          [SKIP][131] ([Intel XE#2320]) -> [SKIP][132] ([Intel XE#6703]) +1 other test skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-4/igt@kms_cursor_crc@cursor-offscreen-32x32.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-onscreen-64x21:
    - shard-bmg:          [SKIP][133] ([Intel XE#6703]) -> [SKIP][134] ([Intel XE#2320]) +4 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-64x21.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-64x21.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-bmg:          [SKIP][135] ([Intel XE#2321]) -> [SKIP][136] ([Intel XE#6703])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-8/igt@kms_cursor_crc@cursor-random-512x170.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-bmg:          [SKIP][137] ([Intel XE#6703]) -> [SKIP][138] ([Intel XE#2321]) +1 other test skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-2/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-2/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-bmg:          [SKIP][139] ([Intel XE#2291]) -> [SKIP][140] ([Intel XE#6703])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [SKIP][141] ([Intel XE#6703]) -> [FAIL][142] ([Intel XE#5299])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-bmg:          [SKIP][143] ([Intel XE#6703]) -> [SKIP][144] ([Intel XE#2286])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-bmg:          [SKIP][145] ([Intel XE#6703]) -> [SKIP][146] ([Intel XE#4354])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-5/igt@kms_dp_link_training@uhbr-sst.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-8/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-bmg:          [SKIP][147] ([Intel XE#4331]) -> [SKIP][148] ([Intel XE#6703])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-8/igt@kms_dp_linktrain_fallback@dsc-fallback.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-bmg:          [SKIP][149] ([Intel XE#6703]) -> [SKIP][150] ([Intel XE#2244]) +1 other test skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-2/igt@kms_dsc@dsc-fractional-bpp.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-2/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-bmg:          [SKIP][151] ([Intel XE#2244]) -> [SKIP][152] ([Intel XE#6703])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-4/igt@kms_dsc@dsc-with-bpc-formats.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
    - shard-bmg:          [SKIP][153] ([Intel XE#4422]) -> [SKIP][154] ([Intel XE#6703])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-8/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html

  * igt@kms_feature_discovery@display-4x:
    - shard-bmg:          [SKIP][155] ([Intel XE#6703]) -> [SKIP][156] ([Intel XE#1138])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-5/igt@kms_feature_discovery@display-4x.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-8/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
    - shard-bmg:          [SKIP][157] ([Intel XE#2316]) -> [SKIP][158] ([Intel XE#6703]) +1 other test skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-4/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-bmg:          [SKIP][159] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][160] ([Intel XE#6703]) +2 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
    - shard-bmg:          [SKIP][161] ([Intel XE#6703]) -> [SKIP][162] ([Intel XE#2293] / [Intel XE#2380]) +2 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][163] ([Intel XE#2311]) -> [SKIP][164] ([Intel XE#2312]) +4 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][165] ([Intel XE#2312]) -> [SKIP][166] ([Intel XE#2311]) +5 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][167] ([Intel XE#2312]) -> [SKIP][168] ([Intel XE#6703]) +9 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render:
    - shard-bmg:          [SKIP][169] ([Intel XE#6703]) -> [SKIP][170] ([Intel XE#2311]) +23 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt:
    - shard-bmg:          [SKIP][171] ([Intel XE#6703]) -> [SKIP][172] ([Intel XE#4141]) +12 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][173] ([Intel XE#2312]) -> [SKIP][174] ([Intel XE#4141]) +1 other test skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][175] ([Intel XE#6557] / [Intel XE#6703]) -> [SKIP][176] ([Intel XE#4141])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][177] ([Intel XE#4141]) -> [SKIP][178] ([Intel XE#2312]) +1 other test skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][179] ([Intel XE#4141]) -> [SKIP][180] ([Intel XE#6703]) +7 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-bmg:          [SKIP][181] ([Intel XE#6703]) -> [SKIP][182] ([Intel XE#2352])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-shrfb-draw-blt:
    - shard-bmg:          [SKIP][183] ([Intel XE#2311]) -> [SKIP][184] ([Intel XE#6703]) +11 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-shrfb-draw-blt.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][185] ([Intel XE#6703]) -> [SKIP][186] ([Intel XE#2313]) +27 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][187] ([Intel XE#2313]) -> [SKIP][188] ([Intel XE#6703]) +11 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][189] ([Intel XE#2312]) -> [SKIP][190] ([Intel XE#2313]) +2 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-bmg:          [SKIP][191] ([Intel XE#2352]) -> [SKIP][192] ([Intel XE#6703])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][193] ([Intel XE#2313]) -> [SKIP][194] ([Intel XE#2312]) +7 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [ABORT][195] ([Intel XE#6740]) -> [SKIP][196] ([Intel XE#6703])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-8/igt@kms_hdr@invalid-hdr.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-bmg:          [SKIP][197] ([Intel XE#6911]) -> [SKIP][198] ([Intel XE#6703]) +1 other test skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-8/igt@kms_joiner@basic-force-ultra-joiner.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-bmg:          [SKIP][199] ([Intel XE#6703]) -> [SKIP][200] ([Intel XE#4298])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-5/igt@kms_joiner@basic-max-non-joiner.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-8/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          [SKIP][201] ([Intel XE#6703]) -> [SKIP][202] ([Intel XE#6911]) +1 other test skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-5/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-9/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_panel_fitting@legacy:
    - shard-bmg:          [SKIP][203] ([Intel XE#6703]) -> [SKIP][204] ([Intel XE#2486])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-5/igt@kms_panel_fitting@legacy.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-9/igt@kms_panel_fitting@legacy.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-bmg:          [SKIP][205] ([Intel XE#6703]) -> [SKIP][206] ([Intel XE#4329])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-5/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-9/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-bmg:          [SKIP][207] ([Intel XE#2393]) -> [SKIP][208] ([Intel XE#6703])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-8/igt@kms_plane_lowres@tiling-yf.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][209] ([Intel XE#5021]) -> [SKIP][210] ([Intel XE#4596])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-y.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          [SKIP][211] ([Intel XE#4596]) -> [SKIP][212] ([Intel XE#6703])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-yf.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:
    - shard-bmg:          [SKIP][213] ([Intel XE#6703]) -> [SKIP][214] ([Intel XE#6886]) +2 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-bmg:          [SKIP][215] ([Intel XE#870]) -> [SKIP][216] ([Intel XE#6703])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-8/igt@kms_pm_backlight@fade-with-dpms.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-bmg:          [SKIP][217] ([Intel XE#6703]) -> [SKIP][218] ([Intel XE#2391])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-5/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-9/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-bmg:          [SKIP][219] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836]) -> [SKIP][220] ([Intel XE#6693]) +1 other test skip
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-8/igt@kms_pm_rpm@dpms-lpsp.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-bmg:          [SKIP][221] ([Intel XE#6693]) -> [SKIP][222] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-9/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          [SKIP][223] ([Intel XE#1406] / [Intel XE#1489]) -> [SKIP][224] ([Intel XE#1406] / [Intel XE#6703]) +4 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-8/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-bmg:          [SKIP][225] ([Intel XE#1406] / [Intel XE#6703]) -> [SKIP][226] ([Intel XE#1406] / [Intel XE#1489]) +8 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-2/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-2/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-bmg:          [SKIP][227] ([Intel XE#1406] / [Intel XE#2387]) -> [SKIP][228] ([Intel XE#1406] / [Intel XE#6703])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-8/igt@kms_psr2_su@page_flip-xrgb8888.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@psr-suspend:
    - shard-bmg:          [SKIP][229] ([Intel XE#1406] / [Intel XE#6703]) -> [SKIP][230] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +8 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-5/igt@kms_psr@psr-suspend.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-9/igt@kms_psr@psr-suspend.html

  * igt@kms_psr@psr2-primary-page-flip:
    - shard-bmg:          [SKIP][231] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) -> [SKIP][232] ([Intel XE#1406] / [Intel XE#6703]) +3 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-8/igt@kms_psr@psr2-primary-page-flip.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@kms_psr@psr2-primary-page-flip.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          [SKIP][233] ([Intel XE#1406] / [Intel XE#2414]) -> [SKIP][234] ([Intel XE#1406] / [Intel XE#6703])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-8/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-bmg:          [SKIP][235] ([Intel XE#6703]) -> [SKIP][236] ([Intel XE#3414] / [Intel XE#3904]) +1 other test skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-5/igt@kms_rotation_crc@bad-pixel-format.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-8/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-bmg:          [SKIP][237] ([Intel XE#2330]) -> [SKIP][238] ([Intel XE#6703])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-bmg:          [SKIP][239] ([Intel XE#3414] / [Intel XE#3904]) -> [SKIP][240] ([Intel XE#6703]) +2 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-4/igt@kms_rotation_crc@sprite-rotation-90.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_sharpness_filter@filter-scaler-downscale:
    - shard-bmg:          [SKIP][241] ([Intel XE#6703]) -> [SKIP][242] ([Intel XE#6503]) +1 other test skip
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-5/igt@kms_sharpness_filter@filter-scaler-downscale.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-8/igt@kms_sharpness_filter@filter-scaler-downscale.html

  * igt@kms_sharpness_filter@invalid-filter-with-plane:
    - shard-bmg:          [SKIP][243] ([Intel XE#6503]) -> [SKIP][244] ([Intel XE#6703])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-8/igt@kms_sharpness_filter@invalid-filter-with-plane.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@kms_sharpness_filter@invalid-filter-with-plane.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][245] ([Intel XE#1729]) -> [SKIP][246] ([Intel XE#2426])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-bmg:          [SKIP][247] ([Intel XE#1499]) -> [SKIP][248] ([Intel XE#6703])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-8/igt@kms_vrr@flip-basic-fastset.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@flip-suspend:
    - shard-bmg:          [SKIP][249] ([Intel XE#6703]) -> [SKIP][250] ([Intel XE#1499]) +1 other test skip
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-5/igt@kms_vrr@flip-suspend.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-9/igt@kms_vrr@flip-suspend.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-bmg:          [SKIP][251] ([Intel XE#6703]) -> [SKIP][252] ([Intel XE#6599])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-5/igt@xe_compute@ccs-mode-basic.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-8/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_eudebug@basic-close:
    - shard-bmg:          [SKIP][253] ([Intel XE#4837]) -> [SKIP][254] ([Intel XE#6703]) +1 other test skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-4/igt@xe_eudebug@basic-close.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@xe_eudebug@basic-close.html

  * igt@xe_eudebug@basic-vm-bind-ufence-reconnect:
    - shard-bmg:          [SKIP][255] ([Intel XE#4837]) -> [SKIP][256] ([Intel XE#6557] / [Intel XE#6703])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-4/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html

  * igt@xe_eudebug@basic-vm-bind-vm-destroy:
    - shard-bmg:          [SKIP][257] ([Intel XE#6703]) -> [SKIP][258] ([Intel XE#4837]) +6 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-5/igt@xe_eudebug@basic-vm-bind-vm-destroy.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-9/igt@xe_eudebug@basic-vm-bind-vm-destroy.html

  * igt@xe_eudebug_online@pagefault-read-stress:
    - shard-bmg:          [SKIP][259] ([Intel XE#6665] / [Intel XE#6681]) -> [SKIP][260] ([Intel XE#6703])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-8/igt@xe_eudebug_online@pagefault-read-stress.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@xe_eudebug_online@pagefault-read-stress.html

  * igt@xe_eudebug_online@set-breakpoint-faultable:
    - shard-bmg:          [SKIP][261] ([Intel XE#4837] / [Intel XE#6665]) -> [SKIP][262] ([Intel XE#6703]) +1 other test skip
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-4/igt@xe_eudebug_online@set-breakpoint-faultable.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@xe_eudebug_online@set-breakpoint-faultable.html

  * igt@xe_eudebug_online@single-step:
    - shard-bmg:          [SKIP][263] ([Intel XE#6703]) -> [SKIP][264] ([Intel XE#4837] / [Intel XE#6665]) +5 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-5/igt@xe_eudebug_online@single-step.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-8/igt@xe_eudebug_online@single-step.html

  * igt@xe_exec_basic@multigpu-once-null-defer-mmap:
    - shard-bmg:          [SKIP][265] ([Intel XE#6703]) -> [SKIP][266] ([Intel XE#2322]) +6 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-2/igt@xe_exec_basic@multigpu-once-null-defer-mmap.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-2/igt@xe_exec_basic@multigpu-once-null-defer-mmap.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - shard-bmg:          [SKIP][267] ([Intel XE#2322]) -> [SKIP][268] ([Intel XE#6703]) +6 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-4/igt@xe_exec_basic@multigpu-once-null-rebind.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@xe_exec_basic@multigpu-once-null-rebind.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate:
    - shard-bmg:          [SKIP][269] ([Intel XE#6874]) -> [SKIP][270] ([Intel XE#6703]) +18 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-8/igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate.html

  * igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem:
    - shard-bmg:          [SKIP][271] ([Intel XE#6703]) -> [SKIP][272] ([Intel XE#6874]) +26 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-5/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-8/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem.html

  * igt@xe_exec_system_allocator@many-64k-mmap-huge:
    - shard-bmg:          [SKIP][273] ([Intel XE#6703]) -> [SKIP][274] ([Intel XE#5007]) +1 other test skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-5/igt@xe_exec_system_allocator@many-64k-mmap-huge.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-9/igt@xe_exec_system_allocator@many-64k-mmap-huge.html

  * igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset:
    - shard-bmg:          [SKIP][275] ([Intel XE#6703]) -> [SKIP][276] ([Intel XE#4943]) +24 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-2/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-2/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-huge:
    - shard-bmg:          [SKIP][277] ([Intel XE#4943]) -> [SKIP][278] ([Intel XE#6703]) +9 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-4/igt@xe_exec_system_allocator@many-large-execqueues-mmap-huge.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@xe_exec_system_allocator@many-large-execqueues-mmap-huge.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-bmg:          [ABORT][279] ([Intel XE#5466]) -> [SKIP][280] ([Intel XE#6703])
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-2/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-bmg:          [SKIP][281] ([Intel XE#6703]) -> [SKIP][282] ([Intel XE#1420])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-5/igt@xe_pat@pat-index-xehpc.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-9/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pm@d3cold-basic:
    - shard-bmg:          [SKIP][283] ([Intel XE#2284]) -> [SKIP][284] ([Intel XE#6703])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-8/igt@xe_pm@d3cold-basic.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@d3cold-i2c:
    - shard-bmg:          [SKIP][285] ([Intel XE#5694]) -> [SKIP][286] ([Intel XE#6703])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-4/igt@xe_pm@d3cold-i2c.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@xe_pm@d3cold-i2c.html

  * igt@xe_pm@d3cold-mocs:
    - shard-bmg:          [SKIP][287] ([Intel XE#6703]) -> [SKIP][288] ([Intel XE#2284])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-5/igt@xe_pm@d3cold-mocs.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-9/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-rpm:
    - shard-bmg:          [SKIP][289] ([Intel XE#4733]) -> [SKIP][290] ([Intel XE#6703]) +1 other test skip
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-8/igt@xe_pxp@pxp-stale-bo-exec-post-rpm.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@xe_pxp@pxp-stale-bo-exec-post-rpm.html

  * igt@xe_pxp@pxp-termination-key-update-post-suspend:
    - shard-bmg:          [SKIP][291] ([Intel XE#6703]) -> [SKIP][292] ([Intel XE#4733]) +1 other test skip
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-5/igt@xe_pxp@pxp-termination-key-update-post-suspend.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-9/igt@xe_pxp@pxp-termination-key-update-post-suspend.html

  * igt@xe_query@multigpu-query-invalid-size:
    - shard-bmg:          [SKIP][293] ([Intel XE#6703]) -> [SKIP][294] ([Intel XE#944]) +1 other test skip
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-2/igt@xe_query@multigpu-query-invalid-size.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-2/igt@xe_query@multigpu-query-invalid-size.html

  * igt@xe_query@multigpu-query-topology-l3-bank-mask:
    - shard-bmg:          [SKIP][295] ([Intel XE#944]) -> [SKIP][296] ([Intel XE#6703]) +2 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-8/igt@xe_query@multigpu-query-topology-l3-bank-mask.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@xe_query@multigpu-query-topology-l3-bank-mask.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
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
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
  [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4674]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4674
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5299]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299
  [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
  [Intel XE#5937]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5937
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#6251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557
  [Intel XE#6599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599
  [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
  [Intel XE#6681]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6681
  [Intel XE#6693]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693
  [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
  [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
  [Intel XE#6740]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740
  [Intel XE#6743]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6743
  [Intel XE#6779]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6779
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
  [Intel XE#6913]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6913
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea -> xe-pw-159096v3

  IGT_8674: f38f4d8e9c65aff45ac807e646d06e38bc3193a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea: 1bfb5feb3a053cde358540d3547d53adb64b57ea
  xe-pw-159096v3: 159096v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/index.html

--===============6452651537228558146==
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
<tr><td><b>Series:</b></td><td>Survivability mode fixes (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/159096/">https://patchwork.freedesktop.org/series/159096/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea_FULL -&gt; xe-pw-159096v3_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-159096v3_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-159096v3_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-159096v3_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_cursor_edge_walk@256x256-right-edge:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-4/igt@kms_cursor_edge_walk@256x256-right-edge.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-2/igt@kms_cursor_edge_walk@256x256-right-edge.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-10/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-159096v3_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunplug-rescan:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-8/igt@core_hotunplug@hotunplug-rescan.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@core_hotunplug@hotunplug-rescan.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6779">Intel XE#6779</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-4/igt@fbdev@info.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-10/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-4/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-2/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-4/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-4/igt@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-10/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-1/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-4/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-modesetfrombusy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-4/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350">Intel XE#2350</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-4/igt@kms_hdr@bpc-switch-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-1/igt@kms_hdr@bpc-switch-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740">Intel XE#6740</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-9/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-4/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392">Intel XE#2392</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693">Intel XE#6693</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-4/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-no-drrs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-4/igt@kms_psr@psr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-4/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-10/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-empty:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-4/igt@xe_eudebug@discovery-empty.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@breakpoint-many-sessions-single-tile:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-4/igt@xe_eudebug_online@breakpoint-many-sessions-single-tile.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-10/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-8/igt@xe_exec_basic@many-bindexecqueue-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@xe_exec_basic@many-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +355 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-10/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-execs-priority:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-4/igt@xe_exec_multi_queue@many-execs-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-4/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-8/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-10/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-exec-after:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@xe_pm@s3-exec-after.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +308 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-lnl-5/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-lnl-3/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251">Intel XE#6251</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-10/igt@xe_sriov_auto_provisioning@selfconfig-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5937">Intel XE#5937</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-5/igt@core_setmaster@master-drop-set-user.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4674">Intel XE#4674</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-9/igt@core_setmaster@master-drop-set-user.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-5/igt@fbdev@nullptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-8/igt@fbdev@nullptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@unused-pitches:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-2/igt@kms_addfb_basic@unused-pitches.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-2/igt@kms_addfb_basic@unused-pitches.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-4/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373">Intel XE#2373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-2/igt@kms_feature_discovery@display-2x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-2/igt@kms_flip@2x-flip-vs-dpms.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-9/igt@kms_flip@2x-flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-8/igt@kms_flip@2x-flip-vs-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-3/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-2.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740">Intel XE#6740</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-10/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-2.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-2/igt@kms_pm_rpm@i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693">Intel XE#6693</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-2/igt@kms_pm_rpm@i2c.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-null-defer-bind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-2/igt@xe_exec_basic@many-execqueues-null-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-2/igt@xe_exec_basic@many-execqueues-null-defer-bind.html">PASS</a> +539 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-5/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-9/igt@xe_live_ktest@xe_bo.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-5/igt@xe_module_load@many-reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6913">Intel XE#6913</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-9/igt@xe_module_load@many-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_enhance0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-lnl-5/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_enhance0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251">Intel XE#6251</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-lnl-3/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_enhance0.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-4/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-5/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-8/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-8/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328">Intel XE#2328</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-9/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-9/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-8/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-9/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-2/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-2/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-4/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-8/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-9/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-2/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-2/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-8/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-8/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-4/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-5/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-8/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-suspend-resume:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-2/igt@kms_content_protection@dp-mst-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6743">Intel XE#6743</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@kms_content_protection@dp-mst-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-5/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-8/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-4/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-8/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707">Intel XE#6707</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-4/igt@kms_cursor_crc@cursor-offscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-64x21:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-8/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-2/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-2/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299">Intel XE#5299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-5/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-8/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-8/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331">Intel XE#4331</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-2/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-2/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-4/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-8/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-5/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-8/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-4/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-8/igt@kms_hdr@invalid-hdr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740">Intel XE#6740</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-8/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911">Intel XE#6911</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-5/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-8/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298">Intel XE#4298</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-5/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-9/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911">Intel XE#6911</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-5/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-9/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486">Intel XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-5/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-9/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329">Intel XE#4329</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-8/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393">Intel XE#2393</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-8/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-5/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-9/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391">Intel XE#2391</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-8/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693">Intel XE#6693</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693">Intel XE#6693</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-9/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-8/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-2/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-2/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-8/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-5/igt@kms_psr@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-9/igt@kms_psr@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-page-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-8/igt@kms_psr@psr2-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@kms_psr@psr2-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-8/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-5/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-8/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-4/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-scaler-downscale:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-5/igt@kms_sharpness_filter@filter-scaler-downscale.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-8/igt@kms_sharpness_filter@filter-scaler-downscale.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-plane:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-8/igt@kms_sharpness_filter@invalid-filter-with-plane.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@kms_sharpness_filter@invalid-filter-with-plane.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-8/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-5/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-9/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-5/igt@xe_compute@ccs-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-8/igt@xe_compute@ccs-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599">Intel XE#6599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-close:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-4/igt@xe_eudebug@basic-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@xe_eudebug@basic-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-reconnect:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-4/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-vm-destroy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-5/igt@xe_eudebug@basic-vm-bind-vm-destroy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-9/igt@xe_eudebug@basic-vm-bind-vm-destroy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@pagefault-read-stress:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-8/igt@xe_eudebug_online@pagefault-read-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6681">Intel XE#6681</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@xe_eudebug_online@pagefault-read-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint-faultable:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-4/igt@xe_eudebug_online@set-breakpoint-faultable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@xe_eudebug_online@set-breakpoint-faultable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-5/igt@xe_eudebug_online@single-step.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-8/igt@xe_eudebug_online@single-step.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-mmap:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-2/igt@xe_exec_basic@multigpu-once-null-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-2/igt@xe_exec_basic@multigpu-once-null-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-4/igt@xe_exec_basic@multigpu-once-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@xe_exec_basic@multigpu-once-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-8/igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-5/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-8/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-huge:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-5/igt@xe_exec_system_allocator@many-64k-mmap-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-9/igt@xe_exec_system_allocator@many-64k-mmap-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007">Intel XE#5007</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-2/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-2/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-huge:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-4/igt@xe_exec_system_allocator@many-large-execqueues-mmap-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@xe_exec_system_allocator@many-large-execqueues-mmap-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-2/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466">Intel XE#5466</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-5/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-9/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-8/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-i2c:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-4/igt@xe_pm@d3cold-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694">Intel XE#5694</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@xe_pm@d3cold-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-5/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-9/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-rpm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-8/igt@xe_pxp@pxp-stale-bo-exec-post-rpm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@xe_pxp@pxp-stale-bo-exec-post-rpm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-5/igt@xe_pxp@pxp-termination-key-update-post-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-9/igt@xe_pxp@pxp-termination-key-update-post-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-2/igt@xe_query@multigpu-query-invalid-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-2/igt@xe_query@multigpu-query-invalid-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology-l3-bank-mask:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea/shard-bmg-8/igt@xe_query@multigpu-query-topology-l3-bank-mask.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v3/shard-bmg-5/igt@xe_query@multigpu-query-topology-l3-bank-mask.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea -&gt; xe-pw-159096v3</li>
</ul>
<p>IGT_8674: f38f4d8e9c65aff45ac807e646d06e38bc3193a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4274-1bfb5feb3a053cde358540d3547d53adb64b57ea: 1bfb5feb3a053cde358540d3547d53adb64b57ea<br />
  xe-pw-159096v3: 159096v3</p>

</body>
</html>

--===============6452651537228558146==--
