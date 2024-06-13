Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59ED8C27C4F
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jun 2024 23:22:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08A1210E13B;
	Thu, 13 Jun 2024 23:22:15 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7EA210E13B;
 Thu, 13 Jun 2024 23:22:12 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5778186589580244223=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe/uc=3A_Fix_and_start_usin?=
 =?utf-8?q?g_xe=5Fuc=5Ffw=5Fsanitize=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 13 Jun 2024 23:22:12 -0000
Message-ID: <171832093293.76316.13330043436187732434@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240613153424.2120-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240613153424.2120-1-michal.wajdeczko@intel.com>
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

--===============5778186589580244223==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/uc: Fix and start using xe_uc_fw_sanitize()
URL   : https://patchwork.freedesktop.org/series/134830/
State : failure

== Summary ==

CI Bug Log - changes from xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3_full -> xe-pw-134830v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-134830v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-134830v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-134830v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_sequence@get-busy@pipe-c-hdmi-a-1:
    - shard-adlp:         [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-adlp-6/igt@kms_sequence@get-busy@pipe-c-hdmi-a-1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-2/igt@kms_sequence@get-busy@pipe-c-hdmi-a-1.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_flip@flip-vs-suspend:
    - {shard-lnl}:        [PASS][3] -> [DMESG-WARN][4] +3 other tests dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-lnl-2/igt@kms_flip@flip-vs-suspend.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-lnl-2/igt@kms_flip@flip-vs-suspend.html

  
Known issues
------------

  Here are the changes found in xe-pw-134830v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@intel_hwmon@hwmon-read:
    - shard-adlp:         NOTRUN -> [SKIP][5] ([Intel XE#1125] / [Intel XE#1201])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@intel_hwmon@hwmon-read.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-adlp:         NOTRUN -> [SKIP][6] ([Intel XE#1124] / [Intel XE#1201]) +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][7] ([Intel XE#1201] / [Intel XE#316]) +3 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][8] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +9 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][9] ([Intel XE#1201] / [Intel XE#787]) +14 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-adlp:         NOTRUN -> [SKIP][10] ([Intel XE#1201] / [Intel XE#306])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
    - shard-adlp:         NOTRUN -> [SKIP][11] ([Intel XE#1201] / [Intel XE#373]) +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html

  * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
    - shard-dg2-set2:     [PASS][12] -> [DMESG-WARN][13] ([Intel XE#1214] / [Intel XE#282]) +3 other tests dmesg-warn
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-dg2-463/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-dg2-433/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][14] ([Intel XE#1201] / [Intel XE#310]) +2 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [SKIP][15] ([Intel XE#1201] / [Intel XE#455]) +4 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-x:
    - shard-adlp:         [PASS][16] -> [FAIL][17] ([Intel XE#1874])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-x.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-x.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][18] ([Intel XE#1201] / [Intel XE#656]) +6 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-plflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][19] ([Intel XE#1201] / [Intel XE#651]) +3 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#1201] / [Intel XE#653]) +3 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][22] ([Intel XE#1201] / [Intel XE#305]) +2 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-1.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-adlp:         NOTRUN -> [SKIP][23] ([Intel XE#1201] / [Intel XE#734])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area:
    - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#1201]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@psr2-sprite-blt:
    - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#1201] / [Intel XE#929]) +2 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@kms_psr@psr2-sprite-blt.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#1127] / [Intel XE#1201])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_sequence@get-busy:
    - shard-adlp:         [PASS][27] -> [ABORT][28] ([Intel XE#1553])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-adlp-6/igt@kms_sequence@get-busy.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-2/igt@kms_sequence@get-busy.html

  * igt@kms_sequence@get-busy@pipe-d-hdmi-a-1:
    - shard-adlp:         [PASS][29] -> [DMESG-WARN][30] ([Intel XE#1214] / [Intel XE#1553])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-adlp-6/igt@kms_sequence@get-busy@pipe-d-hdmi-a-1.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-2/igt@kms_sequence@get-busy@pipe-d-hdmi-a-1.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-dg2-set2:     [PASS][31] -> [FAIL][32] ([Intel XE#771] / [Intel XE#899])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [PASS][33] -> [FAIL][34] ([Intel XE#899]) +1 other test fail
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-adlp:         NOTRUN -> [SKIP][35] ([Intel XE#1201] / [Intel XE#756])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@kms_writeback@writeback-pixel-formats.html

  * igt@xe_copy_basic@mem-copy-linear-0x369:
    - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#1123] / [Intel XE#1201])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@xe_copy_basic@mem-copy-linear-0x369.html

  * igt@xe_evict@evict-cm-threads-small-multi-vm:
    - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#1201] / [Intel XE#261])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@xe_evict@evict-cm-threads-small-multi-vm.html

  * igt@xe_evict@evict-threads-large:
    - shard-dg2-set2:     [PASS][38] -> [TIMEOUT][39] ([Intel XE#1473] / [Intel XE#392])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-dg2-463/igt@xe_evict@evict-threads-large.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-dg2-433/igt@xe_evict@evict-threads-large.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen:
    - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#1201] / [Intel XE#688])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race:
    - shard-adlp:         NOTRUN -> [SKIP][41] ([Intel XE#1201] / [Intel XE#1392]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-execqueues-rebind-imm:
    - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#1201] / [Intel XE#288]) +3 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@xe_exec_fault_mode@many-execqueues-rebind-imm.html

  * igt@xe_gt_freq@freq_fixed_exec:
    - shard-adlp:         [PASS][43] -> [FAIL][44] ([Intel XE#1414])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-adlp-2/igt@xe_gt_freq@freq_fixed_exec.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-8/igt@xe_gt_freq@freq_fixed_exec.html

  * igt@xe_module_load@force-load:
    - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#1201] / [Intel XE#378])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@xe_module_load@force-load.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#1201] / [Intel XE#979])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@d3hot-mmap-vram:
    - shard-dg2-set2:     [PASS][47] -> [INCOMPLETE][48] ([Intel XE#1195]) +2 other tests incomplete
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-dg2-466/igt@xe_pm@d3hot-mmap-vram.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-dg2-464/igt@xe_pm@d3hot-mmap-vram.html

  * igt@xe_pm@s2idle-vm-bind-prefetch:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][49] ([Intel XE#1214])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@xe_pm@s2idle-vm-bind-prefetch.html

  * igt@xe_pm@s4-basic-exec:
    - shard-adlp:         [PASS][50] -> [DMESG-WARN][51] ([Intel XE#1214])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-adlp-2/igt@xe_pm@s4-basic-exec.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@xe_pm@s4-basic-exec.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-dg2-set2:     [DMESG-WARN][52] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][53] +5 other tests pass
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-dg2-433/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-dg2-466/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@torture-bo@pipe-a:
    - shard-dg2-set2:     [DMESG-WARN][54] ([Intel XE#1214] / [Intel XE#877]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-dg2-433/igt@kms_cursor_legacy@torture-bo@pipe-a.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-dg2-466/igt@kms_cursor_legacy@torture-bo@pipe-a.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank:
    - {shard-lnl}:        [FAIL][56] ([Intel XE#886]) -> [PASS][57] +1 other test pass
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-lnl-3/igt@kms_flip@flip-vs-blocking-wf-vblank.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-lnl-8/igt@kms_flip@flip-vs-blocking-wf-vblank.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [SKIP][58] ([Intel XE#1201] / [Intel XE#455]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-dg2-435/igt@kms_hdr@invalid-hdr.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-dg2-463/igt@kms_hdr@invalid-hdr.html

  * igt@kms_lease@page-flip-implicit-plane:
    - shard-adlp:         [ABORT][60] ([Intel XE#1205] / [Intel XE#1553]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-adlp-9/igt@kms_lease@page-flip-implicit-plane.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@kms_lease@page-flip-implicit-plane.html

  * igt@kms_lease@page-flip-implicit-plane@pipe-a-hdmi-a-1:
    - shard-adlp:         [ABORT][62] ([Intel XE#1205]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-adlp-9/igt@kms_lease@page-flip-implicit-plane@pipe-a-hdmi-a-1.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@kms_lease@page-flip-implicit-plane@pipe-a-hdmi-a-1.html

  * igt@kms_lease@page-flip-implicit-plane@pipe-b-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][64] ([Intel XE#1214] / [Intel XE#1553]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-adlp-9/igt@kms_lease@page-flip-implicit-plane@pipe-b-hdmi-a-1.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@kms_lease@page-flip-implicit-plane@pipe-b-hdmi-a-1.html

  * igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     [FAIL][66] ([Intel XE#616]) -> [PASS][67] +1 other test pass
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-dg2-435/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-dg2-463/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-1:
    - shard-adlp:         [FAIL][68] ([Intel XE#1874]) -> [PASS][69] +4 other tests pass
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-adlp-1/igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-1.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-6/igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-1.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][70] ([Intel XE#361]) -> [PASS][71] +1 other test pass
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_pm_rpm@drm-resources-equal:
    - {shard-lnl}:        [FAIL][72] -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-lnl-3/igt@kms_pm_rpm@drm-resources-equal.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-lnl-3/igt@kms_pm_rpm@drm-resources-equal.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - {shard-lnl}:        [DMESG-WARN][74] ([Intel XE#2042]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-lnl-2/igt@kms_pm_rpm@system-suspend-modeset.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-lnl-1/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_pm_rpm@universal-planes-dpms:
    - shard-adlp:         [SKIP][76] ([Intel XE#1201] / [Intel XE#1211]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-adlp-8/igt@kms_pm_rpm@universal-planes-dpms.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-4/igt@kms_pm_rpm@universal-planes-dpms.html

  * igt@kms_psr@fbc-psr2-suspend:
    - {shard-lnl}:        [DMESG-WARN][78] -> [PASS][79] +1 other test pass
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-lnl-3/igt@kms_psr@fbc-psr2-suspend.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-lnl-6/igt@kms_psr@fbc-psr2-suspend.html

  * igt@kms_psr@psr2-cursor-plane-onoff:
    - {shard-lnl}:        [DMESG-WARN][80] ([Intel XE#1622]) -> [PASS][81] +3 other tests pass
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-lnl-3/igt@kms_psr@psr2-cursor-plane-onoff.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-lnl-3/igt@kms_psr@psr2-cursor-plane-onoff.html

  * igt@kms_vrr@flipline:
    - {shard-lnl}:        [INCOMPLETE][82] -> [PASS][83] +1 other test pass
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-lnl-2/igt@kms_vrr@flipline.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-lnl-1/igt@kms_vrr@flipline.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-dg2-set2:     [TIMEOUT][84] ([Intel XE#1473]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-dg2-434/igt@xe_evict@evict-beng-threads-large.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-dg2-464/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_exec_basic@many-null-defer-bind:
    - shard-dg2-set2:     [FAIL][86] -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-dg2-434/igt@xe_exec_basic@many-null-defer-bind.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-dg2-435/igt@xe_exec_basic@many-null-defer-bind.html

  * igt@xe_gt_freq@freq_low_max:
    - shard-dg2-set2:     [FAIL][88] ([Intel XE#1045] / [Intel XE#1204]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-dg2-466/igt@xe_gt_freq@freq_low_max.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-dg2-434/igt@xe_gt_freq@freq_low_max.html

  * igt@xe_gt_freq@freq_reset:
    - shard-adlp:         [DMESG-WARN][90] ([Intel XE#1214]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-adlp-1/igt@xe_gt_freq@freq_reset.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-6/igt@xe_gt_freq@freq_reset.html

  
#### Warnings ####

  * igt@kms_async_flips@async-flip-with-page-flip-events:
    - shard-adlp:         [DMESG-WARN][92] ([Intel XE#1033] / [Intel XE#1214]) -> [INCOMPLETE][93] ([Intel XE#1033] / [Intel XE#1150] / [Intel XE#1195])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y:
    - shard-adlp:         [DMESG-WARN][94] ([Intel XE#1033] / [Intel XE#1214]) -> [INCOMPLETE][95] ([Intel XE#1033] / [Intel XE#1195])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-adlp:         [DMESG-FAIL][96] ([Intel XE#324]) -> [FAIL][97] ([Intel XE#1231])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [FAIL][98] ([Intel XE#1231]) -> [DMESG-FAIL][99] ([Intel XE#324])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_content_protection@legacy@pipe-a-dp-4:
    - shard-dg2-set2:     [FAIL][100] ([Intel XE#1178]) -> [INCOMPLETE][101] ([Intel XE#1195]) +1 other test incomplete
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-dg2-433/igt@kms_content_protection@legacy@pipe-a-dp-4.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-dg2-435/igt@kms_content_protection@legacy@pipe-a-dp-4.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-dg2-set2:     [DMESG-WARN][102] ([Intel XE#1214] / [Intel XE#282]) -> [DMESG-WARN][103] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-dg2-466/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-dg2-464/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@forked-move@pipe-b:
    - shard-dg2-set2:     [DMESG-WARN][104] ([Intel XE#1214] / [Intel XE#282]) -> [INCOMPLETE][105] ([Intel XE#1195]) +1 other test incomplete
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-dg2-466/igt@kms_cursor_legacy@forked-move@pipe-b.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-dg2-464/igt@kms_cursor_legacy@forked-move@pipe-b.html

  * igt@kms_cursor_legacy@torture-bo:
    - shard-dg2-set2:     [DMESG-WARN][106] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#877]) -> [DMESG-WARN][107] ([Intel XE#1214] / [Intel XE#282])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-dg2-433/igt@kms_cursor_legacy@torture-bo.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-dg2-466/igt@kms_cursor_legacy@torture-bo.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][108] ([Intel XE#1191] / [Intel XE#1214]) -> [DMESG-WARN][109] ([Intel XE#1214]) +2 other tests dmesg-warn
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-adlp-9/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-8/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [SKIP][110] ([Intel XE#1201] / [Intel XE#362]) -> [FAIL][111] ([Intel XE#1729])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][112] ([Intel XE#1214]) -> [DMESG-WARN][113] ([Intel XE#1191] / [Intel XE#1214])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-adlp-8/igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-4/igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-dg2-set2:     [DMESG-FAIL][114] ([Intel XE#482]) -> [TIMEOUT][115] ([Intel XE#1473] / [Intel XE#392])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-dg2-434/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-adlp:         [DMESG-WARN][116] ([Intel XE#1214] / [Intel XE#1760]) -> [DMESG-FAIL][117] ([Intel XE#1760])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-adlp-4/igt@xe_wedged@wedged-at-any-timeout.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-6/igt@xe_wedged@wedged-at-any-timeout.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1045]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1045
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1150
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1205]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1205
  [Intel XE#1211]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211
  [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1414
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1553]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1553
  [Intel XE#1595]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1595
  [Intel XE#1622]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1622
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1725]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1960]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1960
  [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/482
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#734]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/910
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * Linux: xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3 -> xe-pw-134830v1

  IGT_7886: 53b62502a04bd57cbcb3ae85ffc2cdf09b2b22a9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3: da370b38472debe8f38360e3beb4483e13c3e7b3
  xe-pw-134830v1: 134830v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/index.html

--===============5778186589580244223==
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
<tr><td><b>Series:</b></td><td>drm/xe/uc: Fix and start using xe_uc_fw_sanitize()</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/134830/">https://patchwork.freedesktop.org/series/134830/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3_full -&gt; xe-pw-134830v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-134830v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-134830v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-134830v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_sequence@get-busy@pipe-c-hdmi-a-1:<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-adlp-6/igt@kms_sequence@get-busy@pipe-c-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-2/igt@kms_sequence@get-busy@pipe-c-hdmi-a-1.html">ABORT</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_flip@flip-vs-suspend:<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-lnl-2/igt@kms_flip@flip-vs-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-lnl-2/igt@kms_flip@flip-vs-suspend.html">DMESG-WARN</a> +3 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-134830v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125">Intel XE#1125</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-dg2-463/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-dg2-433/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-x.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/734">Intel XE#734</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@kms_psr@psr2-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-busy:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-adlp-6/igt@kms_sequence@get-busy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-2/igt@kms_sequence@get-busy.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1553">Intel XE#1553</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-busy@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-adlp-6/igt@kms_sequence@get-busy@pipe-d-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-2/igt@kms_sequence@get-busy@pipe-d-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1553">Intel XE#1553</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x369:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@xe_copy_basic@mem-copy-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-small-multi-vm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@xe_evict@evict-cm-threads-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-dg2-463/igt@xe_evict@evict-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-dg2-433/igt@xe_evict@evict-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-rebind-imm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@xe_exec_fault_mode@many-execqueues-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_fixed_exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-adlp-2/igt@xe_gt_freq@freq_fixed_exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-8/igt@xe_gt_freq@freq_fixed_exec.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1414">Intel XE#1414</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-dg2-466/igt@xe_pm@d3hot-mmap-vram.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-dg2-464/igt@xe_pm@d3hot-mmap-vram.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@xe_pm@s2idle-vm-bind-prefetch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-adlp-2/igt@xe_pm@s4-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@xe_pm@s4-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-dg2-433/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-dg2-466/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-bo@pipe-a:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-dg2-433/igt@kms_cursor_legacy@torture-bo@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-dg2-466/igt@kms_cursor_legacy@torture-bo@pipe-a.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-lnl-3/igt@kms_flip@flip-vs-blocking-wf-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-lnl-8/igt@kms_flip@flip-vs-blocking-wf-vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-dg2-435/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-dg2-463/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_lease@page-flip-implicit-plane:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-adlp-9/igt@kms_lease@page-flip-implicit-plane.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1205">Intel XE#1205</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1553">Intel XE#1553</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@kms_lease@page-flip-implicit-plane.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_lease@page-flip-implicit-plane@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-adlp-9/igt@kms_lease@page-flip-implicit-plane@pipe-a-hdmi-a-1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1205">Intel XE#1205</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@kms_lease@page-flip-implicit-plane@pipe-a-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_lease@page-flip-implicit-plane@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-adlp-9/igt@kms_lease@page-flip-implicit-plane@pipe-b-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1553">Intel XE#1553</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@kms_lease@page-flip-implicit-plane@pipe-b-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-dg2-435/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-dg2-463/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-adlp-1/igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-6/igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-1.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@drm-resources-equal:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-lnl-3/igt@kms_pm_rpm@drm-resources-equal.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-lnl-3/igt@kms_pm_rpm@drm-resources-equal.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-lnl-2/igt@kms_pm_rpm@system-suspend-modeset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042">Intel XE#2042</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-lnl-1/igt@kms_pm_rpm@system-suspend-modeset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-adlp-8/igt@kms_pm_rpm@universal-planes-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-4/igt@kms_pm_rpm@universal-planes-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-suspend:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-lnl-3/igt@kms_psr@fbc-psr2-suspend.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-lnl-6/igt@kms_psr@fbc-psr2-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-plane-onoff:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-lnl-3/igt@kms_psr@psr2-cursor-plane-onoff.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1622">Intel XE#1622</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-lnl-3/igt@kms_psr@psr2-cursor-plane-onoff.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-lnl-2/igt@kms_vrr@flipline.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-lnl-1/igt@kms_vrr@flipline.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-dg2-434/igt@xe_evict@evict-beng-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-dg2-464/igt@xe_evict@evict-beng-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-dg2-434/igt@xe_exec_basic@many-null-defer-bind.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-dg2-435/igt@xe_exec_basic@many-null-defer-bind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_low_max:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-dg2-466/igt@xe_gt_freq@freq_low_max.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1045">Intel XE#1045</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-dg2-434/igt@xe_gt_freq@freq_low_max.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_reset:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-adlp-1/igt@xe_gt_freq@freq_reset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-6/igt@xe_gt_freq@freq_reset.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1150">Intel XE#1150</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-dg2-433/igt@kms_content_protection@legacy@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-dg2-435/igt@kms_content_protection@legacy@pipe-a-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-dg2-466/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-dg2-464/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/910">Intel XE#910</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-move@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-dg2-466/igt@kms_cursor_legacy@forked-move@pipe-b.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-dg2-464/igt@kms_cursor_legacy@forked-move@pipe-b.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-bo:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-dg2-433/igt@kms_cursor_legacy@torture-bo.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-dg2-466/igt@kms_cursor_legacy@torture-bo.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-adlp-9/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-8/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-adlp-8/igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-4/igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/482">Intel XE#482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-dg2-434/igt@xe_evict@evict-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-adlp-4/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-6/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3 -&gt; xe-pw-134830v1</li>
</ul>
<p>IGT_7886: 53b62502a04bd57cbcb3ae85ffc2cdf09b2b22a9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3: da370b38472debe8f38360e3beb4483e13c3e7b3<br />
  xe-pw-134830v1: 134830v1</p>

</body>
</html>

--===============5778186589580244223==--
