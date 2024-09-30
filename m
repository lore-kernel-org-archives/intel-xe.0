Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 181BCCEB2CD
	for <intel-xe@archiver.kernel.org>; Mon, 30 Sep 2024 23:10:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B08FE10E28F;
	Mon, 30 Sep 2024 23:10:03 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D67EA10E28F;
 Mon, 30 Sep 2024 23:10:02 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4084272207965584585=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_series_starting_with_=5BCI=2C1/?=
 =?utf-8?q?2=5D_drm/i915=3A_remove_IS=5FLP=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 30 Sep 2024 23:10:02 -0000
Message-ID: <172773780286.1139356.7974564856520053644@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240930124056.3541988-1-jani.nikula@intel.com>
In-Reply-To: <20240930124056.3541988-1-jani.nikula@intel.com>
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

--===============4084272207965584585==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [CI,1/2] drm/i915: remove IS_LP()
URL   : https://patchwork.freedesktop.org/series/139305/
State : failure

== Summary ==

CI Bug Log - changes from xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed_full -> xe-pw-139305v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-139305v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-139305v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-139305v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][1] +4 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-dg2-435/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-adlp:         [PASS][2] -> [FAIL][3]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-adlp-4/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-adlp-4/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
    - shard-dg2-set2:     [PASS][4] -> [FAIL][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-dg2-433/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-dg2-433/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_flip@flip-vs-suspend@c-hdmi-a1:
    - shard-adlp:         [PASS][6] -> [DMESG-WARN][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-adlp-4/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-adlp-4/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html

  * igt@kms_pipe_crc_basic@disable-crc-after-crtc@pipe-c-edp-1:
    - shard-lnl:          [PASS][8] -> [DMESG-WARN][9] +2 other tests dmesg-warn
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-lnl-4/igt@kms_pipe_crc_basic@disable-crc-after-crtc@pipe-c-edp-1.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-1/igt@kms_pipe_crc_basic@disable-crc-after-crtc@pipe-c-edp-1.html

  * igt@xe_copy_basic@mem-copy-linear-0xfd:
    - shard-lnl:          [PASS][10] -> [TIMEOUT][11]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-lnl-4/igt@xe_copy_basic@mem-copy-linear-0xfd.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-1/igt@xe_copy_basic@mem-copy-linear-0xfd.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:
    - shard-dg2-set2:     [PASS][12] -> [INCOMPLETE][13]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-dg2-466/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html

  * igt@xe_exec_compute_mode@twice-userptr-invalidate-race:
    - shard-lnl:          [PASS][14] -> [FAIL][15]
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-lnl-7/igt@xe_exec_compute_mode@twice-userptr-invalidate-race.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-2/igt@xe_exec_compute_mode@twice-userptr-invalidate-race.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-dg2-set2:     NOTRUN -> [FAIL][16] +2 other tests fail
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-dg2-434/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  
#### Warnings ####

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
    - shard-dg2-set2:     [INCOMPLETE][17] ([Intel XE#1195]) -> [TIMEOUT][18] +1 other test timeout
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-dg2-436/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-dg2-435/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@xe_pm@s3-mocs:
    - {shard-bmg}:        [PASS][19] -> [ABORT][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-bmg-1/igt@xe_pm@s3-mocs.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-bmg-8/igt@xe_pm@s3-mocs.html

  
Known issues
------------

  Here are the changes found in xe-pw-139305v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@crc:
    - shard-adlp:         [PASS][21] -> [FAIL][22] ([Intel XE#1874])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-adlp-1/igt@kms_async_flips@crc.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-adlp-4/igt@kms_async_flips@crc.html

  * igt@kms_async_flips@crc@pipe-b-hdmi-a-1:
    - shard-adlp:         [PASS][23] -> [FAIL][24] ([Intel XE#1656])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-adlp-1/igt@kms_async_flips@crc@pipe-b-hdmi-a-1.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-adlp-4/igt@kms_async_flips@crc@pipe-b-hdmi-a-1.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs:
    - shard-lnl:          [PASS][25] -> [FAIL][26] ([Intel XE#1701]) +1 other test fail
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-lnl-7/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-2/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#599])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-7/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-adlp:         [PASS][28] -> [FAIL][29] ([Intel XE#1426]) +1 other test fail
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-adlp-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-adlp-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#316])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-dg2-434/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#367])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-dg2-434/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#1512])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-7/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#2887])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-7/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#787]) +6 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#306])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-7/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#373])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-dg2-434/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#373])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-7/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#323])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-dg2-464/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#455])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-dg2-464/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_flip@plain-flip-fb-recreate@c-edp1:
    - shard-lnl:          [PASS][41] -> [FAIL][42] ([Intel XE#886]) +3 other tests fail
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-lnl-7/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-2/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#1401] / [Intel XE#1745]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#1401]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#651]) +7 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#656]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#653]) +5 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_plane@plane-position-covered:
    - shard-lnl:          [PASS][48] -> [DMESG-FAIL][49] ([Intel XE#324]) +2 other tests dmesg-fail
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-lnl-8/igt@kms_plane@plane-position-covered.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-3/igt@kms_plane@plane-position-covered.html

  * igt@kms_plane@plane-position-covered@pipe-b-plane-4:
    - shard-lnl:          [PASS][50] -> [DMESG-WARN][51] ([Intel XE#324]) +3 other tests dmesg-warn
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-lnl-8/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-3/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#870])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-dg2-434/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [PASS][53] -> [FAIL][54] ([Intel XE#718])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-lnl-1/igt@kms_pm_dc@dc5-dpms.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-7/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-lnl:          [PASS][55] -> [DMESG-WARN][56] ([Intel XE#1620])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-lnl-4/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-1/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@legacy-planes-dpms@plane-68:
    - shard-lnl:          NOTRUN -> [DMESG-FAIL][57] ([Intel XE#1620])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-8/igt@kms_pm_rpm@legacy-planes-dpms@plane-68.html

  * igt@kms_pm_rpm@universal-planes:
    - shard-lnl:          [PASS][58] -> [INCOMPLETE][59] ([Intel XE#1620] / [Intel XE#2864])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-lnl-8/igt@kms_pm_rpm@universal-planes.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-2/igt@kms_pm_rpm@universal-planes.html

  * igt@kms_pm_rpm@universal-planes@plane-77:
    - shard-lnl:          [PASS][60] -> [DMESG-FAIL][61] ([Intel XE#1620])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-lnl-8/igt@kms_pm_rpm@universal-planes@plane-77.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-2/igt@kms_pm_rpm@universal-planes@plane-77.html

  * igt@kms_psr@pr-dpms:
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#1406])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-7/igt@kms_psr@pr-dpms.html

  * igt@kms_psr@psr2-primary-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#2850]) +2 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-dg2-435/igt@kms_psr@psr2-primary-render.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#1127])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#327])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-dg2-434/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
    - shard-lnl:          [PASS][66] -> [FAIL][67] ([Intel XE#899]) +1 other test fail
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-dg2-set2:     NOTRUN -> [SKIP][68] ([Intel XE#756]) +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-dg2-434/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2-set2:     NOTRUN -> [SKIP][69] ([Intel XE#1091] / [Intel XE#2849])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-dg2-434/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-dg2-set2:     NOTRUN -> [TIMEOUT][70] ([Intel XE#1473])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict@evict-threads-large:
    - shard-dg2-set2:     [PASS][71] -> [TIMEOUT][72] ([Intel XE#1473])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-dg2-434/igt@xe_evict@evict-threads-large.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-dg2-466/igt@xe_evict@evict-threads-large.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#688]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-7/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#288]) +2 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-dg2-464/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html

  * igt@xe_exec_threads@threads-mixed-userptr:
    - shard-lnl:          [PASS][75] -> [INCOMPLETE][76] ([Intel XE#1169])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-lnl-4/igt@xe_exec_threads@threads-mixed-userptr.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-1/igt@xe_exec_threads@threads-mixed-userptr.html

  * igt@xe_oa@invalid-oa-exponent:
    - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#2541])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-dg2-434/igt@xe_oa@invalid-oa-exponent.html

  * igt@xe_oa@oa-regs-whitelisted@ccs-0:
    - shard-lnl:          NOTRUN -> [FAIL][78] ([Intel XE#2514])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-1/igt@xe_oa@oa-regs-whitelisted@ccs-0.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#2838])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-7/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     NOTRUN -> [SKIP][80] ([Intel XE#2284] / [Intel XE#366])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-dg2-434/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-lnl:          [PASS][81] -> [ABORT][82] ([Intel XE#1794])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-lnl-7/igt@xe_pm@s4-vm-bind-userptr.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x:
    - shard-adlp:         [DMESG-WARN][83] ([Intel XE#1033]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs:
    - shard-lnl:          [FAIL][85] ([Intel XE#1701]) -> [PASS][86] +1 other test pass
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-lnl-1/igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-7/igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-adlp:         [FAIL][87] ([Intel XE#1426]) -> [PASS][88] +1 other test pass
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-adlp-4/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-adlp-4/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][89] ([Intel XE#1195]) -> [PASS][90] +2 other tests pass
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     [FAIL][91] -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-dg2-434/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-dg2-463/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
    - shard-adlp:         [FAIL][93] -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-adlp-9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-adlp-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-lnl:          [FAIL][95] ([Intel XE#1475]) -> [PASS][96] +1 other test pass
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-lnl-3/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-5/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-lnl:          [SKIP][97] ([Intel XE#1508]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-lnl-5/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-4/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl@a-edp-1:
    - shard-lnl:          [SKIP][99] -> [PASS][100] +1 other test pass
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-lnl-5/igt@kms_dirtyfb@psr-dirtyfb-ioctl@a-edp-1.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-4/igt@kms_dirtyfb@psr-dirtyfb-ioctl@a-edp-1.html

  * igt@kms_flip@2x-modeset-vs-vblank-race@bc-dp2-hdmi-a3:
    - {shard-bmg}:        [DMESG-WARN][101] ([Intel XE#877]) -> [PASS][102] +2 other tests pass
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-bmg-7/igt@kms_flip@2x-modeset-vs-vblank-race@bc-dp2-hdmi-a3.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-bmg-8/igt@kms_flip@2x-modeset-vs-vblank-race@bc-dp2-hdmi-a3.html

  * igt@kms_flip@blocking-wf_vblank@a-edp1:
    - shard-lnl:          [FAIL][103] ([Intel XE#886]) -> [PASS][104] +4 other tests pass
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-lnl-7/igt@kms_flip@blocking-wf_vblank@a-edp1.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-8/igt@kms_flip@blocking-wf_vblank@a-edp1.html

  * igt@kms_flip@flip-vs-suspend:
    - {shard-bmg}:        [INCOMPLETE][105] ([Intel XE#2597]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-bmg-5/igt@kms_flip@flip-vs-suspend.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-bmg-4/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@d-hdmi-a3:
    - {shard-bmg}:        [INCOMPLETE][107] ([Intel XE#2635]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-bmg-5/igt@kms_flip@flip-vs-suspend@d-hdmi-a3.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-bmg-4/igt@kms_flip@flip-vs-suspend@d-hdmi-a3.html

  * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
    - shard-lnl:          [FAIL][109] ([Intel XE#2879]) -> [PASS][110] +3 other tests pass
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-5/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html

  * igt@kms_pipe_crc_basic@disable-crc-after-crtc@pipe-b-edp-1:
    - shard-lnl:          [DMESG-WARN][111] -> [PASS][112] +1 other test pass
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-lnl-4/igt@kms_pipe_crc_basic@disable-crc-after-crtc@pipe-b-edp-1.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-1/igt@kms_pipe_crc_basic@disable-crc-after-crtc@pipe-b-edp-1.html

  * igt@kms_plane@plane-position-hole@pipe-a-plane-4:
    - shard-lnl:          [DMESG-FAIL][113] ([Intel XE#324]) -> [PASS][114] +1 other test pass
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-lnl-4/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-3/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c:
    - shard-adlp:         [DMESG-WARN][115] -> [PASS][116] +4 other tests pass
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-adlp-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-adlp-8/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20:
    - {shard-bmg}:        [INCOMPLETE][117] ([Intel XE#2566]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-bmg-4/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-bmg-5/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-d:
    - {shard-bmg}:        [INCOMPLETE][119] -> [PASS][120]
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-bmg-4/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-d.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-bmg-5/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-d.html

  * igt@kms_pm_rpm@universal-planes-dpms:
    - shard-lnl:          [INCOMPLETE][121] ([Intel XE#1620] / [Intel XE#2864]) -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-lnl-1/igt@kms_pm_rpm@universal-planes-dpms.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-7/igt@kms_pm_rpm@universal-planes-dpms.html

  * igt@kms_pm_rpm@universal-planes-dpms@plane-77:
    - shard-lnl:          [DMESG-FAIL][123] ([Intel XE#1620]) -> [PASS][124] +1 other test pass
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-lnl-1/igt@kms_pm_rpm@universal-planes-dpms@plane-77.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-7/igt@kms_pm_rpm@universal-planes-dpms@plane-77.html

  * igt@kms_psr@fbc-psr2-cursor-render@edp-1:
    - shard-lnl:          [FAIL][125] ([Intel XE#1649]) -> [PASS][126] +113 other tests pass
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-lnl-7/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-2/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html

  * igt@xe_exec_compute_mode@once-userptr-invalidate-race:
    - shard-lnl:          [FAIL][127] -> [PASS][128] +56 other tests pass
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-lnl-4/igt@xe_exec_compute_mode@once-userptr-invalidate-race.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-3/igt@xe_exec_compute_mode@once-userptr-invalidate-race.html

  * igt@xe_exec_reset@cat-error:
    - shard-adlp:         [DMESG-WARN][129] ([Intel XE#358]) -> [PASS][130]
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-adlp-1/igt@xe_exec_reset@cat-error.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-adlp-8/igt@xe_exec_reset@cat-error.html

  
#### Warnings ####

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [FAIL][131] ([Intel XE#1231]) -> [DMESG-FAIL][132] ([Intel XE#324]) +1 other test dmesg-fail
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [SKIP][133] -> [FAIL][134] ([Intel XE#718])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-lnl-3/igt@kms_pm_dc@dc5-psr.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-5/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [SKIP][135] -> [FAIL][136] ([Intel XE#1430])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-lnl-1/igt@kms_pm_dc@dc6-psr.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-7/igt@kms_pm_dc@dc6-psr.html

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-dg2-set2:     [TIMEOUT][137] ([Intel XE#1473]) -> [FAIL][138] ([Intel XE#1000])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-large.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  * igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate:
    - shard-lnl:          [FAIL][139] -> [DMESG-WARN][140] ([Intel XE#2687])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-lnl-5/igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-8/igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate.html

  * igt@xe_gt_freq@freq_reset_multiple:
    - shard-lnl:          [FAIL][141] ([Intel XE#2711]) -> [DMESG-FAIL][142] ([Intel XE#1620])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-lnl-4/igt@xe_gt_freq@freq_reset_multiple.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-1/igt@xe_gt_freq@freq_reset_multiple.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1620]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
  [Intel XE#1649]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649
  [Intel XE#1656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1656
  [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#2514]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2635]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635
  [Intel XE#2687]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2687
  [Intel XE#2711]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2711
  [Intel XE#2791]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2791
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2864]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864
  [Intel XE#2879]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2879
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899


Build changes
-------------

  * Linux: xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed -> xe-pw-139305v1

  IGT_8043: 8043
  xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed: 2a8d54969ceeb99f139f89f49e8fc25f71fa5bed
  xe-pw-139305v1: 139305v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/index.html

--===============4084272207965584585==
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
<tr><td><b>Series:</b></td><td>series starting with [CI,1/2] drm/i915: remove IS_LP()</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139305/">https://patchwork.freedesktop.org/series/139305/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed_full -&gt; xe-pw-139305v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-139305v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-139305v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-139305v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-dg2-435/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-varying-size:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-adlp-4/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-adlp-4/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">FAIL</a></li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-dg2-433/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-dg2-433/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-adlp-4/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-adlp-4/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@disable-crc-after-crtc@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-lnl-4/igt@kms_pipe_crc_basic@disable-crc-after-crtc@pipe-c-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-1/igt@kms_pipe_crc_basic@disable-crc-after-crtc@pipe-c-edp-1.html">DMESG-WARN</a> +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-lnl-4/igt@xe_copy_basic@mem-copy-linear-0xfd.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-1/igt@xe_copy_basic@mem-copy-linear-0xfd.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-dg2-466/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-lnl-7/igt@xe_exec_compute_mode@twice-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-2/igt@xe_exec_compute_mode@twice-userptr-invalidate-race.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-dg2-434/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-dg2-436/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-dg2-435/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">TIMEOUT</a> +1 other test timeout</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@xe_pm@s3-mocs:<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-bmg-1/igt@xe_pm@s3-mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-bmg-8/igt@xe_pm@s3-mocs.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-139305v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@crc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-adlp-1/igt@kms_async_flips@crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-adlp-4/igt@kms_async_flips@crc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-adlp-1/igt@kms_async_flips@crc@pipe-b-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-adlp-4/igt@kms_async_flips@crc@pipe-b-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1656">Intel XE#1656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-lnl-7/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-2/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701">Intel XE#1701</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-7/igt@kms_atomic_transition@plane-all-modeset-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-adlp-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-adlp-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-dg2-434/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-dg2-434/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-7/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512">Intel XE#1512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-7/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-7/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-dg2-434/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-7/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-dg2-464/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-dg2-464/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-lnl-7/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-2/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-lnl-8/igt@kms_plane@plane-position-covered.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-3/igt@kms_plane@plane-position-covered.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered@pipe-b-plane-4:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-lnl-8/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-3/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-dg2-434/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-lnl-1/igt@kms_pm_dc@dc5-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-7/igt@kms_pm_dc@dc5-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-lnl-4/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-1/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes-dpms@plane-68:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-8/igt@kms_pm_rpm@legacy-planes-dpms@plane-68.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-lnl-8/igt@kms_pm_rpm@universal-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-2/igt@kms_pm_rpm@universal-planes.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864">Intel XE#2864</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes@plane-77:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-lnl-8/igt@kms_pm_rpm@universal-planes@plane-77.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-2/igt@kms_pm_rpm@universal-planes@plane-77.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-dpms:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-7/igt@kms_psr@pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-dg2-435/igt@kms_psr@psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-dg2-434/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-dg2-434/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-dg2-434/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-dg2-434/igt@xe_evict@evict-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-dg2-466/igt@xe_evict@evict-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-7/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-dg2-464/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-userptr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-lnl-4/igt@xe_exec_threads@threads-mixed-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-1/igt@xe_exec_threads@threads-mixed-userptr.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-oa-exponent:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-dg2-434/igt@xe_oa@invalid-oa-exponent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted@ccs-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-1/igt@xe_oa@oa-regs-whitelisted@ccs-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514">Intel XE#2514</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-7/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-dg2-434/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-lnl-7/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-lnl-1/igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701">Intel XE#1701</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-7/igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-adlp-4/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-adlp-4/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-dg2-434/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-dg2-463/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a></li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-adlp-9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-adlp-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-lnl-3/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-5/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-lnl-5/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-4/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl@a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-lnl-5/igt@kms_dirtyfb@psr-dirtyfb-ioctl@a-edp-1.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-4/igt@kms_dirtyfb@psr-dirtyfb-ioctl@a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race@bc-dp2-hdmi-a3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-bmg-7/igt@kms_flip@2x-modeset-vs-vblank-race@bc-dp2-hdmi-a3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-bmg-8/igt@kms_flip@2x-modeset-vs-vblank-race@bc-dp2-hdmi-a3.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-lnl-7/igt@kms_flip@blocking-wf_vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-8/igt@kms_flip@blocking-wf_vblank@a-edp1.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-bmg-5/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-bmg-4/igt@kms_flip@flip-vs-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-hdmi-a3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-bmg-5/igt@kms_flip@flip-vs-suspend@d-hdmi-a3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635">Intel XE#2635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-bmg-4/igt@kms_flip@flip-vs-suspend@d-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2879">Intel XE#2879</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-5/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@disable-crc-after-crtc@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-lnl-4/igt@kms_pipe_crc_basic@disable-crc-after-crtc@pipe-b-edp-1.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-1/igt@kms_pipe_crc_basic@disable-crc-after-crtc@pipe-b-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-a-plane-4:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-lnl-4/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-3/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-adlp-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-adlp-8/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-bmg-4/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-bmg-5/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-d:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-bmg-4/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-d.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-bmg-5/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-d.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-lnl-1/igt@kms_pm_rpm@universal-planes-dpms.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864">Intel XE#2864</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-7/igt@kms_pm_rpm@universal-planes-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms@plane-77:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-lnl-1/igt@kms_pm_rpm@universal-planes-dpms@plane-77.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-7/igt@kms_pm_rpm@universal-planes-dpms@plane-77.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-render@edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-lnl-7/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649">Intel XE#1649</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-2/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html">PASS</a> +113 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@once-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-lnl-4/igt@xe_exec_compute_mode@once-userptr-invalidate-race.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-3/igt@xe_exec_compute_mode@once-userptr-invalidate-race.html">PASS</a> +56 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cat-error:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-adlp-1/igt@xe_exec_reset@cat-error.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-adlp-8/igt@xe_exec_reset@cat-error.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-lnl-3/igt@kms_pm_dc@dc5-psr.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-5/igt@kms_pm_dc@dc5-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-lnl-1/igt@kms_pm_dc@dc6-psr.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-7/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-large.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-lnl-5/igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-8/igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2687">Intel XE#2687</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_reset_multiple:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed/shard-lnl-4/igt@xe_gt_freq@freq_reset_multiple.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2711">Intel XE#2711</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139305v1/shard-lnl-1/igt@xe_gt_freq@freq_reset_multiple.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed -&gt; xe-pw-139305v1</li>
</ul>
<p>IGT_8043: 8043<br />
  xe-1992-2a8d54969ceeb99f139f89f49e8fc25f71fa5bed: 2a8d54969ceeb99f139f89f49e8fc25f71fa5bed<br />
  xe-pw-139305v1: 139305v1</p>

</body>
</html>

--===============4084272207965584585==--
