Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89738EF48D1
	for <intel-xe@archiver.kernel.org>; Fri, 13 Feb 2026 06:23:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 245CA10E793;
	Fri, 13 Feb 2026 06:23:42 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD58D10E793;
 Fri, 13 Feb 2026 06:23:40 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7600192390385053091=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_series_starting_with_=5B1/?=
 =?utf-8?q?2=5D_drm/xe=3A_Do_not_process_GT_WAs_and_tunings_for_SRIOV_VF?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Harish Chegondi" <harish.chegondi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 13 Feb 2026 06:23:40 -0000
Message-ID: <177096382087.250939.2277471990064092529@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <e883c0cd98609066e7f7904128163a02105daf33.1770852521.git.harish.chegondi@intel.com>
In-Reply-To: <e883c0cd98609066e7f7904128163a02105daf33.1770852521.git.harish.chegondi@intel.com>
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

--===============7600192390385053091==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] drm/xe: Do not process GT WAs and tunings for SRIOV VF
URL   : https://patchwork.freedesktop.org/series/161516/
State : failure

== Summary ==

CI Bug Log - changes from xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68_FULL -> xe-pw-161516v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-161516v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-161516v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-161516v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@2x-blocking-absolute-wf_vblank@ab-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][1] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-bmg-6/igt@kms_flip@2x-blocking-absolute-wf_vblank@ab-dp2-hdmi-a3.html

  * igt@kms_plane@pixel-format-linear-modifier@pipe-b-plane-0:
    - shard-lnl:          [PASS][2] -> [FAIL][3] +1 other test fail
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68/shard-lnl-4/igt@kms_plane@pixel-format-linear-modifier@pipe-b-plane-0.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-lnl-6/igt@kms_plane@pixel-format-linear-modifier@pipe-b-plane-0.html

  
Known issues
------------

  Here are the changes found in xe-pw-161516v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#1124]) +2 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-bmg-9/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2314] / [Intel XE#2894])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-bmg-9/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#2887]) +3 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-bmg-9/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#3432])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2325])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-bmg-9/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2252]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-bmg-9/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html

  * igt@kms_content_protection@suspend-resume@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][10] ([Intel XE#1178] / [Intel XE#3304])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-bmg-4/igt@kms_content_protection@suspend-resume@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2320])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-bmg-9/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2321])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-bmg-9/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_feature_discovery@display-4x:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#1138])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-bmg-9/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#7178])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-bmg-9/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#4141]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2311]) +7 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2313]) +5 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#7111] / [Intel XE#7130] / [Intel XE#7131])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-bmg-9/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-a-plane-3:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#7130]) +3 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-bmg-9/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-a-plane-3.html

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-a-plane-5:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#7131])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-bmg-9/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-a-plane-5.html

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-b-plane-5:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#7111] / [Intel XE#7131])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-bmg-9/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-b-plane-5.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#6886]) +4 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-bmg-9/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#870])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-bmg-9/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#1406] / [Intel XE#1489]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-bmg-9/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#1406] / [Intel XE#2387])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-bmg-9/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@pr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-bmg-9/igt@kms_psr@pr-suspend.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2330])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-bmg-9/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#3414] / [Intel XE#3904])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-bmg-9/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_sharpness_filter@filter-scaler-downscale:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#6503])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-bmg-9/igt@kms_sharpness_filter@filter-scaler-downscale.html

  * igt@xe_eudebug@discovery-empty:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#4837]) +2 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-bmg-9/igt@xe_eudebug@discovery-empty.html

  * igt@xe_eudebug_online@pagefault-read:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#4837] / [Intel XE#6665])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-bmg-9/igt@xe_eudebug_online@pagefault-read.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2322]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-bmg-9/igt@xe_exec_basic@multigpu-no-exec-userptr-rebind.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#7136]) +2 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-bmg-9/igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind.html

  * igt@xe_exec_multi_queue@many-execs-close-fd-smem:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#6874]) +6 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-bmg-9/igt@xe_exec_multi_queue@many-execs-close-fd-smem.html

  * igt@xe_exec_system_allocator@partial-atomic-remap-cpu-fault:
    - shard-bmg:          [PASS][35] -> [FAIL][36] ([Intel XE#5625])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68/shard-bmg-7/igt@xe_exec_system_allocator@partial-atomic-remap-cpu-fault.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-bmg-3/igt@xe_exec_system_allocator@partial-atomic-remap-cpu-fault.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#7138]) +2 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-bmg-9/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race.html

  * igt@xe_multigpu_svm@mgpu-migration-basic:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#6964])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-bmg-9/igt@xe_multigpu_svm@mgpu-migration-basic.html

  * igt@xe_pm@s3-exec-after:
    - shard-bmg:          [PASS][39] -> [DMESG-WARN][40] ([Intel XE#3428])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68/shard-bmg-7/igt@xe_pm@s3-exec-after.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-bmg-3/igt@xe_pm@s3-exec-after.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-rpm:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#4733])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-bmg-9/igt@xe_pxp@pxp-stale-bo-bind-post-rpm.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#944])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-bmg-9/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [FAIL][43] ([Intel XE#5299]) -> [PASS][44] +1 other test pass
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [FAIL][45] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][46] +1 other test pass
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_pm_rpm@universal-planes-dpms:
    - shard-bmg:          [INCOMPLETE][47] ([Intel XE#6891]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68/shard-bmg-3/igt@kms_pm_rpm@universal-planes-dpms.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-bmg-9/igt@kms_pm_rpm@universal-planes-dpms.html

  * igt@kms_pm_rpm@universal-planes-dpms@plane-134:
    - shard-bmg:          [INCOMPLETE][49] -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68/shard-bmg-3/igt@kms_pm_rpm@universal-planes-dpms@plane-134.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-bmg-9/igt@kms_pm_rpm@universal-planes-dpms@plane-134.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][51] ([Intel XE#6321]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68/shard-bmg-9/igt@xe_evict@evict-mixed-many-threads-small.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-bmg-4/igt@xe_evict@evict-mixed-many-threads-small.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#5299]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299
  [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6891]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6891
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#7111]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7111
  [Intel XE#7130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7130
  [Intel XE#7131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7131
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68 -> xe-pw-161516v1

  IGT_8751: af788251f1ef729d17c802aec2c4547b52059e58 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68: b4bfe7d753afaf6ea4950111a309a4e2ef5aef68
  xe-pw-161516v1: 161516v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/index.html

--===============7600192390385053091==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] drm/xe: Do not process GT WAs and tunings for SRIOV VF</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161516/">https://patchwork.freedesktop.org/series/161516/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68_FULL -&gt; xe-pw-161516v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-161516v1_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-161516v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-161516v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-bmg-6/igt@kms_flip@2x-blocking-absolute-wf_vblank@ab-dp2-hdmi-a3.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier@pipe-b-plane-0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68/shard-lnl-4/igt@kms_plane@pixel-format-linear-modifier@pipe-b-plane-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-lnl-6/igt@kms_plane@pixel-format-linear-modifier@pipe-b-plane-0.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-161516v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-bmg-9/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-bmg-9/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-bmg-9/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-bmg-9/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-bmg-9/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@suspend-resume@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-bmg-4/igt@kms_content_protection@suspend-resume@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-bmg-9/igt@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-bmg-9/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-bmg-9/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-bmg-9/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-bmg-9/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7111">Intel XE#7111</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7130">Intel XE#7130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7131">Intel XE#7131</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-a-plane-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-bmg-9/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-a-plane-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7130">Intel XE#7130</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-a-plane-5:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-bmg-9/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-a-plane-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7131">Intel XE#7131</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-b-plane-5:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-bmg-9/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-b-plane-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7111">Intel XE#7111</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7131">Intel XE#7131</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-bmg-9/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-bmg-9/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-bmg-9/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-bmg-9/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-bmg-9/igt@kms_psr@pr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-bmg-9/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-bmg-9/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-scaler-downscale:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-bmg-9/igt@kms_sharpness_filter@filter-scaler-downscale.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-empty:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-bmg-9/igt@xe_eudebug@discovery-empty.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@pagefault-read:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-bmg-9/igt@xe_eudebug_online@pagefault-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-bmg-9/igt@xe_exec_basic@multigpu-no-exec-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-bmg-9/igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-execs-close-fd-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-bmg-9/igt@xe_exec_multi_queue@many-execs-close-fd-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@partial-atomic-remap-cpu-fault:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68/shard-bmg-7/igt@xe_exec_system_allocator@partial-atomic-remap-cpu-fault.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-bmg-3/igt@xe_exec_system_allocator@partial-atomic-remap-cpu-fault.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625">Intel XE#5625</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-bmg-9/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-migration-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-bmg-9/igt@xe_multigpu_svm@mgpu-migration-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-exec-after:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68/shard-bmg-7/igt@xe_pm@s3-exec-after.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-bmg-3/igt@xe_pm@s3-exec-after.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428">Intel XE#3428</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-rpm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-bmg-9/igt@xe_pxp@pxp-stale-bo-bind-post-rpm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-bmg-9/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299">Intel XE#5299</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68/shard-bmg-3/igt@kms_pm_rpm@universal-planes-dpms.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6891">Intel XE#6891</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-bmg-9/igt@kms_pm_rpm@universal-planes-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms@plane-134:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68/shard-bmg-3/igt@kms_pm_rpm@universal-planes-dpms@plane-134.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-bmg-9/igt@kms_pm_rpm@universal-planes-dpms@plane-134.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68/shard-bmg-9/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161516v1/shard-bmg-4/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68 -&gt; xe-pw-161516v1</li>
</ul>
<p>IGT_8751: af788251f1ef729d17c802aec2c4547b52059e58 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68: b4bfe7d753afaf6ea4950111a309a4e2ef5aef68<br />
  xe-pw-161516v1: 161516v1</p>

</body>
</html>

--===============7600192390385053091==--
