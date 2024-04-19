Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EBC7C4345F
	for <intel-xe@archiver.kernel.org>; Fri, 19 Apr 2024 03:40:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B012211232E;
	Fri, 19 Apr 2024 03:40:00 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52EDE10FD13;
 Fri, 19 Apr 2024 03:39:59 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6872203987743108008=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EFULL=3A_success_for_drm/xe=3A_Define_all_possible_e?=
 =?utf-8?q?ngines_in_media_IP_descriptors?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 19 Apr 2024 03:39:59 -0000
Message-ID: <171349799931.1519312.16607038910578328067@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240417152621.3357990-2-matthew.d.roper@intel.com>
In-Reply-To: <20240417152621.3357990-2-matthew.d.roper@intel.com>
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

--===============6872203987743108008==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Define all possible engines in media IP descriptors
URL   : https://patchwork.freedesktop.org/series/132568/
State : success

== Summary ==

CI Bug Log - changes from xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878_full -> xe-pw-132568v1_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-132568v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotunbind-rebind:
    - shard-dg2-set2:     [PASS][1] -> [DMESG-WARN][2] ([Intel XE#1214])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-dg2-464/igt@core_hotunplug@hotunbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-435/igt@core_hotunplug@hotunbind-rebind.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][3] -> [FAIL][4] ([Intel XE#827]) +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-dg2-464/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-6.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-435/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-6.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-adlp:         NOTRUN -> [SKIP][5] ([Intel XE#1124] / [Intel XE#1201]) +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][6] ([Intel XE#1201] / [Intel XE#316])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][7] ([Intel XE#1201] / [Intel XE#787]) +62 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-463/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][8] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +7 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-a-hdmi-a-2:
    - shard-adlp:         NOTRUN -> [SKIP][9] ([Intel XE#1201] / [Intel XE#787]) +17 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-7:
    - shard-dg2-set2:     NOTRUN -> [FAIL][10] ([Intel XE#616]) +3 other tests fail
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-7.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-7:
    - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +20 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-7.html

  * igt@kms_cdclk@mode-transition@pipe-c-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#1201] / [Intel XE#314]) +3 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-435/igt@kms_cdclk@mode-transition@pipe-c-dp-4.html

  * igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][13] ([Intel XE#1152] / [Intel XE#1201]) +2 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-1.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#1201]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-464/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][15] ([Intel XE#1178])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-435/igt@kms_content_protection@atomic-dpms@pipe-a-dp-4.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][16] ([Intel XE#1204])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-435/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
    - shard-dg2-set2:     [PASS][17] -> [DMESG-WARN][18] ([Intel XE#1214] / [Intel XE#282]) +2 other tests dmesg-warn
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-dg2-463/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-463/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html

  * igt@kms_cursor_legacy@torture-move:
    - shard-dg2-set2:     [PASS][19] -> [DMESG-WARN][20] ([Intel XE#1214] / [Intel XE#877]) +1 other test dmesg-warn
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-dg2-466/igt@kms_cursor_legacy@torture-move.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-464/igt@kms_cursor_legacy@torture-move.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a6-hdmi-a7:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][21] ([Intel XE#1214]) +5 other tests dmesg-warn
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-464/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a6-hdmi-a7.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [SKIP][22] ([Intel XE#1201] / [Intel XE#455]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][23] ([Intel XE#324])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-4-4-mc-ccs-to-linear:
    - shard-dg2-set2:     NOTRUN -> [FAIL][24] ([Intel XE#650]) +47 other tests fail
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-435/igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-4-4-mc-ccs-to-linear.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#1201] / [Intel XE#656]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:
    - shard-adlp:         NOTRUN -> [INCOMPLETE][26] ([Intel XE#1195]) +1 other test incomplete
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1:
    - shard-adlp:         [PASS][27] -> [DMESG-WARN][28] ([Intel XE#1191] / [Intel XE#1214]) +1 other test dmesg-warn
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-4/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-8/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1.html

  * igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [FAIL][29] ([Intel XE#616]) +3 other tests fail
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][30] ([Intel XE#1201] / [Intel XE#305]) +2 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][31] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-hdmi-a-1.html

  * igt@kms_pm_rpm@basic-rte:
    - shard-dg2-set2:     [PASS][32] -> [FAIL][33] ([Intel XE#1203])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-dg2-464/igt@kms_pm_rpm@basic-rte.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-435/igt@kms_pm_rpm@basic-rte.html

  * igt@kms_pm_rpm@i2c:
    - shard-adlp:         [PASS][34] -> [SKIP][35] ([Intel XE#1201] / [Intel XE#1211])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-4/igt@kms_pm_rpm@i2c.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-8/igt@kms_pm_rpm@i2c.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg2-set2:     [PASS][36] -> [SKIP][37] ([Intel XE#1201] / [Intel XE#1211]) +2 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-dg2-464/igt@kms_pm_rpm@modeset-non-lpsp.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-435/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-adlp:         NOTRUN -> [SKIP][38] ([Intel XE#1149] / [Intel XE#1201])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-dg2-set2:     [PASS][39] -> [FAIL][40] ([Intel XE#771] / [Intel XE#899])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][41] -> [FAIL][42] ([Intel XE#899])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     [PASS][43] -> [INCOMPLETE][44] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#402])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-beng-mixed-threads-small:
    - shard-dg2-set2:     [PASS][45] -> [FAIL][46] ([Intel XE#1259]) +1 other test fail
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-dg2-433/igt@xe_evict@evict-beng-mixed-threads-small.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-436/igt@xe_evict@evict-beng-mixed-threads-small.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-dg2-set2:     [PASS][47] -> [TIMEOUT][48] ([Intel XE#1473] / [Intel XE#821])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-dg2-464/igt@xe_evict@evict-beng-threads-large.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-435/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-dg2-set2:     [PASS][49] -> [INCOMPLETE][50] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-dg2-434/igt@xe_evict@evict-mixed-threads-large.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_evict@evict-threads-large:
    - shard-dg2-set2:     [PASS][51] -> [TIMEOUT][52] ([Intel XE#1473] / [Intel XE#392]) +1 other test timeout
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-dg2-464/igt@xe_evict@evict-threads-large.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-435/igt@xe_evict@evict-threads-large.html

  * igt@xe_exec_basic@multigpu-no-exec-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][53] ([Intel XE#1201] / [Intel XE#1392]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@xe_exec_basic@multigpu-no-exec-rebind.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][54] ([Intel XE#1201] / [Intel XE#288])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch.html

  * igt@xe_exec_reset@gt-reset-stress:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][55] ([Intel XE#1214] / [Intel XE#1329])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@xe_exec_reset@gt-reset-stress.html

  * igt@xe_exec_threads@threads-hang-fd-userptr-rebind:
    - shard-dg2-set2:     [PASS][56] -> [FAIL][57] ([Intel XE#1256]) +1 other test fail
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-dg2-466/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-436/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html

  * igt@xe_exec_threads@threads-shared-vm-rebind:
    - shard-adlp:         NOTRUN -> [INCOMPLETE][58] ([Intel XE#1169] / [Intel XE#1195])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@xe_exec_threads@threads-shared-vm-rebind.html

  * igt@xe_vm@bind-flag-invalid:
    - shard-adlp:         NOTRUN -> [FAIL][59] ([Intel XE#1559])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@xe_vm@bind-flag-invalid.html

  
#### Possible fixes ####

  * igt@kms_atomic_transition@modeset-transition-fencing@2x-outputs:
    - shard-dg2-set2:     [DMESG-WARN][60] ([Intel XE#1200] / [Intel XE#1214]) -> [PASS][61] +1 other test pass
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-dg2-436/igt@kms_atomic_transition@modeset-transition-fencing@2x-outputs.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-436/igt@kms_atomic_transition@modeset-transition-fencing@2x-outputs.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][62] ([Intel XE#1388]) -> [PASS][63] +1 other test pass
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-dg2-435/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-464/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-varying-size:
    - shard-adlp:         [SKIP][64] ([Intel XE#1201]) -> [PASS][65] +44 other tests pass
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@kms_cursor_legacy@cursora-vs-flipa-varying-size.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_cursor_legacy@cursora-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@forked-bo@all-pipes:
    - shard-dg2-set2:     [DMESG-WARN][66] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][67] +7 other tests pass
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-dg2-435/igt@kms_cursor_legacy@forked-bo@all-pipes.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-464/igt@kms_cursor_legacy@forked-bo@all-pipes.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
    - shard-adlp:         [FAIL][68] ([Intel XE#616]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html

  * igt@kms_getfb@getfb-repeated-different-handles:
    - shard-adlp:         [SKIP][70] ([Intel XE#1177] / [Intel XE#1201]) -> [PASS][71] +2 other tests pass
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@kms_getfb@getfb-repeated-different-handles.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_getfb@getfb-repeated-different-handles.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-adlp:         [FAIL][72] ([Intel XE#718]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-4/igt@kms_pm_dc@dc6-dpms.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@cursor-dpms:
    - shard-dg2-set2:     [SKIP][74] ([Intel XE#1201] / [Intel XE#1211]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-dg2-466/igt@kms_pm_rpm@cursor-dpms.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-464/igt@kms_pm_rpm@cursor-dpms.html

  * igt@xe_evict@evict-mixed-threads-large-multi-vm:
    - shard-dg2-set2:     [TIMEOUT][76] ([Intel XE#1259] / [Intel XE#1473]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-dg2-463/igt@xe_evict@evict-mixed-threads-large-multi-vm.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-434/igt@xe_evict@evict-mixed-threads-large-multi-vm.html

  * igt@xe_exec_threads@threads-bal-fd-basic:
    - shard-dg2-set2:     [INCOMPLETE][78] ([Intel XE#1169] / [Intel XE#1195] / [Intel XE#1356] / [Intel XE#1376]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-dg2-435/igt@xe_exec_threads@threads-bal-fd-basic.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-464/igt@xe_exec_threads@threads-bal-fd-basic.html

  * igt@xe_exec_threads@threads-bal-fd-userptr:
    - shard-dg2-set2:     [TIMEOUT][80] ([Intel XE#1261] / [Intel XE#1356]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-dg2-463/igt@xe_exec_threads@threads-bal-fd-userptr.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-466/igt@xe_exec_threads@threads-bal-fd-userptr.html

  * igt@xe_exec_threads@threads-bal-fd-userptr-rebind:
    - shard-dg2-set2:     [TIMEOUT][82] ([Intel XE#1206] / [Intel XE#1356]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-dg2-466/igt@xe_exec_threads@threads-bal-fd-userptr-rebind.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-436/igt@xe_exec_threads@threads-bal-fd-userptr-rebind.html

  * igt@xe_module_load@many-reload:
    - shard-adlp:         [FAIL][84] -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@xe_module_load@many-reload.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@xe_module_load@many-reload.html

  * igt@xe_module_load@reload-no-display:
    - shard-dg2-set2:     [ABORT][86] ([Intel XE#1205] / [Intel XE#1216]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-dg2-466/igt@xe_module_load@reload-no-display.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-464/igt@xe_module_load@reload-no-display.html

  * igt@xe_pm@d3-mmap-vram:
    - shard-dg2-set2:     [FAIL][88] ([Intel XE#1221]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-dg2-466/igt@xe_pm@d3-mmap-vram.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-464/igt@xe_pm@d3-mmap-vram.html

  
#### Warnings ####

  * igt@core_hotunplug@hotreplug-lateclose:
    - shard-adlp:         [ABORT][90] ([Intel XE#1538]) -> [INCOMPLETE][91] ([Intel XE#1195] / [Intel XE#1538])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-2/igt@core_hotunplug@hotreplug-lateclose.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-9/igt@core_hotunplug@hotreplug-lateclose.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-adlp:         [SKIP][92] ([Intel XE#1201]) -> [FAIL][93] ([Intel XE#616]) +1 other test fail
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         [DMESG-FAIL][94] ([Intel XE#324]) -> [FAIL][95] ([Intel XE#1204])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [DMESG-FAIL][96] ([Intel XE#324]) -> [FAIL][97] ([Intel XE#1231])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-adlp:         [SKIP][98] ([Intel XE#1201]) -> [SKIP][99] ([Intel XE#1124] / [Intel XE#1201]) +3 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-ccs:
    - shard-adlp:         [SKIP][100] ([Intel XE#1201]) -> [SKIP][101] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@kms_ccs@bad-aux-stride-y-tiled-ccs.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_ccs@bad-aux-stride-y-tiled-ccs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-adlp:         [SKIP][102] ([Intel XE#1201]) -> [SKIP][103] ([Intel XE#1152] / [Intel XE#1201] / [Intel XE#455])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@kms_cdclk@plane-scaling.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_frames@dp-frame-dump:
    - shard-adlp:         [SKIP][104] ([Intel XE#1201]) -> [SKIP][105] ([Intel XE#1201] / [Intel XE#373]) +1 other test skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@kms_chamelium_frames@dp-frame-dump.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_chamelium_frames@dp-frame-dump.html

  * igt@kms_chamelium_hpd@vga-hpd-after-hibernate:
    - shard-adlp:         [SKIP][106] ([Intel XE#1177] / [Intel XE#1201]) -> [SKIP][107] ([Intel XE#1201] / [Intel XE#373])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@kms_chamelium_hpd@vga-hpd-after-hibernate.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_chamelium_hpd@vga-hpd-after-hibernate.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2-set2:     [SKIP][108] ([Intel XE#1201] / [Intel XE#455]) -> [FAIL][109] ([Intel XE#1178])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-dg2-464/igt@kms_content_protection@atomic-dpms.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-435/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     [SKIP][110] ([Intel XE#1201] / [Intel XE#455]) -> [FAIL][111] ([Intel XE#1204])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-dg2-464/igt@kms_content_protection@lic-type-0.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-435/igt@kms_content_protection@lic-type-0.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-adlp:         [SKIP][112] ([Intel XE#1201]) -> [SKIP][113] ([Intel XE#1201] / [Intel XE#455]) +3 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@kms_cursor_crc@cursor-offscreen-32x32.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][114] ([Intel XE#616]) -> [DMESG-FAIL][115] ([Intel XE#1162]) +1 other test dmesg-fail
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-dg2-464/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-435/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-adlp:         [SKIP][116] ([Intel XE#1201]) -> [SKIP][117] ([Intel XE#1201] / [Intel XE#309])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-adlp:         [SKIP][118] ([Intel XE#1177] / [Intel XE#1201]) -> [SKIP][119] ([Intel XE#1201] / [Intel XE#455]) +1 other test skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-adlp:         [SKIP][120] ([Intel XE#1201]) -> [SKIP][121] ([Intel XE#1201] / [Intel XE#310])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-adlp:         [DMESG-WARN][122] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [ABORT][123] ([Intel XE#1191] / [Intel XE#1608])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-4/igt@kms_flip@flip-vs-suspend.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-2/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][124] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [DMESG-WARN][125] ([Intel XE#1214] / [Intel XE#1608]) +4 other tests dmesg-warn
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][126] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [DMESG-WARN][127] ([Intel XE#1191] / [Intel XE#1214])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-4/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-2/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend@d-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][128] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [ABORT][129] ([Intel XE#1608])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-4/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-2/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-adlp:         [SKIP][130] ([Intel XE#1201]) -> [DMESG-FAIL][131] ([Intel XE#324])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move:
    - shard-adlp:         [SKIP][132] ([Intel XE#1177] / [Intel XE#1201]) -> [SKIP][133] ([Intel XE#1201] / [Intel XE#651])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-adlp:         [SKIP][134] ([Intel XE#1201]) -> [DMESG-WARN][135] ([Intel XE#1191] / [Intel XE#1214])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-suspend:
    - shard-adlp:         [SKIP][136] ([Intel XE#1201]) -> [SKIP][137] ([Intel XE#1201] / [Intel XE#651]) +3 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:
    - shard-adlp:         [SKIP][138] ([Intel XE#1201]) -> [SKIP][139] ([Intel XE#1201] / [Intel XE#653]) +1 other test skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-render:
    - shard-adlp:         [SKIP][140] ([Intel XE#1201]) -> [SKIP][141] ([Intel XE#1201] / [Intel XE#656]) +8 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-render.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt:
    - shard-adlp:         [SKIP][142] ([Intel XE#1177] / [Intel XE#1201]) -> [SKIP][143] ([Intel XE#1201] / [Intel XE#656]) +1 other test skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-adlp:         [SKIP][144] ([Intel XE#1201]) -> [SKIP][145] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-adlp:         [SKIP][146] ([Intel XE#1177] / [Intel XE#1201]) -> [SKIP][147] ([Intel XE#1129] / [Intel XE#1201])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@kms_pm_dc@dc5-psr.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-adlp:         [SKIP][148] ([Intel XE#1201]) -> [SKIP][149] ([Intel XE#1122] / [Intel XE#1201])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@kms_psr2_su@page_flip-nv12.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-psr-cursor-plane-onoff:
    - shard-adlp:         [SKIP][150] ([Intel XE#1177] / [Intel XE#1201]) -> [SKIP][151] ([Intel XE#1201] / [Intel XE#929])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@kms_psr@fbc-psr-cursor-plane-onoff.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_psr@fbc-psr-cursor-plane-onoff.html

  * igt@kms_psr@psr-no-drrs:
    - shard-adlp:         [SKIP][152] ([Intel XE#1201]) -> [SKIP][153] ([Intel XE#1201] / [Intel XE#929]) +1 other test skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@kms_psr@psr-no-drrs.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_psr@psr-no-drrs.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-adlp:         [SKIP][154] ([Intel XE#1201]) -> [SKIP][155] ([Intel XE#1201] / [Intel XE#327])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-adlp:         [DMESG-WARN][156] ([Intel XE#1191] / [Intel XE#1214]) -> [DMESG-WARN][157] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-4/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-8/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][158] ([Intel XE#1191] / [Intel XE#1214]) -> [DMESG-WARN][159] ([Intel XE#1214] / [Intel XE#1608])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-4/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-8/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-adlp:         [DMESG-WARN][160] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [INCOMPLETE][161] ([Intel XE#1034] / [Intel XE#1195] / [Intel XE#927])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-8/igt@kms_vblank@ts-continuation-suspend.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-9/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][162] ([Intel XE#1191] / [Intel XE#1214]) -> [INCOMPLETE][163] ([Intel XE#1034] / [Intel XE#1195])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-8/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-9/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html

  * igt@xe_evict@evict-cm-threads-large:
    - shard-adlp:         [SKIP][164] ([Intel XE#1201]) -> [SKIP][165] ([Intel XE#1201] / [Intel XE#261])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@xe_evict@evict-cm-threads-large.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@xe_evict@evict-cm-threads-large.html

  * igt@xe_evict@evict-small-external:
    - shard-adlp:         [SKIP][166] ([Intel XE#1201]) -> [SKIP][167] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@xe_evict@evict-small-external.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@xe_evict@evict-small-external.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr:
    - shard-adlp:         [SKIP][168] ([Intel XE#1201]) -> [SKIP][169] ([Intel XE#1201] / [Intel XE#1392]) +1 other test skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-rebind-prefetch:
    - shard-adlp:         [SKIP][170] ([Intel XE#1201]) -> [SKIP][171] ([Intel XE#1201] / [Intel XE#288]) +3 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@xe_exec_fault_mode@many-bindexecqueue-rebind-prefetch.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@xe_exec_fault_mode@many-bindexecqueue-rebind-prefetch.html

  * igt@xe_gt_freq@freq_suspend:
    - shard-adlp:         [DMESG-WARN][172] ([Intel XE#1191] / [Intel XE#1214]) -> [INCOMPLETE][173] ([Intel XE#1195])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@xe_gt_freq@freq_suspend.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-1/igt@xe_gt_freq@freq_suspend.html

  * igt@xe_pm@s2idle-multiple-execs:
    - shard-adlp:         [DMESG-WARN][174] ([Intel XE#1214] / [Intel XE#1608]) -> [DMESG-WARN][175] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-4/igt@xe_pm@s2idle-multiple-execs.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-8/igt@xe_pm@s2idle-multiple-execs.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-adlp:         [SKIP][176] ([Intel XE#1201]) -> [SKIP][177] ([Intel XE#1201] / [Intel XE#944])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@xe_query@multigpu-query-mem-usage.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@xe_query@multigpu-query-mem-usage.html

  
  [Intel XE#1034]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
  [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
  [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
  [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
  [Intel XE#1177]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1177
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1200]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1200
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1203]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1203
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1205]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1205
  [Intel XE#1206]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1206
  [Intel XE#1211]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211
  [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
  [Intel XE#1216]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1216
  [Intel XE#1221]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1221
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1256]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1256
  [Intel XE#1259]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259
  [Intel XE#1261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1261
  [Intel XE#1329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1329
  [Intel XE#1356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356
  [Intel XE#1376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1376
  [Intel XE#1388]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1388
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1538]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1538
  [Intel XE#1559]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1559
  [Intel XE#1608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/650
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/821
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/927
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878 -> xe-pw-132568v1

  IGT_7810: 189483744e9ff56ea573e07a049c5365404c7ecb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878: 564a9518652dca0f0eb31bd5ad321f8dd90ec878
  xe-pw-132568v1: 132568v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/index.html

--===============6872203987743108008==
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
<tr><td><b>Series:</b></td><td>drm/xe: Define all possible engines in media IP descriptors</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132568/">https://patchwork.freedesktop.org/series/132568/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878_full -&gt; xe-pw-132568v1_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-132568v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunbind-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-dg2-464/igt@core_hotunplug@hotunbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-435/igt@core_hotunplug@hotunbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-dg2-464/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-435/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-463/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-7:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-7.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-7:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-435/igt@kms_cdclk@mode-transition@pipe-c-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152">Intel XE#1152</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-464/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-435/igt@kms_content_protection@atomic-dpms@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-435/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-dg2-463/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-463/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-dg2-466/igt@kms_cursor_legacy@torture-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-464/igt@kms_cursor_legacy@torture-move.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a6-hdmi-a7:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-464/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a6-hdmi-a7.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-4-4-mc-ccs-to-linear:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-435/igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-4-4-mc-ccs-to-linear.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/650">Intel XE#650</a>) +47 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-4/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-8/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-dg2-464/igt@kms_pm_rpm@basic-rte.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-435/igt@kms_pm_rpm@basic-rte.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1203">Intel XE#1203</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-4/igt@kms_pm_rpm@i2c.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-8/igt@kms_pm_rpm@i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-dg2-464/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-435/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-dg2-433/igt@xe_evict@evict-beng-mixed-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-436/igt@xe_evict@evict-beng-mixed-threads-small.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259">Intel XE#1259</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-dg2-464/igt@xe_evict@evict-beng-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-435/igt@xe_evict@evict-beng-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/821">Intel XE#821</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-dg2-434/igt@xe_evict@evict-mixed-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-dg2-464/igt@xe_evict@evict-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-435/igt@xe_evict@evict-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@xe_exec_basic@multigpu-no-exec-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-reset-stress:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@xe_exec_reset@gt-reset-stress.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1329">Intel XE#1329</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-dg2-466/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-436/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1256">Intel XE#1256</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-shared-vm-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@xe_exec_threads@threads-shared-vm-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@bind-flag-invalid:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@xe_vm@bind-flag-invalid.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1559">Intel XE#1559</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@modeset-transition-fencing@2x-outputs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-dg2-436/igt@kms_atomic_transition@modeset-transition-fencing@2x-outputs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1200">Intel XE#1200</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-436/igt@kms_atomic_transition@modeset-transition-fencing@2x-outputs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-dg2-435/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1388">Intel XE#1388</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-464/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-varying-size:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@kms_cursor_legacy@cursora-vs-flipa-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_cursor_legacy@cursora-vs-flipa-varying-size.html">PASS</a> +44 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-bo@all-pipes:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-dg2-435/igt@kms_cursor_legacy@forked-bo@all-pipes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-464/igt@kms_cursor_legacy@forked-bo@all-pipes.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-repeated-different-handles:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@kms_getfb@getfb-repeated-different-handles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1177">Intel XE#1177</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_getfb@getfb-repeated-different-handles.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-4/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-dg2-466/igt@kms_pm_rpm@cursor-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-464/igt@kms_pm_rpm@cursor-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large-multi-vm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-dg2-463/igt@xe_evict@evict-mixed-threads-large-multi-vm.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259">Intel XE#1259</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-434/igt@xe_evict@evict-mixed-threads-large-multi-vm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-fd-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-dg2-435/igt@xe_exec_threads@threads-bal-fd-basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1376">Intel XE#1376</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-464/igt@xe_exec_threads@threads-bal-fd-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-fd-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-dg2-463/igt@xe_exec_threads@threads-bal-fd-userptr.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1261">Intel XE#1261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-466/igt@xe_exec_threads@threads-bal-fd-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-fd-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-dg2-466/igt@xe_exec_threads@threads-bal-fd-userptr-rebind.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1206">Intel XE#1206</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-436/igt@xe_exec_threads@threads-bal-fd-userptr-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@xe_module_load@many-reload.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@xe_module_load@many-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-dg2-466/igt@xe_module_load@reload-no-display.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1205">Intel XE#1205</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1216">Intel XE#1216</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-464/igt@xe_module_load@reload-no-display.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-dg2-466/igt@xe_pm@d3-mmap-vram.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1221">Intel XE#1221</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-464/igt@xe_pm@d3-mmap-vram.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug-lateclose:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-2/igt@core_hotunplug@hotreplug-lateclose.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1538">Intel XE#1538</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-9/igt@core_hotunplug@hotreplug-lateclose.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1538">Intel XE#1538</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-ccs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@kms_ccs@bad-aux-stride-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_ccs@bad-aux-stride-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152">Intel XE#1152</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-frame-dump:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@kms_chamelium_frames@dp-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_chamelium_frames@dp-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-after-hibernate:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@kms_chamelium_hpd@vga-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1177">Intel XE#1177</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_chamelium_hpd@vga-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-dg2-464/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-435/igt@kms_content_protection@atomic-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-dg2-464/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-435/igt@kms_content_protection@lic-type-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@kms_cursor_crc@cursor-offscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_cursor_crc@cursor-offscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-dg2-464/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-435/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1177">Intel XE#1177</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-4/igt@kms_flip@flip-vs-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-2/igt@kms_flip@flip-vs-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-4/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-2/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-4/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-2/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1177">Intel XE#1177</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1177">Intel XE#1177</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1177">Intel XE#1177</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-plane-onoff:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@kms_psr@fbc-psr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1177">Intel XE#1177</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_psr@fbc-psr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-no-drrs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@kms_psr@psr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_psr@psr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-4/igt@kms_vblank@ts-continuation-dpms-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-8/igt@kms_vblank@ts-continuation-dpms-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-4/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-8/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-8/igt@kms_vblank@ts-continuation-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-9/igt@kms_vblank@ts-continuation-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034">Intel XE#1034</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-8/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-9/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034">Intel XE#1034</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-large:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@xe_evict@evict-cm-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@xe_evict@evict-cm-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@xe_evict@evict-small-external.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@xe_evict@evict-small-external.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-rebind-prefetch:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@xe_exec_fault_mode@many-bindexecqueue-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@xe_exec_fault_mode@many-bindexecqueue-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@xe_gt_freq@freq_suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-1/igt@xe_gt_freq@freq_suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-4/igt@xe_pm@s2idle-multiple-execs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-8/igt@xe_pm@s2idle-multiple-execs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878 -&gt; xe-pw-132568v1</li>
</ul>
<p>IGT_7810: 189483744e9ff56ea573e07a049c5365404c7ecb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878: 564a9518652dca0f0eb31bd5ad321f8dd90ec878<br />
  xe-pw-132568v1: 132568v1</p>

</body>
</html>

--===============6872203987743108008==--
