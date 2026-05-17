Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D78CCD4F3C
	for <intel-xe@archiver.kernel.org>; Sun, 17 May 2026 05:05:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4D1310E50E;
	Sun, 17 May 2026 05:05:28 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9396A10E644;
 Sun, 17 May 2026 05:05:27 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3380595083641663302=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/i915/display=3A_Use_PI?=
 =?utf-8?q?PEDMC=5FFRMTMSTMP_on_display_ver_=3E=3D_30_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 17 May 2026 05:05:27 -0000
Message-ID: <177899432764.77765.6516766232683984417@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260515082443.975592-1-suraj.kandpal@intel.com>
In-Reply-To: <20260515082443.975592-1-suraj.kandpal@intel.com>
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

--===============3380595083641663302==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: Use PIPEDMC_FRMTMSTMP on display ver >= 30 (rev2)
URL   : https://patchwork.freedesktop.org/series/166634/
State : success

== Summary ==

CI Bug Log - changes from xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40_FULL -> xe-pw-166634v2_FULL
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

  Here are the changes found in xe-pw-166634v2_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotunplug-rescan:
    - shard-bmg:          [PASS][1] -> [SKIP][2] ([Intel XE#6779])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-5/igt@core_hotunplug@hotunplug-rescan.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-2/igt@core_hotunplug@hotunplug-rescan.html

  * igt@intel_hwmon@hwmon-read:
    - shard-bmg:          [PASS][3] -> [SKIP][4] ([Intel XE#5177] / [Intel XE#6703])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-5/igt@intel_hwmon@hwmon-read.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-2/igt@intel_hwmon@hwmon-read.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2327])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-7/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#1124]) +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-7/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2887]) +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-7/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2724] / [Intel XE#7449])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-7/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2325] / [Intel XE#7358]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-10/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2252])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-7/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2390] / [Intel XE#6974])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-7/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_cursor_crc@cursor-offscreen-32x10:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2320]) +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-32x10.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][13] -> [FAIL][14] ([Intel XE#7571])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [PASS][15] -> [FAIL][16] ([Intel XE#301]) +1 other test fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#7178] / [Intel XE#7351])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#4141]) +2 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2311]) +12 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2313]) +10 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#7061])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-render.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#7283])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-7/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier.html

  * igt@kms_pm_backlight@fade:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-7/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_rpm@universal-planes-dpms:
    - shard-bmg:          [PASS][24] -> [DMESG-FAIL][25] ([Intel XE#5545] / [Intel XE#7774]) +3 other tests dmesg-fail
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-10/igt@kms_pm_rpm@universal-planes-dpms.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-2/igt@kms_pm_rpm@universal-planes-dpms.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#1489]) +2 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html

  * igt@kms_psr@psr-sprite-plane-move:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2234] / [Intel XE#2850]) +4 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-10/igt@kms_psr@psr-sprite-plane-move.html

  * igt@xe_eudebug_online@stopped-thread:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#7636]) +2 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-10/igt@xe_eudebug_online@stopped-thread.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2322] / [Intel XE#7372]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-7/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html

  * igt@xe_exec_multi_queue@many-execs-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#6874]) +7 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-10/igt@xe_exec_multi_queue@many-execs-userptr.html

  * igt@xe_exec_threads@threads-multi-queue-fd-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#7138]) +2 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-fd-userptr-invalidate.html

  * igt@xe_multigpu_svm@mgpu-atomic-op-conflict:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#6964]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-7/igt@xe_multigpu_svm@mgpu-atomic-op-conflict.html

  * igt@xe_pm@d3hot-i2c:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#5742] / [Intel XE#7328] / [Intel XE#7400])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-7/igt@xe_pm@d3hot-i2c.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#2284] / [Intel XE#7370])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-7/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_prefetch_fault@prefetch-fault-svm:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#7599])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-7/igt@xe_prefetch_fault@prefetch-fault-svm.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#944])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-7/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:
    - shard-bmg:          [PASS][37] -> [SKIP][38] ([Intel XE#6703]) +262 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-5/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-2/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-lnl:          [PASS][39] -> [ABORT][40] ([Intel XE#7914])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-lnl-1/igt@xe_wedged@wedged-mode-toggle.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-lnl-3/igt@xe_wedged@wedged-mode-toggle.html

  
#### Possible fixes ####

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [FAIL][41] ([Intel XE#301]) -> [PASS][42] +2 other tests pass
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_hdr@bpc-switch:
    - shard-bmg:          [INCOMPLETE][43] -> [PASS][44] +1 other test pass
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-5/igt@kms_hdr@bpc-switch.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-7/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f:
    - shard-bmg:          [SKIP][45] ([Intel XE#7915]) -> [PASS][46] +3 other tests pass
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-3/igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-6/igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f.html

  * igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads:
    - shard-bmg:          [FAIL][47] ([Intel XE#7850]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-7/igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-5/igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads.html

  
#### Warnings ####

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-bmg:          [SKIP][49] ([Intel XE#2327]) -> [SKIP][50] ([Intel XE#6703]) +2 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-5/igt@kms_big_fb@linear-32bpp-rotate-90.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-2/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-bmg:          [SKIP][51] ([Intel XE#610] / [Intel XE#7387]) -> [SKIP][52] ([Intel XE#6703])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-10/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-2/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-bmg:          [SKIP][53] ([Intel XE#2328] / [Intel XE#7367]) -> [SKIP][54] ([Intel XE#6703])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-10/igt@kms_big_fb@yf-tiled-addfb.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-2/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-bmg:          [SKIP][55] ([Intel XE#1124]) -> [SKIP][56] ([Intel XE#6703]) +2 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-target-2160x1440p:
    - shard-bmg:          [SKIP][57] ([Intel XE#7679]) -> [SKIP][58] ([Intel XE#6703])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-target-2160x1440p.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-target-2160x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-target-1920x1080p:
    - shard-bmg:          [SKIP][59] ([Intel XE#367]) -> [SKIP][60] ([Intel XE#6703])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-10/igt@kms_bw@linear-tiling-4-displays-target-1920x1080p.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-2/igt@kms_bw@linear-tiling-4-displays-target-1920x1080p.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:
    - shard-bmg:          [SKIP][61] ([Intel XE#2887]) -> [SKIP][62] ([Intel XE#6703]) +4 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-10/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-2/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-bmg:          [SKIP][63] ([Intel XE#3432]) -> [SKIP][64] ([Intel XE#6703])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:
    - shard-bmg:          [SKIP][65] ([Intel XE#2252]) -> [SKIP][66] ([Intel XE#6703]) +3 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-5/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-2/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html

  * igt@kms_content_protection@type1:
    - shard-bmg:          [SKIP][67] ([Intel XE#7642]) -> [SKIP][68] ([Intel XE#6703])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-10/igt@kms_content_protection@type1.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-2/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-offscreen-64x21:
    - shard-bmg:          [SKIP][69] ([Intel XE#2320]) -> [SKIP][70] ([Intel XE#6703]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-64x21.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-64x21.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-bmg:          [SKIP][71] ([Intel XE#2321] / [Intel XE#7355]) -> [SKIP][72] ([Intel XE#6703])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-5/igt@kms_cursor_crc@cursor-random-512x170.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-2/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-lnl:          [SKIP][73] ([Intel XE#309] / [Intel XE#7343] / [Intel XE#7935]) -> [SKIP][74] ([Intel XE#309] / [Intel XE#7343])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-lnl-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-bmg:          [SKIP][75] ([Intel XE#2244]) -> [SKIP][76] ([Intel XE#6703])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-10/igt@kms_dsc@dsc-with-bpc.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-2/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
    - shard-bmg:          [SKIP][77] ([Intel XE#4422] / [Intel XE#7442]) -> [SKIP][78] ([Intel XE#6703])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-5/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-2/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html

  * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
    - shard-bmg:          [SKIP][79] ([Intel XE#4141]) -> [SKIP][80] ([Intel XE#6703]) +4 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][81] ([Intel XE#2311]) -> [SKIP][82] ([Intel XE#6703]) +24 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-render.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-bmg:          [SKIP][83] ([Intel XE#2350] / [Intel XE#7503]) -> [SKIP][84] ([Intel XE#6703])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-10/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-2/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][85] ([Intel XE#2313]) -> [SKIP][86] ([Intel XE#6703]) +19 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-5/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-2/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-mmap-wc:
    - shard-bmg:          [SKIP][87] ([Intel XE#7061]) -> [SKIP][88] ([Intel XE#6703]) +3 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-5/igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-mmap-wc.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-2/igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-mmap-wc.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][89] ([Intel XE#3544] / [Intel XE#7916]) -> [SKIP][90] ([Intel XE#3544] / [Intel XE#7915] / [Intel XE#7916])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-10/igt@kms_hdr@brightness-with-hdr.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f:
    - shard-bmg:          [SKIP][91] ([Intel XE#7916]) -> [SKIP][92] ([Intel XE#7915]) +1 other test skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-10/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-8/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][93] ([Intel XE#1503]) -> [SKIP][94] ([Intel XE#6703])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-5/igt@kms_hdr@invalid-hdr.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-2/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-bmg:          [SKIP][95] ([Intel XE#4090] / [Intel XE#7443]) -> [SKIP][96] ([Intel XE#6703])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-10/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-2/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier:
    - shard-bmg:          [SKIP][97] ([Intel XE#7283]) -> [SKIP][98] ([Intel XE#6703])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-10/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-2/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-bmg:          [SKIP][99] ([Intel XE#5020] / [Intel XE#7348]) -> [SKIP][100] ([Intel XE#6703])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-5/igt@kms_plane_multiple@tiling-y.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-2/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5:
    - shard-bmg:          [SKIP][101] ([Intel XE#2763] / [Intel XE#6886]) -> [SKIP][102] ([Intel XE#6703])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-5/igt@kms_plane_scaling@planes-downscale-factor-0-5.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-2/igt@kms_plane_scaling@planes-downscale-factor-0-5.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          [SKIP][103] ([Intel XE#1489]) -> [SKIP][104] ([Intel XE#6703]) +2 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-10/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@fbc-psr2-basic:
    - shard-bmg:          [SKIP][105] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][106] ([Intel XE#6703]) +4 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-10/igt@kms_psr@fbc-psr2-basic.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-2/igt@kms_psr@fbc-psr2-basic.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-bmg:          [SKIP][107] ([Intel XE#2413]) -> [SKIP][108] ([Intel XE#6703])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-10/igt@kms_scaling_modes@scaling-mode-full-aspect.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-2/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-bmg:          [SKIP][109] ([Intel XE#2450] / [Intel XE#5857]) -> [SKIP][110] ([Intel XE#6557] / [Intel XE#6703])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-10/igt@kms_tv_load_detect@load-detect.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-2/igt@kms_tv_load_detect@load-detect.html

  * igt@xe_eudebug_online@single-step:
    - shard-bmg:          [SKIP][111] ([Intel XE#7636]) -> [SKIP][112] ([Intel XE#6703]) +3 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-5/igt@xe_eudebug_online@single-step.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-2/igt@xe_eudebug_online@single-step.html

  * igt@xe_evict@evict-small-multi-queue:
    - shard-bmg:          [SKIP][113] ([Intel XE#7140]) -> [SKIP][114] ([Intel XE#6703])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-10/igt@xe_evict@evict-small-multi-queue.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-2/igt@xe_evict@evict-small-multi-queue.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:
    - shard-bmg:          [SKIP][115] ([Intel XE#2322] / [Intel XE#7372]) -> [SKIP][116] ([Intel XE#6703]) +1 other test skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-10/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-2/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr:
    - shard-bmg:          [SKIP][117] ([Intel XE#7136]) -> [SKIP][118] ([Intel XE#6703]) +5 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-5/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-2/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr.html

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-dyn-priority-smem:
    - shard-bmg:          [SKIP][119] ([Intel XE#6874]) -> [SKIP][120] ([Intel XE#6703]) +11 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-10/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-dyn-priority-smem.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-2/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-dyn-priority-smem.html

  * igt@xe_exec_reset@cm-multi-queue-close-execqueues:
    - shard-bmg:          [SKIP][121] ([Intel XE#7866]) -> [SKIP][122] ([Intel XE#6703])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-10/igt@xe_exec_reset@cm-multi-queue-close-execqueues.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-2/igt@xe_exec_reset@cm-multi-queue-close-execqueues.html

  * igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind:
    - shard-bmg:          [SKIP][123] ([Intel XE#7138]) -> [SKIP][124] ([Intel XE#6703]) +3 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind.html

  * igt@xe_pm@d3cold-i2c:
    - shard-bmg:          [SKIP][125] ([Intel XE#5694] / [Intel XE#7370]) -> [SKIP][126] ([Intel XE#6703])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-5/igt@xe_pm@d3cold-i2c.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-2/igt@xe_pm@d3cold-i2c.html

  * igt@xe_query@multigpu-query-invalid-query:
    - shard-bmg:          [SKIP][127] ([Intel XE#944]) -> [SKIP][128] ([Intel XE#6703])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-5/igt@xe_query@multigpu-query-invalid-query.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-2/igt@xe_query@multigpu-query-invalid-query.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
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
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#4090]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5177]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5177
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
  [Intel XE#5742]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742
  [Intel XE#5857]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5857
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#6557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557
  [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
  [Intel XE#6779]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6779
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#7140]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7328
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
  [Intel XE#7387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387
  [Intel XE#7400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7400
  [Intel XE#7442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442
  [Intel XE#7443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7443
  [Intel XE#7449]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449
  [Intel XE#7503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7503
  [Intel XE#7571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571
  [Intel XE#7599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599
  [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
  [Intel XE#7774]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774
  [Intel XE#7850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7850
  [Intel XE#7866]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7866
  [Intel XE#7914]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7914
  [Intel XE#7915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915
  [Intel XE#7916]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7916
  [Intel XE#7935]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40 -> xe-pw-166634v2

  IGT_8917: 65d691069f26fc2a42c79e2364241320b85d48bc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40: d47455904378e2bd24294dae67bfc7e442f58c40
  xe-pw-166634v2: 166634v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/index.html

--===============3380595083641663302==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: Use PIPEDMC_FRMTMSTMP on display ver &gt;= 30 (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/166634/">https://patchwork.freedesktop.org/series/166634/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40_FULL -&gt; xe-pw-166634v2_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-166634v2_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunplug-rescan:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-5/igt@core_hotunplug@hotunplug-rescan.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-2/igt@core_hotunplug@hotunplug-rescan.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6779">Intel XE#6779</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-5/igt@intel_hwmon@hwmon-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-2/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5177">Intel XE#5177</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-7/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-7/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-7/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-7/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449">Intel XE#7449</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-10/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-7/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-7/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x10:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571">Intel XE#7571</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-7/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-7/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376">Intel XE#7376</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760">Intel XE#7760</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-10/igt@kms_pm_rpm@universal-planes-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-2/igt@kms_pm_rpm@universal-planes-dpms.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774">Intel XE#7774</a>) +3 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-10/igt@kms_psr@psr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@stopped-thread:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-10/igt@xe_eudebug_online@stopped-thread.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-7/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-execs-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-10/igt@xe_exec_multi_queue@many-execs-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-fd-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-fd-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-atomic-op-conflict:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-7/igt@xe_multigpu_svm@mgpu-atomic-op-conflict.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-i2c:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-7/igt@xe_pm@d3hot-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742">Intel XE#5742</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7328">Intel XE#7328</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7400">Intel XE#7400</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-7/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_prefetch_fault@prefetch-fault-svm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-7/igt@xe_prefetch_fault@prefetch-fault-svm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599">Intel XE#7599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-7/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-5/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-2/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +262 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-lnl-1/igt@xe_wedged@wedged-mode-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-lnl-3/igt@xe_wedged@wedged-mode-toggle.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7914">Intel XE#7914</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-5/igt@kms_hdr@bpc-switch.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-7/igt@kms_hdr@bpc-switch.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-3/igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-6/igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-7/igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7850">Intel XE#7850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-5/igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-5/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-2/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-10/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387">Intel XE#7387</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-2/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-10/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328">Intel XE#2328</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367">Intel XE#7367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-2/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-target-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-target-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-target-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-10/igt@kms_bw@linear-tiling-4-displays-target-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-2/igt@kms_bw@linear-tiling-4-displays-target-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-10/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-2/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-5/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-2/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-10/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-2/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-64x21:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-5/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-2/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935">Intel XE#7935</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-lnl-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-10/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-2/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-5/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442">Intel XE#7442</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-2/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-10/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350">Intel XE#2350</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7503">Intel XE#7503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-2/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-5/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-2/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-5/igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-2/igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-10/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7916">Intel XE#7916</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7916">Intel XE#7916</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-10/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7916">Intel XE#7916</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-8/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-5/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-2/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-10/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090">Intel XE#4090</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7443">Intel XE#7443</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-2/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-10/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-2/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-5/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020">Intel XE#5020</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348">Intel XE#7348</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-2/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-5/igt@kms_plane_scaling@planes-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-2/igt@kms_plane_scaling@planes-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-10/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-10/igt@kms_psr@fbc-psr2-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-2/igt@kms_psr@fbc-psr2-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-10/igt@kms_scaling_modes@scaling-mode-full-aspect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-2/igt@kms_scaling_modes@scaling-mode-full-aspect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-10/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450">Intel XE#2450</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5857">Intel XE#5857</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-2/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-5/igt@xe_eudebug_online@single-step.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-2/igt@xe_eudebug_online@single-step.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-10/igt@xe_evict@evict-small-multi-queue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140">Intel XE#7140</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-2/igt@xe_evict@evict-small-multi-queue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-10/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-2/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-5/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-2/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-dyn-priority-smem:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-10/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-dyn-priority-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-2/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-dyn-priority-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-multi-queue-close-execqueues:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-10/igt@xe_exec_reset@cm-multi-queue-close-execqueues.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7866">Intel XE#7866</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-2/igt@xe_exec_reset@cm-multi-queue-close-execqueues.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-i2c:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-5/igt@xe_pm@d3cold-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694">Intel XE#5694</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-2/igt@xe_pm@d3cold-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-query:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40/shard-bmg-5/igt@xe_query@multigpu-query-invalid-query.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166634v2/shard-bmg-2/igt@xe_query@multigpu-query-invalid-query.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40 -&gt; xe-pw-166634v2</li>
</ul>
<p>IGT_8917: 65d691069f26fc2a42c79e2364241320b85d48bc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40: d47455904378e2bd24294dae67bfc7e442f58c40<br />
  xe-pw-166634v2: 166634v2</p>

</body>
</html>

--===============3380595083641663302==--
