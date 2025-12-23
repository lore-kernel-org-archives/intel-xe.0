Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A80EE6F093
	for <intel-xe@archiver.kernel.org>; Tue, 23 Dec 2025 14:02:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41C0410E1B2;
	Tue, 23 Dec 2025 14:02:05 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1827210E1B2;
 Tue, 23 Dec 2025 14:02:04 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4946404988417826875=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/i915/cdclk=3A_Incorpor?=
 =?utf-8?q?ate_Xe3=5FLPD_changes_for_CD2X_divider?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 23 Dec 2025 14:02:04 -0000
Message-ID: <176649852409.114115.12600099659756697092@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251222-xe3_lpd-no-cd2x-divider-v1-1-96f1e112baaa@intel.com>
In-Reply-To: <20251222-xe3_lpd-no-cd2x-divider-v1-1-96f1e112baaa@intel.com>
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

--===============4946404988417826875==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/cdclk: Incorporate Xe3_LPD changes for CD2X divider
URL   : https://patchwork.freedesktop.org/series/159400/
State : failure

== Summary ==

CI Bug Log - changes from xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9_FULL -> xe-pw-159400v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-159400v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-159400v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-159400v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_plane_multiple@2x-tiling-4@pipe-b-hdmi-a-3-pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-4@pipe-b-hdmi-a-3-pipe-c-dp-2.html

  
#### Warnings ####

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-bmg:          [SKIP][2] ([Intel XE#6703]) -> [INCOMPLETE][3]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-4.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-4.html

  
Known issues
------------

  Here are the changes found in xe-pw-159400v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp-2:
    - shard-bmg:          [PASS][4] -> [FAIL][5] ([Intel XE#6078])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp-2.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp-2.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#1124]) +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-7/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          [PASS][7] -> [SKIP][8] ([Intel XE#2314] / [Intel XE#2894])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-10/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2314] / [Intel XE#2894])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-7/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2887]) +2 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#3432])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2325])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-7/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2252]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2320]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][15] -> [SKIP][16] ([Intel XE#2291])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-10/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [PASS][17] -> [FAIL][18] ([Intel XE#6715])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-10/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:
    - shard-bmg:          [PASS][19] -> [SKIP][20] ([Intel XE#2316]) +2 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-10/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp2:
    - shard-bmg:          [PASS][21] -> [FAIL][22] ([Intel XE#5338] / [Intel XE#6266]) +1 other test fail
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-2/igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp2.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-7/igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp2.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [PASS][23] -> [FAIL][24] ([Intel XE#301]) +1 other test fail
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [PASS][25] -> [FAIL][26] ([Intel XE#301] / [Intel XE#3149])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [PASS][27] -> [DMESG-FAIL][28] ([Intel XE#5208] / [Intel XE#6576])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-7/igt@kms_flip@flip-vs-suspend-interruptible.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-9/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp2:
    - shard-bmg:          [PASS][29] -> [DMESG-FAIL][30] ([Intel XE#6576])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp2.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-9/igt@kms_flip@flip-vs-suspend-interruptible@a-dp2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2293] / [Intel XE#2380]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2293]) +7 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2311]) +8 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#4141]) +2 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#2312]) +4 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2313]) +3 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2350])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-2:
    - shard-bmg:          [PASS][38] -> [ABORT][39] ([Intel XE#6740]) +1 other test abort
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-4/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-2.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-1/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-2.html

  * igt@kms_hdr@bpc-switch@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [ABORT][40] ([Intel XE#6740]) +2 other tests abort
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-7/igt@kms_hdr@bpc-switch@pipe-a-dp-2.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2925])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-7/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#6886]) +7 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-10/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#2392]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-7/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#1406] / [Intel XE#1489]) +2 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#1406] / [Intel XE#2387])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-7/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@psr-no-drrs:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +3 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@kms_psr@psr-no-drrs.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#3414] / [Intel XE#3904])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-7/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2413])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@xe_eudebug@discovery-empty:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#4837]) +2 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@xe_eudebug@discovery-empty.html

  * igt@xe_exec_basic@multigpu-no-exec-null-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2322]) +2 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-7/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html

  * igt@xe_exec_multi_queue@max-queues-preempt-mode-basic-smem:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#6874]) +6 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-7/igt@xe_exec_multi_queue@max-queues-preempt-mode-basic-smem.html

  * igt@xe_exec_system_allocator@many-execqueues-mmap-free-huge:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#4943]) +7 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-7/igt@xe_exec_system_allocator@many-execqueues-mmap-free-huge.html

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-remap:
    - shard-bmg:          [PASS][53] -> [ABORT][54] ([Intel XE#3970])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-8/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-remap.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-remap.html

  * igt@xe_media_fill@media-fill:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#2459] / [Intel XE#2596])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-7/igt@xe_media_fill@media-fill.html

  * igt@xe_pmu@engine-activity-accuracy-90:
    - shard-lnl:          [PASS][56] -> [FAIL][57] ([Intel XE#6251]) +2 other tests fail
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-lnl-1/igt@xe_pmu@engine-activity-accuracy-90.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-lnl-3/igt@xe_pmu@engine-activity-accuracy-90.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#4733])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-7/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotreplug-lateclose:
    - shard-bmg:          [SKIP][59] ([Intel XE#6779]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@core_hotunplug@hotreplug-lateclose.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-2/igt@core_hotunplug@hotreplug-lateclose.html

  * igt@device_reset@unbind-reset-rebind:
    - shard-bmg:          [SKIP][61] ([Intel XE#6815]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@device_reset@unbind-reset-rebind.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-2/igt@device_reset@unbind-reset-rebind.html

  * igt@fbdev@unaligned-read:
    - shard-bmg:          [SKIP][63] ([Intel XE#2134]) -> [PASS][64] +1 other test pass
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@fbdev@unaligned-read.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-2/igt@fbdev@unaligned-read.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2:
    - shard-bmg:          [FAIL][65] ([Intel XE#6078]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [INCOMPLETE][67] ([Intel XE#3862]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-bmg:          [SKIP][69] ([Intel XE#2291]) -> [PASS][70] +1 other test pass
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-bmg:          [SKIP][71] ([Intel XE#2316]) -> [PASS][72] +1 other test pass
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-4/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-bmg:          [INCOMPLETE][73] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][74] +1 other test pass
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-7/igt@kms_flip@2x-flip-vs-suspend.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-9/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_pm_rpm@i2c:
    - shard-bmg:          [SKIP][75] ([Intel XE#6693]) -> [PASS][76] +5 other tests pass
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_pm_rpm@i2c.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@kms_pm_rpm@i2c.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][77] ([Intel XE#6321]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-8/igt@xe_evict@evict-mixed-many-threads-small.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_system_allocator@once-mmap-race-nomemset:
    - shard-bmg:          [SKIP][79] ([Intel XE#6557] / [Intel XE#6703]) -> [PASS][80] +8 other tests pass
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@xe_exec_system_allocator@once-mmap-race-nomemset.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@xe_exec_system_allocator@once-mmap-race-nomemset.html

  * igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:
    - shard-bmg:          [SKIP][81] ([Intel XE#6703]) -> [PASS][82] +849 other tests pass
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html

  * igt@xe_live_ktest@xe_bo:
    - shard-bmg:          [SKIP][83] ([Intel XE#2229]) -> [PASS][84] +1 other test pass
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@xe_live_ktest@xe_bo.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-10/igt@xe_live_ktest@xe_bo.html

  * igt@xe_mmap@vram-system:
    - shard-bmg:          [DMESG-WARN][85] -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-2/igt@xe_mmap@vram-system.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-8/igt@xe_mmap@vram-system.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-bmg:          [SKIP][87] ([Intel XE#6703]) -> [SKIP][88] ([Intel XE#2327]) +2 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-3/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          [SKIP][89] ([Intel XE#6703]) -> [SKIP][90] ([Intel XE#1124]) +15 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-2/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-bmg:          [SKIP][91] ([Intel XE#6703]) -> [SKIP][92] ([Intel XE#607]) +1 other test skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-10/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
    - shard-bmg:          [SKIP][93] ([Intel XE#6703]) -> [SKIP][94] ([Intel XE#367]) +3 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-bmg:          [SKIP][95] ([Intel XE#6703]) -> [SKIP][96] ([Intel XE#3432]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs:
    - shard-bmg:          [SKIP][97] ([Intel XE#6703]) -> [SKIP][98] ([Intel XE#2887]) +23 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-10/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-bmg:          [SKIP][99] ([Intel XE#6703]) -> [SKIP][100] ([Intel XE#2724]) +1 other test skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_cdclk@plane-scaling.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-2/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-bmg:          [SKIP][101] ([Intel XE#6703]) -> [SKIP][102] ([Intel XE#2325])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_chamelium_color@ctm-0-75.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-3/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-bmg:          [SKIP][103] ([Intel XE#6703]) -> [SKIP][104] ([Intel XE#2252]) +12 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-bmg:          [SKIP][105] ([Intel XE#6703]) -> [SKIP][106] ([Intel XE#2390]) +1 other test skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_content_protection@dp-mst-lic-type-1.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-3/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-bmg:          [SKIP][107] ([Intel XE#6703]) -> [SKIP][108] ([Intel XE#2321]) +2 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-max-size:
    - shard-bmg:          [SKIP][109] ([Intel XE#6703]) -> [SKIP][110] ([Intel XE#2320]) +6 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-max-size.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-max-size.html

  * igt@kms_cursor_crc@cursor-rapid-movement-256x85:
    - shard-bmg:          [SKIP][111] ([Intel XE#6557] / [Intel XE#6703]) -> [SKIP][112] ([Intel XE#2320])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-2/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-bmg:          [SKIP][113] ([Intel XE#6703]) -> [SKIP][114] ([Intel XE#2291]) +1 other test skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-bmg:          [SKIP][115] ([Intel XE#6703]) -> [SKIP][116] ([Intel XE#2286])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [SKIP][117] ([Intel XE#6703]) -> [SKIP][118] ([Intel XE#4302])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_display_modes@extended-mode-basic.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-bmg:          [SKIP][119] ([Intel XE#6703]) -> [SKIP][120] ([Intel XE#4354])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_dp_link_training@non-uhbr-mst.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-2/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-bmg:          [SKIP][121] ([Intel XE#6703]) -> [SKIP][122] ([Intel XE#2244]) +1 other test skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_dsc@dsc-fractional-bpp.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-bmg:          [SKIP][123] ([Intel XE#6703]) -> [SKIP][124] ([Intel XE#776])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_fbcon_fbt@psr-suspend.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-2/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-bmg:          [SKIP][125] ([Intel XE#6703]) -> [SKIP][126] ([Intel XE#2375])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_feature_discovery@dp-mst.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr2:
    - shard-bmg:          [SKIP][127] ([Intel XE#6703]) -> [SKIP][128] ([Intel XE#2374])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_feature_discovery@psr2.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-2/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-bmg:          [SKIP][129] ([Intel XE#6703]) -> [SKIP][130] ([Intel XE#2316]) +2 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-lnl:          [FAIL][131] ([Intel XE#301]) -> [FAIL][132] ([Intel XE#301] / [Intel XE#3149])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-bmg:          [SKIP][133] ([Intel XE#6703]) -> [SKIP][134] ([Intel XE#2293] / [Intel XE#2380]) +5 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][135] ([Intel XE#2311]) -> [SKIP][136] ([Intel XE#2312]) +5 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-10/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt:
    - shard-bmg:          [SKIP][137] ([Intel XE#6703]) -> [SKIP][138] ([Intel XE#4141]) +15 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-bmg:          [SKIP][139] ([Intel XE#2312]) -> [SKIP][140] ([Intel XE#4141])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][141] ([Intel XE#6557] / [Intel XE#6703]) -> [SKIP][142] ([Intel XE#2312])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][143] ([Intel XE#4141]) -> [SKIP][144] ([Intel XE#2312]) +1 other test skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][145] ([Intel XE#2312]) -> [SKIP][146] ([Intel XE#2311]) +6 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][147] ([Intel XE#6703]) -> [SKIP][148] ([Intel XE#2311]) +35 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][149] ([Intel XE#6703]) -> [SKIP][150] ([Intel XE#2312]) +16 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt:
    - shard-bmg:          [SKIP][151] ([Intel XE#6703]) -> [SKIP][152] ([Intel XE#2313]) +35 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][153] ([Intel XE#2313]) -> [SKIP][154] ([Intel XE#2312]) +7 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-10/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][155] ([Intel XE#2312]) -> [SKIP][156] ([Intel XE#2313]) +4 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-blt.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][157] ([Intel XE#6703]) -> [SKIP][158] ([Intel XE#3374] / [Intel XE#3544])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][159] ([Intel XE#6703]) -> [ABORT][160] ([Intel XE#6740])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-2/igt@kms_hdr@invalid-hdr.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-8/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-bmg:          [SKIP][161] ([Intel XE#6703]) -> [SKIP][162] ([Intel XE#6911])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_joiner@basic-ultra-joiner.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-10/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_panel_fitting@legacy:
    - shard-bmg:          [SKIP][163] ([Intel XE#6703]) -> [SKIP][164] ([Intel XE#2486])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_panel_fitting@legacy.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-10/igt@kms_panel_fitting@legacy.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-bmg:          [SKIP][165] ([Intel XE#6703]) -> [SKIP][166] ([Intel XE#4329] / [Intel XE#6912])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-10/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
    - shard-lnl:          [SKIP][167] ([Intel XE#4329]) -> [SKIP][168] ([Intel XE#4329] / [Intel XE#6912])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-lnl-2/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-lnl-5/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-bmg:          [SKIP][169] ([Intel XE#6703]) -> [SKIP][170] ([Intel XE#2393])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_plane_lowres@tiling-y.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-2/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][171] ([Intel XE#5021]) -> [SKIP][172] ([Intel XE#4596])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-10/igt@kms_plane_multiple@2x-tiling-y.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          [SKIP][173] ([Intel XE#6703]) -> [SKIP][174] ([Intel XE#5020])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_plane_multiple@tiling-yf.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:
    - shard-bmg:          [SKIP][175] ([Intel XE#6703]) -> [SKIP][176] ([Intel XE#6886]) +1 other test skip
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-10/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          [SKIP][177] ([Intel XE#6703]) -> [SKIP][178] ([Intel XE#2938])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_pm_backlight@brightness-with-dpms.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-2/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade:
    - shard-bmg:          [SKIP][179] ([Intel XE#6703]) -> [SKIP][180] ([Intel XE#870])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_pm_backlight@fade.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-3/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-bmg:          [SKIP][181] ([Intel XE#6703]) -> [SKIP][182] ([Intel XE#3309])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_pm_dc@dc5-retention-flops.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-2/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:
    - shard-bmg:          [SKIP][183] ([Intel XE#1406] / [Intel XE#6703]) -> [SKIP][184] ([Intel XE#1406] / [Intel XE#1489]) +9 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-3/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr@psr2-no-drrs:
    - shard-bmg:          [SKIP][185] ([Intel XE#1406] / [Intel XE#6703]) -> [SKIP][186] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +19 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_psr@psr2-no-drrs.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@kms_psr@psr2-no-drrs.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-bmg:          [SKIP][187] ([Intel XE#6703]) -> [SKIP][188] ([Intel XE#2330])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_sharpness_filter@filter-formats:
    - shard-bmg:          [SKIP][189] ([Intel XE#6703]) -> [SKIP][190] ([Intel XE#6503]) +4 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_sharpness_filter@filter-formats.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-2/igt@kms_sharpness_filter@filter-formats.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-bmg:          [SKIP][191] ([Intel XE#6557] / [Intel XE#6703]) -> [SKIP][192] ([Intel XE#2450])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_tv_load_detect@load-detect.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-2/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@flip-suspend:
    - shard-bmg:          [SKIP][193] ([Intel XE#6703]) -> [SKIP][194] ([Intel XE#1499]) +2 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_vrr@flip-suspend.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-10/igt@kms_vrr@flip-suspend.html

  * igt@xe_eudebug@basic-vm-access-userptr:
    - shard-bmg:          [SKIP][195] ([Intel XE#6703]) -> [SKIP][196] ([Intel XE#4837]) +13 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@xe_eudebug@basic-vm-access-userptr.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-2/igt@xe_eudebug@basic-vm-access-userptr.html

  * igt@xe_eudebug_online@set-breakpoint-sigint-debugger:
    - shard-bmg:          [SKIP][197] ([Intel XE#6703]) -> [SKIP][198] ([Intel XE#4837] / [Intel XE#6665]) +6 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html

  * igt@xe_eudebug_sriov@deny-eudebug:
    - shard-bmg:          [SKIP][199] ([Intel XE#6703]) -> [SKIP][200] ([Intel XE#5793])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@xe_eudebug_sriov@deny-eudebug.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-2/igt@xe_eudebug_sriov@deny-eudebug.html

  * igt@xe_exec_basic@multigpu-once-null-defer-mmap:
    - shard-bmg:          [SKIP][201] ([Intel XE#6703]) -> [SKIP][202] ([Intel XE#2322]) +9 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@xe_exec_basic@multigpu-once-null-defer-mmap.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@xe_exec_basic@multigpu-once-null-defer-mmap.html

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority:
    - shard-bmg:          [SKIP][203] ([Intel XE#6703]) -> [SKIP][204] ([Intel XE#6874]) +42 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority.html

  * igt@xe_exec_system_allocator@many-64k-mmap-new-huge:
    - shard-bmg:          [SKIP][205] ([Intel XE#6703]) -> [SKIP][206] ([Intel XE#5007]) +1 other test skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@xe_exec_system_allocator@many-64k-mmap-new-huge.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-3/igt@xe_exec_system_allocator@many-64k-mmap-new-huge.html

  * igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset:
    - shard-bmg:          [SKIP][207] ([Intel XE#6703]) -> [SKIP][208] ([Intel XE#4943]) +35 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html

  * igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:
    - shard-bmg:          [SKIP][209] ([Intel XE#6703]) -> [SKIP][210] ([Intel XE#6281])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-2/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html

  * igt@xe_mmap@small-bar:
    - shard-bmg:          [SKIP][211] ([Intel XE#6703]) -> [SKIP][212] ([Intel XE#586])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@xe_mmap@small-bar.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-3/igt@xe_mmap@small-bar.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-bmg:          [SKIP][213] ([Intel XE#6703]) -> [SKIP][214] ([Intel XE#1420])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@xe_pat@pat-index-xehpc.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-10/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelp:
    - shard-bmg:          [SKIP][215] ([Intel XE#6703]) -> [SKIP][216] ([Intel XE#2245])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@xe_pat@pat-index-xelp.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pm@d3cold-basic:
    - shard-bmg:          [SKIP][217] ([Intel XE#6703]) -> [SKIP][218] ([Intel XE#2284]) +1 other test skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-2/igt@xe_pm@d3cold-basic.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-8/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@d3hot-i2c:
    - shard-bmg:          [SKIP][219] ([Intel XE#6703]) -> [SKIP][220] ([Intel XE#5742])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@xe_pm@d3hot-i2c.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-2/igt@xe_pm@d3hot-i2c.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-bmg:          [SKIP][221] ([Intel XE#6703]) -> [SKIP][222] ([Intel XE#579])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@xe_pm@vram-d3cold-threshold.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-2/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pxp@pxp-termination-key-update-post-suspend:
    - shard-bmg:          [SKIP][223] ([Intel XE#6703]) -> [SKIP][224] ([Intel XE#4733]) +1 other test skip
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@xe_pxp@pxp-termination-key-update-post-suspend.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-10/igt@xe_pxp@pxp-termination-key-update-post-suspend.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-bmg:          [SKIP][225] ([Intel XE#6703]) -> [SKIP][226] ([Intel XE#944]) +4 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@xe_query@multigpu-query-invalid-cs-cycles.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
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
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
  [Intel XE#2459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
  [Intel XE#5338]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5338
  [Intel XE#5742]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#5793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5793
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#6251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251
  [Intel XE#6266]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266
  [Intel XE#6281]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557
  [Intel XE#6576]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6576
  [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
  [Intel XE#6693]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693
  [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
  [Intel XE#6715]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6715
  [Intel XE#6740]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740
  [Intel XE#6779]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6779
  [Intel XE#6815]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6815
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
  [Intel XE#6912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9 -> xe-pw-159400v1

  IGT_8674: f38f4d8e9c65aff45ac807e646d06e38bc3193a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9: f101d56dc32350daa45c130ff7a6d46512f614a9
  xe-pw-159400v1: 159400v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/index.html

--===============4946404988417826875==
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
<tr><td><b>Series:</b></td><td>drm/i915/cdclk: Incorporate Xe3_LPD changes for CD2X divider</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/159400/">https://patchwork.freedesktop.org/series/159400/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9_FULL -&gt; xe-pw-159400v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-159400v1_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-159400v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-159400v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_plane_multiple@2x-tiling-4@pipe-b-hdmi-a-3-pipe-c-dp-2:<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-4@pipe-b-hdmi-a-3-pipe-c-dp-2.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_plane_multiple@2x-tiling-4:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-4.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-159400v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-7/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-10/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-7/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-7/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-10/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-10/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6715">Intel XE#6715</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-10/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-2/igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-7/igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5338">Intel XE#5338</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266">Intel XE#6266</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-7/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-9/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208">Intel XE#5208</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6576">Intel XE#6576</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-9/igt@kms_flip@flip-vs-suspend-interruptible@a-dp2.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6576">Intel XE#6576</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350">Intel XE#2350</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-4/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-1/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-2.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740">Intel XE#6740</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-7/igt@kms_hdr@bpc-switch@pipe-a-dp-2.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740">Intel XE#6740</a>) +2 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-7/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-10/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-7/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392">Intel XE#2392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-7/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-no-drrs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@kms_psr@psr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-7/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-empty:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@xe_eudebug@discovery-empty.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-7/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@max-queues-preempt-mode-basic-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-7/igt@xe_exec_multi_queue@max-queues-preempt-mode-basic-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-free-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-7/igt@xe_exec_system_allocator@many-execqueues-mmap-free-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-remap:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-8/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-remap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-remap.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-7/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459">Intel XE#2459</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596">Intel XE#2596</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-90:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-lnl-1/igt@xe_pmu@engine-activity-accuracy-90.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-lnl-3/igt@xe_pmu@engine-activity-accuracy-90.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251">Intel XE#6251</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-7/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug-lateclose:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@core_hotunplug@hotreplug-lateclose.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6779">Intel XE#6779</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-2/igt@core_hotunplug@hotreplug-lateclose.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@device_reset@unbind-reset-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6815">Intel XE#6815</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-2/igt@device_reset@unbind-reset-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@unaligned-read:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@fbdev@unaligned-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-2/igt@fbdev@unaligned-read.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-4/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-7/igt@kms_flip@2x-flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-9/igt@kms_flip@2x-flip-vs-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_pm_rpm@i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693">Intel XE#6693</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@kms_pm_rpm@i2c.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-8/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-race-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@xe_exec_system_allocator@once-mmap-race-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@xe_exec_system_allocator@once-mmap-race-nomemset.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html">PASS</a> +849 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-10/igt@xe_live_ktest@xe_bo.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram-system:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-2/igt@xe_mmap@vram-system.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-8/igt@xe_mmap@vram-system.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-3/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-2/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-10/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-10/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-2/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-3/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-3/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-max-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-256x85:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-2/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302">Intel XE#4302</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-2/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-2/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375">Intel XE#2375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-2/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374">Intel XE#2374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-10/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +35 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +35 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-10/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-2/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-8/igt@kms_hdr@invalid-hdr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740">Intel XE#6740</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-10/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911">Intel XE#6911</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-10/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486">Intel XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-10/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329">Intel XE#4329</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912">Intel XE#6912</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-lnl-2/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329">Intel XE#4329</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-lnl-5/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329">Intel XE#4329</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912">Intel XE#6912</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-2/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-10/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020">Intel XE#5020</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-10/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-2/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-3/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-2/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309">Intel XE#3309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-3/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-no-drrs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_psr@psr2-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@kms_psr@psr2-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-formats:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_sharpness_filter@filter-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-2/igt@kms_sharpness_filter@filter-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-2/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450">Intel XE#2450</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-10/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@xe_eudebug@basic-vm-access-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-2/igt@xe_eudebug@basic-vm-access-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint-sigint-debugger:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-eudebug:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@xe_eudebug_sriov@deny-eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-2/igt@xe_eudebug_sriov@deny-eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5793">Intel XE#5793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-mmap:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@xe_exec_basic@multigpu-once-null-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@xe_exec_basic@multigpu-once-null-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +42 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-new-huge:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@xe_exec_system_allocator@many-64k-mmap-new-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-3/igt@xe_exec_system_allocator@many-64k-mmap-new-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007">Intel XE#5007</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +35 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-2/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281">Intel XE#6281</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-3/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/586">Intel XE#586</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-10/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-2/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-8/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-i2c:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@xe_pm@d3hot-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-2/igt@xe_pm@d3hot-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742">Intel XE#5742</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-2/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@xe_pxp@pxp-termination-key-update-post-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-10/igt@xe_pxp@pxp-termination-key-update-post-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9/shard-bmg-5/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159400v1/shard-bmg-4/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +4 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9 -&gt; xe-pw-159400v1</li>
</ul>
<p>IGT_8674: f38f4d8e9c65aff45ac807e646d06e38bc3193a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9: f101d56dc32350daa45c130ff7a6d46512f614a9<br />
  xe-pw-159400v1: 159400v1</p>

</body>
</html>

--===============4946404988417826875==--
