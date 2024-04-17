Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A81D8C4345F
	for <intel-xe@archiver.kernel.org>; Wed, 17 Apr 2024 04:34:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C42010F0CA;
	Wed, 17 Apr 2024 04:34:10 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56D9F10E9B7;
 Wed, 17 Apr 2024 04:34:08 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6749128406021297843=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_series_starting_with_=5Bv7=2C1/?=
 =?utf-8?q?2=5D_drm/xe=3A_add_a_new_debugfs_file_-_mmio_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Koby Elbaz" <kelbaz@habana.ai>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 17 Apr 2024 04:34:08 -0000
Message-ID: <171332844834.1463726.16170321096417732066@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240414081105.1199559-1-kelbaz@habana.ai>
In-Reply-To: <20240414081105.1199559-1-kelbaz@habana.ai>
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

--===============6749128406021297843==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [v7,1/2] drm/xe: add a new debugfs file - mmio (rev2)
URL   : https://patchwork.freedesktop.org/series/132409/
State : failure

== Summary ==

CI Bug Log - changes from xe-1095-5f7597e990bea547bd1261170497e7476fb781bb_full -> xe-pw-132409v2_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-132409v2_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-132409v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-132409v2_full:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_debugfs@base:
    - shard-adlp:         [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-9/igt@xe_debugfs@base.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-6/igt@xe_debugfs@base.html

  * igt@xe_exec_basic@twice-userptr-rebind:
    - shard-adlp:         [PASS][3] -> [DMESG-FAIL][4] +1 other test dmesg-fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@xe_exec_basic@twice-userptr-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-6/igt@xe_exec_basic@twice-userptr-rebind.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_addfb_basic@addfb25-4-tiled:
    - {shard-lnl}:        [PASS][5] -> [DMESG-WARN][6] +4 other tests dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-1/igt@kms_addfb_basic@addfb25-4-tiled.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-lnl-7/igt@kms_addfb_basic@addfb25-4-tiled.html

  * igt@kms_chamelium_frames@hdmi-crc-single:
    - {shard-lnl}:        [SKIP][7] ([Intel XE#373]) -> [SKIP][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-7/igt@kms_chamelium_frames@hdmi-crc-single.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-lnl-2/igt@kms_chamelium_frames@hdmi-crc-single.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - {shard-lnl}:        [SKIP][9] ([Intel XE#309]) -> [SKIP][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-lnl-2/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_flip@flip-vs-rmfb@a-edp2:
    - {shard-lnl}:        NOTRUN -> [DMESG-WARN][11] +5 other tests dmesg-warn
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-lnl-7/igt@kms_flip@flip-vs-rmfb@a-edp2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
    - {shard-lnl}:        [SKIP][12] ([Intel XE#1401]) -> [SKIP][13]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:
    - {shard-lnl}:        [SKIP][14] ([Intel XE#656]) -> [SKIP][15]
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - {shard-lnl}:        [PASS][16] -> [DMESG-FAIL][17] +2 other tests dmesg-fail
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-1/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-lnl-7/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
    - {shard-lnl}:        [PASS][18] -> [INCOMPLETE][19] +1 other test incomplete
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-slowdraw:
    - {shard-lnl}:        NOTRUN -> [INCOMPLETE][20] +1 other test incomplete
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-slowdraw.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a-edp-1:
    - {shard-lnl}:        [TIMEOUT][21] ([Intel XE#1558]) -> [INCOMPLETE][22] +1 other test incomplete
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-4/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a-edp-1.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-lnl-1/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a-edp-1.html

  * {igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-edp-2}:
    - {shard-lnl}:        NOTRUN -> [SKIP][23]
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-lnl-7/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-edp-2.html

  * igt@kms_psr@fbc-psr2-cursor-render@edp-1:
    - {shard-lnl}:        [PASS][24] -> [FAIL][25] +4 other tests fail
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-7/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-lnl-4/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - {shard-lnl}:        NOTRUN -> [DMESG-FAIL][26] +2 other tests dmesg-fail
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-lnl-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_live_ktest@xe_mocs:
    - {shard-lnl}:        [PASS][27] -> [SKIP][28]
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-4/igt@xe_live_ktest@xe_mocs.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-lnl-4/igt@xe_live_ktest@xe_mocs.html

  * igt@xe_pm@s4-multiple-execs:
    - {shard-lnl}:        [FAIL][29] ([Intel XE#1043]) -> [FAIL][30]
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-lnl-7/igt@xe_pm@s4-multiple-execs.html

  
Known issues
------------

  Here are the changes found in xe-pw-132409v2_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@intel_hwmon@hwmon-write:
    - shard-adlp:         NOTRUN -> [SKIP][31] ([Intel XE#1125] / [Intel XE#1201])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-2/igt@intel_hwmon@hwmon-write.html

  * igt@kms_async_flips@async-flip-with-page-flip-events:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][32] ([Intel XE#1033] / [Intel XE#1214] / [Intel XE#324] / [Intel XE#358])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][33] ([Intel XE#1214] / [Intel XE#324] / [Intel XE#358]) +1 other test dmesg-warn
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][34] ([Intel XE#1033] / [Intel XE#1214]) +2 other tests dmesg-warn
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][35] ([Intel XE#1033] / [Intel XE#1214] / [Intel XE#324])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [FAIL][36] ([Intel XE#650]) +8 other tests fail
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-464/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-6-4-rc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#1201] / [Intel XE#801]) +7 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-464/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-6-4-rc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-7-4-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#1185] / [Intel XE#1201]) +7 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-464/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-7-4-rc-ccs-cc.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#1201] / [Intel XE#316])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-466/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-adlp:         [PASS][40] -> [DMESG-FAIL][41] ([Intel XE#324])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#1201] / [Intel XE#316]) +6 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-6/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         NOTRUN -> [FAIL][43] ([Intel XE#1204])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [PASS][44] -> [FAIL][45] ([Intel XE#1231])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#1201] / [Intel XE#619])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-2/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#1124] / [Intel XE#1201]) +12 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#1124] / [Intel XE#1201]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#1201] / [Intel XE#367])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-435/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-adlp:         NOTRUN -> [SKIP][50] ([Intel XE#1201] / [Intel XE#367]) +2 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-4/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +39 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-6/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-adlp:         NOTRUN -> [SKIP][52] ([Intel XE#1201] / [Intel XE#787]) +71 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-6/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#1201] / [Intel XE#787]) +54 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][54] ([Intel XE#1201] / [Intel XE#1252])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +17 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-adlp:         NOTRUN -> [SKIP][56] ([Intel XE#1201] / [Intel XE#306]) +2 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-4/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#1201] / [Intel XE#373]) +14 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-1/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_frames@hdmi-frame-dump:
    - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#1201] / [Intel XE#373]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-464/igt@kms_chamelium_frames@hdmi-frame-dump.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#1201] / [Intel XE#307])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-1/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#1201] / [Intel XE#308])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-8/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#1201] / [Intel XE#308])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][62] ([Intel XE#1214] / [Intel XE#1608])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-2/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html

  * igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][63] ([Intel XE#1214] / [Intel XE#282]) +1 other test dmesg-warn
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-466/igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-a-hdmi-a-6.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-dg2-set2:     [PASS][64] -> [DMESG-WARN][65] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-466/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-466/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-dg2-set2:     [PASS][66] -> [DMESG-WARN][67] ([Intel XE#1214] / [Intel XE#282]) +5 other tests dmesg-warn
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-436/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-463/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-adlp:         NOTRUN -> [SKIP][68] ([Intel XE#1201] / [Intel XE#309]) +6 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-adlp:         NOTRUN -> [SKIP][69] ([Intel XE#1201] / [Intel XE#323]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][70] ([Intel XE#1214] / [Intel XE#324]) +1 other test dmesg-warn
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-434/igt@kms_dither@fb-8bpc-vs-panel-8bpc@pipe-a-hdmi-a-6.html

  * igt@kms_feature_discovery@chamelium:
    - shard-adlp:         NOTRUN -> [SKIP][71] ([Intel XE#1201] / [Intel XE#701])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-9/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-adlp:         NOTRUN -> [SKIP][72] ([Intel XE#1137] / [Intel XE#1201])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-4/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:
    - shard-adlp:         NOTRUN -> [SKIP][73] ([Intel XE#1201] / [Intel XE#310]) +9 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@flip-vs-rmfb@c-hdmi-a2:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][74] ([Intel XE#1214]) +4 other tests dmesg-warn
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-6/igt@kms_flip@flip-vs-rmfb@c-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][75] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) +5 other tests dmesg-warn
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-4/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
    - shard-adlp:         NOTRUN -> [FAIL][76] ([Intel XE#422] / [Intel XE#616]) +1 other test fail
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-8/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#1201] / [Intel XE#455]) +2 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
    - shard-adlp:         [PASS][78] -> [SKIP][79] ([Intel XE#1201])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-9/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][80] ([Intel XE#324]) +3 other tests dmesg-fail
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][81] ([Intel XE#1201] / [Intel XE#656]) +59 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([Intel XE#1201] / [Intel XE#651]) +7 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][83] ([Intel XE#1201] / [Intel XE#651]) +14 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][84] ([Intel XE#1201] / [Intel XE#653]) +5 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][85] ([Intel XE#1201] / [Intel XE#653]) +20 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][86] ([Intel XE#1201] / [Intel XE#1341])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-1/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][87] ([Intel XE#616])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-433/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][88] ([Intel XE#1191] / [Intel XE#1214]) +5 other tests dmesg-warn
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-8/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html

  * igt@kms_plane@pixel-format@pipe-b:
    - shard-adlp:         NOTRUN -> [FAIL][89] ([Intel XE#1331]) +2 other tests fail
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-2/igt@kms_plane@pixel-format@pipe-b.html

  * igt@kms_plane_lowres@tiling-none@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-FAIL][90] ([Intel XE#324]) +1 other test dmesg-fail
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-436/igt@kms_plane_lowres@tiling-none@pipe-a-dp-4.html

  * igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [FAIL][91] ([Intel XE#616]) +10 other tests fail
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-1/igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][92] ([Intel XE#1201] / [Intel XE#305]) +11 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-9/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-adlp:         NOTRUN -> [SKIP][93] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) +6 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_pm_backlight@fade:
    - shard-adlp:         NOTRUN -> [SKIP][94] ([Intel XE#1201] / [Intel XE#870]) +2 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-1/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-adlp:         [PASS][95] -> [SKIP][96] ([Intel XE#1201] / [Intel XE#1211]) +2 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-6/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-2/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@modeset-stress-extra-wait:
    - shard-dg2-set2:     [PASS][97] -> [SKIP][98] ([Intel XE#1201] / [Intel XE#1211]) +2 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-433/igt@kms_pm_rpm@modeset-stress-extra-wait.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-466/igt@kms_pm_rpm@modeset-stress-extra-wait.html

  * igt@kms_psr2_sf@cursor-plane-update-sf:
    - shard-adlp:         NOTRUN -> [SKIP][99] ([Intel XE#1201]) +6 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-9/igt@kms_psr2_sf@cursor-plane-update-sf.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-adlp:         NOTRUN -> [SKIP][100] ([Intel XE#1122] / [Intel XE#1201]) +2 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-1/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][101] ([Intel XE#1201] / [Intel XE#929]) +4 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-433/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@psr-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][102] ([Intel XE#1201] / [Intel XE#929]) +15 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-4/igt@kms_psr@psr-suspend.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-adlp:         NOTRUN -> [SKIP][103] ([Intel XE#1149] / [Intel XE#1201])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rmfb@close-fd@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [FAIL][104] ([Intel XE#294]) +1 other test fail
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-4/igt@kms_rmfb@close-fd@pipe-a-hdmi-a-1.html

  * igt@kms_rmfb@close-fd@pipe-b-hdmi-a-7:
    - shard-dg2-set2:     NOTRUN -> [FAIL][105] ([Intel XE#294])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-464/igt@kms_rmfb@close-fd@pipe-b-hdmi-a-7.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][106] ([Intel XE#1214] / [Intel XE#324])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-9/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][107] ([Intel XE#1201] / [Intel XE#327])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_sysfs_edid_timing:
    - shard-adlp:         NOTRUN -> [FAIL][108] ([Intel XE#1174])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-9/igt@kms_sysfs_edid_timing.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [PASS][109] -> [FAIL][110] ([Intel XE#899])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html

  * igt@kms_vrr@flip-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][111] ([Intel XE#1201] / [Intel XE#455]) +38 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-8/igt@kms_vrr@flip-suspend.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-adlp:         NOTRUN -> [SKIP][112] ([Intel XE#1201] / [Intel XE#756])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-9/igt@kms_writeback@writeback-invalid-parameters.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][113] ([Intel XE#1201] / [Intel XE#756])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-463/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@xe_ccs@ctrl-surf-copy:
    - shard-adlp:         NOTRUN -> [SKIP][114] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#488]) +2 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-1/igt@xe_ccs@ctrl-surf-copy.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-dg2-set2:     NOTRUN -> [FAIL][115] ([Intel XE#1050])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-463/igt@xe_compute@ccs-mode-compute-kernel.html
    - shard-adlp:         NOTRUN -> [SKIP][116] ([Intel XE#1201] / [Intel XE#1447])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-9/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_evict@evict-beng-mixed-threads-large-multi-vm:
    - shard-adlp:         NOTRUN -> [SKIP][117] ([Intel XE#1201] / [Intel XE#261]) +7 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-4/igt@xe_evict@evict-beng-mixed-threads-large-multi-vm.html

  * igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:
    - shard-dg2-set2:     [PASS][118] -> [FAIL][119] ([Intel XE#1259])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-433/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-dg2-set2:     [PASS][120] -> [TIMEOUT][121] ([Intel XE#1473])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-463/igt@xe_evict@evict-beng-threads-large.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-466/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-dg2-set2:     [PASS][122] -> [INCOMPLETE][123] ([Intel XE#1195] / [Intel XE#1473])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-small.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-dg2-set2:     [PASS][124] -> [TIMEOUT][125] ([Intel XE#1473] / [Intel XE#392]) +1 other test timeout
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-464/igt@xe_evict@evict-mixed-threads-large.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_evict@evict-small-external-cm:
    - shard-adlp:         NOTRUN -> [SKIP][126] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688]) +3 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-4/igt@xe_evict@evict-small-external-cm.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen:
    - shard-adlp:         NOTRUN -> [SKIP][127] ([Intel XE#1201] / [Intel XE#688]) +2 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-4/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen.html

  * igt@xe_exec_balancer@once-virtual-basic:
    - shard-adlp:         [PASS][128] -> [DMESG-WARN][129] ([Intel XE#1214]) +1 other test dmesg-warn
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-4/igt@xe_exec_balancer@once-virtual-basic.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-9/igt@xe_exec_balancer@once-virtual-basic.html

  * igt@xe_exec_fault_mode@many-execqueues-basic-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][130] ([Intel XE#1201] / [Intel XE#288]) +2 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-464/igt@xe_exec_fault_mode@many-execqueues-basic-prefetch.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-userptr:
    - shard-adlp:         NOTRUN -> [SKIP][131] ([Intel XE#1201] / [Intel XE#288]) +26 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-9/igt@xe_exec_fault_mode@once-bindexecqueue-userptr.html

  * igt@xe_exec_reset@cm-gt-reset:
    - shard-adlp:         NOTRUN -> [FAIL][132] ([Intel XE#1068])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-2/igt@xe_exec_reset@cm-gt-reset.html

  * igt@xe_exec_store@basic-all:
    - shard-adlp:         NOTRUN -> [INCOMPLETE][133] ([Intel XE#1044] / [Intel XE#1195])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-6/igt@xe_exec_store@basic-all.html

  * igt@xe_exec_threads@threads-bal-fd-userptr-invalidate:
    - shard-dg2-set2:     [PASS][134] -> [TIMEOUT][135] ([Intel XE#1206] / [Intel XE#1261] / [Intel XE#1356]) +1 other test timeout
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-463/igt@xe_exec_threads@threads-bal-fd-userptr-invalidate.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-463/igt@xe_exec_threads@threads-bal-fd-userptr-invalidate.html

  * igt@xe_exec_threads@threads-bal-mixed-basic:
    - shard-adlp:         [PASS][136] -> [INCOMPLETE][137] ([Intel XE#1169] / [Intel XE#1195] / [Intel XE#1376])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@xe_exec_threads@threads-bal-mixed-basic.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-6/igt@xe_exec_threads@threads-bal-mixed-basic.html

  * igt@xe_exec_threads@threads-bal-mixed-shared-vm-basic:
    - shard-dg2-set2:     [PASS][138] -> [INCOMPLETE][139] ([Intel XE#1169] / [Intel XE#1195] / [Intel XE#1356]) +1 other test incomplete
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-433/igt@xe_exec_threads@threads-bal-mixed-shared-vm-basic.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-466/igt@xe_exec_threads@threads-bal-mixed-shared-vm-basic.html

  * igt@xe_gt_freq@freq_suspend:
    - shard-adlp:         NOTRUN -> [INCOMPLETE][140] ([Intel XE#1195]) +1 other test incomplete
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-9/igt@xe_gt_freq@freq_suspend.html

  * igt@xe_huc_copy@huc_copy:
    - shard-adlp:         [PASS][141] -> [DMESG-FAIL][142] ([Intel XE#1088] / [Intel XE#1330])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-4/igt@xe_huc_copy@huc_copy.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-6/igt@xe_huc_copy@huc_copy.html

  * igt@xe_live_ktest@xe_migrate:
    - shard-dg2-set2:     [PASS][143] -> [SKIP][144] ([Intel XE#1192] / [Intel XE#1201]) +1 other test skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-433/igt@xe_live_ktest@xe_migrate.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-434/igt@xe_live_ktest@xe_migrate.html
    - shard-adlp:         [PASS][145] -> [SKIP][146] ([Intel XE#1192] / [Intel XE#1201])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-4/igt@xe_live_ktest@xe_migrate.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-2/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_mmap@small-bar:
    - shard-adlp:         NOTRUN -> [SKIP][147] ([Intel XE#1201] / [Intel XE#512])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-8/igt@xe_mmap@small-bar.html

  * igt@xe_module_load@reload:
    - shard-dg2-set2:     [PASS][148] -> [DMESG-WARN][149] ([Intel XE#1214]) +2 other tests dmesg-warn
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-434/igt@xe_module_load@reload.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-435/igt@xe_module_load@reload.html

  * igt@xe_noexec_ping_pong:
    - shard-adlp:         NOTRUN -> [SKIP][150] ([Intel XE#1201] / [Intel XE#379])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-1/igt@xe_noexec_ping_pong.html

  * igt@xe_pm@d3-mmap-system:
    - shard-adlp:         NOTRUN -> [FAIL][151] ([Intel XE#1221])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-1/igt@xe_pm@d3-mmap-system.html

  * igt@xe_pm@d3-mmap-vram:
    - shard-adlp:         NOTRUN -> [SKIP][152] ([Intel XE#1008] / [Intel XE#1201])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-2/igt@xe_pm@d3-mmap-vram.html

  * igt@xe_pm@d3hot-basic:
    - shard-dg2-set2:     [PASS][153] -> [FAIL][154] ([Intel XE#355])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-463/igt@xe_pm@d3hot-basic.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-466/igt@xe_pm@d3hot-basic.html

  * igt@xe_pm@d3hot-multiple-execs:
    - shard-adlp:         [PASS][155] -> [FAIL][156] ([Intel XE#355])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-4/igt@xe_pm@d3hot-multiple-execs.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-6/igt@xe_pm@d3hot-multiple-execs.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-adlp:         NOTRUN -> [SKIP][157] ([Intel XE#1201] / [Intel XE#366])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-1/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@s3-exec-after:
    - shard-adlp:         [PASS][158] -> [DMESG-WARN][159] ([Intel XE#1191] / [Intel XE#1214])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-9/igt@xe_pm@s3-exec-after.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-8/igt@xe_pm@s3-exec-after.html

  * igt@xe_pm@s4-basic-exec:
    - shard-adlp:         NOTRUN -> [FAIL][160] ([Intel XE#1043] / [Intel XE#845])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-8/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-adlp:         [PASS][161] -> [FAIL][162] ([Intel XE#958])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-6/igt@xe_pm_residency@toggle-gt-c6.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-8/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-adlp:         NOTRUN -> [SKIP][163] ([Intel XE#1201] / [Intel XE#944]) +1 other test skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-8/igt@xe_query@multigpu-query-invalid-extension.html

  
#### Possible fixes ####

  * igt@kms_big_fb@4-tiled-64bpp-rotate-0:
    - {shard-lnl}:        [DMESG-FAIL][164] ([Intel XE#1602]) -> [PASS][165]
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-8/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-lnl-4/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [FAIL][166] ([Intel XE#1231]) -> [PASS][167]
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - {shard-lnl}:        [DMESG-FAIL][168] ([Intel XE#1602] / [Intel XE#1619]) -> [PASS][169]
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-lnl-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         [FAIL][170] ([Intel XE#1204]) -> [PASS][171]
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * {igt@kms_big_joiner@basic-force-joiner}:
    - shard-dg2-set2:     [SKIP][172] ([Intel XE#1201]) -> [PASS][173]
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-464/igt@kms_big_joiner@basic-force-joiner.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-433/igt@kms_big_joiner@basic-force-joiner.html

  * igt@kms_cursor_legacy@forked-move@pipe-b:
    - shard-dg2-set2:     [DMESG-WARN][174] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][175] +7 other tests pass
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-466/igt@kms_cursor_legacy@forked-move@pipe-b.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-464/igt@kms_cursor_legacy@forked-move@pipe-b.html

  * igt@kms_flip@basic-plain-flip:
    - shard-adlp:         [INCOMPLETE][176] ([Intel XE#1150] / [Intel XE#1195] / [Intel XE#1330]) -> [PASS][177]
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-1/igt@kms_flip@basic-plain-flip.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-8/igt@kms_flip@basic-plain-flip.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@c-edp1:
    - {shard-lnl}:        [FAIL][178] ([Intel XE#480]) -> [PASS][179] +2 other tests pass
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-2/igt@kms_flip@flip-vs-absolute-wf_vblank@c-edp1.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-lnl-2/igt@kms_flip@flip-vs-absolute-wf_vblank@c-edp1.html

  * igt@kms_flip@flip-vs-rmfb-interruptible:
    - shard-adlp:         [SKIP][180] ([Intel XE#1177] / [Intel XE#1201]) -> [PASS][181] +8 other tests pass
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_flip@flip-vs-rmfb-interruptible.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-4/igt@kms_flip@flip-vs-rmfb-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:
    - shard-adlp:         [DMESG-WARN][182] ([Intel XE#1214]) -> [PASS][183] +1 other test pass
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-adlp:         [INCOMPLETE][184] ([Intel XE#1195]) -> [PASS][185]
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render:
    - {shard-lnl}:        [INCOMPLETE][186] ([Intel XE#1602]) -> [PASS][187] +3 other tests pass
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - {shard-lnl}:        [DMESG-FAIL][188] ([Intel XE#1537] / [Intel XE#1602]) -> [PASS][189]
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-8/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-lnl-8/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_plane_cursor@overlay@pipe-a-edp-1-size-64:
    - {shard-lnl}:        [DMESG-WARN][190] ([Intel XE#1330]) -> [PASS][191] +9 other tests pass
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-8/igt@kms_plane_cursor@overlay@pipe-a-edp-1-size-64.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-lnl-3/igt@kms_plane_cursor@overlay@pipe-a-edp-1-size-64.html

  * igt@kms_plane_cursor@primary:
    - {shard-lnl}:        [DMESG-FAIL][192] ([Intel XE#1330]) -> [PASS][193]
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-5/igt@kms_plane_cursor@primary.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-lnl-8/igt@kms_plane_cursor@primary.html

  * igt@kms_plane_cursor@primary@pipe-a-edp-1-size-64:
    - {shard-lnl}:        [FAIL][194] ([Intel XE#1471] / [Intel XE#1495]) -> [PASS][195]
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-5/igt@kms_plane_cursor@primary@pipe-a-edp-1-size-64.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-lnl-8/igt@kms_plane_cursor@primary@pipe-a-edp-1-size-64.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:
    - {shard-lnl}:        [SKIP][196] -> [PASS][197]
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-1/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-lnl-3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html

  * igt@kms_pm_dc@dc5-psr:
    - {shard-lnl}:        [FAIL][198] ([Intel XE#718]) -> [PASS][199]
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-5/igt@kms_pm_dc@dc5-psr.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-lnl-1/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-dg2-set2:     [FAIL][200] ([Intel XE#1204]) -> [PASS][201]
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-463/igt@kms_pm_dc@dc9-dpms.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-434/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_rpm@cursor-dpms:
    - shard-adlp:         [SKIP][202] ([Intel XE#1201] / [Intel XE#1211]) -> [PASS][203]
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_pm_rpm@cursor-dpms.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-9/igt@kms_pm_rpm@cursor-dpms.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
    - {shard-lnl}:        [FAIL][204] ([Intel XE#1605]) -> [PASS][205] +1 other test pass
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-6/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-lnl-2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][206] ([Intel XE#899]) -> [PASS][207]
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-dg2-set2:     [DMESG-WARN][208] ([Intel XE#1162] / [Intel XE#1214]) -> [PASS][209]
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-463/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-464/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@kms_vblank@wait-forked:
    - {shard-lnl}:        [DMESG-WARN][210] ([Intel XE#1602]) -> [PASS][211]
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-6/igt@kms_vblank@wait-forked.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-lnl-6/igt@kms_vblank@wait-forked.html

  * igt@xe_evict@evict-threads-large:
    - shard-dg2-set2:     [TIMEOUT][212] ([Intel XE#1473] / [Intel XE#392]) -> [PASS][213]
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-463/igt@xe_evict@evict-threads-large.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-434/igt@xe_evict@evict-threads-large.html

  * igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate:
    - {shard-lnl}:        [DMESG-FAIL][214] ([Intel XE#1537] / [Intel XE#1619]) -> [PASS][215]
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-6/igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-lnl-8/igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate.html

  * igt@xe_exec_compute_mode@many-bindexecqueue-userptr:
    - {shard-lnl}:        [INCOMPLETE][216] ([Intel XE#1617]) -> [PASS][217]
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-8/igt@xe_exec_compute_mode@many-bindexecqueue-userptr.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-lnl-3/igt@xe_exec_compute_mode@many-bindexecqueue-userptr.html
    - shard-adlp:         [INCOMPLETE][218] ([Intel XE#1044] / [Intel XE#1195]) -> [PASS][219]
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@xe_exec_compute_mode@many-bindexecqueue-userptr.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-8/igt@xe_exec_compute_mode@many-bindexecqueue-userptr.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch:
    - {shard-lnl}:        [DMESG-FAIL][220] ([Intel XE#1537]) -> [PASS][221]
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-6/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-lnl-3/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_queue_property@invalid-property:
    - {shard-lnl}:        [DMESG-WARN][222] ([Intel XE#1537]) -> [PASS][223]
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-6/igt@xe_exec_queue_property@invalid-property.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-lnl-2/igt@xe_exec_queue_property@invalid-property.html

  * igt@xe_exec_reset@gt-reset-stress:
    - {shard-lnl}:        [DMESG-WARN][224] ([Intel XE#1329]) -> [PASS][225]
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-4/igt@xe_exec_reset@gt-reset-stress.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-lnl-6/igt@xe_exec_reset@gt-reset-stress.html

  * igt@xe_exec_threads@threads-bal-userptr-rebind:
    - shard-adlp:         [DMESG-FAIL][226] ([Intel XE#1088] / [Intel XE#1330]) -> [PASS][227]
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@xe_exec_threads@threads-bal-userptr-rebind.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-6/igt@xe_exec_threads@threads-bal-userptr-rebind.html

  * igt@xe_exec_threads@threads-cm-fd-userptr-invalidate:
    - shard-dg2-set2:     [TIMEOUT][228] ([Intel XE#1206] / [Intel XE#1261] / [Intel XE#1356]) -> [PASS][229]
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-434/igt@xe_exec_threads@threads-cm-fd-userptr-invalidate.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-464/igt@xe_exec_threads@threads-cm-fd-userptr-invalidate.html

  * igt@xe_exec_threads@threads-hang-fd-basic:
    - shard-dg2-set2:     [FAIL][230] ([Intel XE#1256]) -> [PASS][231]
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-436/igt@xe_exec_threads@threads-hang-fd-basic.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-434/igt@xe_exec_threads@threads-hang-fd-basic.html

  * igt@xe_module_load@reload:
    - shard-adlp:         [FAIL][232] -> [PASS][233]
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@xe_module_load@reload.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-6/igt@xe_module_load@reload.html

  * igt@xe_pm@d3hot-basic-exec:
    - shard-dg2-set2:     [FAIL][234] ([Intel XE#355]) -> [PASS][235]
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-464/igt@xe_pm@d3hot-basic-exec.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-466/igt@xe_pm@d3hot-basic-exec.html

  * igt@xe_pm@s3-basic:
    - shard-adlp:         [DMESG-WARN][236] ([Intel XE#1191] / [Intel XE#1214]) -> [PASS][237] +1 other test pass
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-4/igt@xe_pm@s3-basic.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-6/igt@xe_pm@s3-basic.html

  * igt@xe_spin_batch@spin-basic-all:
    - shard-adlp:         [SKIP][238] ([Intel XE#1201]) -> [PASS][239] +74 other tests pass
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@xe_spin_batch@spin-basic-all.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-9/igt@xe_spin_batch@spin-basic-all.html

  * igt@xe_spin_batch@spin-fixed-duration:
    - shard-adlp:         [FAIL][240] ([Intel XE#1081]) -> [PASS][241]
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-4/igt@xe_spin_batch@spin-fixed-duration.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-9/igt@xe_spin_batch@spin-fixed-duration.html

  * igt@xe_vm@large-userptr-binds-16777216:
    - {shard-lnl}:        [DMESG-FAIL][242] ([Intel XE#1619]) -> [PASS][243]
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-8/igt@xe_vm@large-userptr-binds-16777216.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-lnl-6/igt@xe_vm@large-userptr-binds-16777216.html
    - shard-adlp:         [DMESG-FAIL][244] ([Intel XE#1619]) -> [PASS][245]
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@xe_vm@large-userptr-binds-16777216.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-9/igt@xe_vm@large-userptr-binds-16777216.html

  * igt@xe_vm@munmap-style-unbind-either-side-partial-split-page-hammer:
    - {shard-lnl}:        [FAIL][246] ([Intel XE#1440]) -> [PASS][247]
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-2/igt@xe_vm@munmap-style-unbind-either-side-partial-split-page-hammer.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-lnl-7/igt@xe_vm@munmap-style-unbind-either-side-partial-split-page-hammer.html

  
#### Warnings ####

  * igt@core_hotunplug@hotreplug:
    - shard-adlp:         [DMESG-WARN][248] ([Intel XE#1214]) -> [ABORT][249] ([Intel XE#1538])
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@core_hotunplug@hotreplug.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-2/igt@core_hotunplug@hotreplug.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [SKIP][250] ([Intel XE#1201]) -> [SKIP][251] ([Intel XE#1124] / [Intel XE#1201]) +2 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         [SKIP][252] ([Intel XE#1177] / [Intel XE#1201]) -> [FAIL][253] ([Intel XE#1204])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [DMESG-FAIL][254] ([Intel XE#1619]) -> [FAIL][255] ([Intel XE#1231])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [FAIL][256] ([Intel XE#1231]) -> [DMESG-FAIL][257] ([Intel XE#324])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - shard-adlp:         [DMESG-FAIL][258] ([Intel XE#1619]) -> [FAIL][259] ([Intel XE#616])
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-1/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-adlp:         [SKIP][260] ([Intel XE#1201]) -> [FAIL][261] ([Intel XE#616]) +3 other tests fail
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         [SKIP][262] ([Intel XE#1177] / [Intel XE#1201]) -> [SKIP][263] ([Intel XE#1124] / [Intel XE#1201]) +2 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-adlp:         [SKIP][264] ([Intel XE#1201]) -> [SKIP][265] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +6 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-4/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs:
    - shard-adlp:         [SKIP][266] ([Intel XE#1201]) -> [SKIP][267] ([Intel XE#1201] / [Intel XE#1252])
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-9/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html

  * igt@kms_chamelium_frames@hdmi-crc-single:
    - shard-adlp:         [SKIP][268] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][269] ([Intel XE#1201])
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_chamelium_frames@hdmi-crc-single.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-1/igt@kms_chamelium_frames@hdmi-crc-single.html

  * igt@kms_chamelium_hpd@common-hpd-after-hibernate:
    - shard-adlp:         [SKIP][270] ([Intel XE#1201]) -> [SKIP][271] ([Intel XE#1201] / [Intel XE#373]) +4 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_chamelium_hpd@common-hpd-after-hibernate.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-4/igt@kms_chamelium_hpd@common-hpd-after-hibernate.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2-set2:     [FAIL][272] ([Intel XE#1178]) -> [SKIP][273] ([Intel XE#1201] / [Intel XE#455]) +1 other test skip
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-435/igt@kms_content_protection@atomic-dpms.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-464/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-adlp:         [SKIP][274] ([Intel XE#1201]) -> [SKIP][275] ([Intel XE#1201] / [Intel XE#308])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-4/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_edge_walk@256x256-top-bottom:
    - shard-dg2-set2:     [FAIL][276] ([Intel XE#581]) -> [DMESG-WARN][277] ([Intel XE#1214] / [Intel XE#282])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-464/igt@kms_cursor_edge_walk@256x256-top-bottom.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-466/igt@kms_cursor_edge_walk@256x256-top-bottom.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-adlp:         [SKIP][278] ([Intel XE#1201] / [Intel XE#309]) -> [SKIP][279] ([Intel XE#1201])
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-4/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-1/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-adlp:         [SKIP][280] ([Intel XE#1201]) -> [SKIP][281] ([Intel XE#1201] / [Intel XE#309]) +1 other test skip
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-6/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-adlp:         [SKIP][282] ([Intel XE#1201]) -> [SKIP][283] ([Intel XE#1201] / [Intel XE#310]) +1 other test skip
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_flip@2x-blocking-wf_vblank.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-8/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][284] ([Intel XE#1191] / [Intel XE#1214]) -> [DMESG-WARN][285] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608])
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][286] ([Intel XE#1214] / [Intel XE#1608]) -> [DMESG-WARN][287] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) +2 other tests dmesg-warn
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-adlp:         [SKIP][288] ([Intel XE#1201]) -> [SKIP][289] ([Intel XE#1201] / [Intel XE#455]) +8 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-9/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-blt:
    - shard-adlp:         [SKIP][290] ([Intel XE#1177] / [Intel XE#1201]) -> [SKIP][291] ([Intel XE#1201] / [Intel XE#651])
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-blt.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-adlp:         [SKIP][292] ([Intel XE#1201]) -> [SKIP][293] ([Intel XE#1201] / [Intel XE#656]) +15 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-blt:
    - shard-adlp:         [SKIP][294] ([Intel XE#1201]) -> [SKIP][295] ([Intel XE#1201] / [Intel XE#651]) +4 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-blt.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-pri-indfb-multidraw:
    - shard-dg2-set2:     [SKIP][296] ([Intel XE#1201]) -> [SKIP][297] ([Intel XE#1201] / [Intel XE#651])
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-pri-indfb-multidraw.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:
    - shard-adlp:         [SKIP][298] ([Intel XE#1201] / [Intel XE#656]) -> [SKIP][299] ([Intel XE#1201])
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-adlp:         [SKIP][300] ([Intel XE#1177] / [Intel XE#1201]) -> [SKIP][301] ([Intel XE#1201] / [Intel XE#656]) +2 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4:
    - shard-adlp:         [SKIP][302] ([Intel XE#1201]) -> [SKIP][303] ([Intel XE#1151] / [Intel XE#1201])
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render:
    - shard-adlp:         [SKIP][304] ([Intel XE#1201]) -> [SKIP][305] ([Intel XE#1201] / [Intel XE#653]) +5 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-adlp:         [SKIP][306] ([Intel XE#1177] / [Intel XE#1201]) -> [SKIP][307] ([Intel XE#1201] / [Intel XE#455])
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-6/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-adlp:         [SKIP][308] ([Intel XE#1177] / [Intel XE#1201]) -> [SKIP][309] ([Intel XE#1201] / [Intel XE#417])
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_hdmi_inject@inject-audio.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-1/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-adlp:         [SKIP][310] ([Intel XE#1201]) -> [DMESG-WARN][311] ([Intel XE#1191] / [Intel XE#1214])
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-8/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
    - shard-dg2-set2:     [FAIL][312] ([Intel XE#616]) -> [DMESG-FAIL][313] ([Intel XE#1162]) +1 other test dmesg-fail
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-434/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-466/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html

  * igt@kms_plane_lowres@tiling-x:
    - shard-dg2-set2:     [DMESG-WARN][314] ([Intel XE#1214] / [Intel XE#324]) -> [DMESG-FAIL][315] ([Intel XE#324])
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-435/igt@kms_plane_lowres@tiling-x.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-464/igt@kms_plane_lowres@tiling-x.html

  * igt@kms_plane_multiple@tiling-x:
    - shard-adlp:         [FAIL][316] ([Intel XE#616] / [Intel XE#654]) -> [INCOMPLETE][317] ([Intel XE#1195])
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_plane_multiple@tiling-x.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-6/igt@kms_plane_multiple@tiling-x.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:
    - shard-dg2-set2:     [TIMEOUT][318] ([Intel XE#380] / [Intel XE#904] / [Intel XE#909]) -> [INCOMPLETE][319] ([Intel XE#1195] / [Intel XE#904] / [Intel XE#909])
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [TIMEOUT][320] ([Intel XE#904] / [Intel XE#909]) -> [INCOMPLETE][321] ([Intel XE#1195] / [Intel XE#904] / [Intel XE#909])
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-adlp:         [SKIP][322] ([Intel XE#1177] / [Intel XE#1201]) -> [SKIP][323] ([Intel XE#1122] / [Intel XE#1201])
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-4/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-adlp:         [FAIL][324] ([Intel XE#1148] / [Intel XE#1204]) -> [SKIP][325] ([Intel XE#1201] / [Intel XE#734])
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-9/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
    - shard-adlp:         [SKIP][326] ([Intel XE#1177] / [Intel XE#1201]) -> [SKIP][327] ([Intel XE#1201])
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-6/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr@fbc-pr-primary-page-flip:
    - shard-adlp:         [SKIP][328] ([Intel XE#1201]) -> [SKIP][329] ([Intel XE#1201] / [Intel XE#929]) +4 other tests skip
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_psr@fbc-pr-primary-page-flip.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-2/igt@kms_psr@fbc-pr-primary-page-flip.html

  * igt@kms_psr@fbc-psr-dpms:
    - shard-adlp:         [SKIP][330] ([Intel XE#1177] / [Intel XE#1201]) -> [SKIP][331] ([Intel XE#1201] / [Intel XE#929]) +2 other tests skip
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_psr@fbc-psr-dpms.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-1/igt@kms_psr@fbc-psr-dpms.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-adlp:         [SKIP][332] ([Intel XE#1201]) -> [SKIP][333] ([Intel XE#1201] / [Intel XE#330])
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_tv_load_detect@load-detect.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-4/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-adlp:         [INCOMPLETE][334] ([Intel XE#1034] / [Intel XE#1195] / [Intel XE#927]) -> [DMESG-WARN][335] ([Intel XE#1191] / [Intel XE#1214])
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-1/igt@kms_vblank@ts-continuation-suspend.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-2/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1:
    - shard-adlp:         [INCOMPLETE][336] ([Intel XE#1034] / [Intel XE#1195]) -> [DMESG-WARN][337] ([Intel XE#1191] / [Intel XE#1214])
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-1/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-2/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-adlp:         [SKIP][338] ([Intel XE#1201]) -> [SKIP][339] ([Intel XE#1201] / [Intel XE#756])
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_writeback@writeback-check-output-xrgb2101010.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-9/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@xe_evict@evict-beng-small-multi-vm-cm:
    - shard-adlp:         [SKIP][340] ([Intel XE#1201]) -> [SKIP][341] ([Intel XE#1201] / [Intel XE#261])
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@xe_evict@evict-beng-small-multi-vm-cm.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-8/igt@xe_evict@evict-beng-small-multi-vm-cm.html

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-dg2-set2:     [TIMEOUT][342] ([Intel XE#1041] / [Intel XE#1473] / [Intel XE#392]) -> [INCOMPLETE][343] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392])
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-large.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_evict@evict-small-multi-vm-cm:
    - shard-adlp:         [SKIP][344] ([Intel XE#1201]) -> [SKIP][345] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688])
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@xe_evict@evict-small-multi-vm-cm.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-6/igt@xe_evict@evict-small-multi-vm-cm.html

  * igt@xe_exec_fault_mode@many-userptr-invalidate-race:
    - shard-adlp:         [SKIP][346] ([Intel XE#1201]) -> [SKIP][347] ([Intel XE#1201] / [Intel XE#288]) +6 other tests skip
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-6/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html

  * igt@xe_exec_reset@cm-cat-error:
    - shard-adlp:         [DMESG-FAIL][348] ([Intel XE#1068]) -> [DMESG-FAIL][349] ([Intel XE#1068] / [Intel XE#1088] / [Intel XE#1330] / [Intel XE#358])
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-6/igt@xe_exec_reset@cm-cat-error.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-8/igt@xe_exec_reset@cm-cat-error.html

  * igt@xe_pm@s2idle-basic-exec:
    - shard-adlp:         [DMESG-WARN][350] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [INCOMPLETE][351] ([Intel XE#1195] / [Intel XE#1358] / [Intel XE#927])
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@xe_pm@s2idle-basic-exec.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-1/igt@xe_pm@s2idle-basic-exec.html

  * igt@xe_pm@s2idle-d3hot-basic-exec:
    - shard-adlp:         [SKIP][352] ([Intel XE#1201]) -> [DMESG-WARN][353] ([Intel XE#1214] / [Intel XE#1608])
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@xe_pm@s2idle-d3hot-basic-exec.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-2/igt@xe_pm@s2idle-d3hot-basic-exec.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-adlp:         [FAIL][354] ([Intel XE#1043] / [Intel XE#845]) -> [FAIL][355] ([Intel XE#1257])
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@xe_pm@s4-multiple-execs.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-6/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_query@multigpu-query-invalid-size:
    - shard-adlp:         [SKIP][356] ([Intel XE#1201]) -> [SKIP][357] ([Intel XE#1201] / [Intel XE#944]) +2 other tests skip
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@xe_query@multigpu-query-invalid-size.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-9/igt@xe_query@multigpu-query-invalid-size.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1034]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034
  [Intel XE#1041]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041
  [Intel XE#1043]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1043
  [Intel XE#1044]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044
  [Intel XE#1050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1068]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1068
  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
  [Intel XE#1081]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081
  [Intel XE#1088]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1088
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1148]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1148
  [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
  [Intel XE#1150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1150
  [Intel XE#1151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151
  [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
  [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
  [Intel XE#1174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1174
  [Intel XE#1177]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1177
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1185]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1185
  [Intel XE#1191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1206]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1206
  [Intel XE#1211]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211
  [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
  [Intel XE#1221]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1221
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
  [Intel XE#1256]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1256
  [Intel XE#1257]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1257
  [Intel XE#1259]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259
  [Intel XE#1261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1261
  [Intel XE#1329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1329
  [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
  [Intel XE#1331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1331
  [Intel XE#1341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1341
  [Intel XE#1356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1376
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1396
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
  [Intel XE#1440]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1440
  [Intel XE#1446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1446
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1460]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1460
  [Intel XE#1465]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1465
  [Intel XE#1466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466
  [Intel XE#1471]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1471
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1495]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1495
  [Intel XE#1504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504
  [Intel XE#1537]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1537
  [Intel XE#1538]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1538
  [Intel XE#1558]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1558
  [Intel XE#1577]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1577
  [Intel XE#1595]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1595
  [Intel XE#1602]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602
  [Intel XE#1603]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1603
  [Intel XE#1605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1605
  [Intel XE#1608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608
  [Intel XE#1617]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1617
  [Intel XE#1619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1619
  [Intel XE#1641]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1641
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/294
  [Intel XE#305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/355
  [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#379]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/379
  [Intel XE#380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/380
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/417
  [Intel XE#422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/422
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#581]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/581
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/650
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#654]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/654
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#734]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#801]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/801
  [Intel XE#845]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/845
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/904
  [Intel XE#909]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/909
  [Intel XE#910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/910
  [Intel XE#927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/927
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977


Build changes
-------------

  * IGT: IGT_7806 -> IGT_7807
  * Linux: xe-1095-5f7597e990bea547bd1261170497e7476fb781bb -> xe-pw-132409v2

  IGT_7806: 849cd963ce7e8222dcf17cc872d355181fd2c2a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7807: 43e71eeac0fb4fe59df40df2c96fd0fdbf585c0b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1095-5f7597e990bea547bd1261170497e7476fb781bb: 5f7597e990bea547bd1261170497e7476fb781bb
  xe-pw-132409v2: 132409v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/index.html

--===============6749128406021297843==
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
<tr><td><b>Series:</b></td><td>series starting with [v7,1/2] drm/xe: add a new debugfs file - mmio (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132409/">https://patchwork.freedesktop.org/series/132409/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1095-5f7597e990bea547bd1261170497e7476fb781bb_full -&gt; xe-pw-132409v2_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-132409v2_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-132409v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-132409v2_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_debugfs@base:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-9/igt@xe_debugfs@base.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-6/igt@xe_debugfs@base.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr-rebind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@xe_exec_basic@twice-userptr-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-6/igt@xe_exec_basic@twice-userptr-rebind.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-4-tiled:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-1/igt@kms_addfb_basic@addfb25-4-tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-lnl-7/igt@kms_addfb_basic@addfb25-4-tiled.html">DMESG-WARN</a> +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-single:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-7/igt@kms_chamelium_frames@hdmi-crc-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-lnl-2/igt@kms_chamelium_frames@hdmi-crc-single.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-lnl-2/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb@a-edp2:</p>
<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-lnl-7/igt@kms_flip@flip-vs-rmfb@a-edp2.html">DMESG-WARN</a> +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-1/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-lnl-7/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">DMESG-FAIL</a> +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-slowdraw:</p>
<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-slowdraw.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a-edp-1:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-4/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a-edp-1.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1558">Intel XE#1558</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-lnl-1/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a-edp-1.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-edp-2}:</p>
<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-lnl-7/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-edp-2.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-render@edp-1:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-7/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-lnl-4/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html">FAIL</a> +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-lnl-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">DMESG-FAIL</a> +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-4/igt@xe_live_ktest@xe_mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-lnl-4/igt@xe_live_ktest@xe_mocs.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1043">Intel XE#1043</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-lnl-7/igt@xe_pm@s4-multiple-execs.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-132409v2_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-2/igt@intel_hwmon@hwmon-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125">Intel XE#1125</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-464/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/650">Intel XE#650</a>) +8 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-6-4-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-464/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-6-4-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/801">Intel XE#801</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-7-4-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-464/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-7-4-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1185">Intel XE#1185</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-466/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-6/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-2/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-435/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-4/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-6/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-6/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +71 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +54 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-4/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-1/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-frame-dump:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-464/igt@kms_chamelium_frames@hdmi-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-1/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-8/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-2/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-466/igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-a-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-466/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-466/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/910">Intel XE#910</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-436/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-463/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-8bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-434/igt@kms_dither@fb-8bpc-vs-panel-8bpc@pipe-a-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-9/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-4/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb@c-hdmi-a2:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-6/igt@kms_flip@flip-vs-rmfb@c-hdmi-a2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-4/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-8/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/422">Intel XE#422</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-9/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +3 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +59 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-1/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1341">Intel XE#1341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-433/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-8/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format@pipe-b:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-2/igt@kms_plane@pixel-format@pipe-b.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1331">Intel XE#1331</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-none@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-436/igt@kms_plane_lowres@tiling-none@pipe-a-dp-4.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-1/igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +10 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-9/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-1/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-6/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-2/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-stress-extra-wait:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-433/igt@kms_pm_rpm@modeset-stress-extra-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-466/igt@kms_pm_rpm@modeset-stress-extra-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-update-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-9/igt@kms_psr2_sf@cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-1/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-433/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-4/igt@kms_psr@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rmfb@close-fd@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-4/igt@kms_rmfb@close-fd@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/294">Intel XE#294</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_rmfb@close-fd@pipe-b-hdmi-a-7:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-464/igt@kms_rmfb@close-fd@pipe-b-hdmi-a-7.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/294">Intel XE#294</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-9/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-9/igt@kms_sysfs_edid_timing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1174">Intel XE#1174</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-8/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +38 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-9/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-463/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-1/igt@xe_ccs@ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/488">Intel XE#488</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-463/igt@xe_compute@ccs-mode-compute-kernel.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050">Intel XE#1050</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-9/igt@xe_compute@ccs-mode-compute-kernel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447">Intel XE#1447</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large-multi-vm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-4/igt@xe_evict@evict-beng-mixed-threads-large-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-433/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259">Intel XE#1259</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-463/igt@xe_evict@evict-beng-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-466/igt@xe_evict@evict-beng-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-464/igt@xe_evict@evict-mixed-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-4/igt@xe_evict@evict-small-external-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-4/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-virtual-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-4/igt@xe_exec_balancer@once-virtual-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-9/igt@xe_exec_balancer@once-virtual-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-basic-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-464/igt@xe_exec_fault_mode@many-execqueues-basic-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-userptr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-9/igt@xe_exec_fault_mode@once-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-gt-reset:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-2/igt@xe_exec_reset@cm-gt-reset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1068">Intel XE#1068</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_store@basic-all:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-6/igt@xe_exec_store@basic-all.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044">Intel XE#1044</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-fd-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-463/igt@xe_exec_threads@threads-bal-fd-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-463/igt@xe_exec_threads@threads-bal-fd-userptr-invalidate.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1206">Intel XE#1206</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1261">Intel XE#1261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@xe_exec_threads@threads-bal-mixed-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-6/igt@xe_exec_threads@threads-bal-mixed-basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1376">Intel XE#1376</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-shared-vm-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-433/igt@xe_exec_threads@threads-bal-mixed-shared-vm-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-466/igt@xe_exec_threads@threads-bal-mixed-shared-vm-basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-9/igt@xe_gt_freq@freq_suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-4/igt@xe_huc_copy@huc_copy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-6/igt@xe_huc_copy@huc_copy.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1088">Intel XE#1088</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330">Intel XE#1330</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-433/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-434/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-4/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-8/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-434/igt@xe_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-435/igt@xe_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_noexec_ping_pong:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-1/igt@xe_noexec_ping_pong.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/379">Intel XE#379</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3-mmap-system:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-1/igt@xe_pm@d3-mmap-system.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1221">Intel XE#1221</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3-mmap-vram:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-2/igt@xe_pm@d3-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008">Intel XE#1008</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-463/igt@xe_pm@d3hot-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-466/igt@xe_pm@d3hot-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/355">Intel XE#355</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-4/igt@xe_pm@d3hot-multiple-execs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-6/igt@xe_pm@d3hot-multiple-execs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/355">Intel XE#355</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-1/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-exec-after:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-9/igt@xe_pm@s3-exec-after.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-8/igt@xe_pm@s3-exec-after.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-8/igt@xe_pm@s4-basic-exec.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1043">Intel XE#1043</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/845">Intel XE#845</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-6/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-8/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-8/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-0:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-8/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602">Intel XE#1602</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-lnl-4/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602">Intel XE#1602</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1619">Intel XE#1619</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-lnl-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_big_joiner@basic-force-joiner}:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-464/igt@kms_big_joiner@basic-force-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-433/igt@kms_big_joiner@basic-force-joiner.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-move@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-466/igt@kms_cursor_legacy@forked-move@pipe-b.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-464/igt@kms_cursor_legacy@forked-move@pipe-b.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-1/igt@kms_flip@basic-plain-flip.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1150">Intel XE#1150</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330">Intel XE#1330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-8/igt@kms_flip@basic-plain-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@c-edp1:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-2/igt@kms_flip@flip-vs-absolute-wf_vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-lnl-2/igt@kms_flip@flip-vs-absolute-wf_vblank@c-edp1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_flip@flip-vs-rmfb-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1177">Intel XE#1177</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-4/igt@kms_flip@flip-vs-rmfb-interruptible.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602">Intel XE#1602</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-8/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1537">Intel XE#1537</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602">Intel XE#1602</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-lnl-8/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-edp-1-size-64:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-8/igt@kms_plane_cursor@overlay@pipe-a-edp-1-size-64.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330">Intel XE#1330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-lnl-3/igt@kms_plane_cursor@overlay@pipe-a-edp-1-size-64.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-5/igt@kms_plane_cursor@primary.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330">Intel XE#1330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-lnl-8/igt@kms_plane_cursor@primary.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-edp-1-size-64:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-5/igt@kms_plane_cursor@primary@pipe-a-edp-1-size-64.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1471">Intel XE#1471</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1495">Intel XE#1495</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-lnl-8/igt@kms_plane_cursor@primary@pipe-a-edp-1-size-64.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-1/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-lnl-3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-5/igt@kms_pm_dc@dc5-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-lnl-1/igt@kms_pm_dc@dc5-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-463/igt@kms_pm_dc@dc9-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-434/igt@kms_pm_dc@dc9-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor-dpms:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_pm_rpm@cursor-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-9/igt@kms_pm_rpm@cursor-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-6/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1605">Intel XE#1605</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-lnl-2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-463/igt@kms_vblank@ts-continuation-dpms-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-464/igt@kms_vblank@ts-continuation-dpms-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-6/igt@kms_vblank@wait-forked.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602">Intel XE#1602</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-lnl-6/igt@kms_vblank@wait-forked.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-463/igt@xe_evict@evict-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-434/igt@xe_evict@evict-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-6/igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1537">Intel XE#1537</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1619">Intel XE#1619</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-lnl-8/igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-bindexecqueue-userptr:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-8/igt@xe_exec_compute_mode@many-bindexecqueue-userptr.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1617">Intel XE#1617</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-lnl-3/igt@xe_exec_compute_mode@many-bindexecqueue-userptr.html">PASS</a></li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@xe_exec_compute_mode@many-bindexecqueue-userptr.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044">Intel XE#1044</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-8/igt@xe_exec_compute_mode@many-bindexecqueue-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-6/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1537">Intel XE#1537</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-lnl-3/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_queue_property@invalid-property:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-6/igt@xe_exec_queue_property@invalid-property.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1537">Intel XE#1537</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-lnl-2/igt@xe_exec_queue_property@invalid-property.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-reset-stress:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-4/igt@xe_exec_reset@gt-reset-stress.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1329">Intel XE#1329</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-lnl-6/igt@xe_exec_reset@gt-reset-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-userptr-rebind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@xe_exec_threads@threads-bal-userptr-rebind.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1088">Intel XE#1088</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330">Intel XE#1330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-6/igt@xe_exec_threads@threads-bal-userptr-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-fd-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-434/igt@xe_exec_threads@threads-cm-fd-userptr-invalidate.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1206">Intel XE#1206</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1261">Intel XE#1261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-464/igt@xe_exec_threads@threads-cm-fd-userptr-invalidate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-436/igt@xe_exec_threads@threads-hang-fd-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1256">Intel XE#1256</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-434/igt@xe_exec_threads@threads-hang-fd-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@xe_module_load@reload.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-6/igt@xe_module_load@reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-464/igt@xe_pm@d3hot-basic-exec.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/355">Intel XE#355</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-466/igt@xe_pm@d3hot-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-4/igt@xe_pm@s3-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-6/igt@xe_pm@s3-basic.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-basic-all:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@xe_spin_batch@spin-basic-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-9/igt@xe_spin_batch@spin-basic-all.html">PASS</a> +74 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-fixed-duration:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-4/igt@xe_spin_batch@spin-fixed-duration.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081">Intel XE#1081</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-9/igt@xe_spin_batch@spin-fixed-duration.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-binds-16777216:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-8/igt@xe_vm@large-userptr-binds-16777216.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1619">Intel XE#1619</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-lnl-6/igt@xe_vm@large-userptr-binds-16777216.html">PASS</a></li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@xe_vm@large-userptr-binds-16777216.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1619">Intel XE#1619</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-9/igt@xe_vm@large-userptr-binds-16777216.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-either-side-partial-split-page-hammer:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-2/igt@xe_vm@munmap-style-unbind-either-side-partial-split-page-hammer.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1440">Intel XE#1440</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-lnl-7/igt@xe_vm@munmap-style-unbind-either-side-partial-split-page-hammer.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@core_hotunplug@hotreplug.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-2/igt@core_hotunplug@hotreplug.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1538">Intel XE#1538</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1177">Intel XE#1177</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1619">Intel XE#1619</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1619">Intel XE#1619</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-1/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1177">Intel XE#1177</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-4/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-9/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-single:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_chamelium_frames@hdmi-crc-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-1/igt@kms_chamelium_frames@hdmi-crc-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-hibernate:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_chamelium_hpd@common-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-4/igt@kms_chamelium_hpd@common-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-435/igt@kms_content_protection@atomic-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-464/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-4/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-top-bottom:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-464/igt@kms_cursor_edge_walk@256x256-top-bottom.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/581">Intel XE#581</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-466/igt@kms_cursor_edge_walk@256x256-top-bottom.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-4/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-1/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-6/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_flip@2x-blocking-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-8/igt@kms_flip@2x-blocking-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-9/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1177">Intel XE#1177</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1177">Intel XE#1177</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151">Intel XE#1151</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1177">Intel XE#1177</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-6/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1177">Intel XE#1177</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-1/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/417">Intel XE#417</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_pipe_crc_basic@suspend-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-8/igt@kms_pipe_crc_basic@suspend-read-crc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-434/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-466/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-435/igt@kms_plane_lowres@tiling-x.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-464/igt@kms_plane_lowres@tiling-x.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_plane_multiple@tiling-x.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/654">Intel XE#654</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-6/igt@kms_plane_multiple@tiling-x.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/380">Intel XE#380</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1177">Intel XE#1177</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-4/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1148">Intel XE#1148</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-9/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/734">Intel XE#734</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1177">Intel XE#1177</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-6/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-page-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_psr@fbc-pr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-2/igt@kms_psr@fbc-pr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-dpms:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_psr@fbc-psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1177">Intel XE#1177</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-1/igt@kms_psr@fbc-psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-4/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-1/igt@kms_vblank@ts-continuation-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034">Intel XE#1034</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-2/igt@kms_vblank@ts-continuation-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-1/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034">Intel XE#1034</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-2/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-9/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-multi-vm-cm:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@xe_evict@evict-beng-small-multi-vm-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-8/igt@xe_evict@evict-beng-small-multi-vm-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041">Intel XE#1041</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-vm-cm:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@xe_evict@evict-small-multi-vm-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-6/igt@xe_evict@evict-small-multi-vm-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-invalidate-race:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-6/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-cat-error:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-6/igt@xe_exec_reset@cm-cat-error.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1068">Intel XE#1068</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-8/igt@xe_exec_reset@cm-cat-error.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1068">Intel XE#1068</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1088">Intel XE#1088</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330">Intel XE#1330</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@xe_pm@s2idle-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-1/igt@xe_pm@s2idle-basic-exec.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@xe_pm@s2idle-d3hot-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-2/igt@xe_pm@s2idle-d3hot-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@xe_pm@s4-multiple-execs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1043">Intel XE#1043</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/845">Intel XE#845</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-6/igt@xe_pm@s4-multiple-execs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1257">Intel XE#1257</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-size:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@xe_query@multigpu-query-invalid-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v2/shard-adlp-9/igt@xe_query@multigpu-query-invalid-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7806 -&gt; IGT_7807</li>
<li>Linux: xe-1095-5f7597e990bea547bd1261170497e7476fb781bb -&gt; xe-pw-132409v2</li>
</ul>
<p>IGT_7806: 849cd963ce7e8222dcf17cc872d355181fd2c2a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7807: 43e71eeac0fb4fe59df40df2c96fd0fdbf585c0b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1095-5f7597e990bea547bd1261170497e7476fb781bb: 5f7597e990bea547bd1261170497e7476fb781bb<br />
  xe-pw-132409v2: 132409v2</p>

</body>
</html>

--===============6749128406021297843==--
