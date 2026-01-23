Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A1B7D778B1
	for <intel-xe@archiver.kernel.org>; Fri, 23 Jan 2026 23:16:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3531410EC03;
	Fri, 23 Jan 2026 23:16:30 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 551CA10EC00;
 Fri, 23 Jan 2026 23:16:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============9197094279139805740=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe=3A_Use_IS=5FENABLED?=
 =?utf-8?q?=28=29_for_config_checks_instead_of_defined=28=29_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nitin Gote" <nitin.r.gote@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 23 Jan 2026 23:16:28 -0000
Message-ID: <176921018834.189692.547638821212196970@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251202070231.187562-2-nitin.r.gote@intel.com>
In-Reply-To: <20251202070231.187562-2-nitin.r.gote@intel.com>
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

--===============9197094279139805740==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Use IS_ENABLED() for config checks instead of defined() (rev3)
URL   : https://patchwork.freedesktop.org/series/158176/
State : failure

== Summary ==

CI Bug Log - changes from xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff_FULL -> xe-pw-158176v3_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-158176v3_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-158176v3_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-158176v3_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-9/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@xe_module_load@force-load:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-10/igt@xe_module_load@force-load.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-lnl:          [PASS][4] -> [DMESG-WARN][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-lnl-8/igt@xe_pm@s4-vm-bind-unbind-all.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-lnl-7/igt@xe_pm@s4-vm-bind-unbind-all.html

  
Known issues
------------

  Here are the changes found in xe-pw-158176v3_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotunplug-rescan:
    - shard-bmg:          [PASS][6] -> [SKIP][7] ([Intel XE#6779])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-9/igt@core_hotunplug@hotunplug-rescan.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-2/igt@core_hotunplug@hotunplug-rescan.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2233])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-9/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_atomic@plane-invalid-params-fence@pipe-a-edp-1:
    - shard-lnl:          [PASS][9] -> [DMESG-WARN][10] ([Intel XE#7063])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-lnl-3/igt@kms_atomic@plane-invalid-params-fence@pipe-a-edp-1.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-lnl-5/igt@kms_atomic@plane-invalid-params-fence@pipe-a-edp-1.html

  * igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing:
    - shard-bmg:          NOTRUN -> [ABORT][11] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#4760])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-10/igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing.html

  * igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [ABORT][12] ([Intel XE#2705] / [Intel XE#4760])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-10/igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-a-dp-2.html

  * igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][13] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#6819])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-10/igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-a-hdmi-a-3.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#7059])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-9/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#1124]) +4 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-3/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#607])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-9/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2314] / [Intel XE#2894])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-3/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#367]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-9/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2887]) +5 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-9/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#3432])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2252]) +5 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-9/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2390] / [Intel XE#6974])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-3/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2321]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-9/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2320])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-9/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#4331])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-9/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [PASS][26] -> [FAIL][27] ([Intel XE#301] / [Intel XE#3149]) +1 other test fail
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [PASS][28] -> [FAIL][29] ([Intel XE#301]) +2 other tests fail
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2293] / [Intel XE#2380]) +2 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2293]) +2 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2311]) +17 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#4141]) +10 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#7061]) +3 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#2313]) +14 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - shard-bmg:          [PASS][36] -> [SKIP][37] ([Intel XE#6693])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-9/igt@kms_pm_rpm@basic-pci-d3-state.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-2/igt@kms_pm_rpm@basic-pci-d3-state.html

  * igt@kms_pm_rpm@package-g7:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#6814])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-3/igt@kms_pm_rpm@package-g7.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#1406] / [Intel XE#1489]) +2 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-4/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#1406] / [Intel XE#2387])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-9/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-primary-blt:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +6 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-3/igt@kms_psr@fbc-pr-primary-blt.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2330])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_sharpness_filter@filter-rotations:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#6503])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-9/igt@kms_sharpness_filter@filter-rotations.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][44] -> [FAIL][45] ([Intel XE#4459]) +1 other test fail
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@kms_vrr@flip-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#1499])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-9/igt@kms_vrr@flip-dpms.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#6599])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-9/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2504])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-9/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_eudebug@vm-bind-clear:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#4837]) +3 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-3/igt@xe_eudebug@vm-bind-clear.html

  * igt@xe_eudebug_online@pagefault-write:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#4837] / [Intel XE#6665]) +3 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-10/igt@xe_eudebug_online@pagefault-write.html

  * igt@xe_evict@evict-small-external-multi-queue-cm:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#7140])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-9/igt@xe_evict@evict-small-external-multi-queue-cm.html

  * igt@xe_exec_balancer@many-parallel-userptr-invalidate-race:
    - shard-bmg:          [PASS][52] -> [SKIP][53] ([Intel XE#6557] / [Intel XE#6703]) +3 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-9/igt@xe_exec_balancer@many-parallel-userptr-invalidate-race.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-2/igt@xe_exec_balancer@many-parallel-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#2322]) +6 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-9/igt@xe_exec_basic@multigpu-once-null-rebind.html

  * igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-imm:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#7136]) +7 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-9/igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-imm.html

  * igt@xe_exec_multi_queue@one-queue-priority-smem:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#6874]) +16 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-10/igt@xe_exec_multi_queue@one-queue-priority-smem.html

  * igt@xe_exec_system_allocator@many-64k-mmap-free-nomemset:
    - shard-bmg:          [PASS][57] -> [SKIP][58] ([Intel XE#6703]) +117 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-9/igt@xe_exec_system_allocator@many-64k-mmap-free-nomemset.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-2/igt@xe_exec_system_allocator@many-64k-mmap-free-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#4943]) +11 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-9/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge.html

  * igt@xe_exec_threads@threads-multi-queue-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#7138]) +4 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-9/igt@xe_exec_threads@threads-multi-queue-rebind.html

  * igt@xe_multigpu_svm@mgpu-atomic-op-basic:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#6964]) +1 other test skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-3/igt@xe_multigpu_svm@mgpu-atomic-op-basic.html

  * igt@xe_pat@pat-index-xelp:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#2245])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-9/igt@xe_pat@pat-index-xelp.html

  * igt@xe_peer2peer@write:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2427] / [Intel XE#6953])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-3/igt@xe_peer2peer@write.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#579])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-3/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pxp@display-black-pxp-fb:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#4733])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-9/igt@xe_pxp@display-black-pxp-fb.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#944]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-4/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-bmg:          [FAIL][67] ([Intel XE#5299]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-bmg:          [ABORT][69] ([Intel XE#5175]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-4.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-9/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_multiple@2x-tiling-4@pipe-c-hdmi-a-3-pipe-a-dp-2:
    - shard-bmg:          [ABORT][71] ([Intel XE#5545]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-4@pipe-c-hdmi-a-3-pipe-a-dp-2.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-9/igt@kms_plane_multiple@2x-tiling-4@pipe-c-hdmi-a-3-pipe-a-dp-2.html

  * igt@kms_plane_multiple@tiling-none:
    - shard-bmg:          [INCOMPLETE][73] ([Intel XE#5175]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-2/igt@kms_plane_multiple@tiling-none.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-9/igt@kms_plane_multiple@tiling-none.html

  * igt@kms_plane_multiple@tiling-none@pipe-d-hdmi-a-3:
    - shard-bmg:          [INCOMPLETE][75] -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-2/igt@kms_plane_multiple@tiling-none@pipe-d-hdmi-a-3.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-9/igt@kms_plane_multiple@tiling-none@pipe-d-hdmi-a-3.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][77] ([Intel XE#6321]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-4/igt@xe_evict@evict-mixed-many-threads-small.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-10/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_pmu@engine-activity-accuracy-50:
    - shard-lnl:          [FAIL][79] ([Intel XE#7072]) -> [PASS][80] +1 other test pass
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-lnl-2/igt@xe_pmu@engine-activity-accuracy-50.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-lnl-2/igt@xe_pmu@engine-activity-accuracy-50.html

  
#### Warnings ####

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-bmg:          [SKIP][81] ([Intel XE#2370]) -> [SKIP][82] ([Intel XE#6703])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-9/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-bmg:          [SKIP][83] ([Intel XE#2327]) -> [SKIP][84] ([Intel XE#6703]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-9/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-2/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-bmg:          [SKIP][85] ([Intel XE#1124]) -> [SKIP][86] ([Intel XE#6703]) +2 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-9/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
    - shard-bmg:          [SKIP][87] ([Intel XE#367]) -> [SKIP][88] ([Intel XE#6703])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-9/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-2/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs:
    - shard-bmg:          [SKIP][89] ([Intel XE#2887]) -> [SKIP][90] ([Intel XE#6703]) +3 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-9/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-bmg:          [SKIP][91] ([Intel XE#2252]) -> [SKIP][92] ([Intel XE#6703])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-9/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-2/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-bmg:          [SKIP][93] ([Intel XE#4354]) -> [SKIP][94] ([Intel XE#6703])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-9/igt@kms_dp_link_training@uhbr-sst.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-2/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-bmg:          [SKIP][95] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][96] ([Intel XE#6703])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-9/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][97] ([Intel XE#2311]) -> [SKIP][98] ([Intel XE#6703]) +6 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][99] ([Intel XE#4141]) -> [ABORT][100] ([Intel XE#5545])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][101] ([Intel XE#4141]) -> [SKIP][102] ([Intel XE#6703]) +2 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render:
    - shard-bmg:          [SKIP][103] ([Intel XE#7061]) -> [SKIP][104] ([Intel XE#6703])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][105] ([Intel XE#2313]) -> [SKIP][106] ([Intel XE#6703]) +6 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-bmg:          [SKIP][107] ([Intel XE#6901]) -> [SKIP][108] ([Intel XE#6703])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-9/igt@kms_joiner@invalid-modeset-big-joiner.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-2/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:
    - shard-bmg:          [SKIP][109] ([Intel XE#1406] / [Intel XE#1489]) -> [SKIP][110] ([Intel XE#1406] / [Intel XE#6703])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-9/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-2/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr@fbc-psr-basic:
    - shard-bmg:          [SKIP][111] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) -> [SKIP][112] ([Intel XE#1406] / [Intel XE#6703]) +1 other test skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-9/igt@kms_psr@fbc-psr-basic.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-2/igt@kms_psr@fbc-psr-basic.html

  * igt@kms_vrr@lobf:
    - shard-bmg:          [SKIP][113] ([Intel XE#2168]) -> [SKIP][114] ([Intel XE#6703])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-9/igt@kms_vrr@lobf.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-2/igt@kms_vrr@lobf.html

  * igt@xe_eudebug@basic-vm-bind-extended:
    - shard-bmg:          [SKIP][115] ([Intel XE#4837]) -> [SKIP][116] ([Intel XE#6703])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-9/igt@xe_eudebug@basic-vm-bind-extended.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-2/igt@xe_eudebug@basic-vm-bind-extended.html

  * igt@xe_eudebug_online@set-breakpoint-sigint-debugger:
    - shard-bmg:          [SKIP][117] ([Intel XE#4837] / [Intel XE#6665]) -> [SKIP][118] ([Intel XE#6703]) +1 other test skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-9/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-2/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:
    - shard-bmg:          [SKIP][119] ([Intel XE#2322]) -> [SKIP][120] ([Intel XE#6703])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-9/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm:
    - shard-bmg:          [SKIP][121] ([Intel XE#7136]) -> [SKIP][122] ([Intel XE#6703]) +1 other test skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-9/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-2/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm.html

  * igt@xe_exec_multi_queue@two-queues-userptr:
    - shard-bmg:          [SKIP][123] ([Intel XE#6874]) -> [SKIP][124] ([Intel XE#6703]) +6 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-9/igt@xe_exec_multi_queue@two-queues-userptr.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-2/igt@xe_exec_multi_queue@two-queues-userptr.html

  * igt@xe_exec_system_allocator@threads-many-large-mmap-huge-nomemset:
    - shard-bmg:          [SKIP][125] ([Intel XE#4943]) -> [SKIP][126] ([Intel XE#6703]) +9 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-9/igt@xe_exec_system_allocator@threads-many-large-mmap-huge-nomemset.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-large-mmap-huge-nomemset.html

  * igt@xe_exec_threads@threads-multi-queue-fd-userptr-invalidate:
    - shard-bmg:          [SKIP][127] ([Intel XE#7138]) -> [SKIP][128] ([Intel XE#6703]) +1 other test skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-9/igt@xe_exec_threads@threads-multi-queue-fd-userptr-invalidate.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-fd-userptr-invalidate.html

  * igt@xe_pm@d3hot-i2c:
    - shard-bmg:          [SKIP][129] ([Intel XE#5742]) -> [SKIP][130] ([Intel XE#6703])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-9/igt@xe_pm@d3hot-i2c.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-2/igt@xe_pm@d3hot-i2c.html

  * igt@xe_pxp@pxp-termination-key-update-post-suspend:
    - shard-bmg:          [SKIP][131] ([Intel XE#4733]) -> [SKIP][132] ([Intel XE#6703])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-9/igt@xe_pxp@pxp-termination-key-update-post-suspend.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-2/igt@xe_pxp@pxp-termination-key-update-post-suspend.html

  * igt@xe_query@multigpu-query-topology-l3-bank-mask:
    - shard-bmg:          [SKIP][133] ([Intel XE#944]) -> [SKIP][134] ([Intel XE#6703])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-9/igt@xe_query@multigpu-query-topology-l3-bank-mask.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-2/igt@xe_query@multigpu-query-topology-l3-bank-mask.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5175]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5175
  [Intel XE#5299]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5742]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557
  [Intel XE#6599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599
  [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
  [Intel XE#6693]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693
  [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
  [Intel XE#6779]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6779
  [Intel XE#6814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6814
  [Intel XE#6819]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6819
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#6901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901
  [Intel XE#6953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7063]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7063
  [Intel XE#7072]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7072
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#7140]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff -> xe-pw-158176v3

  IGT_8715: 8715
  xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff: 4a255b429d80f8b0800bdef43ba3175b771e77ff
  xe-pw-158176v3: 158176v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/index.html

--===============9197094279139805740==
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
<tr><td><b>Series:</b></td><td>drm/xe: Use IS_ENABLED() for config checks instead of defined() (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/158176/">https://patchwork.freedesktop.org/series/158176/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff_FULL -&gt; xe-pw-158176v3_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-158176v3_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-158176v3_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-158176v3_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-9/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-10/igt@xe_module_load@force-load.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-lnl-8/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-lnl-7/igt@xe_pm@s4-vm-bind-unbind-all.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-158176v3_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunplug-rescan:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-9/igt@core_hotunplug@hotunplug-rescan.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-2/igt@core_hotunplug@hotunplug-rescan.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6779">Intel XE#6779</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-9/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233">Intel XE#2233</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-invalid-params-fence@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-lnl-3/igt@kms_atomic@plane-invalid-params-fence@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-lnl-5/igt@kms_atomic@plane-invalid-params-fence@pipe-a-edp-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7063">Intel XE#7063</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-10/igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760">Intel XE#4760</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-10/igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-a-dp-2.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760">Intel XE#4760</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-10/igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-a-hdmi-a-3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6819">Intel XE#6819</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-9/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059">Intel XE#7059</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-3/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-9/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-3/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-9/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-9/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-9/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-3/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-9/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-9/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-9/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331">Intel XE#4331</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-9/igt@kms_pm_rpm@basic-pci-d3-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-2/igt@kms_pm_rpm@basic-pci-d3-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693">Intel XE#6693</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@package-g7:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-3/igt@kms_pm_rpm@package-g7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6814">Intel XE#6814</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-4/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-9/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-3/igt@kms_psr@fbc-pr-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-rotations:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-9/igt@kms_sharpness_filter@filter-rotations.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459">Intel XE#4459</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-9/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-9/igt@xe_compute@ccs-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599">Intel XE#6599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-9/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504">Intel XE#2504</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@vm-bind-clear:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-3/igt@xe_eudebug@vm-bind-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@pagefault-write:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-10/igt@xe_eudebug_online@pagefault-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-multi-queue-cm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-9/igt@xe_evict@evict-small-external-multi-queue-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140">Intel XE#7140</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-parallel-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-9/igt@xe_exec_balancer@many-parallel-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-2/igt@xe_exec_balancer@many-parallel-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-9/igt@xe_exec_basic@multigpu-once-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-9/igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-priority-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-10/igt@xe_exec_multi_queue@one-queue-priority-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-free-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-9/igt@xe_exec_system_allocator@many-64k-mmap-free-nomemset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-2/igt@xe_exec_system_allocator@many-64k-mmap-free-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +117 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-9/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-9/igt@xe_exec_threads@threads-multi-queue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-atomic-op-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-3/igt@xe_multigpu_svm@mgpu-atomic-op-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-9/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-3/igt@xe_peer2peer@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">Intel XE#2427</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953">Intel XE#6953</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-3/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-black-pxp-fb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-9/igt@xe_pxp@display-black-pxp-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-4/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299">Intel XE#5299</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-4.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5175">Intel XE#5175</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-9/igt@kms_plane_multiple@2x-tiling-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4@pipe-c-hdmi-a-3-pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-4@pipe-c-hdmi-a-3-pipe-a-dp-2.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-9/igt@kms_plane_multiple@2x-tiling-4@pipe-c-hdmi-a-3-pipe-a-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-none:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-2/igt@kms_plane_multiple@tiling-none.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5175">Intel XE#5175</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-9/igt@kms_plane_multiple@tiling-none.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-none@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-2/igt@kms_plane_multiple@tiling-none@pipe-d-hdmi-a-3.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-9/igt@kms_plane_multiple@tiling-none@pipe-d-hdmi-a-3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-4/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-10/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-50:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-lnl-2/igt@xe_pmu@engine-activity-accuracy-50.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7072">Intel XE#7072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-lnl-2/igt@xe_pmu@engine-activity-accuracy-50.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-9/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-9/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-2/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-9/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-9/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-2/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-9/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-9/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-2/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-9/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-2/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-9/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-9/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901">Intel XE#6901</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-2/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-9/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-2/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-9/igt@kms_psr@fbc-psr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-2/igt@kms_psr@fbc-psr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-9/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-2/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-extended:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-9/igt@xe_eudebug@basic-vm-bind-extended.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-2/igt@xe_eudebug@basic-vm-bind-extended.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint-sigint-debugger:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-9/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-2/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-9/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-9/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-2/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-9/igt@xe_exec_multi_queue@two-queues-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-2/igt@xe_exec_multi_queue@two-queues-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-huge-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-9/igt@xe_exec_system_allocator@threads-many-large-mmap-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-large-mmap-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-fd-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-9/igt@xe_exec_threads@threads-multi-queue-fd-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-fd-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-i2c:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-9/igt@xe_pm@d3hot-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742">Intel XE#5742</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-2/igt@xe_pm@d3hot-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-9/igt@xe_pxp@pxp-termination-key-update-post-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-2/igt@xe_pxp@pxp-termination-key-update-post-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology-l3-bank-mask:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff/shard-bmg-9/igt@xe_query@multigpu-query-topology-l3-bank-mask.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158176v3/shard-bmg-2/igt@xe_query@multigpu-query-topology-l3-bank-mask.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff -&gt; xe-pw-158176v3</li>
</ul>
<p>IGT_8715: 8715<br />
  xe-4441-4a255b429d80f8b0800bdef43ba3175b771e77ff: 4a255b429d80f8b0800bdef43ba3175b771e77ff<br />
  xe-pw-158176v3: 158176v3</p>

</body>
</html>

--===============9197094279139805740==--
