Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA176C55ABF
	for <intel-xe@archiver.kernel.org>; Thu,  6 Aug 2026 09:15:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 550FD10F157;
	Thu,  6 Aug 2026 09:15:11 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B68D710F155;
 Thu,  6 Aug 2026 09:15:10 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2933406573168243562=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_Fix_device_page_migration_?=
 =?utf-8?q?in_low_memory_fallback_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 06 Aug 2026 09:15:10 -0000
Message-ID: <178600771073.24443.7107549999694372067@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260805231041.3791771-1-matthew.brost@intel.com>
In-Reply-To: <20260805231041.3791771-1-matthew.brost@intel.com>
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

--===============2933406573168243562==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fix device page migration in low memory fallback (rev3)
URL   : https://patchwork.freedesktop.org/series/171651/
State : success

== Summary ==

CI Bug Log - changes from xe-5548-ff9b76577dfe70713faaa2f19a30424ec9a51a18_FULL -> xe-pw-171651v3_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-171651v3_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-bmg:          [PASS][1] -> [FAIL][2] ([Intel XE#3718] / [Intel XE#6078])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5548-ff9b76577dfe70713faaa2f19a30424ec9a51a18/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2:
    - shard-bmg:          [PASS][3] -> [FAIL][4] ([Intel XE#6078])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5548-ff9b76577dfe70713faaa2f19a30424ec9a51a18/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2370])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-9/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#2327])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-9/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#1124]) +5 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-9/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_bw@linear-tiling-2-displays-target-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#367]) +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-9/igt@kms_bw@linear-tiling-2-displays-target-2160x1440p.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#3432]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2887]) +3 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-9/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2325] / [Intel XE#7358])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-9/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2252]) +4 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-9/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2390] / [Intel XE#6974])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-9/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_cursor_crc@cursor-offscreen-32x10:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2320]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-9/igt@kms_cursor_crc@cursor-offscreen-32x10.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2286] / [Intel XE#6035])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-9/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dsc@dsc-basic-ultrajoiner:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#8265]) +1 other test skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-9/igt@kms_dsc@dsc-basic-ultrajoiner.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2375])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-9/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@vrr:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#8586])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-9/igt@kms_feature_discovery@vrr.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [PASS][19] -> [FAIL][20] ([Intel XE#301]) +3 other tests fail
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5548-ff9b76577dfe70713faaa2f19a30424ec9a51a18/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2311]) +24 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-9/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#7061]) +5 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-9/igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#4141]) +4 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#7399])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2313]) +24 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-5:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#8303]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-9/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-5.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#7283])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-9/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#7794])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-9/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#1489]) +2 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-9/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr@fbc-pr-sprite-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2234] / [Intel XE#2850]) +3 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-9/igt@kms_psr@fbc-pr-sprite-plane-onoff.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2450] / [Intel XE#5857])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-9/igt@kms_tv_load_detect@load-detect.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#6599])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-9/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [PASS][33] -> [INCOMPLETE][34] ([Intel XE#6321] / [Intel XE#8355])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5548-ff9b76577dfe70713faaa2f19a30424ec9a51a18/shard-bmg-9/igt@xe_evict@evict-mixed-many-threads-small.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-10/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#2322] / [Intel XE#7372]) +2 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-9/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html

  * igt@xe_exec_fault_mode@twice-multi-queue-imm:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#8374]) +7 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-9/igt@xe_exec_fault_mode@twice-multi-queue-imm.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-dyn-priority:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#8364]) +12 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-9/igt@xe_exec_multi_queue@few-execs-preempt-mode-dyn-priority.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-userptr-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#8378]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-9/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-rebind.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:
    - shard-bmg:          [PASS][39] -> [ABORT][40] ([Intel XE#8007]) +2 other tests abort
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5548-ff9b76577dfe70713faaa2f19a30424ec9a51a18/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html

  * igt@xe_multigpu_svm@mgpu-latency-copy-basic:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#6964]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-9/igt@xe_multigpu_svm@mgpu-latency-copy-basic.html

  * igt@xe_page_reclaim@basic-mixed:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#7793])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-9/igt@xe_page_reclaim@basic-mixed.html

  * igt@xe_pat@pat-sw-hw-suspend:
    - shard-bmg:          NOTRUN -> [FAIL][43] ([Intel XE#7695])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-9/igt@xe_pat@pat-sw-hw-suspend.html

  * igt@xe_pm@d3cold-basic:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#2284] / [Intel XE#7370])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-9/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@d3cold-i2c:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#5694] / [Intel XE#7370])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-9/igt@xe_pm@d3cold-i2c.html

  * igt@xe_query@multigpu-query-topology-l3-bank-mask:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#944]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-9/igt@xe_query@multigpu-query-topology-l3-bank-mask.html

  * igt@xe_sriov_flr@flr-vfs-parallel:
    - shard-bmg:          NOTRUN -> [FAIL][47] ([Intel XE#6569])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-9/igt@xe_sriov_flr@flr-vfs-parallel.html

  
#### Possible fixes ####

  * igt@kms_sharpness_filter@invalid-plane-with-filter@pipe-a-edp-1-invalid-plane-with-filter:
    - shard-lnl:          [DMESG-WARN][48] ([Intel XE#8551]) -> [PASS][49] +1 other test pass
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5548-ff9b76577dfe70713faaa2f19a30424ec9a51a18/shard-lnl-3/igt@kms_sharpness_filter@invalid-plane-with-filter@pipe-a-edp-1-invalid-plane-with-filter.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-lnl-5/igt@kms_sharpness_filter@invalid-plane-with-filter@pipe-a-edp-1-invalid-plane-with-filter.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][50] ([Intel XE#6321] / [Intel XE#8355]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5548-ff9b76577dfe70713faaa2f19a30424ec9a51a18/shard-bmg-4/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-1/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_exec_threads@threads-mixed-basic:
    - shard-bmg:          [DMESG-WARN][52] ([Intel XE#8300]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5548-ff9b76577dfe70713faaa2f19a30424ec9a51a18/shard-bmg-9/igt@xe_exec_threads@threads-mixed-basic.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-10/igt@xe_exec_threads@threads-mixed-basic.html

  * igt@xe_fault_injection@vm-create-fail-xe_pt_create:
    - shard-bmg:          [ABORT][54] ([Intel XE#8007]) -> [PASS][55] +1 other test pass
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5548-ff9b76577dfe70713faaa2f19a30424ec9a51a18/shard-bmg-3/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-9/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html

  * igt@xe_sriov_auto_provisioning@fair-allocation@numvfs-random:
    - shard-bmg:          [FAIL][56] ([Intel XE#7992]) -> [PASS][57] +1 other test pass
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5548-ff9b76577dfe70713faaa2f19a30424ec9a51a18/shard-bmg-9/igt@xe_sriov_auto_provisioning@fair-allocation@numvfs-random.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-2/igt@xe_sriov_auto_provisioning@fair-allocation@numvfs-random.html

  
#### Warnings ####

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][58] ([Intel XE#1729] / [Intel XE#7424]) -> [SKIP][59] ([Intel XE#2426] / [Intel XE#5848])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5548-ff9b76577dfe70713faaa2f19a30424ec9a51a18/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5857]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5857
  [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
  [Intel XE#6599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794
  [Intel XE#7992]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8300]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8300
  [Intel XE#8303]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303
  [Intel XE#8355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8551
  [Intel XE#8586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8586
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-5548-ff9b76577dfe70713faaa2f19a30424ec9a51a18 -> xe-pw-171651v3

  IGT_9039: 9039
  xe-5548-ff9b76577dfe70713faaa2f19a30424ec9a51a18: ff9b76577dfe70713faaa2f19a30424ec9a51a18
  xe-pw-171651v3: 171651v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/index.html

--===============2933406573168243562==
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
<tr><td><b>Series:</b></td><td>Fix device page migration in low memory fallback (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/171651/">https://patchwork.freedesktop.org/series/171651/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5548-ff9b76577dfe70713faaa2f19a30424ec9a51a18_FULL -&gt; xe-pw-171651v3_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-171651v3_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5548-ff9b76577dfe70713faaa2f19a30424ec9a51a18/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5548-ff9b76577dfe70713faaa2f19a30424ec9a51a18/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-9/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-9/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-9/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-target-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-9/igt@kms_bw@linear-tiling-2-displays-target-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-9/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-9/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-9/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-9/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x10:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-9/igt@kms_cursor_crc@cursor-offscreen-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-9/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035">Intel XE#6035</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic-ultrajoiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-9/igt@kms_dsc@dsc-basic-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-9/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375">Intel XE#2375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@vrr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-9/igt@kms_feature_discovery@vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8586">Intel XE#8586</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5548-ff9b76577dfe70713faaa2f19a30424ec9a51a18/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-9/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-9/igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-5:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-9/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303">Intel XE#8303</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-9/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-9/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794">Intel XE#7794</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-9/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-9/igt@kms_psr@fbc-pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-9/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450">Intel XE#2450</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5857">Intel XE#5857</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-9/igt@xe_compute@ccs-mode-compute-kernel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599">Intel XE#6599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5548-ff9b76577dfe70713faaa2f19a30424ec9a51a18/shard-bmg-9/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-10/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355">Intel XE#8355</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-9/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-imm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-9/igt@xe_exec_fault_mode@twice-multi-queue-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-dyn-priority:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-9/igt@xe_exec_multi_queue@few-execs-preempt-mode-dyn-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-userptr-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-9/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5548-ff9b76577dfe70713faaa2f19a30424ec9a51a18/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) +2 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-latency-copy-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-9/igt@xe_multigpu_svm@mgpu-latency-copy-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@basic-mixed:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-9/igt@xe_page_reclaim@basic-mixed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-sw-hw-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-9/igt@xe_pat@pat-sw-hw-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695">Intel XE#7695</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-9/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-i2c:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-9/igt@xe_pm@d3cold-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694">Intel XE#5694</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology-l3-bank-mask:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-9/igt@xe_query@multigpu-query-topology-l3-bank-mask.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vfs-parallel:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-9/igt@xe_sriov_flr@flr-vfs-parallel.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569">Intel XE#6569</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_sharpness_filter@invalid-plane-with-filter@pipe-a-edp-1-invalid-plane-with-filter:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5548-ff9b76577dfe70713faaa2f19a30424ec9a51a18/shard-lnl-3/igt@kms_sharpness_filter@invalid-plane-with-filter@pipe-a-edp-1-invalid-plane-with-filter.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8551">Intel XE#8551</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-lnl-5/igt@kms_sharpness_filter@invalid-plane-with-filter@pipe-a-edp-1-invalid-plane-with-filter.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5548-ff9b76577dfe70713faaa2f19a30424ec9a51a18/shard-bmg-4/igt@xe_evict@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355">Intel XE#8355</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-1/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5548-ff9b76577dfe70713faaa2f19a30424ec9a51a18/shard-bmg-9/igt@xe_exec_threads@threads-mixed-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8300">Intel XE#8300</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-10/igt@xe_exec_threads@threads-mixed-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_pt_create:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5548-ff9b76577dfe70713faaa2f19a30424ec9a51a18/shard-bmg-3/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-9/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@fair-allocation@numvfs-random:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5548-ff9b76577dfe70713faaa2f19a30424ec9a51a18/shard-bmg-9/igt@xe_sriov_auto_provisioning@fair-allocation@numvfs-random.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992">Intel XE#7992</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-2/igt@xe_sriov_auto_provisioning@fair-allocation@numvfs-random.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_tiled_display@basic-test-pattern:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5548-ff9b76577dfe70713faaa2f19a30424ec9a51a18/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171651v3/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5548-ff9b76577dfe70713faaa2f19a30424ec9a51a18 -&gt; xe-pw-171651v3</li>
</ul>
<p>IGT_9039: 9039<br />
  xe-5548-ff9b76577dfe70713faaa2f19a30424ec9a51a18: ff9b76577dfe70713faaa2f19a30424ec9a51a18<br />
  xe-pw-171651v3: 171651v3</p>

</body>
</html>

--===============2933406573168243562==--
