Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35EB7D3B7DD
	for <intel-xe@archiver.kernel.org>; Mon,  8 Dec 2025 09:42:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D364210E3F9;
	Mon,  8 Dec 2025 09:42:02 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B547410E3E6;
 Mon,  8 Dec 2025 09:42:01 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2249969325270874197=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Reset_recovery=5Fqueued_af?=
 =?utf-8?q?ter_issuing_RESFIX=5FSTART_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 08 Dec 2025 09:42:01 -0000
Message-ID: <176518692172.65816.9054323921109999101@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251208072739.336647-4-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20251208072739.336647-4-satyanarayana.k.v.p@intel.com>
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

--===============2249969325270874197==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Reset recovery_queued after issuing RESFIX_START (rev2)
URL   : https://patchwork.freedesktop.org/series/158541/
State : failure

== Summary ==

CI Bug Log - changes from xe-4203-db6505187efb9c255df1dd6e78c00d95fadfef79_FULL -> xe-pw-158541v2_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-158541v2_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-158541v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-158541v2_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_pm@s3-basic-exec:
    - shard-bmg:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4203-db6505187efb9c255df1dd6e78c00d95fadfef79/shard-bmg-8/igt@xe_pm@s3-basic-exec.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v2/shard-bmg-6/igt@xe_pm@s3-basic-exec.html

  
New tests
---------

  New tests have been introduced between xe-4203-db6505187efb9c255df1dd6e78c00d95fadfef79_FULL and xe-pw-158541v2_FULL:

### New IGT tests (8) ###

  * igt@kms_async_flips@crc-atomic@pipe-a-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.27] s

  * igt@kms_async_flips@crc-atomic@pipe-b-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.27] s

  * igt@kms_async_flips@crc-atomic@pipe-c-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.25] s

  * igt@kms_async_flips@crc-atomic@pipe-d-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.28] s

  * igt@kms_async_flips@test-time-stamp-atomic@pipe-a-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_async_flips@test-time-stamp-atomic@pipe-b-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_async_flips@test-time-stamp-atomic@pipe-c-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_async_flips@test-time-stamp-atomic@pipe-d-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  

Known issues
------------

  Here are the changes found in xe-pw-158541v2_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#2327]) +3 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v2/shard-bmg-1/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#1124]) +3 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v2/shard-bmg-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#367])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v2/shard-bmg-1/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#3432])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v2/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2887]) +5 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v2/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_chamelium_color@degamma:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2325])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v2/shard-bmg-1/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2252]) +2 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v2/shard-bmg-8/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_colorop@plane-xr24-xr24-ctm_3x4_bt709_dec_enc:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#6704]) +2 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v2/shard-bmg-8/igt@kms_colorop@plane-xr24-xr24-ctm_3x4_bt709_dec_enc.html

  * igt@kms_content_protection@dp-mst-suspend-resume:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#6743])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v2/shard-bmg-8/igt@kms_content_protection@dp-mst-suspend-resume.html

  * igt@kms_content_protection@suspend-resume:
    - shard-bmg:          NOTRUN -> [FAIL][12] ([Intel XE#1178]) +2 other tests fail
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v2/shard-bmg-1/igt@kms_content_protection@suspend-resume.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2320]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v2/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2244])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v2/shard-bmg-8/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2293] / [Intel XE#2380]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v2/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2293]) +1 other test skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v2/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2311]) +11 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v2/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#4141]) +2 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2313]) +9 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v2/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#5020])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v2/shard-bmg-1/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v2/shard-bmg-8/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#1406] / [Intel XE#1489]) +2 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v2/shard-bmg-1/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#1406] / [Intel XE#2387])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v2/shard-bmg-1/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-psr-sprite-blt:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +3 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v2/shard-bmg-8/igt@kms_psr@fbc-psr-sprite-blt.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2330])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v2/shard-bmg-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@xe_eudebug@basic-vm-access:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#4837]) +3 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v2/shard-bmg-1/igt@xe_eudebug@basic-vm-access.html

  * igt@xe_eudebug_online@pagefault-read:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#4837] / [Intel XE#6665]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v2/shard-bmg-8/igt@xe_eudebug_online@pagefault-read.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [PASS][28] -> [INCOMPLETE][29] ([Intel XE#6321])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4203-db6505187efb9c255df1dd6e78c00d95fadfef79/shard-bmg-4/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v2/shard-bmg-5/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2322]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v2/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#4943]) +7 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v2/shard-bmg-1/igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset.html

  * igt@xe_media_fill@media-fill:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2459] / [Intel XE#2596])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v2/shard-bmg-1/igt@xe_media_fill@media-fill.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2248])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v2/shard-bmg-8/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#2284]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v2/shard-bmg-1/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#579])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v2/shard-bmg-1/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-rpm:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#4733])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v2/shard-bmg-1/igt@xe_pxp@pxp-stale-bo-bind-post-rpm.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#944])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v2/shard-bmg-1/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-bmg:          NOTRUN -> [FAIL][38] ([Intel XE#6569])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v2/shard-bmg-8/igt@xe_sriov_flr@flr-vf1-clear.html

  
#### Possible fixes ####

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-bmg:          [INCOMPLETE][39] -> [PASS][40] +1 other test pass
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4203-db6505187efb9c255df1dd6e78c00d95fadfef79/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v2/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [FAIL][41] ([Intel XE#5299]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4203-db6505187efb9c255df1dd6e78c00d95fadfef79/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v2/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
    - shard-lnl:          [FAIL][43] ([Intel XE#301]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4203-db6505187efb9c255df1dd6e78c00d95fadfef79/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v2/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-lnl:          [FAIL][45] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][46] +1 other test pass
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4203-db6505187efb9c255df1dd6e78c00d95fadfef79/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v2/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x:
    - shard-adlp:         [FAIL][47] ([Intel XE#1874]) -> [PASS][48] +2 other tests pass
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4203-db6505187efb9c255df1dd6e78c00d95fadfef79/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v2/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][49], [PASS][50], [PASS][51], [PASS][52], [PASS][53], [PASS][54], [SKIP][55], [PASS][56], [PASS][57], [PASS][58], [PASS][59], [PASS][60], [PASS][61], [PASS][62], [PASS][63], [PASS][64], [PASS][65], [PASS][66], [PASS][67], [PASS][68], [PASS][69], [PASS][70], [PASS][71], [PASS][72], [PASS][73], [PASS][74]) ([Intel XE#378]) -> ([PASS][75], [PASS][76], [PASS][77], [PASS][78], [PASS][79], [PASS][80])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4203-db6505187efb9c255df1dd6e78c00d95fadfef79/shard-lnl-4/igt@xe_module_load@load.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4203-db6505187efb9c255df1dd6e78c00d95fadfef79/shard-lnl-8/igt@xe_module_load@load.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4203-db6505187efb9c255df1dd6e78c00d95fadfef79/shard-lnl-2/igt@xe_module_load@load.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4203-db6505187efb9c255df1dd6e78c00d95fadfef79/shard-lnl-5/igt@xe_module_load@load.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4203-db6505187efb9c255df1dd6e78c00d95fadfef79/shard-lnl-1/igt@xe_module_load@load.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4203-db6505187efb9c255df1dd6e78c00d95fadfef79/shard-lnl-8/igt@xe_module_load@load.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4203-db6505187efb9c255df1dd6e78c00d95fadfef79/shard-lnl-5/igt@xe_module_load@load.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4203-db6505187efb9c255df1dd6e78c00d95fadfef79/shard-lnl-1/igt@xe_module_load@load.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4203-db6505187efb9c255df1dd6e78c00d95fadfef79/shard-lnl-1/igt@xe_module_load@load.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4203-db6505187efb9c255df1dd6e78c00d95fadfef79/shard-lnl-1/igt@xe_module_load@load.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4203-db6505187efb9c255df1dd6e78c00d95fadfef79/shard-lnl-3/igt@xe_module_load@load.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4203-db6505187efb9c255df1dd6e78c00d95fadfef79/shard-lnl-4/igt@xe_module_load@load.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4203-db6505187efb9c255df1dd6e78c00d95fadfef79/shard-lnl-5/igt@xe_module_load@load.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4203-db6505187efb9c255df1dd6e78c00d95fadfef79/shard-lnl-2/igt@xe_module_load@load.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4203-db6505187efb9c255df1dd6e78c00d95fadfef79/shard-lnl-8/igt@xe_module_load@load.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4203-db6505187efb9c255df1dd6e78c00d95fadfef79/shard-lnl-8/igt@xe_module_load@load.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4203-db6505187efb9c255df1dd6e78c00d95fadfef79/shard-lnl-2/igt@xe_module_load@load.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4203-db6505187efb9c255df1dd6e78c00d95fadfef79/shard-lnl-2/igt@xe_module_load@load.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4203-db6505187efb9c255df1dd6e78c00d95fadfef79/shard-lnl-3/igt@xe_module_load@load.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4203-db6505187efb9c255df1dd6e78c00d95fadfef79/shard-lnl-5/igt@xe_module_load@load.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4203-db6505187efb9c255df1dd6e78c00d95fadfef79/shard-lnl-5/igt@xe_module_load@load.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4203-db6505187efb9c255df1dd6e78c00d95fadfef79/shard-lnl-3/igt@xe_module_load@load.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4203-db6505187efb9c255df1dd6e78c00d95fadfef79/shard-lnl-3/igt@xe_module_load@load.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4203-db6505187efb9c255df1dd6e78c00d95fadfef79/shard-lnl-4/igt@xe_module_load@load.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4203-db6505187efb9c255df1dd6e78c00d95fadfef79/shard-lnl-4/igt@xe_module_load@load.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4203-db6505187efb9c255df1dd6e78c00d95fadfef79/shard-lnl-4/igt@xe_module_load@load.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v2/shard-lnl-1/igt@xe_module_load@load.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v2/shard-lnl-2/igt@xe_module_load@load.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v2/shard-lnl-3/igt@xe_module_load@load.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v2/shard-lnl-5/igt@xe_module_load@load.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v2/shard-lnl-8/igt@xe_module_load@load.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v2/shard-lnl-4/igt@xe_module_load@load.html

  
#### Warnings ####

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-bmg:          [SKIP][81] ([Intel XE#4354]) -> [FAIL][82] ([Intel XE#6793])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4203-db6505187efb9c255df1dd6e78c00d95fadfef79/shard-bmg-8/igt@kms_dp_link_training@uhbr-sst.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v2/shard-bmg-6/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][83] ([Intel XE#3544]) -> [SKIP][84] ([Intel XE#3374] / [Intel XE#3544])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4203-db6505187efb9c255df1dd6e78c00d95fadfef79/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v2/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][85] ([Intel XE#2426]) -> [SKIP][86] ([Intel XE#2509])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4203-db6505187efb9c255df1dd6e78c00d95fadfef79/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v2/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5299]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
  [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
  [Intel XE#6704]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6704
  [Intel XE#6743]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6743
  [Intel XE#6793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6793
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-4203-db6505187efb9c255df1dd6e78c00d95fadfef79 -> xe-pw-158541v2

  IGT_8658: 5d645d459768a0e5c8e5e95b9fce16bb17319825 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4203-db6505187efb9c255df1dd6e78c00d95fadfef79: db6505187efb9c255df1dd6e78c00d95fadfef79
  xe-pw-158541v2: 158541v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v2/index.html

--===============2249969325270874197==
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
<tr><td><b>Series:</b></td><td>Reset recovery_queued after issuing RESFIX_S=
TART (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/158541/">https://patchwork.freedesktop.org/series/158541/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-158541v2/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-158541v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4203-db6505187efb9c255df1dd6e78c00d95f=
adfef79_FULL -&gt; xe-pw-158541v2_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-158541v2_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-158541v2_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1585=
41v2_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_pm@s3-basic-exec:<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4203-db6505187efb9c255df1dd6e78c00d95fadfef79/shard-bmg-8/igt@xe_pm@s3=
-basic-exec.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-158541v2/shard-bmg-6/igt@xe_pm@s3-basic-exec.html">DMESG-W=
ARN</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-4203-db6505187efb9c255df1dd6e7=
8c00d95fadfef79_FULL and xe-pw-158541v2_FULL:</p>
<h3>New IGT tests (8)</h3>
<ul>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-a-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-b-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-c-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-d-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp-atomic@pipe-a-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp-atomic@pipe-b-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp-atomic@pipe-c-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp-atomic@pipe-d-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-158541v2_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158541v2/shard-bmg-1/igt@kms_big_fb@4-tiled-32bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2327">Intel XE#2327</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158541v2/shard-bmg-1/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158541v2/shard-bmg-1/igt@kms_bw@linear-tiling-1-displa=
ys-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158541v2/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4=
-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158541v2/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-bas=
ic-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +5 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158541v2/shard-bmg-1/igt@kms_chamelium_color@degamma.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158541v2/shard-bmg-8/igt@kms_chamelium_edid@dp-edid-re=
solution-list.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2252">Intel XE#2252</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_colorop@plane-xr24-xr24-ctm_3x4_bt709_dec_enc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158541v2/shard-bmg-8/igt@kms_colorop@plane-xr24-xr24-c=
tm_3x4_bt709_dec_enc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/6704">Intel XE#6704</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-suspend-resume:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158541v2/shard-bmg-8/igt@kms_content_protection@dp-mst=
-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/6743">Intel XE#6743</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@suspend-resume:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158541v2/shard-bmg-1/igt@kms_content_protection@suspen=
d-resume.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1178">Intel XE#1178</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158541v2/shard-bmg-1/igt@kms_cursor_crc@cursor-onscree=
n-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158541v2/shard-bmg-8/igt@kms_dsc@dsc-with-bpc.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244=
">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158541v2/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bp=
p-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158541v2/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Inte=
l XE#2293</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158541v2/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs=
-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +11 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158541v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-=
1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +2 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158541v2/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-=
1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +9 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158541v2/shard-bmg-1/igt@kms_plane_multiple@tiling-y.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/5020">Intel XE#5020</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158541v2/shard-bmg-8/igt@kms_pm_rpm@modeset-lpsp.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3141">Intel XE#3141</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158541v2/shard-bmg-1/igt@kms_psr2_sf@fbc-pr-overlay-pr=
imary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158541v2/shard-bmg-1/igt@kms_psr2_su@page_flip-xrgb888=
8.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2387">Intel XE#2387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158541v2/shard-bmg-8/igt@kms_psr@fbc-psr-sprite-blt.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +3 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158541v2/shard-bmg-1/igt@kms_rotation_crc@primary-yf-t=
iled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2330">Intel XE#2330</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158541v2/shard-bmg-1/igt@xe_eudebug@basic-vm-access.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4837">Intel XE#4837</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@pagefault-read:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158541v2/shard-bmg-8/igt@xe_eudebug_online@pagefault-r=
ead.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4837">Intel XE#4837</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/6665">Intel XE#6665</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4203-db6505187efb9c255df1dd6e78c00d95fadfef79/shard-bmg-4/igt@xe_evict=
@evict-beng-mixed-many-threads-small.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v2/shard-bmg-5/igt@xe_evict=
@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158541v2/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exe=
c-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +1 oth=
er test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158541v2/shard-bmg-1/igt@xe_exec_system_allocator@thre=
ads-many-mmap-new-huge-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +7 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158541v2/shard-bmg-1/igt@xe_media_fill@media-fill.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2459">Intel XE#2459</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2596">Intel XE#2596</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158541v2/shard-bmg-8/igt@xe_oa@oa-tlb-invalidate.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
248">Intel XE#2248</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158541v2/shard-bmg-1/igt@xe_pm@s3-d3cold-basic-exec.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2284">Intel XE#2284</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158541v2/shard-bmg-1/igt@xe_pm@vram-d3cold-threshold.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-rpm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158541v2/shard-bmg-1/igt@xe_pxp@pxp-stale-bo-bind-post=
-rpm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158541v2/shard-bmg-1/igt@xe_query@multigpu-query-uc-fw=
-version-huc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158541v2/shard-bmg-8/igt@xe_sriov_flr@flr-vf1-clear.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/6569">Intel XE#6569</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4203-db6505187efb9c255df1dd6e78c00d95fadfef79/shard-bmg-3/igt@kms_atom=
ic_transition@plane-all-modeset-transition-fencing.html">INCOMPLETE</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v2/shar=
d-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html=
">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4203-db6505187efb9c255df1dd6e78c00d95fadfef79/shard-bmg-6/igt@kms_curs=
or_legacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/5299">Intel XE#5299</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v2/shard-bmg-2/ig=
t@kms_cursor_legacy@flip-vs-cursor-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4203-db6505187efb9c255df1dd6e78c00d95fadfef79/shard-lnl-3/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@a-edp1.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v2/shar=
d-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4203-db6505187efb9c255df1dd6e78c00d95fadfef79/shard-lnl-3/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@c-edp1.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE=
#3149</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-158541v2/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-e=
dp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4203-db6505187efb9c255df1dd6e78c00d95fadfef79/shard-adlp-8/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1585=
41v2/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-=
to-x.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-4203-db6505187efb9c255df1dd6e78c00d95fadfef79/shard-lnl-4/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-4203-db6505187efb9c255df1dd6e78c00d95fadfef79/shard-lnl-8/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-4203-db6505187efb9c255df1dd6e78c00d95fadfef79/shard-lnl-2/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-4203-db6505187efb9c255df1dd6e78c00d95fadfef79/shard-lnl-5=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-4203-db6505187efb9c255df1dd6e78c00d95fadfef79/shard-l=
nl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-4203-db6505187efb9c255df1dd6e78c00d95fadfef79/sha=
rd-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-4203-db6505187efb9c255df1dd6e78c00d95fadfef79=
/shard-lnl-5/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-4203-db6505187efb9c255df1dd6e78c00d95fadf=
ef79/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-4203-db6505187efb9c255df1dd6e78c00d95=
fadfef79/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-4203-db6505187efb9c255df1dd6e78c0=
0d95fadfef79/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4203-db6505187efb9c255df1dd6e=
78c00d95fadfef79/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4203-db6505187efb9c255df1=
dd6e78c00d95fadfef79/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4203-db6505187efb9c25=
5df1dd6e78c00d95fadfef79/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4203-db6505187efb=
9c255df1dd6e78c00d95fadfef79/shard-lnl-2/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4203-db650518=
7efb9c255df1dd6e78c00d95fadfef79/shard-lnl-8/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4203-db65=
05187efb9c255df1dd6e78c00d95fadfef79/shard-lnl-8/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4203-=
db6505187efb9c255df1dd6e78c00d95fadfef79/shard-lnl-2/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4=
203-db6505187efb9c255df1dd6e78c00d95fadfef79/shard-lnl-2/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-4203-db6505187efb9c255df1dd6e78c00d95fadfef79/shard-lnl-3/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-4203-db6505187efb9c255df1dd6e78c00d95fadfef79/shard-lnl-5/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-4203-db6505187efb9c255df1dd6e78c00d95fadfef79/shard-lnl-5/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-4203-db6505187efb9c255df1dd6e78c00d95fadfef79/shard-lnl-3/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-4203-db6505187efb9c255df1dd6e78c00d95fadfef79/shard-lnl-=
3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-4203-db6505187efb9c255df1dd6e78c00d95fadfef79/shard-=
lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-4203-db6505187efb9c255df1dd6e78c00d95fadfef79/sh=
ard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-4203-db6505187efb9c255df1dd6e78c00d95fadfef7=
9/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; (<a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v2/shard-lnl=
-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-158541v2/shard-lnl-2/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158=
541v2/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v2/shard-lnl-5/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-158541v2/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v2/shard-lnl=
-4/igt@xe_module_load@load.html">PASS</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4203-db6505187efb9c255df1dd6e78c00d95fadfef79/shard-bmg-8/igt@kms_dp_l=
ink_training@uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v2/shard-bmg-6/igt@kms_dp_li=
nk_training@uhbr-sst.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/6793">Intel XE#6793</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4203-db6505187efb9c255df1dd6e78c00d95fadfef79/shard-bmg-4/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v2/shard-bmg-5/igt@kms_hdr@bri=
ghtness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4203-db6505187efb9c255df1dd6e78c00d95fadfef79/shard-bmg-1/igt@kms_tile=
d_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v2/sha=
rd-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">=
Intel XE#2509</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4203-db6505187efb9c255df1dd6e78c00d95fadfef79 -&gt; xe-pw-158=
541v2</li>
</ul>
<p>IGT_8658: 5d645d459768a0e5c8e5e95b9fce16bb17319825 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-4203-db6505187efb9c255df1dd6e78c00d95fadfef79: db6505187efb9c255df1dd6=
e78c00d95fadfef79<br />
  xe-pw-158541v2: 158541v2</p>

</body>
</html>

--===============2249969325270874197==--
