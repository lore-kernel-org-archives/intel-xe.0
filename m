Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 402F3CD5BAC
	for <intel-xe@archiver.kernel.org>; Thu, 21 May 2026 09:02:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9F3910E2BE;
	Thu, 21 May 2026 09:02:42 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41D4E10E3F6;
 Thu, 21 May 2026 09:02:30 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4680844499784743458=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/xe=3A_Fix_return_type_?=
 =?utf-8?q?and_adjust_variable?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mohanram Meenakshisundaram" <mohanram.meenakshisundaram@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 21 May 2026 09:02:30 -0000
Message-ID: <177935415025.94833.18242127322948542558@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260521060338.2112191-1-mohanram.meenakshisundaram@intel.com>
In-Reply-To: <20260521060338.2112191-1-mohanram.meenakshisundaram@intel.com>
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

--===============4680844499784743458==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Fix return type and adjust variable
URL   : https://patchwork.freedesktop.org/series/166981/
State : success

== Summary ==

CI Bug Log - changes from xe-5106-a7f4472d401c5c4ee7710c20b7350b6958b8bbed_FULL -> xe-pw-166981v1_FULL
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

  Here are the changes found in xe-pw-166981v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][1] ([Intel XE#2327])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/shard-bmg-7/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][2] ([Intel XE#1124]) +1 other test skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/shard-bmg-5/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html

  * igt@kms_bw@linear-tiling-1-displays-target-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#367])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/shard-bmg-4/igt@kms_bw@linear-tiling-1-displays-target-1920x1080p.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#2887]) +3 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/shard-bmg-1/igt@kms_ccs@random-ccs-data-yf-tiled-ccs.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2252]) +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/shard-bmg-7/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#2390] / [Intel XE#6974])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/shard-bmg-3/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2320]) +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][8] -> [FAIL][9] ([Intel XE#7571])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5106-a7f4472d401c5c4ee7710c20b7350b6958b8bbed/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_feature_discovery@chamelium:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2372] / [Intel XE#7359])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/shard-bmg-7/igt@kms_feature_discovery@chamelium.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [PASS][11] -> [FAIL][12] ([Intel XE#301]) +1 other test fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5106-a7f4472d401c5c4ee7710c20b7350b6958b8bbed/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_frontbuffer_tracking@drrshdr-modesetfrombusy:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2311]) +12 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrshdr-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#4141]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#7905])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/shard-lnl-3/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-move:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2313]) +6 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-move.html

  * igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f:
    - shard-bmg:          [PASS][17] -> [SKIP][18] ([Intel XE#7915]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5106-a7f4472d401c5c4ee7710c20b7350b6958b8bbed/shard-bmg-10/igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/shard-bmg-3/igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2763] / [Intel XE#6886]) +4 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [PASS][20] -> [FAIL][21] ([Intel XE#7340])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5106-a7f4472d401c5c4ee7710c20b7350b6958b8bbed/shard-lnl-4/igt@kms_pm_dc@dc6-dpms.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/shard-lnl-2/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#7794])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/shard-bmg-9/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_psr@psr-cursor-plane-move:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/shard-bmg-4/igt@kms_psr@psr-cursor-plane-move.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2330] / [Intel XE#5813])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#1499])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/shard-bmg-9/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@xe_eudebug_online@pagefault-write:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#7636]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/shard-bmg-7/igt@xe_eudebug_online@pagefault-write.html

  * igt@xe_evict@evict-small-external-multi-queue-cm:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#7140])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/shard-bmg-6/igt@xe_evict@evict-small-external-multi-queue-cm.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2322] / [Intel XE#7372]) +3 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#1392])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/shard-lnl-3/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-rebind-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#7136]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/shard-bmg-8/igt@xe_exec_fault_mode@many-execqueues-multi-queue-rebind-prefetch.html

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#6874]) +5 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/shard-bmg-9/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority.html

  * igt@xe_exec_reset@multi-queue-close-execqueues:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#7866])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/shard-bmg-4/igt@xe_exec_reset@multi-queue-close-execqueues.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#7138]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/shard-bmg-4/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr.html

  * igt@xe_multigpu_svm@mgpu-concurrent-access-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#6964])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/shard-bmg-4/igt@xe_multigpu_svm@mgpu-concurrent-access-prefetch.html

  * igt@xe_page_reclaim@binds-full-pd:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#7793])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/shard-bmg-9/igt@xe_page_reclaim@binds-full-pd.html

  * igt@xe_pm@d3hot-i2c:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#5742] / [Intel XE#7328] / [Intel XE#7400])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/shard-bmg-6/igt@xe_pm@d3hot-i2c.html

  * igt@xe_sriov_flr@flr-vfs-parallel:
    - shard-bmg:          [PASS][37] -> [FAIL][38] ([Intel XE#6569])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5106-a7f4472d401c5c4ee7710c20b7350b6958b8bbed/shard-bmg-5/igt@xe_sriov_flr@flr-vfs-parallel.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/shard-bmg-9/igt@xe_sriov_flr@flr-vfs-parallel.html

  
#### Possible fixes ####

  * igt@kms_hdmi_inject@inject-audio:
    - shard-bmg:          [SKIP][39] ([Intel XE#7308]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5106-a7f4472d401c5c4ee7710c20b7350b6958b8bbed/shard-bmg-5/igt@kms_hdmi_inject@inject-audio.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/shard-bmg-6/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-lnl:          [SKIP][41] ([Intel XE#4692] / [Intel XE#7508]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5106-a7f4472d401c5c4ee7710c20b7350b6958b8bbed/shard-lnl-3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/shard-lnl-2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@xe_exec_system_allocator@fault-benchmark:
    - shard-bmg:          [FAIL][43] ([Intel XE#8020]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5106-a7f4472d401c5c4ee7710c20b7350b6958b8bbed/shard-bmg-8/igt@xe_exec_system_allocator@fault-benchmark.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/shard-bmg-8/igt@xe_exec_system_allocator@fault-benchmark.html

  * igt@xe_sriov_auto_provisioning@fair-allocation@numvfs-random:
    - shard-bmg:          [FAIL][45] ([Intel XE#7992]) -> [PASS][46] +1 other test pass
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5106-a7f4472d401c5c4ee7710c20b7350b6958b8bbed/shard-bmg-6/igt@xe_sriov_auto_provisioning@fair-allocation@numvfs-random.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/shard-bmg-8/igt@xe_sriov_auto_provisioning@fair-allocation@numvfs-random.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-lnl:          [SKIP][47] ([Intel XE#7865]) -> [ABORT][48] ([Intel XE#8007])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5106-a7f4472d401c5c4ee7710c20b7350b6958b8bbed/shard-lnl-4/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-mmap-wc.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][49] ([Intel XE#3544] / [Intel XE#7916]) -> [SKIP][50] ([Intel XE#3544] / [Intel XE#7915] / [Intel XE#7916])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5106-a7f4472d401c5c4ee7710c20b7350b6958b8bbed/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb2101010:
    - shard-bmg:          [SKIP][51] ([Intel XE#7916]) -> [SKIP][52] ([Intel XE#7915]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5106-a7f4472d401c5c4ee7710c20b7350b6958b8bbed/shard-bmg-4/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb2101010.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/shard-bmg-8/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb2101010.html

  * igt@xe_sriov_flr@flr-twice:
    - shard-bmg:          [FAIL][53] ([Intel XE#6569]) -> [FAIL][54] ([Intel XE#7992])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5106-a7f4472d401c5c4ee7710c20b7350b6958b8bbed/shard-bmg-4/igt@xe_sriov_flr@flr-twice.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/shard-bmg-9/igt@xe_sriov_flr@flr-twice.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4692]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4692
  [Intel XE#5742]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#7140]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140
  [Intel XE#7308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308
  [Intel XE#7328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7328
  [Intel XE#7340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340
  [Intel XE#7359]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7359
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7400
  [Intel XE#7508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7508
  [Intel XE#7571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571
  [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7866]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7866
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#7915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915
  [Intel XE#7916]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7916
  [Intel XE#7992]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8020


Build changes
-------------

  * IGT: IGT_8926 -> IGT_8927
  * Linux: xe-5106-a7f4472d401c5c4ee7710c20b7350b6958b8bbed -> xe-pw-166981v1

  IGT_8926: 8926
  IGT_8927: 3adedfd3a52fa7cdf94df31e5da59e0fdbda92fd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5106-a7f4472d401c5c4ee7710c20b7350b6958b8bbed: a7f4472d401c5c4ee7710c20b7350b6958b8bbed
  xe-pw-166981v1: 166981v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/index.html

--===============4680844499784743458==
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
<tr><td><b>Series:</b></td><td>drm/xe: Fix return type and adjust variable</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/166981/">https://patchwork.freedesktop.org/series/166981/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5106-a7f4472d401c5c4ee7710c20b7350b6958b8bbed_FULL -&gt; xe-pw-166981v1_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-166981v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/shard-bmg-7/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/shard-bmg-5/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/shard-bmg-4/igt@kms_bw@linear-tiling-1-displays-target-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/shard-bmg-1/igt@kms_ccs@random-ccs-data-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/shard-bmg-7/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/shard-bmg-3/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5106-a7f4472d401c5c4ee7710c20b7350b6958b8bbed/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571">Intel XE#7571</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/shard-bmg-7/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372">Intel XE#2372</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7359">Intel XE#7359</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5106-a7f4472d401c5c4ee7710c20b7350b6958b8bbed/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-modesetfrombusy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrshdr-modesetfrombusy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/shard-lnl-3/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5106-a7f4472d401c5c4ee7710c20b7350b6958b8bbed/shard-bmg-10/igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/shard-bmg-3/igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5106-a7f4472d401c5c4ee7710c20b7350b6958b8bbed/shard-lnl-4/igt@kms_pm_dc@dc6-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/shard-lnl-2/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340">Intel XE#7340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/shard-bmg-9/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794">Intel XE#7794</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/shard-bmg-4/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/shard-bmg-9/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@pagefault-write:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/shard-bmg-7/igt@xe_eudebug_online@pagefault-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-multi-queue-cm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/shard-bmg-6/igt@xe_evict@evict-small-external-multi-queue-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140">Intel XE#7140</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +3 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/shard-lnl-3/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-rebind-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/shard-bmg-8/igt@xe_exec_fault_mode@many-execqueues-multi-queue-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/shard-bmg-9/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-close-execqueues:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/shard-bmg-4/igt@xe_exec_reset@multi-queue-close-execqueues.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7866">Intel XE#7866</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/shard-bmg-4/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-concurrent-access-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/shard-bmg-4/igt@xe_multigpu_svm@mgpu-concurrent-access-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@binds-full-pd:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/shard-bmg-9/igt@xe_page_reclaim@binds-full-pd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-i2c:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/shard-bmg-6/igt@xe_pm@d3hot-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742">Intel XE#5742</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7328">Intel XE#7328</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7400">Intel XE#7400</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vfs-parallel:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5106-a7f4472d401c5c4ee7710c20b7350b6958b8bbed/shard-bmg-5/igt@xe_sriov_flr@flr-vfs-parallel.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/shard-bmg-9/igt@xe_sriov_flr@flr-vfs-parallel.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569">Intel XE#6569</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5106-a7f4472d401c5c4ee7710c20b7350b6958b8bbed/shard-bmg-5/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308">Intel XE#7308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/shard-bmg-6/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5106-a7f4472d401c5c4ee7710c20b7350b6958b8bbed/shard-lnl-3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4692">Intel XE#4692</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7508">Intel XE#7508</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/shard-lnl-2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@fault-benchmark:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5106-a7f4472d401c5c4ee7710c20b7350b6958b8bbed/shard-bmg-8/igt@xe_exec_system_allocator@fault-benchmark.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8020">Intel XE#8020</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/shard-bmg-8/igt@xe_exec_system_allocator@fault-benchmark.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@fair-allocation@numvfs-random:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5106-a7f4472d401c5c4ee7710c20b7350b6958b8bbed/shard-bmg-6/igt@xe_sriov_auto_provisioning@fair-allocation@numvfs-random.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992">Intel XE#7992</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/shard-bmg-8/igt@xe_sriov_auto_provisioning@fair-allocation@numvfs-random.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5106-a7f4472d401c5c4ee7710c20b7350b6958b8bbed/shard-lnl-4/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-mmap-wc.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5106-a7f4472d401c5c4ee7710c20b7350b6958b8bbed/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7916">Intel XE#7916</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7916">Intel XE#7916</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5106-a7f4472d401c5c4ee7710c20b7350b6958b8bbed/shard-bmg-4/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7916">Intel XE#7916</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/shard-bmg-8/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-twice:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5106-a7f4472d401c5c4ee7710c20b7350b6958b8bbed/shard-bmg-4/igt@xe_sriov_flr@flr-twice.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569">Intel XE#6569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166981v1/shard-bmg-9/igt@xe_sriov_flr@flr-twice.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992">Intel XE#7992</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8926 -&gt; IGT_8927</li>
<li>Linux: xe-5106-a7f4472d401c5c4ee7710c20b7350b6958b8bbed -&gt; xe-pw-166981v1</li>
</ul>
<p>IGT_8926: 8926<br />
  IGT_8927: 3adedfd3a52fa7cdf94df31e5da59e0fdbda92fd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5106-a7f4472d401c5c4ee7710c20b7350b6958b8bbed: a7f4472d401c5c4ee7710c20b7350b6958b8bbed<br />
  xe-pw-166981v1: 166981v1</p>

</body>
</html>

--===============4680844499784743458==--
