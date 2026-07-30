Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C523C531D0
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jul 2026 06:39:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E15010EDC7;
	Thu, 30 Jul 2026 06:39:15 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4F0E10EDC2;
 Thu, 30 Jul 2026 06:39:13 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8779196617419442101=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/xe/pm=3A_do_not_warn_a?=
 =?utf-8?q?bout_missing_runtime_PM_protection_after_hot-unplug?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nitin Gote" <nitin.r.gote@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 30 Jul 2026 06:39:13 -0000
Message-ID: <178539355372.2830.323411145946716776@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260730053635.1515929-2-nitin.r.gote@intel.com>
In-Reply-To: <20260730053635.1515929-2-nitin.r.gote@intel.com>
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

--===============8779196617419442101==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/pm: do not warn about missing runtime PM protection after hot-unplug
URL   : https://patchwork.freedesktop.org/series/171320/
State : success

== Summary ==

CI Bug Log - changes from xe-5507-593120331e000d147d0c405b446c82de0740c57e_FULL -> xe-pw-171320v1_FULL
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

  Here are the changes found in xe-pw-171320v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@unaligned-read:
    - shard-bmg:          [PASS][1] -> [SKIP][2] ([Intel XE#2134]) +3 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-10/igt@fbdev@unaligned-read.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@fbdev@unaligned-read.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#2327]) +3 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-4/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#610] / [Intel XE#7387])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-2/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#1124]) +2 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-6/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#2887]) +6 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-2/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2652]) +8 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-4/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#8714]) +166 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2252])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-2/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_content_protection@dp-mst-type-1-suspend-resume:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#6974])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-9/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][11] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +1 other test fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-10/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_content_protection@uevent-hdcp14@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][12] ([Intel XE#6707] / [Intel XE#7439])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-5/igt@kms_content_protection@uevent-hdcp14@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-offscreen-32x10:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2320]) +3 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-32x10.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#8265]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-8/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#4422] / [Intel XE#7442])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-2/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [PASS][16] -> [FAIL][17] ([Intel XE#301]) +2 other tests fail
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#7178] / [Intel XE#7349])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#7061] / [Intel XE#7356])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#4141]) +2 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2311]) +28 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#7061]) +4 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2313]) +20 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#6911] / [Intel XE#7378])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-4/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#8303]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-9/igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5.html

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#7283]) +3 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-4/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [PASS][27] -> [FAIL][28] ([Intel XE#8399])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-lnl-3/igt@kms_pm_dc@dc5-psr.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-lnl-3/igt@kms_pm_dc@dc5-psr.html
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#7794])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-10/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2499])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-10/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#1489]) +2 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-10/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2387] / [Intel XE#7429])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-4/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@psr2-sprite-blt:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2234] / [Intel XE#2850]) +3 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-8/igt@kms_psr@psr2-sprite-blt.html

  * igt@kms_sharpness_filter@invalid-plane-with-filter:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#6503]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-2/igt@kms_sharpness_filter@invalid-plane-with-filter.html

  * igt@kms_vrr@max-min:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#1499]) +2 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-10/igt@kms_vrr@max-min.html

  * igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-rebind:
    - shard-bmg:          [PASS][36] -> [SKIP][37] ([Intel XE#8714]) +638 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-6/igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-rebind.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-once-userptr-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2322] / [Intel XE#7372]) +2 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-9/igt@xe_exec_basic@multigpu-once-userptr-rebind.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#8374]) +3 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-3/igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind-prefetch.html

  * igt@xe_exec_multi_queue@many-queues-basic-smem:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#8364]) +6 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-10/igt@xe_exec_multi_queue@many-queues-basic-smem.html

  * igt@xe_exec_reset@multi-queue-close-fd:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#8369])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-1/igt@xe_exec_reset@multi-queue-close-fd.html

  * igt@xe_exec_system_allocator@many-stride-new-prefetch:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][42] ([Intel XE#7098] / [Intel XE#8159])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-6/igt@xe_exec_system_allocator@many-stride-new-prefetch.html

  * igt@xe_exec_threads@threads-multi-queue-fd-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#8378]) +2 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-fd-userptr-invalidate-race.html

  * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:
    - shard-bmg:          [PASS][44] -> [ABORT][45] ([Intel XE#8007])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-9/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html

  * igt@xe_module_load@reload-no-display:
    - shard-bmg:          [PASS][46] -> [FAIL][47] ([Intel XE#8714]) +1 other test fail
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-5/igt@xe_module_load@reload-no-display.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@xe_module_load@reload-no-display.html

  * igt@xe_multigpu_svm@mgpu-pagefault-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#6964] / [Intel XE#8714])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@xe_multigpu_svm@mgpu-pagefault-prefetch.html

  * igt@xe_page_reclaim@invalid-1g:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#7793]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-5/igt@xe_page_reclaim@invalid-1g.html

  * igt@xe_pat@pat-sw-hw-suspend:
    - shard-bmg:          NOTRUN -> [FAIL][50] ([Intel XE#7695])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-2/igt@xe_pat@pat-sw-hw-suspend.html

  * igt@xe_pm@d3hot-i2c:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#5742] / [Intel XE#7328] / [Intel XE#7400])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-5/igt@xe_pm@d3hot-i2c.html

  * igt@xe_prefetch_fault@prefetch-fault-svm:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#7599])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-5/igt@xe_prefetch_fault@prefetch-fault-svm.html

  * igt@xe_query@multigpu-query-hwconfig:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#944])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-8/igt@xe_query@multigpu-query-hwconfig.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][54] ([Intel XE#5545])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-2/igt@xe_wedged@wedged-at-any-timeout.html

  
#### Possible fixes ####

  * igt@intel_hwmon@hwmon-write:
    - shard-bmg:          [SKIP][55] ([Intel XE#5177]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@intel_hwmon@hwmon-write.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-9/igt@intel_hwmon@hwmon-write.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [FAIL][57] ([Intel XE#7571]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][59] ([Intel XE#6321] / [Intel XE#8355]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-10/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-9/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_exec_system_allocator@once-mmap-new-nomemset:
    - shard-bmg:          [SKIP][61] ([Intel XE#8714]) -> [PASS][62] +626 other tests pass
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@xe_exec_system_allocator@once-mmap-new-nomemset.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-4/igt@xe_exec_system_allocator@once-mmap-new-nomemset.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_wa_gt_init:
    - shard-bmg:          [ABORT][63] ([Intel XE#8007]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-9/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_gt_init.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_gt_init.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][65], [PASS][66], [PASS][67], [PASS][68], [PASS][69], [PASS][70], [PASS][71], [PASS][72], [PASS][73], [PASS][74], [PASS][75], [PASS][76], [PASS][77], [PASS][78], [PASS][79], [PASS][80], [PASS][81], [PASS][82], [PASS][83], [SKIP][84], [PASS][85], [PASS][86], [PASS][87], [PASS][88], [PASS][89], [PASS][90]) ([Intel XE#2457] / [Intel XE#7405]) -> ([PASS][91], [PASS][92], [PASS][93], [PASS][94], [PASS][95], [PASS][96], [PASS][97], [PASS][98], [PASS][99], [PASS][100], [PASS][101], [PASS][102], [PASS][103], [PASS][104], [PASS][105], [PASS][106], [PASS][107], [PASS][108], [PASS][109], [PASS][110], [PASS][111], [PASS][112], [PASS][113], [PASS][114], [PASS][115])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@xe_module_load@load.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-3/igt@xe_module_load@load.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@xe_module_load@load.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@xe_module_load@load.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@xe_module_load@load.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@xe_module_load@load.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-4/igt@xe_module_load@load.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-3/igt@xe_module_load@load.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-1/igt@xe_module_load@load.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@xe_module_load@load.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-9/igt@xe_module_load@load.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-9/igt@xe_module_load@load.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-6/igt@xe_module_load@load.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-4/igt@xe_module_load@load.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-4/igt@xe_module_load@load.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-8/igt@xe_module_load@load.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-5/igt@xe_module_load@load.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-5/igt@xe_module_load@load.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-1/igt@xe_module_load@load.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-4/igt@xe_module_load@load.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-8/igt@xe_module_load@load.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-6/igt@xe_module_load@load.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-10/igt@xe_module_load@load.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-10/igt@xe_module_load@load.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-2/igt@xe_module_load@load.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-2/igt@xe_module_load@load.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-2/igt@xe_module_load@load.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-8/igt@xe_module_load@load.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-4/igt@xe_module_load@load.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-5/igt@xe_module_load@load.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-9/igt@xe_module_load@load.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-6/igt@xe_module_load@load.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-2/igt@xe_module_load@load.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-9/igt@xe_module_load@load.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-5/igt@xe_module_load@load.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-6/igt@xe_module_load@load.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-10/igt@xe_module_load@load.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@xe_module_load@load.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-8/igt@xe_module_load@load.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@xe_module_load@load.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-3/igt@xe_module_load@load.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@xe_module_load@load.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@xe_module_load@load.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-3/igt@xe_module_load@load.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@xe_module_load@load.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-4/igt@xe_module_load@load.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@xe_module_load@load.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-1/igt@xe_module_load@load.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-1/igt@xe_module_load@load.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-10/igt@xe_module_load@load.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-9/igt@xe_module_load@load.html

  * igt@xe_pmu@engine-activity-accuracy-50:
    - shard-bmg:          [FAIL][116] ([Intel XE#8555]) -> [PASS][117] +4 other tests pass
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-1/igt@xe_pmu@engine-activity-accuracy-50.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-6/igt@xe_pmu@engine-activity-accuracy-50.html

  
#### Warnings ####

  * igt@core_hotunplug@hotrebind:
    - shard-bmg:          [ABORT][118] ([Intel XE#8007]) -> [SKIP][119] ([Intel XE#8714])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-2/igt@core_hotunplug@hotrebind.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@core_hotunplug@hotrebind.html

  * igt@core_hotunplug@hotunplug-rescan:
    - shard-bmg:          [SKIP][120] ([Intel XE#8714]) -> [ABORT][121] ([Intel XE#8007])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@core_hotunplug@hotunplug-rescan.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-8/igt@core_hotunplug@hotunplug-rescan.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-bmg:          [SKIP][122] ([Intel XE#2327]) -> [SKIP][123] ([Intel XE#8714]) +1 other test skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-3/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-bmg:          [SKIP][124] ([Intel XE#8714]) -> [SKIP][125] ([Intel XE#2327]) +4 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-1/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-bmg:          [SKIP][126] ([Intel XE#1124]) -> [SKIP][127] ([Intel XE#8714]) +9 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-10/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-bmg:          [SKIP][128] ([Intel XE#2328] / [Intel XE#7367]) -> [SKIP][129] ([Intel XE#8714]) +1 other test skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-9/igt@kms_big_fb@y-tiled-addfb.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-bmg:          [SKIP][130] ([Intel XE#607] / [Intel XE#7361]) -> [SKIP][131] ([Intel XE#8714])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-4/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-bmg:          [SKIP][132] ([Intel XE#8714]) -> [SKIP][133] ([Intel XE#1124]) +9 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-9/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p:
    - shard-bmg:          [SKIP][134] ([Intel XE#8714]) -> [SKIP][135] ([Intel XE#7679])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-3/igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p:
    - shard-bmg:          [SKIP][136] ([Intel XE#7679]) -> [SKIP][137] ([Intel XE#8714])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-2/igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p.html

  * igt@kms_bw@linear-tiling-2-displays-target-2560x1440p:
    - shard-bmg:          [SKIP][138] ([Intel XE#367]) -> [SKIP][139] ([Intel XE#8714]) +2 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-10/igt@kms_bw@linear-tiling-2-displays-target-2560x1440p.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@kms_bw@linear-tiling-2-displays-target-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-target-3840x2160p:
    - shard-bmg:          [SKIP][140] ([Intel XE#8714]) -> [SKIP][141] ([Intel XE#367]) +1 other test skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_bw@linear-tiling-4-displays-target-3840x2160p.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-5/igt@kms_bw@linear-tiling-4-displays-target-3840x2160p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-bmg:          [SKIP][142] ([Intel XE#2887]) -> [SKIP][143] ([Intel XE#8714]) +13 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-2/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          [SKIP][144] ([Intel XE#8714]) -> [SKIP][145] ([Intel XE#2887]) +16 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-9/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          [SKIP][146] ([Intel XE#8714]) -> [SKIP][147] ([Intel XE#3432]) +1 other test skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-bmg:          [SKIP][148] ([Intel XE#3432]) -> [SKIP][149] ([Intel XE#8714]) +2 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-bmg:          [SKIP][150] ([Intel XE#8714]) -> [SKIP][151] ([Intel XE#2724] / [Intel XE#7449])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_cdclk@mode-transition-all-outputs.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-9/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-bmg:          [SKIP][152] ([Intel XE#2325] / [Intel XE#7358]) -> [SKIP][153] ([Intel XE#8714])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-6/igt@kms_chamelium_color@ctm-limited-range.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-bmg:          [SKIP][154] ([Intel XE#8714]) -> [SKIP][155] ([Intel XE#2325] / [Intel XE#7358]) +2 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_chamelium_color@ctm-red-to-blue.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-9/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4:
    - shard-bmg:          [SKIP][156] ([Intel XE#7358]) -> [SKIP][157] ([Intel XE#8714]) +1 other test skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-3/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-bmg:          [SKIP][158] ([Intel XE#8714]) -> [SKIP][159] ([Intel XE#2252]) +7 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-10/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@dp-hpd-storm:
    - shard-bmg:          [SKIP][160] ([Intel XE#2252]) -> [SKIP][161] ([Intel XE#8714]) +4 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-4/igt@kms_chamelium_hpd@dp-hpd-storm.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@kms_chamelium_hpd@dp-hpd-storm.html

  * igt@kms_color_pipeline@plane-lut3d-green-only:
    - shard-bmg:          [SKIP][162] ([Intel XE#6969] / [Intel XE#7006]) -> [SKIP][163] ([Intel XE#8714])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-4/igt@kms_color_pipeline@plane-lut3d-green-only.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@kms_color_pipeline@plane-lut3d-green-only.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-bmg:          [SKIP][164] ([Intel XE#2390] / [Intel XE#6974]) -> [SKIP][165] ([Intel XE#8714])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-6/igt@kms_content_protection@dp-mst-lic-type-0.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:
    - shard-bmg:          [SKIP][166] ([Intel XE#8714]) -> [SKIP][167] ([Intel XE#6974])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-2/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html

  * igt@kms_content_protection@legacy-hdcp14:
    - shard-bmg:          [SKIP][168] ([Intel XE#8714]) -> [FAIL][169] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +1 other test fail
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_content_protection@legacy-hdcp14.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-3/igt@kms_content_protection@legacy-hdcp14.html

  * igt@kms_content_protection@mei-interface:
    - shard-bmg:          [SKIP][170] ([Intel XE#7642]) -> [SKIP][171] ([Intel XE#8714])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-8/igt@kms_content_protection@mei-interface.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@type1:
    - shard-bmg:          [SKIP][172] ([Intel XE#8714]) -> [SKIP][173] ([Intel XE#7642])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_content_protection@type1.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-6/igt@kms_content_protection@type1.html

  * igt@kms_content_protection@uevent-hdcp14:
    - shard-bmg:          [SKIP][174] ([Intel XE#8714]) -> [FAIL][175] ([Intel XE#6707] / [Intel XE#7439])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_content_protection@uevent-hdcp14.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-5/igt@kms_content_protection@uevent-hdcp14.html

  * igt@kms_cursor_crc@cursor-random-256x85:
    - shard-bmg:          [SKIP][176] ([Intel XE#8714]) -> [SKIP][177] ([Intel XE#2320])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_cursor_crc@cursor-random-256x85.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-9/igt@kms_cursor_crc@cursor-random-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-bmg:          [SKIP][178] ([Intel XE#8714]) -> [SKIP][179] ([Intel XE#2321] / [Intel XE#7355])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-9/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          [SKIP][180] ([Intel XE#2321] / [Intel XE#7355]) -> [SKIP][181] ([Intel XE#8714]) +2 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-4/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-64x21:
    - shard-bmg:          [SKIP][182] ([Intel XE#2320]) -> [SKIP][183] ([Intel XE#8714]) +2 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding-64x21.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-64x21.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-bmg:          [SKIP][184] ([Intel XE#8714]) -> [SKIP][185] ([Intel XE#4354] / [Intel XE#5882])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_dp_link_training@non-uhbr-mst.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-2/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-bmg:          [SKIP][186] ([Intel XE#4354] / [Intel XE#7386]) -> [SKIP][187] ([Intel XE#8714])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-1/igt@kms_dp_link_training@uhbr-mst.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-bmg:          [SKIP][188] ([Intel XE#8714]) -> [SKIP][189] ([Intel XE#4331] / [Intel XE#7227])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_dp_linktrain_fallback@dsc-fallback.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-10/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-fractional-bpp-bigjoiner:
    - shard-bmg:          [SKIP][190] ([Intel XE#8265]) -> [SKIP][191] ([Intel XE#8714]) +1 other test skip
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-2/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner:
    - shard-bmg:          [SKIP][192] ([Intel XE#8714]) -> [SKIP][193] ([Intel XE#8265]) +2 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-3/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          [SKIP][194] ([Intel XE#4156] / [Intel XE#7425]) -> [SKIP][195] ([Intel XE#8714])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-9/igt@kms_fbcon_fbt@fbc-suspend.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-bmg:          [SKIP][196] ([Intel XE#2372] / [Intel XE#7359]) -> [SKIP][197] ([Intel XE#8714])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-4/igt@kms_feature_discovery@chamelium.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@vrr:
    - shard-bmg:          [SKIP][198] ([Intel XE#8714]) -> [SKIP][199] ([Intel XE#8586])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_feature_discovery@vrr.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-5/igt@kms_feature_discovery@vrr.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-bmg:          [SKIP][200] ([Intel XE#7178] / [Intel XE#7351]) -> [SKIP][201] ([Intel XE#8714]) +2 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
    - shard-bmg:          [SKIP][202] ([Intel XE#8714]) -> [SKIP][203] ([Intel XE#7178] / [Intel XE#7351]) +6 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x:
    - shard-bmg:          [SKIP][204] ([Intel XE#7179]) -> [SKIP][205] ([Intel XE#8714]) +1 other test skip
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-1/igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][206] ([Intel XE#4141]) -> [SKIP][207] ([Intel XE#8714]) +16 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-linear:
    - shard-bmg:          [SKIP][208] ([Intel XE#8714]) -> [SKIP][209] ([Intel XE#4141]) +14 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][210] ([Intel XE#8714]) -> [SKIP][211] ([Intel XE#2311]) +54 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render:
    - shard-bmg:          [SKIP][212] ([Intel XE#8714]) -> [SKIP][213] ([Intel XE#7061] / [Intel XE#7356]) +4 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][214] ([Intel XE#2311]) -> [SKIP][215] ([Intel XE#8714]) +49 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-indfb-pgflip-blt.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-blt:
    - shard-bmg:          [SKIP][216] ([Intel XE#7061]) -> [SKIP][217] ([Intel XE#8714]) +4 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-blt.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][218] ([Intel XE#2313]) -> [SKIP][219] ([Intel XE#8714]) +61 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y:
    - shard-bmg:          [SKIP][220] ([Intel XE#8714]) -> [SKIP][221] ([Intel XE#7399])
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-mmap-wc:
    - shard-bmg:          [SKIP][222] ([Intel XE#8714]) -> [SKIP][223] ([Intel XE#7061]) +6 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-mmap-wc.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-10/igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][224] ([Intel XE#8714]) -> [SKIP][225] ([Intel XE#2313]) +55 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc:
    - shard-bmg:          [SKIP][226] ([Intel XE#7061] / [Intel XE#7356]) -> [SKIP][227] ([Intel XE#8714]) +3 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][228] ([Intel XE#3544]) -> [SKIP][229] ([Intel XE#8714])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-9/igt@kms_hdr@brightness-with-hdr.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-bmg:          [SKIP][230] ([Intel XE#6911] / [Intel XE#7466]) -> [SKIP][231] ([Intel XE#8714])
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-5/igt@kms_joiner@basic-force-ultra-joiner.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-bmg:          [SKIP][232] ([Intel XE#4298] / [Intel XE#5873]) -> [SKIP][233] ([Intel XE#8714])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-6/igt@kms_joiner@basic-max-non-joiner.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-bmg:          [SKIP][234] ([Intel XE#8714]) -> [SKIP][235] ([Intel XE#4090] / [Intel XE#7443])
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-6/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-bmg:          [SKIP][236] ([Intel XE#8714]) -> [SKIP][237] ([Intel XE#2486])
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_panel_fitting@atomic-fastset.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-5/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_panel_fitting@legacy:
    - shard-bmg:          [SKIP][238] ([Intel XE#2486]) -> [SKIP][239] ([Intel XE#8714])
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-1/igt@kms_panel_fitting@legacy.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane@pixel-format-y-tiled-modifier:
    - shard-bmg:          [SKIP][240] ([Intel XE#7283]) -> [SKIP][241] ([Intel XE#8714]) +4 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-1/igt@kms_plane@pixel-format-y-tiled-modifier.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@kms_plane@pixel-format-y-tiled-modifier.html

  * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping:
    - shard-bmg:          [SKIP][242] ([Intel XE#8714]) -> [SKIP][243] ([Intel XE#7283]) +4 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-6/igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-bmg:          [SKIP][244] ([Intel XE#8714]) -> [SKIP][245] ([Intel XE#2393])
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_plane_lowres@tiling-yf.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-4/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
    - shard-bmg:          [SKIP][246] ([Intel XE#2763] / [Intel XE#6886]) -> [SKIP][247] ([Intel XE#8714]) +1 other test skip
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-10/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-bmg:          [SKIP][248] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870]) -> [SKIP][249] ([Intel XE#8714])
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-4/igt@kms_pm_backlight@basic-brightness.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_dc@dc3co-framedrop-check:
    - shard-bmg:          [SKIP][250] ([Intel XE#8395] / [Intel XE#8396]) -> [SKIP][251] ([Intel XE#8714])
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-2/igt@kms_pm_dc@dc3co-framedrop-check.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@kms_pm_dc@dc3co-framedrop-check.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-bmg:          [SKIP][252] ([Intel XE#8714]) -> [SKIP][253] ([Intel XE#3309] / [Intel XE#7368])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_pm_dc@dc5-retention-flops.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-3/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-bmg:          [SKIP][254] ([Intel XE#8714]) -> [SKIP][255] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_pm_rpm@modeset-lpsp.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-3/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:
    - shard-bmg:          [SKIP][256] ([Intel XE#8714]) -> [SKIP][257] ([Intel XE#1489]) +5 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-8/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:
    - shard-bmg:          [SKIP][258] ([Intel XE#1489]) -> [SKIP][259] ([Intel XE#8714]) +9 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-4/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-bmg:          [SKIP][260] ([Intel XE#8714]) -> [SKIP][261] ([Intel XE#2387] / [Intel XE#7429])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_psr2_su@page_flip-nv12.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-2/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-pr-primary-page-flip:
    - shard-bmg:          [SKIP][262] ([Intel XE#8714]) -> [SKIP][263] ([Intel XE#2234] / [Intel XE#2850]) +11 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_psr@fbc-pr-primary-page-flip.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-9/igt@kms_psr@fbc-pr-primary-page-flip.html

  * igt@kms_psr@pr-sprite-plane-onoff:
    - shard-bmg:          [SKIP][264] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][265] ([Intel XE#8714]) +9 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-5/igt@kms_psr@pr-sprite-plane-onoff.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@kms_psr@pr-sprite-plane-onoff.html

  * igt@kms_psr@psr2-primary-render:
    - shard-bmg:          [SKIP][266] ([Intel XE#8714]) -> [SKIP][267] ([Intel XE#2234])
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_psr@psr2-primary-render.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-2/igt@kms_psr@psr2-primary-render.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-bmg:          [SKIP][268] ([Intel XE#8714]) -> [SKIP][269] ([Intel XE#3904] / [Intel XE#7342]) +1 other test skip
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_rotation_crc@primary-rotation-90.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-8/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-bmg:          [SKIP][270] ([Intel XE#2330] / [Intel XE#5813]) -> [SKIP][271] ([Intel XE#8714])
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-bmg:          [SKIP][272] ([Intel XE#3904] / [Intel XE#7342]) -> [SKIP][273] ([Intel XE#8714])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-8/igt@kms_rotation_crc@sprite-rotation-90.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-bmg:          [SKIP][274] ([Intel XE#8714]) -> [SKIP][275] ([Intel XE#2413])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_scaling_modes@scaling-mode-full.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-3/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-bmg:          [SKIP][276] ([Intel XE#8714]) -> [SKIP][277] ([Intel XE#1435] / [Intel XE#8695])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_setmode@invalid-clone-exclusive-crtc.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-2/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_sharpness_filter@filter-toggle:
    - shard-bmg:          [SKIP][278] ([Intel XE#8714]) -> [SKIP][279] ([Intel XE#6503])
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_sharpness_filter@filter-toggle.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-4/igt@kms_sharpness_filter@filter-toggle.html

  * igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:
    - shard-bmg:          [SKIP][280] ([Intel XE#6503]) -> [SKIP][281] ([Intel XE#8714]) +3 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-4/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][282] ([Intel XE#2426] / [Intel XE#5848]) -> [SKIP][283] ([Intel XE#8714])
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][284] ([Intel XE#8714]) -> [SKIP][285] ([Intel XE#2509] / [Intel XE#7437])
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@flip-basic:
    - shard-bmg:          [SKIP][286] ([Intel XE#1499]) -> [SKIP][287] ([Intel XE#8714])
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-10/igt@kms_vrr@flip-basic.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-bmg:          [SKIP][288] ([Intel XE#8714]) -> [SKIP][289] ([Intel XE#1499])
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_vrr@flip-basic-fastset.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-8/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@lobf-dc3co:
    - shard-bmg:          [SKIP][290] ([Intel XE#8397]) -> [SKIP][291] ([Intel XE#8714])
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-1/igt@kms_vrr@lobf-dc3co.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@kms_vrr@lobf-dc3co.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [SKIP][292] ([Intel XE#8714]) -> [INCOMPLETE][293] ([Intel XE#6321] / [Intel XE#8355])
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@xe_evict@evict-mixed-many-threads-small.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict@evict-small-external-multi-queue-cm:
    - shard-bmg:          [SKIP][294] ([Intel XE#8370]) -> [SKIP][295] ([Intel XE#8714]) +1 other test skip
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-9/igt@xe_evict@evict-small-external-multi-queue-cm.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@xe_evict@evict-small-external-multi-queue-cm.html

  * igt@xe_evict@evict-small-multi-queue-cm:
    - shard-bmg:          [SKIP][296] ([Intel XE#8714]) -> [SKIP][297] ([Intel XE#8370]) +1 other test skip
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@xe_evict@evict-small-multi-queue-cm.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-10/igt@xe_evict@evict-small-multi-queue-cm.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race:
    - shard-bmg:          [SKIP][298] ([Intel XE#8714]) -> [SKIP][299] ([Intel XE#2322] / [Intel XE#7372]) +6 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - shard-bmg:          [SKIP][300] ([Intel XE#2322] / [Intel XE#7372]) -> [SKIP][301] ([Intel XE#8714]) +4 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-10/igt@xe_exec_basic@multigpu-once-null-rebind.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@xe_exec_basic@multigpu-once-null-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr:
    - shard-bmg:          [SKIP][302] ([Intel XE#8714]) -> [SKIP][303] ([Intel XE#8374]) +10 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-8/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr.html

  * igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-imm:
    - shard-bmg:          [SKIP][304] ([Intel XE#8374]) -> [SKIP][305] ([Intel XE#8714]) +10 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-9/igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-imm.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-imm.html

  * igt@xe_exec_multi_queue@one-queue-priority-smem:
    - shard-bmg:          [SKIP][306] ([Intel XE#8364]) -> [SKIP][307] ([Intel XE#8714]) +25 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-10/igt@xe_exec_multi_queue@one-queue-priority-smem.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@xe_exec_multi_queue@one-queue-priority-smem.html

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority:
    - shard-bmg:          [SKIP][308] ([Intel XE#8714]) -> [SKIP][309] ([Intel XE#8364]) +33 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-4/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority.html

  * igt@xe_exec_reset@cm-multi-queue-cat-error-on-secondary:
    - shard-bmg:          [SKIP][310] ([Intel XE#8714]) -> [SKIP][311] ([Intel XE#8369]) +2 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@xe_exec_reset@cm-multi-queue-cat-error-on-secondary.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-1/igt@xe_exec_reset@cm-multi-queue-cat-error-on-secondary.html

  * igt@xe_exec_reset@cm-multi-queue-close-execqueues:
    - shard-bmg:          [SKIP][312] ([Intel XE#8369]) -> [SKIP][313] ([Intel XE#8714]) +1 other test skip
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-6/igt@xe_exec_reset@cm-multi-queue-close-execqueues.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@xe_exec_reset@cm-multi-queue-close-execqueues.html

  * igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind:
    - shard-bmg:          [SKIP][314] ([Intel XE#8714]) -> [SKIP][315] ([Intel XE#8378]) +8 other tests skip
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-6/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr-invalidate-race:
    - shard-bmg:          [SKIP][316] ([Intel XE#8378]) -> [SKIP][317] ([Intel XE#8714]) +5 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-9/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr-invalidate-race.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr-invalidate-race.html

  * igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:
    - shard-bmg:          [SKIP][318] ([Intel XE#6281] / [Intel XE#7426]) -> [SKIP][319] ([Intel XE#8714])
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-9/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html

  * igt@xe_gpgpu_fill@offset-4x4:
    - shard-bmg:          [SKIP][320] ([Intel XE#8714]) -> [SKIP][321] ([Intel XE#7954])
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@xe_gpgpu_fill@offset-4x4.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-3/igt@xe_gpgpu_fill@offset-4x4.html

  * igt@xe_multigpu_svm@mgpu-concurrent-access-basic:
    - shard-bmg:          [SKIP][322] ([Intel XE#6964]) -> [SKIP][323] ([Intel XE#6964] / [Intel XE#8714]) +3 other tests skip
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@xe_multigpu_svm@mgpu-concurrent-access-basic.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@xe_multigpu_svm@mgpu-concurrent-access-basic.html

  * igt@xe_page_reclaim@basic-mixed:
    - shard-bmg:          [SKIP][324] ([Intel XE#8714]) -> [SKIP][325] ([Intel XE#7793])
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@xe_page_reclaim@basic-mixed.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-9/igt@xe_page_reclaim@basic-mixed.html

  * igt@xe_page_reclaim@many-vma-same-bo:
    - shard-bmg:          [SKIP][326] ([Intel XE#7793]) -> [SKIP][327] ([Intel XE#8714]) +2 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-10/igt@xe_page_reclaim@many-vma-same-bo.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@xe_page_reclaim@many-vma-same-bo.html

  * igt@xe_pat@l2-flush-opt-svm-pat-restrict:
    - shard-bmg:          [SKIP][328] ([Intel XE#7590]) -> [SKIP][329] ([Intel XE#8714])
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-6/igt@xe_pat@l2-flush-opt-svm-pat-restrict.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@xe_pat@l2-flush-opt-svm-pat-restrict.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-bmg:          [SKIP][330] ([Intel XE#8714]) -> [SKIP][331] ([Intel XE#2236] / [Intel XE#7590])
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@xe_pat@pat-index-xelpg.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-3/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@d3cold-i2c:
    - shard-bmg:          [SKIP][332] ([Intel XE#8714]) -> [SKIP][333] ([Intel XE#5694] / [Intel XE#7370])
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@xe_pm@d3cold-i2c.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-3/igt@xe_pm@d3cold-i2c.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-bmg:          [SKIP][334] ([Intel XE#2284] / [Intel XE#7370]) -> [SKIP][335] ([Intel XE#8714]) +1 other test skip
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-4/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_prefetch_fault@prefetch-fault:
    - shard-bmg:          [SKIP][336] ([Intel XE#8714]) -> [SKIP][337] ([Intel XE#7599])
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@xe_prefetch_fault@prefetch-fault.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-2/igt@xe_prefetch_fault@prefetch-fault.html

  * igt@xe_pxp@display-black-pxp-fb:
    - shard-bmg:          [SKIP][338] ([Intel XE#4733] / [Intel XE#7417]) -> [SKIP][339] ([Intel XE#8714]) +3 other tests skip
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-6/igt@xe_pxp@display-black-pxp-fb.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@xe_pxp@display-black-pxp-fb.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:
    - shard-bmg:          [SKIP][340] ([Intel XE#8714]) -> [SKIP][341] ([Intel XE#4733] / [Intel XE#7417]) +4 other tests skip
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-6/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html

  * igt@xe_query@multigpu-query-engines:
    - shard-bmg:          [SKIP][342] ([Intel XE#944]) -> [SKIP][343] ([Intel XE#8714]) +1 other test skip
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-3/igt@xe_query@multigpu-query-engines.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@xe_query@multigpu-query-engines.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-bmg:          [SKIP][344] ([Intel XE#8714]) -> [SKIP][345] ([Intel XE#944]) +1 other test skip
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-3/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4090]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5177]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5177
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
  [Intel XE#5742]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5873
  [Intel XE#5882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5882
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#6281]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7006]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7098
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
  [Intel XE#7227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7227
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7328
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7359]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7359
  [Intel XE#7361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361
  [Intel XE#7367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367
  [Intel XE#7368]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7368
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
  [Intel XE#7378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7378
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7386]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7386
  [Intel XE#7387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7400
  [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425
  [Intel XE#7426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7426
  [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439
  [Intel XE#7442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442
  [Intel XE#7443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7443
  [Intel XE#7449]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449
  [Intel XE#7466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7466
  [Intel XE#7571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695
  [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794
  [Intel XE#7954]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7954
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8303]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303
  [Intel XE#8355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395
  [Intel XE#8396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396
  [Intel XE#8397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8397
  [Intel XE#8399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399
  [Intel XE#8555]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8555
  [Intel XE#8586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8586
  [Intel XE#8695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8695
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#8714]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_9032 -> IGT_9033
  * Linux: xe-5507-593120331e000d147d0c405b446c82de0740c57e -> xe-pw-171320v1

  IGT_9032: 9032
  IGT_9033: 9033
  xe-5507-593120331e000d147d0c405b446c82de0740c57e: 593120331e000d147d0c405b446c82de0740c57e
  xe-pw-171320v1: 171320v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/index.html

--===============8779196617419442101==
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
<tr><td><b>Series:</b></td><td>drm/xe/pm: do not warn about missing runtime=
 PM protection after hot-unplug</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/171320/">https://patchwork.freedesktop.org/series/171320/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-171320v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-171320v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5507-593120331e000d147d0c405b446c82de0=
740c57e_FULL -&gt; xe-pw-171320v1_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-171320v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@unaligned-read:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-10/igt@fbdev@u=
naligned-read.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@fbdev@unaligned-read.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">=
Intel XE#2134</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171320v1/shard-bmg-4/igt@kms_big_fb@linear-8bpp-rotate=
-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2327">Intel XE#2327</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171320v1/shard-bmg-2/igt@kms_big_fb@y-tiled-addfb-size=
-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/610">Intel XE#610</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7387">Intel XE#7387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171320v1/shard-bmg-6/igt@kms_big_fb@yf-tiled-8bpp-rota=
te-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171320v1/shard-bmg-2/igt@kms_ccs@crc-primary-basic-4-t=
iled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171320v1/shard-bmg-4/igt@kms_ccs@random-ccs-data-4-til=
ed-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@kms_chamelium_edid@dp-edid-ch=
ange-during-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +166 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171320v1/shard-bmg-2/igt@kms_chamelium_frames@dp-crc-f=
ast.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1-suspend-resume:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171320v1/shard-bmg-9/igt@kms_content_protection@dp-mst=
-type-1-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171320v1/shard-bmg-10/igt@kms_content_protection@lic-t=
ype-0@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) =
+1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent-hdcp14@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171320v1/shard-bmg-5/igt@kms_content_protection@uevent=
-hdcp14@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/6707">Intel XE#6707</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7439">Intel XE#7439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x10:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171320v1/shard-bmg-2/igt@kms_cursor_crc@cursor-offscre=
en-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2320">Intel XE#2320</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171320v1/shard-bmg-8/igt@kms_dsc@dsc-with-output-forma=
ts.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/8265">Intel XE#8265</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171320v1/shard-bmg-2/igt@kms_fbc_dirty_rect@fbc-dirty-=
rectangle-different-formats.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7442">Intel XE#7442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-lnl-8/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-lnl-1/ig=
t@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#30=
1</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171320v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bp=
p-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349">Intel XE#7=
349</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171320v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs=
-abgr161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171320v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +2 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-pri-shrfb-draw-mmap-=
wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171320v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcd=
rrshdr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +28 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171320v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbch=
dr-argb161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +4 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171320v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcp=
srhdr-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +20 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171320v1/shard-bmg-4/igt@kms_joiner@invalid-modeset-ul=
tra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6911">Intel XE#6911</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7378">Intel XE#7378</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171320v1/shard-bmg-9/igt@kms_plane@pixel-format-x-tile=
d-modifier@pipe-b-plane-5.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/8303">Intel XE#8303</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171320v1/shard-bmg-4/igt@kms_plane@pixel-format-y-tile=
d-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +3 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-lnl-3/igt@kms_pm_d=
c@dc5-psr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-171320v1/shard-lnl-3/igt@kms_pm_dc@dc5-psr.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399">Intel X=
E#8399</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171320v1/shard-bmg-10/igt@kms_pm_dc@dc5-psr.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794">=
Intel XE#7794</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171320v1/shard-bmg-10/igt@kms_pm_lpsp@kms-lpsp.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/249=
9">Intel XE#2499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171320v1/shard-bmg-10/igt@kms_psr2_sf@pr-plane-move-sf=
-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171320v1/shard-bmg-4/igt@kms_psr2_su@frontbuffer-xrgb8=
888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2387">Intel XE#2387</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7429">Intel XE#7429</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171320v1/shard-bmg-8/igt@kms_psr@psr2-sprite-blt.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2850">Intel XE#2850</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-plane-with-filter:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171320v1/shard-bmg-2/igt@kms_sharpness_filter@invalid-=
plane-with-filter.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/6503">Intel XE#6503</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171320v1/shard-bmg-10/igt@kms_vrr@max-min.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">In=
tel XE#1499</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-6/igt@xe_exec_=
balancer@many-execqueues-cm-virtual-userptr-rebind.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-=
7/igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-rebind.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">=
Intel XE#8714</a>) +638 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171320v1/shard-bmg-9/igt@xe_exec_basic@multigpu-once-u=
serptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2322">Intel XE#2322</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +2 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171320v1/shard-bmg-3/igt@xe_exec_fault_mode@twice-mult=
i-queue-userptr-rebind-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +3 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-basic-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171320v1/shard-bmg-10/igt@xe_exec_multi_queue@many-que=
ues-basic-smem.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/8364">Intel XE#8364</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-close-fd:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171320v1/shard-bmg-1/igt@xe_exec_reset@multi-queue-clo=
se-fd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/8369">Intel XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-new-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171320v1/shard-bmg-6/igt@xe_exec_system_allocator@many=
-stride-new-prefetch.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7098">Intel XE#7098</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/8159">Intel XE#8159</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-fd-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171320v1/shard-bmg-5/igt@xe_exec_threads@threads-multi=
-queue-fd-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +2 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-9/igt@xe_fault=
_injection@vm-bind-fail-xe_pt_update_ops_prepare.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-1/=
igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html">ABORT</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Int=
el XE#8007</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-5/igt@xe_modul=
e_load@reload-no-display.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@xe_module_load@reloa=
d-no-display.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/8714">Intel XE#8714</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-pagefault-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@xe_multigpu_svm@mgpu-pagefaul=
t-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6964">Intel XE#6964</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@invalid-1g:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171320v1/shard-bmg-5/igt@xe_page_reclaim@invalid-1g.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/7793">Intel XE#7793</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-sw-hw-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171320v1/shard-bmg-2/igt@xe_pat@pat-sw-hw-suspend.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7695">Intel XE#7695</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-i2c:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171320v1/shard-bmg-5/igt@xe_pm@d3hot-i2c.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742">Int=
el XE#5742</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/7328">Intel XE#7328</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7400">Intel XE#7400</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_prefetch_fault@prefetch-fault-svm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171320v1/shard-bmg-5/igt@xe_prefetch_fault@prefetch-fa=
ult-svm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7599">Intel XE#7599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-hwconfig:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171320v1/shard-bmg-8/igt@xe_query@multigpu-query-hwcon=
fig.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171320v1/shard-bmg-2/igt@xe_wedged@wedged-at-any-timeo=
ut.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/5545">Intel XE#5545</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@intel_hw=
mon@hwmon-write.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/5177">Intel XE#5177</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-9/igt@intel_hwmon@hwm=
on-write.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-1/igt@kms_curs=
or_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7571">Intel XE#7571</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-8/ig=
t@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-10/igt@xe_evic=
t@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355">Intel X=
E#8355</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-171320v1/shard-bmg-9/igt@xe_evict@evict-beng-mixed-many-threads-small.htm=
l">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-new-nomemset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@xe_exec_=
system_allocator@once-mmap-new-nomemset.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-b=
mg-4/igt@xe_exec_system_allocator@once-mmap-new-nomemset.html">PASS</a> +62=
6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_wa_gt_init:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-9/igt@xe_fault=
_injection@inject-fault-probe-function-xe_wa_gt_init.html">ABORT</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#80=
07</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-17=
1320v1/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_wa=
_gt_init.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-3/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-b=
mg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/sha=
rd-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e=
/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740=
c57e/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de=
0740c57e/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c=
82de0740c57e/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b=
446c82de0740c57e/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c=
405b446c82de0740c57e/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d14=
7d0c405b446c82de0740c57e/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e00=
0d147d0c405b446c82de0740c57e/shard-bmg-4/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-59312033=
1e000d147d0c405b446c82de0740c57e/shard-bmg-4/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-5931=
20331e000d147d0c405b446c82de0740c57e/shard-bmg-8/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-=
593120331e000d147d0c405b446c82de0740c57e/shard-bmg-5/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5=
507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-5/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-1/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-4/igt@xe_mod=
ule_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-8/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-6/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-=
10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard=
-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/=
shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c=
57e/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405">Intel XE#7=
405</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
171320v1/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-8/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-171320v1/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-=
bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-9/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
171320v1/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-2/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-171320v1/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-=
bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-6/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
171320v1/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-171320v1/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard=
-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-3/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-171320v1/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-171320v1/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard=
-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-4/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-171320v1/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-1/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-171320v1/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard=
-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-9/igt@xe_module_load@loa=
d.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-50:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-1/igt@xe_pmu@e=
ngine-activity-accuracy-50.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/8555">Intel XE#8555</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-6/igt@xe_p=
mu@engine-activity-accuracy-50.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-2/igt@core_hot=
unplug@hotrebind.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/8007">Intel XE#8007</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@core_hotunplu=
g@hotrebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotunplug-rescan:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@core_hot=
unplug@hotunplug-rescan.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-8/igt@core_ho=
tunplug@hotunplug-rescan.html">ABORT</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-3/igt@kms_big_=
fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@kms_=
big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_big_=
fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-1/igt@kms_=
big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +4 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-10/igt@kms_big=
_fb@y-tiled-8bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@kms_=
big_fb@y-tiled-8bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +9 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-9/igt@kms_big_=
fb@y-tiled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2328">Intel XE#2328</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7367">Intel XE#7367</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/ig=
t@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-4/igt@kms_big_=
fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361">Intel XE#7361=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1713=
20v1/shard-bmg-7/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714=
">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_big_=
fb@y-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard=
-bmg-9/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Inte=
l XE#1124</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_bw@c=
onnected-linear-tiling-3-displays-target-1920x1080p.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1713=
20v1/shard-bmg-3/igt@kms_bw@connected-linear-tiling-3-displays-target-1920x=
1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-2/igt@kms_bw@c=
onnected-linear-tiling-4-displays-target-3840x2160p.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1713=
20v1/shard-bmg-7/igt@kms_bw@connected-linear-tiling-4-displays-target-3840x=
2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-10/igt@kms_bw@=
linear-tiling-2-displays-target-2560x1440p.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-=
bmg-7/igt@kms_bw@linear-tiling-2-displays-target-2560x1440p.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel=
 XE#8714</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_bw@l=
inear-tiling-4-displays-target-3840x2160p.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard=
-bmg-5/igt@kms_bw@linear-tiling-4-displays-target-3840x2160p.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel=
 XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-2/igt@kms_ccs@=
bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7=
/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a=
>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_ccs@=
bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-b=
mg-9/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE=
#2887</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_ccs@=
crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard=
-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Inte=
l XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-8/igt@kms_ccs@=
crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/ig=
t@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +2 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_cdcl=
k@mode-transition-all-outputs.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-9/igt@k=
ms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449">Intel XE#7449=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-6/igt@kms_cham=
elium_color@ctm-limited-range.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/sha=
rd-bmg-7/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_cham=
elium_color@ctm-red-to-blue.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-9/igt@kms=
_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)=
 +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-3/igt@kms_cham=
elium_color_pipeline@plane-lut1d-ctm3x4.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-b=
mg-7/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE=
#8714</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_cham=
elium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-10=
/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>=
) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-4/igt@kms_cham=
elium_hpd@dp-hpd-storm.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@kms_cham=
elium_hpd@dp-hpd-storm.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-4/igt@kms_colo=
r_pipeline@plane-lut3d-green-only.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1=
/shard-bmg-7/igt@kms_color_pipeline@plane-lut3d-green-only.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel =
XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-6/igt@kms_cont=
ent_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/=
shard-bmg-7/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE=
#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_cont=
ent_protection@dp-mst-lic-type-0-hdcp14.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-b=
mg-2/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE=
#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy-hdcp14:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_cont=
ent_protection@legacy-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-3/igt@km=
s_content_protection@legacy-hdcp14.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">In=
tel XE#7374</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-8/igt@kms_cont=
ent_protection@mei-interface.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@km=
s_content_protection@mei-interface.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_cont=
ent_protection@type1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-6/igt@kms_conten=
t_protection@type1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent-hdcp14:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_cont=
ent_protection@uevent-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-5/igt@km=
s_content_protection@uevent-hdcp14.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/6707">Intel XE#6707</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439">Intel XE#7439</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_curs=
or_crc@cursor-random-256x85.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-9/igt@kms=
_cursor_crc@cursor-random-256x85.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_curs=
or_crc@cursor-sliding-512x170.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-9/igt@k=
ms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-4/igt@kms_curs=
or_crc@cursor-sliding-512x512.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/sha=
rd-bmg-7/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714=
</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-6/igt@kms_curs=
or_crc@cursor-sliding-64x21.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@kms=
_cursor_crc@cursor-sliding-64x21.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +2 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_dp_l=
ink_training@non-uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-2/igt@kms_d=
p_link_training@non-uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/5882">Intel XE#5882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-1/igt@kms_dp_l=
ink_training@uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4354">Intel XE#4354</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7386">Intel XE#7386</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7=
/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_dp_l=
inktrain_fallback@dsc-fallback.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-10/i=
gt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4331">Intel XE#4331</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7227">Intel XE#=
7227</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-bigjoiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-2/igt@kms_dsc@=
dsc-fractional-bpp-bigjoiner.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@km=
s_dsc@dsc-fractional-bpp-bigjoiner.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_dsc@=
dsc-with-output-formats-with-bpc-ultrajoiner.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/sh=
ard-bmg-3/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265=
">Intel XE#8265</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-9/igt@kms_fbco=
n_fbt@fbc-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4156">Intel XE#4156</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7425">Intel XE#7425</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/ig=
t@kms_fbcon_fbt@fbc-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-4/igt@kms_feat=
ure_discovery@chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2372">Intel XE#2372</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7359">Intel XE#7359</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg=
-7/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@vrr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_feat=
ure_discovery@vrr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-5/igt@kms_feature_d=
iscovery@vrr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/8586">Intel XE#8586</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling=
:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-1/igt@kms_flip=
_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Inte=
l XE#7178</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/7351">Intel XE#7351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-=
yftileccs-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +2 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_flip=
_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#87=
14</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-17=
1320v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-=
upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7178">Intel XE#7178</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) +6 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-1/igt@kms_flip=
_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179">Intel XE#71=
79</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-17=
1320v1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-=
reflect-x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/8714">Intel XE#8714</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-10/igt@kms_fro=
ntbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#414=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171=
320v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-dr=
aw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/8714">Intel XE#8714</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-linear:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbc-tiling-linear.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-1/=
igt@kms_frontbuffer_tracking@fbc-tiling-linear.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)=
 +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#87=
14</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-17=
1320v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-p=
lflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2311">Intel XE#2311</a>) +54 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbcdrrs-argb161616f-draw-render.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v=
1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/7061">Intel XE#7061</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7356">Intel XE#7356</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@fbcdrrshdr-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE=
#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-171320v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-i=
ndfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/8714">Intel XE#8714</a>) +49 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbcdrrshdr-abgr161616f-draw-blt.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v=
1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-blt.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/8714">Intel XE#8714</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-10/igt@kms_fro=
ntbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#23=
13</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-17=
1320v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-ms=
flip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/8714">Intel XE#8714</a>) +61 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbcpsrhdr-tiling-y.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-1=
0/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@hdr-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/s=
hard-bmg-10/igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-mmap-wc.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7=
061">Intel XE#7061</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1713=
20v1/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2313">Intel XE#2313</a>) +55 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@psr-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel=
 XE#7356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-171320v1/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-=
mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/8714">Intel XE#8714</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-9/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@kms_hdr@bri=
ghtness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-5/igt@kms_join=
er@basic-force-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/6911">Intel XE#6911</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7466">Intel XE#7466</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard=
-bmg-7/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-6/igt@kms_join=
er@basic-max-non-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4298">Intel XE#4298</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/5873">Intel XE#5873</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg=
-7/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_join=
er@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard=
-bmg-6/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090">Inte=
l XE#4090</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/7443">Intel XE#7443</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_pane=
l_fitting@atomic-fastset.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-5/igt@kms_pa=
nel_fitting@atomic-fastset.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2486">Intel XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-1/igt@kms_pane=
l_fitting@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2486">Intel XE#2486</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@kms_panel_fitt=
ing@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-1/igt@kms_plan=
e@pixel-format-y-tiled-modifier.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/ig=
t@kms_plane@pixel-format-y-tiled-modifier.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +4 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_plan=
e@pixel-format-yf-tiled-modifier-source-clamping.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v=
1/shard-bmg-6/igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/7283">Intel XE#7283</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_plan=
e_lowres@tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-4/igt@kms_plane_lo=
wres@tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-10/igt@kms_pla=
ne_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel=
 XE#2763</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/6886">Intel XE#6886</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@kms_plane_scaling@planes-upscale=
-factor-0-25-downscale-factor-0-75.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-4/igt@kms_pm_b=
acklight@basic-brightness.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7376">Intel XE#7376</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7760">Intel XE#7760</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1713=
20v1/shard-bmg-7/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8=
714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-framedrop-check:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-2/igt@kms_pm_d=
c@dc3co-framedrop-check.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/8395">Intel XE#8395</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg=
-7/igt@kms_pm_dc@dc3co-framedrop-check.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_pm_d=
c@dc5-retention-flops.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-3/igt@kms_pm_dc=
@dc5-retention-flops.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3309">Intel XE#3309</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7368">Intel XE#7368</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_pm_r=
pm@modeset-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-3/igt@kms_pm_rpm@mode=
set-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_psr2=
_sf@pr-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/=
shard-bmg-8/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1489">Intel XE#1489</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-4/igt@kms_psr2=
_sf@pr-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-b=
mg-7/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE=
#8714</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_psr2=
_su@page_flip-nv12.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-2/igt@kms_psr2_su@=
page_flip-nv12.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2387">Intel XE#2387</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7429">Intel XE#7429</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-page-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_psr@=
fbc-pr-primary-page-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-9/igt@kms_ps=
r@fbc-pr-primary-page-flip.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +11 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-5/igt@kms_psr@=
pr-sprite-plane-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7=
/igt@kms_psr@pr-sprite-plane-onoff.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +9 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_psr@=
psr2-primary-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-2/igt@kms_psr@psr=
2-primary-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2234">Intel XE#2234</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_rota=
tion_crc@primary-rotation-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-8/igt@km=
s_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a=
>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-3/igt@kms_rota=
tion_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813">Intel XE#5813=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1713=
20v1/shard-bmg-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714=
">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-8/igt@kms_rota=
tion_crc@sprite-rotation-90.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard=
-bmg-7/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_scal=
ing_modes@scaling-mode-full.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-3/igt@kms=
_scaling_modes@scaling-mode-full.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_setm=
ode@invalid-clone-exclusive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-2/ig=
t@kms_setmode@invalid-clone-exclusive-crtc.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8695">Intel XE=
#8695</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_shar=
pness_filter@filter-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-4/igt@kms_=
sharpness_filter@filter-toggle.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-4/igt@kms_shar=
pness_filter@invalid-filter-with-scaling-mode.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/s=
hard-bmg-7/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/87=
14">Intel XE#8714</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-6/igt@kms_tile=
d_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shar=
d-bmg-7/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_tile=
d_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/sha=
rd-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">=
Intel XE#2509</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/7437">Intel XE#7437</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-10/igt@kms_vrr=
@flip-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@kms_vrr@flip-basic.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_vrr@=
flip-basic-fastset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-8/igt@kms_vrr@flip=
-basic-fastset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf-dc3co:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-1/igt@kms_vrr@=
lobf-dc3co.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/8397">Intel XE#8397</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@kms_vrr@lobf-dc3co.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@xe_evict=
@evict-mixed-many-threads-small.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-1/ig=
t@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355">Int=
el XE#8355</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-multi-queue-cm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-9/igt@xe_evict=
@evict-small-external-multi-queue-cm.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/8370">Intel XE#8370</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-=
7/igt@xe_evict@evict-small-external-multi-queue-cm.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue-cm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@xe_evict=
@evict-small-multi-queue-cm.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-10/igt@xe=
_evict@evict-small-multi-queue-cm.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/8370">Intel XE#8370</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race=
:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@xe_exec_=
basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Inte=
l XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-171320v1/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-=
userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +6 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-10/igt@xe_exec=
_basic@multigpu-once-null-rebind.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/=
shard-bmg-7/igt@xe_exec_basic@multigpu-once-null-rebind.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#=
8714</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@xe_exec_=
fault_mode@many-execqueues-multi-queue-userptr.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/=
shard-bmg-8/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
8374">Intel XE#8374</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-imm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-9/igt@xe_exec_=
fault_mode@many-multi-queue-userptr-invalidate-imm.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1713=
20v1/shard-bmg-7/igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate=
-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/8714">Intel XE#8714</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-priority-smem:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-10/igt@xe_exec=
_multi_queue@one-queue-priority-smem.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-=
7/igt@xe_exec_multi_queue@one-queue-priority-smem.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714=
</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@xe_exec_=
multi_queue@two-queues-preempt-mode-fault-priority.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1713=
20v1/shard-bmg-4/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-prio=
rity.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/8364">Intel XE#8364</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-multi-queue-cat-error-on-secondary:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@xe_exec_=
reset@cm-multi-queue-cat-error-on-secondary.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/sha=
rd-bmg-1/igt@xe_exec_reset@cm-multi-queue-cat-error-on-secondary.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">=
Intel XE#8369</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-multi-queue-close-execqueues:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-6/igt@xe_exec_=
reset@cm-multi-queue-close-execqueues.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg=
-7/igt@xe_exec_reset@cm-multi-queue-close-execqueues.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#871=
4</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@xe_exec_=
threads@threads-multi-queue-cm-fd-userptr-rebind.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v=
1/shard-bmg-6/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/8378">Intel XE#8378</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr-invalidate-race=
:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-9/igt@xe_exec_=
threads@threads-multi-queue-mixed-fd-userptr-invalidate-race.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Inte=
l XE#8378</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-171320v1/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-mixed-fd-=
userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +5 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-9/igt@xe_fault=
_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281">Intel XE#=
6281</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7=
426">Intel XE#7426</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-171320v1/shard-bmg-7/igt@xe_fault_injection@exec-queue-create=
-fail-xe_pxp_exec_queue_add.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_gpgpu_fill@offset-4x4:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@xe_gpgpu=
_fill@offset-4x4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-3/igt@xe_gpgpu_fill@=
offset-4x4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7954">Intel XE#7954</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-concurrent-access-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@xe_multi=
gpu_svm@mgpu-concurrent-access-basic.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-=
7/igt@xe_multigpu_svm@mgpu-concurrent-access-basic.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714"=
>Intel XE#8714</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@basic-mixed:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@xe_page_=
reclaim@basic-mixed.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-9/igt@xe_page_rec=
laim@basic-mixed.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@many-vma-same-bo:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-10/igt@xe_page=
_reclaim@many-vma-same-bo.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@xe_pa=
ge_reclaim@many-vma-same-bo.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +2 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_pat@l2-flush-opt-svm-pat-restrict:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-6/igt@xe_pat@l=
2-flush-opt-svm-pat-restrict.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@xe=
_pat@l2-flush-opt-svm-pat-restrict.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@xe_pat@p=
at-index-xelpg.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-3/igt@xe_pat@pat-index=
-xelpg.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2236">Intel XE#2236</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-i2c:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@xe_pm@d3=
cold-i2c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-3/igt@xe_pm@d3cold-i2c.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5=
694">Intel XE#5694</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-4/igt@xe_pm@s2=
idle-d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-=
7/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@xe_prefetch_fault@prefetch-fault:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@xe_prefe=
tch_fault@prefetch-fault.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-2/igt@xe_pre=
fetch_fault@prefetch-fault.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7599">Intel XE#7599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-black-pxp-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-6/igt@xe_pxp@d=
isplay-black-pxp-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/i=
gt@xe_pxp@display-black-pxp-fb.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +3 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@xe_pxp@p=
xp-stale-bo-bind-post-termination-irq.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg=
-6/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#473=
3</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417=
">Intel XE#7417</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-3/igt@xe_query=
@multigpu-query-engines.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard-bmg-7/igt@xe_query@=
multigpu-query-engines.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@xe_query=
@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v1/shard=
-bmg-3/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel=
 XE#944</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9032 -&gt; IGT_9033</li>
<li>Linux: xe-5507-593120331e000d147d0c405b446c82de0740c57e -&gt; xe-pw-171=
320v1</li>
</ul>
<p>IGT_9032: 9032<br />
  IGT_9033: 9033<br />
  xe-5507-593120331e000d147d0c405b446c82de0740c57e: 593120331e000d147d0c405=
b446c82de0740c57e<br />
  xe-pw-171320v1: 171320v1</p>

</body>
</html>

--===============8779196617419442101==--
