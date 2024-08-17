Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15ADCC52D7F
	for <intel-xe@archiver.kernel.org>; Sat, 17 Aug 2024 12:55:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA7CB10E09D;
	Sat, 17 Aug 2024 12:55:51 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76C3110E048;
 Sat, 17 Aug 2024 12:55:50 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6830920742925396151=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_series_starting_with_=5B01/12?=
 =?utf-8?q?=5D_drm/xe=3A_Removed_unused_xe=5Fggtt=5Fprintk?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 17 Aug 2024 12:55:50 -0000
Message-ID: <172389935047.659789.3891735973000405945@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240817103556.163783-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240817103556.163783-1-rodrigo.vivi@intel.com>
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

--===============6830920742925396151==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [01/12] drm/xe: Removed unused xe_ggtt_printk
URL   : https://patchwork.freedesktop.org/series/137409/
State : failure

== Summary ==

CI Bug Log - changes from xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c_full -> xe-pw-137409v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-137409v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-137409v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-137409v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all:
    - shard-adlp:         [PASS][1] -> [FAIL][2] +8 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-adlp-2/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-adlp-8/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-adlp:         [PASS][3] -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-adlp-4/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-adlp-9/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:
    - {shard-bmg}:        [PASS][5] -> [INCOMPLETE][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-bmg-6/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-bmg-1/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html

  
Known issues
------------

  Here are the changes found in xe-pw-137409v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-dg2-set2:     [PASS][7] -> [FAIL][8] ([Intel XE#827]) +1 other test fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-434/igt@kms_async_flips@alternate-sync-async-flip.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-463/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#1407])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-lnl-1/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][10] ([Intel XE#1201] / [Intel XE#316])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-433/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#1124] / [Intel XE#1201]) +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#1124])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-lnl-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#2191])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-lnl-7/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#1512])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-lnl-7/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-433/igt@kms_ccs@bad-pixel-format-y-tiled-ccs.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#1201] / [Intel XE#787]) +6 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-433/igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#1399])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-lnl-7/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#306])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-lnl-1/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#1201] / [Intel XE#306])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-433/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@hdmi-mode-timings:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#373]) +3 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-lnl-1/igt@kms_chamelium_edid@hdmi-mode-timings.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#307])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-lnl-7/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#1201] / [Intel XE#308])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-433/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-256x85:
    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#1424]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-lnl-1/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#309]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-lnl-1/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@single-bo@pipe-b:
    - shard-dg2-set2:     [PASS][25] -> [DMESG-WARN][26] ([Intel XE#877]) +1 other test dmesg-warn
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-463/igt@kms_cursor_legacy@single-bo@pipe-b.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-434/igt@kms_cursor_legacy@single-bo@pipe-b.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#599]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-lnl-7/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_flip@2x-plain-flip:
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#1421]) +2 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-lnl-7/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#1397] / [Intel XE#1745])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#1397])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#1201] / [Intel XE#455]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#651]) +3 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#1201] / [Intel XE#651])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#1201] / [Intel XE#653]) +2 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#656]) +10 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_plane@plane-position-covered@pipe-b-plane-4:
    - shard-lnl:          [PASS][36] -> [DMESG-WARN][37] ([Intel XE#324])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-lnl-4/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-lnl-7/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#498]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-lnl-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a-edp-1.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#736])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-lnl-1/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [PASS][40] -> [FAIL][41] ([Intel XE#1430])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-lnl-6/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#1201] / [Intel XE#1489])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-433/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@fbc-pr-suspend:
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#1406])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-lnl-7/igt@kms_psr@fbc-pr-suspend.html

  * igt@kms_psr@fbc-psr2-suspend:
    - shard-lnl:          NOTRUN -> [FAIL][44] ([Intel XE#2028]) +1 other test fail
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-lnl-1/igt@kms_psr@fbc-psr2-suspend.html

  * igt@kms_psr@psr2-sprite-plane-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#1201] / [Intel XE#929]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-433/igt@kms_psr@psr2-sprite-plane-move.html

  * igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-system-system:
    - shard-lnl:          [PASS][46] -> [FAIL][47] ([Intel XE#2028]) +5 other tests fail
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-lnl-2/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-system-system.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-lnl-1/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-system-system.html

  * igt@xe_evict@evict-beng-large-cm:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#688]) +4 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-lnl-1/igt@xe_evict@evict-beng-large-cm.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - shard-dg2-set2:     [PASS][49] -> [FAIL][50] ([Intel XE#1600])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-435/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-435/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-dg2-set2:     [PASS][51] -> [TIMEOUT][52] ([Intel XE#1473]) +1 other test timeout
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-432/igt@xe_evict@evict-beng-mixed-threads-large.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_exec_balancer@once-cm-parallel-userptr-invalidate:
    - shard-dg2-set2:     [PASS][53] -> [INCOMPLETE][54] ([Intel XE#1195])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-434/igt@xe_exec_balancer@once-cm-parallel-userptr-invalidate.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-463/igt@xe_exec_balancer@once-cm-parallel-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#1392]) +3 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-lnl-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html

  * igt@xe_exec_compute_mode@once-preempt-fence-early:
    - shard-lnl:          [PASS][56] -> [FAIL][57] ([Intel XE#1069])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-lnl-8/igt@xe_exec_compute_mode@once-preempt-fence-early.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-lnl-1/igt@xe_exec_compute_mode@once-preempt-fence-early.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-dg2-set2:     [PASS][58] -> [TIMEOUT][59] ([Intel XE#2105])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-432/igt@xe_exec_reset@parallel-gt-reset.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-432/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#1201] / [Intel XE#1337])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-433/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_peer2peer@write:
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#1061])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-lnl-7/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-basic:
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#2284] / [Intel XE#366])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-lnl-1/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-adlp:         [PASS][63] -> [ABORT][64] ([Intel XE#1358] / [Intel XE#1607])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-adlp-8/igt@xe_pm@s4-d3hot-basic-exec.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-exec-after:
    - shard-lnl:          [PASS][65] -> [ABORT][66] ([Intel XE#1358] / [Intel XE#1607])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-lnl-1/igt@xe_pm@s4-exec-after.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-lnl-2/igt@xe_pm@s4-exec-after.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#944])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-lnl-1/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-d-dp-2:
    - {shard-bmg}:        [FAIL][68] ([Intel XE#827]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-dp-2.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-dp-2.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:
    - shard-adlp:         [DMESG-WARN][70] ([Intel XE#1033]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:
    - shard-lnl:          [FAIL][72] ([Intel XE#1426]) -> [PASS][73] +1 other test pass
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-lnl-2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-lnl-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][74] ([Intel XE#1426]) -> [PASS][75] +1 other test pass
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-435/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-434/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          [FAIL][76] ([Intel XE#1659]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_cursor_edge_walk@128x128-top-bottom@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][78] ([Intel XE#1195]) -> [PASS][79] +1 other test pass
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-463/igt@kms_cursor_edge_walk@128x128-top-bottom@pipe-d-hdmi-a-6.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-433/igt@kms_cursor_edge_walk@128x128-top-bottom@pipe-d-hdmi-a-6.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - {shard-bmg}:        [DMESG-WARN][80] ([Intel XE#877]) -> [PASS][81] +8 other tests pass
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1:
    - shard-lnl:          [FAIL][82] ([Intel XE#886]) -> [PASS][83] +1 other test pass
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-lnl-3/igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-lnl-6/igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1.html

  * igt@kms_plane@plane-position-covered@pipe-b-plane-1:
    - shard-lnl:          [DMESG-WARN][84] ([Intel XE#324]) -> [PASS][85] +2 other tests pass
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-lnl-4/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-lnl-7/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html

  * igt@kms_plane_lowres@tiling-4@pipe-b-hdmi-a-3:
    - {shard-bmg}:        [FAIL][86] ([Intel XE#2058]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-bmg-1/igt@kms_plane_lowres@tiling-4@pipe-b-hdmi-a-3.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-bmg-1/igt@kms_plane_lowres@tiling-4@pipe-b-hdmi-a-3.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][88] ([Intel XE#361]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-adlp:         [FAIL][90] ([Intel XE#771] / [Intel XE#899]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1:
    - shard-adlp:         [FAIL][92] ([Intel XE#899]) -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html

  * igt@kms_vblank@accuracy-idle@pipe-d-hdmi-a-3:
    - {shard-bmg}:        [INCOMPLETE][94] -> [PASS][95] +1 other test pass
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-bmg-6/igt@kms_vblank@accuracy-idle@pipe-d-hdmi-a-3.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-bmg-3/igt@kms_vblank@accuracy-idle@pipe-d-hdmi-a-3.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1:
    - shard-lnl:          [FAIL][96] ([Intel XE#2028]) -> [PASS][97] +6 other tests pass
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-lnl-1/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-lnl-2/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1.html

  * igt@kms_vrr@max-min:
    - shard-lnl:          [FAIL][98] ([Intel XE#2443]) -> [PASS][99] +1 other test pass
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-lnl-8/igt@kms_vrr@max-min.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-lnl-1/igt@kms_vrr@max-min.html

  * igt@xe_evict@evict-beng-cm-threads-large:
    - shard-dg2-set2:     [TIMEOUT][100] ([Intel XE#1473]) -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-434/igt@xe_evict@evict-beng-cm-threads-large.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-466/igt@xe_evict@evict-beng-cm-threads-large.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     [TIMEOUT][102] ([Intel XE#1473] / [Intel XE#402]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - {shard-bmg}:        [TIMEOUT][104] ([Intel XE#1473]) -> [PASS][105] +1 other test pass
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-bmg-7/igt@xe_evict@evict-beng-mixed-threads-large.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-bmg-8/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict@evict-threads-large:
    - {shard-bmg}:        [TIMEOUT][106] ([Intel XE#1473] / [Intel XE#2472]) -> [PASS][107]
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-bmg-5/igt@xe_evict@evict-threads-large.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-bmg-5/igt@xe_evict@evict-threads-large.html

  * igt@xe_exec_basic@many-execqueues-many-vm-basic:
    - shard-lnl:          [FAIL][108] -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-lnl-8/igt@xe_exec_basic@many-execqueues-many-vm-basic.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-lnl-1/igt@xe_exec_basic@many-execqueues-many-vm-basic.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-lnl:          [ABORT][110] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-lnl-7/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-lnl:          [ABORT][112] ([Intel XE#1794]) -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-lnl-1/igt@xe_pm@s4-vm-bind-userptr.html

  
#### Warnings ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:
    - shard-dg2-set2:     [SKIP][114] ([Intel XE#1201] / [Intel XE#801]) -> [SKIP][115] ([Intel XE#801]) +23 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-466/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][116] ([Intel XE#316]) -> [SKIP][117] ([Intel XE#1201] / [Intel XE#316]) +2 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-432/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-466/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         [FAIL][118] ([Intel XE#1204]) -> [DMESG-FAIL][119] ([Intel XE#324])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][120] ([Intel XE#1124]) -> [SKIP][121] ([Intel XE#1124] / [Intel XE#1201]) +7 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-432/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-435/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2-set2:     [SKIP][122] ([Intel XE#1201] / [Intel XE#619]) -> [SKIP][123] ([Intel XE#619])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][124] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][125] ([Intel XE#1124]) +7 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][126] ([Intel XE#2191]) -> [SKIP][127] ([Intel XE#1201] / [Intel XE#2191]) +1 other test skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-435/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][128] ([Intel XE#1201] / [Intel XE#2191]) -> [SKIP][129] ([Intel XE#2191]) +1 other test skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][130] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][131] ([Intel XE#367]) +1 other test skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-466/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][132] ([Intel XE#367]) -> [SKIP][133] ([Intel XE#1201] / [Intel XE#367]) +3 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-435/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][134] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][135] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +13 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-432/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-466/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][136] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][137] ([Intel XE#455] / [Intel XE#787]) +19 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-466/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-432/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][138] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][139] ([Intel XE#787]) +69 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2-set2:     [SKIP][140] ([Intel XE#787]) -> [SKIP][141] ([Intel XE#1201] / [Intel XE#787]) +48 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-466/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:
    - shard-dg2-set2:     [SKIP][142] ([Intel XE#1252]) -> [SKIP][143] ([Intel XE#1201] / [Intel XE#1252]) +1 other test skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html

  * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][144] ([Intel XE#314]) -> [SKIP][145] ([Intel XE#1201] / [Intel XE#314]) +3 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-435/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-dg2-set2:     [SKIP][146] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][147] ([Intel XE#306])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-466/igt@kms_chamelium_color@ctm-0-50.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-432/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-dg2-set2:     [SKIP][148] ([Intel XE#306]) -> [SKIP][149] ([Intel XE#1201] / [Intel XE#306])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-432/igt@kms_chamelium_color@ctm-0-75.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-466/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-dg2-set2:     [SKIP][150] ([Intel XE#373]) -> [SKIP][151] ([Intel XE#1201] / [Intel XE#373]) +7 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-432/igt@kms_chamelium_edid@dp-edid-resolution-list.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-466/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-dg2-set2:     [SKIP][152] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][153] ([Intel XE#373]) +6 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-set2:     [SKIP][154] ([Intel XE#307]) -> [SKIP][155] ([Intel XE#1201] / [Intel XE#307])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-432/igt@kms_content_protection@dp-mst-type-0.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-466/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-dg2-set2:     [SKIP][156] ([Intel XE#308]) -> [SKIP][157] ([Intel XE#1201] / [Intel XE#308])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-466/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-dg2-set2:     [SKIP][158] ([Intel XE#1201] / [Intel XE#323]) -> [SKIP][159] ([Intel XE#323])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-466/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     [SKIP][160] ([Intel XE#323]) -> [SKIP][161] ([Intel XE#1201] / [Intel XE#323])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-466/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg2-set2:     [SKIP][162] ([Intel XE#1135]) -> [SKIP][163] ([Intel XE#1135] / [Intel XE#1201])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-432/igt@kms_feature_discovery@psr2.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-435/igt@kms_feature_discovery@psr2.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2-set2:     [SKIP][164] ([i915#5274]) -> [SKIP][165] ([Intel XE#1201] / [i915#5274])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-432/igt@kms_force_connector_basic@prune-stale-modes.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-466/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][166] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][167] ([Intel XE#651]) +20 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][168] ([Intel XE#651]) -> [SKIP][169] ([Intel XE#1201] / [Intel XE#651]) +22 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear:
    - shard-dg2-set2:     [SKIP][170] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][171] ([Intel XE#653]) +24 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html

  * igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:
    - shard-dg2-set2:     [SKIP][172] ([Intel XE#653]) -> [SKIP][173] ([Intel XE#1201] / [Intel XE#653]) +19 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [SKIP][174] ([Intel XE#455]) -> [SKIP][175] ([Intel XE#1201] / [Intel XE#455]) +10 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-432/igt@kms_hdr@invalid-hdr.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-466/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-dg2-set2:     [SKIP][176] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][177] ([Intel XE#455]) +14 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-466/igt@kms_plane_lowres@tiling-y.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-432/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
    - shard-dg2-set2:     [SKIP][178] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) -> [SKIP][179] ([Intel XE#455] / [Intel XE#498]) +1 other test skip
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][180] ([Intel XE#1201] / [Intel XE#498]) -> [SKIP][181] ([Intel XE#498]) +2 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c-hdmi-a-6.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][182] ([Intel XE#1201] / [Intel XE#2318]) -> [SKIP][183] ([Intel XE#2318]) +2 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-466/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][184] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) -> [SKIP][185] ([Intel XE#2318] / [Intel XE#455]) +1 other test skip
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-466/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-dg2-set2:     [SKIP][186] ([Intel XE#1201] / [Intel XE#870]) -> [SKIP][187] ([Intel XE#870])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-466/igt@kms_pm_backlight@bad-brightness.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-432/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg2-set2:     [SKIP][188] ([Intel XE#870]) -> [SKIP][189] ([Intel XE#1201] / [Intel XE#870]) +1 other test skip
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-432/igt@kms_pm_backlight@fade-with-suspend.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-466/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
    - shard-dg2-set2:     [SKIP][190] ([Intel XE#1489]) -> [SKIP][191] ([Intel XE#1201] / [Intel XE#1489]) +2 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-432/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-466/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
    - shard-dg2-set2:     [SKIP][192] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][193] ([Intel XE#1489]) +3 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-466/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-dg2-set2:     [SKIP][194] ([Intel XE#1122]) -> [SKIP][195] ([Intel XE#1122] / [Intel XE#1201])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-432/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-466/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     [SKIP][196] ([Intel XE#1122] / [Intel XE#1201]) -> [SKIP][197] ([Intel XE#1122])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-466/igt@kms_psr2_su@page_flip-nv12.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-432/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@pr-sprite-blt:
    - shard-dg2-set2:     [SKIP][198] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][199] ([Intel XE#929]) +9 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-466/igt@kms_psr@pr-sprite-blt.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-432/igt@kms_psr@pr-sprite-blt.html

  * igt@kms_psr@psr2-basic:
    - shard-dg2-set2:     [SKIP][200] ([Intel XE#929]) -> [SKIP][201] ([Intel XE#1201] / [Intel XE#929]) +9 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-432/igt@kms_psr@psr2-basic.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-466/igt@kms_psr@psr2-basic.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg2-set2:     [SKIP][202] ([Intel XE#1149]) -> [SKIP][203] ([Intel XE#1149] / [Intel XE#1201])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-432/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-466/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][204] ([Intel XE#1127] / [Intel XE#1201]) -> [SKIP][205] ([Intel XE#1127])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-dg2-set2:     [SKIP][206] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][207] ([Intel XE#327]) +1 other test skip
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-466/igt@kms_rotation_crc@sprite-rotation-90.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][208] ([Intel XE#1201] / [Intel XE#1500]) -> [SKIP][209] ([Intel XE#1201] / [Intel XE#362])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@lobf:
    - shard-dg2-set2:     [SKIP][210] ([Intel XE#1201] / [Intel XE#2168]) -> [SKIP][211] ([Intel XE#2168]) +1 other test skip
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-466/igt@kms_vrr@lobf.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-432/igt@kms_vrr@lobf.html

  * igt@kms_writeback@writeback-check-output:
    - shard-dg2-set2:     [SKIP][212] ([Intel XE#1201] / [Intel XE#756]) -> [SKIP][213] ([Intel XE#756])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-466/igt@kms_writeback@writeback-check-output.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-432/igt@kms_writeback@writeback-check-output.html

  * igt@xe_copy_basic@mem-copy-linear-0x369:
    - shard-dg2-set2:     [SKIP][214] ([Intel XE#1123] / [Intel XE#1201]) -> [SKIP][215] ([Intel XE#1123])
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0x369.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x369.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][216] ([Intel XE#1126]) -> [SKIP][217] ([Intel XE#1126] / [Intel XE#1201])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfffe.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_exec_fault_mode@once-rebind-imm:
    - shard-dg2-set2:     [SKIP][218] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][219] ([Intel XE#288]) +16 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-466/igt@xe_exec_fault_mode@once-rebind-imm.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-432/igt@xe_exec_fault_mode@once-rebind-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][220] ([Intel XE#288]) -> [SKIP][221] ([Intel XE#1201] / [Intel XE#288]) +18 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     [SKIP][222] ([Intel XE#1201] / [Intel XE#2360]) -> [SKIP][223] ([Intel XE#2360])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-466/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-432/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_mmap@small-bar:
    - shard-dg2-set2:     [SKIP][224] ([Intel XE#512]) -> [SKIP][225] ([Intel XE#1201] / [Intel XE#512])
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-432/igt@xe_mmap@small-bar.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-466/igt@xe_mmap@small-bar.html

  * igt@xe_oa@mi-rpc:
    - shard-dg2-set2:     [SKIP][226] ([Intel XE#2541]) -> [SKIP][227] ([Intel XE#1201] / [Intel XE#2541]) +4 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-432/igt@xe_oa@mi-rpc.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-466/igt@xe_oa@mi-rpc.html

  * igt@xe_oa@non-privileged-access-vaddr:
    - shard-dg2-set2:     [SKIP][228] ([Intel XE#1201] / [Intel XE#2541]) -> [SKIP][229] ([Intel XE#2541]) +3 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-466/igt@xe_oa@non-privileged-access-vaddr.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-432/igt@xe_oa@non-privileged-access-vaddr.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     [SKIP][230] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][231] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-432/igt@xe_pm@d3cold-mmap-vram.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-466/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-dg2-set2:     [SKIP][232] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) -> [SKIP][233] ([Intel XE#2284] / [Intel XE#366])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-466/igt@xe_pm@d3cold-multiple-execs.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-432/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_query@multigpu-query-config:
    - shard-dg2-set2:     [SKIP][234] ([Intel XE#944]) -> [SKIP][235] ([Intel XE#1201] / [Intel XE#944]) +1 other test skip
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-432/igt@xe_query@multigpu-query-config.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-466/igt@xe_query@multigpu-query-config.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-dg2-set2:     [SKIP][236] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][237] ([Intel XE#944]) +2 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-466/igt@xe_query@multigpu-query-cs-cycles.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-432/igt@xe_query@multigpu-query-cs-cycles.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#2026]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2026
  [Intel XE#2028]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028
  [Intel XE#2058]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2058
  [Intel XE#2105]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2251
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2357]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2357
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#2514]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#736]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/736
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#801]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/801
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274


Build changes
-------------

  * Linux: xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c -> xe-pw-137409v1

  IGT_7975: 7975
  xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c: d6dac3db19935f5939cbb033eea30c90bdf3888c
  xe-pw-137409v1: 137409v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/index.html

--===============6830920742925396151==
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
<tr><td><b>Series:</b></td><td>series starting with [01/12] drm/xe: Removed unused xe_ggtt_printk</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137409/">https://patchwork.freedesktop.org/series/137409/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c_full -&gt; xe-pw-137409v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-137409v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-137409v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-137409v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-adlp-2/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-adlp-8/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all.html">FAIL</a> +8 other tests fail</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-adlp-4/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-adlp-9/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-bmg-6/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-bmg-1/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-137409v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-434/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-463/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-lnl-1/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-433/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-lnl-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-lnl-7/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-lnl-7/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512">Intel XE#1512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-433/igt@kms_ccs@bad-pixel-format-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-433/igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-lnl-7/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399">Intel XE#1399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-lnl-1/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-433/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-mode-timings:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-lnl-1/igt@kms_chamelium_edid@hdmi-mode-timings.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-lnl-7/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-433/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-256x85:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-lnl-1/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-lnl-1/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-bo@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-463/igt@kms_cursor_legacy@single-bo@pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-434/igt@kms_cursor_legacy@single-bo@pipe-b.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-lnl-7/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-lnl-7/igt@kms_flip@2x-plain-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered@pipe-b-plane-4:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-lnl-4/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-lnl-7/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-lnl-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-lnl-1/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/736">Intel XE#736</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-lnl-6/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-433/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-lnl-7/igt@kms_psr@fbc-pr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-lnl-1/igt@kms_psr@fbc-psr2-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-433/igt@kms_psr@psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-system-system:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-lnl-2/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-system-system.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-lnl-1/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-system-system.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-cm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-lnl-1/igt@xe_evict@evict-beng-large-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-435/igt@xe_evict@evict-beng-large-multi-vm-cm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-435/igt@xe_evict@evict-beng-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600">Intel XE#1600</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-432/igt@xe_evict@evict-beng-mixed-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-cm-parallel-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-434/igt@xe_exec_balancer@once-cm-parallel-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-463/igt@xe_exec_balancer@once-cm-parallel-userptr-invalidate.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-lnl-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@once-preempt-fence-early:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-lnl-8/igt@xe_exec_compute_mode@once-preempt-fence-early.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-lnl-1/igt@xe_exec_compute_mode@once-preempt-fence-early.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-432/igt@xe_exec_reset@parallel-gt-reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-432/igt@xe_exec_reset@parallel-gt-reset.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105">Intel XE#2105</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-433/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-lnl-7/igt@xe_peer2peer@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-lnl-1/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-adlp-8/igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-lnl-1/igt@xe_pm@s4-exec-after.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-lnl-2/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-lnl-1/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-d-dp-2:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-lnl-2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-lnl-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-435/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-434/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@128x128-top-bottom@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-463/igt@kms_cursor_edge_walk@128x128-top-bottom@pipe-d-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-433/igt@kms_cursor_edge_walk@128x128-top-bottom@pipe-d-hdmi-a-6.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-lnl-3/igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-lnl-6/igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered@pipe-b-plane-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-lnl-4/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-lnl-7/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4@pipe-b-hdmi-a-3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-bmg-1/igt@kms_plane_lowres@tiling-4@pipe-b-hdmi-a-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2058">Intel XE#2058</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-bmg-1/igt@kms_plane_lowres@tiling-4@pipe-b-hdmi-a-3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@accuracy-idle@pipe-d-hdmi-a-3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-bmg-6/igt@kms_vblank@accuracy-idle@pipe-d-hdmi-a-3.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-bmg-3/igt@kms_vblank@accuracy-idle@pipe-d-hdmi-a-3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-lnl-1/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-lnl-2/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-lnl-8/igt@kms_vrr@max-min.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443">Intel XE#2443</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-lnl-1/igt@kms_vrr@max-min.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-434/igt@xe_evict@evict-beng-cm-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-466/igt@xe_evict@evict-beng-cm-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-bmg-7/igt@xe_evict@evict-beng-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-bmg-8/igt@xe_evict@evict-beng-mixed-threads-large.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-bmg-5/igt@xe_evict@evict-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472">Intel XE#2472</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-bmg-5/igt@xe_evict@evict-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-lnl-8/igt@xe_exec_basic@many-execqueues-many-vm-basic.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-lnl-1/igt@xe_exec_basic@many-execqueues-many-vm-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-lnl-7/igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-lnl-1/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-466/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/801">Intel XE#801</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/801">Intel XE#801</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-432/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-466/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-432/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-435/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-435/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-466/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-435/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-432/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-466/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-466/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-432/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +69 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-466/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +48 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-435/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-466/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-432/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-432/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-466/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-432/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-466/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-432/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-466/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-466/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-466/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-466/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-432/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-435/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-432/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-466/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-432/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-466/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-466/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-432/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-466/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-466/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-466/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-432/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-432/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-466/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-432/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-466/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-466/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-432/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-466/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-466/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-432/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-466/igt@kms_psr@pr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-432/igt@kms_psr@pr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-432/igt@kms_psr@psr2-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-466/igt@kms_psr@psr2-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-432/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-466/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-466/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-466/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-432/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-466/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-432/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x369:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-466/igt@xe_exec_fault_mode@once-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-432/igt@xe_exec_fault_mode@once-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-466/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-432/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-432/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-466/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mi-rpc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-432/igt@xe_oa@mi-rpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-466/igt@xe_oa@mi-rpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-access-vaddr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-466/igt@xe_oa@non-privileged-access-vaddr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-432/igt@xe_oa@non-privileged-access-vaddr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-432/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-466/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-466/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-432/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-config:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-432/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-466/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c/shard-dg2-466/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137409v1/shard-dg2-432/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c -&gt; xe-pw-137409v1</li>
</ul>
<p>IGT_7975: 7975<br />
  xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c: d6dac3db19935f5939cbb033eea30c90bdf3888c<br />
  xe-pw-137409v1: 137409v1</p>

</body>
</html>

--===============6830920742925396151==--
