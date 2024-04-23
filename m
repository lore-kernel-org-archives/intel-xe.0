Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43F71C4345F
	for <intel-xe@archiver.kernel.org>; Tue, 23 Apr 2024 04:22:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E631D113080;
	Tue, 23 Apr 2024 04:22:23 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68B94113080;
 Tue, 23 Apr 2024 04:22:22 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2305127867621256403=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe=3A_make_xe=5Fpm=5Fruntim?=
 =?utf-8?q?e=5Flockdep=5Fmap_a_static_struct?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 23 Apr 2024 04:22:22 -0000
Message-ID: <171384614241.1590358.9181200528734366855@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240422201454.699089-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240422201454.699089-1-rodrigo.vivi@intel.com>
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

--===============2305127867621256403==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: make xe_pm_runtime_lockdep_map a static struct
URL   : https://patchwork.freedesktop.org/series/132729/
State : failure

== Summary ==

CI Bug Log - changes from xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa_full -> xe-pw-132729v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-132729v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-132729v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-132729v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@core_getversion@basic:
    - {shard-lnl}:        NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-lnl-4/igt@core_getversion@basic.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - {shard-lnl}:        NOTRUN -> [SKIP][3] +131 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * {igt@kms_hdr@bpc-switch-suspend@pipe-a-edp-2}:
    - {shard-lnl}:        NOTRUN -> [INCOMPLETE][4] +2 other tests incomplete
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-lnl-3/igt@kms_hdr@bpc-switch-suspend@pipe-a-edp-2.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - {shard-lnl}:        [PASS][5] -> [INCOMPLETE][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-5/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-lnl-2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@xe_exec_store@page-sized:
    - {shard-lnl}:        [INCOMPLETE][7] -> [SKIP][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-4/igt@xe_exec_store@page-sized.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-lnl-4/igt@xe_exec_store@page-sized.html

  
Known issues
------------

  Here are the changes found in xe-pw-132729v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotreplug-lateclose:
    - shard-adlp:         NOTRUN -> [ABORT][9] ([Intel XE#1538] / [Intel XE#1689])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-2/igt@core_hotunplug@hotreplug-lateclose.html

  * igt@kms_async_flips@async-flip-with-page-flip-events:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][10] ([Intel XE#1033] / [Intel XE#1214] / [Intel XE#324] / [Intel XE#358])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][11] ([Intel XE#1033] / [Intel XE#1214]) +1 other test dmesg-warn
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][12] ([Intel XE#1033] / [Intel XE#1214] / [Intel XE#324]) +1 other test dmesg-warn
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][13] ([Intel XE#1124] / [Intel XE#1201]) +17 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-4/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#1201] / [Intel XE#316])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-436/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][15] ([Intel XE#1201] / [Intel XE#316]) +3 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-4/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#1124] / [Intel XE#1201]) +3 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-463/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-adlp:         NOTRUN -> [FAIL][17] ([Intel XE#1231]) +1 other test fail
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-adlp:         NOTRUN -> [SKIP][18] ([Intel XE#1201] / [Intel XE#610])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-2/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_joiner@basic:
    - shard-adlp:         NOTRUN -> [SKIP][19] ([Intel XE#1201] / [Intel XE#346])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-4/igt@kms_big_joiner@basic.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#1201] / [Intel XE#367]) +2 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-463/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#1201] / [Intel XE#367]) +3 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-2/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#1201] / [Intel XE#829]) +5 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-466/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-hdmi-a-7:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#1201] / [Intel XE#787]) +54 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-hdmi-a-7.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +23 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#1201] / [Intel XE#787]) +35 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-d-hdmi-a-7:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +16 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-d-hdmi-a-7.html

  * igt@kms_cdclk@plane-scaling:
    - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#1152] / [Intel XE#1201] / [Intel XE#455])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-6/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#1201] / [Intel XE#306])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-436/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-adlp:         NOTRUN -> [SKIP][29] ([Intel XE#1201] / [Intel XE#306]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-2/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_hpd@dp-hpd-storm:
    - shard-adlp:         NOTRUN -> [SKIP][30] ([Intel XE#1201] / [Intel XE#373]) +10 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-6/igt@kms_chamelium_hpd@dp-hpd-storm.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#1201] / [Intel XE#373]) +5 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#1201] / [Intel XE#307])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-463/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@legacy:
    - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#1201] / [Intel XE#455]) +27 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-8/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@legacy@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][34] ([Intel XE#1178]) +2 other tests fail
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-435/igt@kms_content_protection@legacy@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-adlp:         NOTRUN -> [SKIP][35] ([Intel XE#1201] / [Intel XE#308]) +3 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-6/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#1201] / [Intel XE#309]) +5 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-4/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-dg2-set2:     [PASS][37] -> [DMESG-WARN][38] ([Intel XE#1214] / [Intel XE#282]) +4 other tests dmesg-warn
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-433/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-434/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#1201] / [Intel XE#323])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][40] ([Intel XE#1214] / [Intel XE#282]) +3 other tests dmesg-warn
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-436/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_fbcon_fbt@psr:
    - shard-adlp:         NOTRUN -> [SKIP][41] ([Intel XE#1201] / [Intel XE#776])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-6/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@psr1:
    - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#1135] / [Intel XE#1201])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-4/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#1201] / [Intel XE#310]) +5 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-4/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-adlp:         NOTRUN -> [INCOMPLETE][44] ([Intel XE#1195] / [Intel XE#927])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-6/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][45] ([Intel XE#1162] / [Intel XE#1214])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][46] ([Intel XE#1214])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a2:
    - shard-adlp:         NOTRUN -> [INCOMPLETE][47] ([Intel XE#1195])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-6/igt@kms_flip@flip-vs-suspend@a-hdmi-a2.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
    - shard-adlp:         [PASS][48] -> [FAIL][49] ([Intel XE#616]) +1 other test fail
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#1201] / [i915#5274])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-436/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#1201] / [Intel XE#656]) +45 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [FAIL][52] ([Intel XE#616]) +7 other tests fail
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     [PASS][53] -> [DMESG-WARN][54] ([Intel XE#1214])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#1201] / [Intel XE#651]) +12 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][56] ([Intel XE#1201] / [Intel XE#651]) +17 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#1201] / [Intel XE#1235]) +2 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:
    - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#1201] / [Intel XE#653]) +12 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#1201] / [Intel XE#653]) +15 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#1201]) +22 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_getfb@getfb2-accept-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#1201] / [Intel XE#687])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-466/igt@kms_getfb@getfb2-accept-ccs.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [PASS][62] -> [SKIP][63] ([Intel XE#1201] / [Intel XE#455])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-435/igt@kms_hdr@invalid-hdr.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-adlp:         NOTRUN -> [SKIP][64] ([Intel XE#1201] / [Intel XE#356])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][65] ([Intel XE#1088] / [Intel XE#1214] / [Intel XE#1330]) +3 other tests dmesg-warn
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-6/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-hdmi-a-2:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][66] ([Intel XE#1214]) +4 other tests dmesg-warn
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-6/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-hdmi-a-2.html

  * igt@kms_plane_cursor@primary:
    - shard-dg2-set2:     NOTRUN -> [FAIL][67] ([Intel XE#581])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-466/igt@kms_plane_cursor@primary.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][68] ([Intel XE#1201] / [Intel XE#455]) +8 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-463/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-adlp:         NOTRUN -> [SKIP][69] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][70] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][71] ([Intel XE#1201] / [Intel XE#305]) +5 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][72] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) +3 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-hdmi-a-1.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#1201] / [Intel XE#870])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-463/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-adlp:         NOTRUN -> [SKIP][74] ([Intel XE#1201] / [Intel XE#1211]) +1 other test skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-2/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@drm-resources-equal:
    - shard-dg2-set2:     [PASS][75] -> [SKIP][76] ([Intel XE#1201] / [Intel XE#1211])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-435/igt@kms_pm_rpm@drm-resources-equal.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-433/igt@kms_pm_rpm@drm-resources-equal.html

  * igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-adlp:         NOTRUN -> [SKIP][77] ([Intel XE#1201]) +10 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-2/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@fbc-pr-cursor-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][78] ([Intel XE#1201] / [Intel XE#1234])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-466/igt@kms_psr@fbc-pr-cursor-render.html

  * igt@kms_psr@fbc-psr2-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][79] ([Intel XE#1201] / [Intel XE#929]) +7 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-436/igt@kms_psr@fbc-psr2-suspend.html

  * igt@kms_psr@pr-primary-page-flip:
    - shard-adlp:         NOTRUN -> [SKIP][80] ([Intel XE#1201] / [Intel XE#929]) +21 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-6/igt@kms_psr@pr-primary-page-flip.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-adlp:         NOTRUN -> [SKIP][81] ([Intel XE#1149] / [Intel XE#1201])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rmfb@close-fd@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [FAIL][82] ([Intel XE#294]) +1 other test fail
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-8/igt@kms_rmfb@close-fd@pipe-a-hdmi-a-1.html

  * igt@kms_rmfb@close-fd@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][83] ([Intel XE#294])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-435/igt@kms_rmfb@close-fd@pipe-b-dp-4.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-adlp:         NOTRUN -> [SKIP][84] ([Intel XE#1201] / [Intel XE#327])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-4/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-adlp:         NOTRUN -> [SKIP][85] ([Intel XE#1127] / [Intel XE#1201])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][86] ([Intel XE#1201] / [Intel XE#327])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-436/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-adlp:         NOTRUN -> [SKIP][87] ([Intel XE#1201] / [Intel XE#362])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-adlp:         NOTRUN -> [SKIP][88] ([Intel XE#1201] / [Intel XE#330])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-4/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-dg2-set2:     [PASS][89] -> [FAIL][90] ([Intel XE#771] / [Intel XE#899])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [PASS][91] -> [FAIL][92] ([Intel XE#899])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][93] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-2/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][94] ([Intel XE#1191] / [Intel XE#1214]) +1 other test dmesg-warn
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-2/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][95] ([Intel XE#1214] / [Intel XE#1608])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-2/igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-adlp:         NOTRUN -> [SKIP][96] ([Intel XE#1201] / [Intel XE#756])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-4/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all:
    - shard-adlp:         NOTRUN -> [FAIL][97] ([Intel XE#1080]) +29 other tests fail
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-8/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all.html

  * igt@xe_copy_basic@mem-copy-linear-0x3fff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#1123] / [Intel XE#1201])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0x3fff.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-adlp:         NOTRUN -> [SKIP][99] ([Intel XE#1126] / [Intel XE#1201])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-8/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_evict@evict-cm-threads-large:
    - shard-dg2-set2:     [PASS][100] -> [TIMEOUT][101] ([Intel XE#1041] / [Intel XE#1473] / [Intel XE#392])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-463/igt@xe_evict@evict-cm-threads-large.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-435/igt@xe_evict@evict-cm-threads-large.html

  * igt@xe_evict@evict-large-cm:
    - shard-adlp:         NOTRUN -> [SKIP][102] ([Intel XE#1201] / [Intel XE#261]) +8 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-4/igt@xe_evict@evict-large-cm.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][103] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-436/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_evict@evict-small:
    - shard-adlp:         NOTRUN -> [SKIP][104] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-2/igt@xe_evict@evict-small.html

  * igt@xe_evict@evict-threads-small-multi-vm:
    - shard-dg2-set2:     [PASS][105] -> [FAIL][106] ([Intel XE#1259])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-434/igt@xe_evict@evict-threads-small-multi-vm.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-466/igt@xe_evict@evict-threads-small-multi-vm.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:
    - shard-adlp:         NOTRUN -> [SKIP][107] ([Intel XE#1201] / [Intel XE#688]) +1 other test skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html

  * igt@xe_exec_balancer@once-cm-parallel-userptr-invalidate:
    - shard-adlp:         NOTRUN -> [FAIL][108] ([Intel XE#1069])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-6/igt@xe_exec_balancer@once-cm-parallel-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][109] ([Intel XE#1201] / [Intel XE#1392]) +11 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind.html

  * igt@xe_exec_compute_mode@lr-mode-workload:
    - shard-adlp:         NOTRUN -> [FAIL][110] ([Intel XE#1396])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-2/igt@xe_exec_compute_mode@lr-mode-workload.html

  * igt@xe_exec_compute_mode@twice-bindexecqueue-rebind:
    - shard-adlp:         [PASS][111] -> [INCOMPLETE][112] ([Intel XE#1195])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-adlp-9/igt@xe_exec_compute_mode@twice-bindexecqueue-rebind.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-9/igt@xe_exec_compute_mode@twice-bindexecqueue-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][113] ([Intel XE#1201] / [Intel XE#288]) +13 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-6/igt@xe_exec_fault_mode@many-execqueues-rebind.html

  * igt@xe_exec_fault_mode@twice-invalid-fault:
    - shard-dg2-set2:     NOTRUN -> [SKIP][114] ([Intel XE#1201] / [Intel XE#288]) +8 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-463/igt@xe_exec_fault_mode@twice-invalid-fault.html

  * igt@xe_exec_threads@threads-bal-fd-rebind:
    - shard-dg2-set2:     [PASS][115] -> [TIMEOUT][116] ([Intel XE#1206] / [Intel XE#1356])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-466/igt@xe_exec_threads@threads-bal-fd-rebind.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-466/igt@xe_exec_threads@threads-bal-fd-rebind.html

  * igt@xe_exec_threads@threads-cm-fd-basic:
    - shard-dg2-set2:     [PASS][117] -> [TIMEOUT][118] ([Intel XE#1206] / [Intel XE#1261] / [Intel XE#1356])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-463/igt@xe_exec_threads@threads-cm-fd-basic.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-435/igt@xe_exec_threads@threads-cm-fd-basic.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-adlp:         NOTRUN -> [SKIP][119] ([Intel XE#1201] / [Intel XE#1337])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-6/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     NOTRUN -> [FAIL][120] ([Intel XE#1173]) +1 other test fail
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-463/igt@xe_peer2peer@read.html

  * igt@xe_pm@d3-mmap-vram:
    - shard-adlp:         NOTRUN -> [SKIP][121] ([Intel XE#1008] / [Intel XE#1201])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-8/igt@xe_pm@d3-mmap-vram.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [SKIP][122] ([Intel XE#1201] / [Intel XE#366])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-463/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_query@multigpu-query-config:
    - shard-adlp:         NOTRUN -> [SKIP][123] ([Intel XE#1201] / [Intel XE#944])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-4/igt@xe_query@multigpu-query-config.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-dg2-set2:     NOTRUN -> [SKIP][124] ([Intel XE#1201] / [Intel XE#944])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-463/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  * igt@xe_vm@bind-flag-invalid:
    - shard-adlp:         NOTRUN -> [FAIL][125] ([Intel XE#1559])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-4/igt@xe_vm@bind-flag-invalid.html

  * igt@xe_vm@large-split-binds-536870912:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][126] ([Intel XE#1619]) +1 other test dmesg-fail
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-6/igt@xe_vm@large-split-binds-536870912.html

  
#### Possible fixes ####

  * igt@kms_addfb_basic@invalid-set-prop:
    - shard-adlp:         [ABORT][127] -> [PASS][128]
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-adlp-6/igt@kms_addfb_basic@invalid-set-prop.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-6/igt@kms_addfb_basic@invalid-set-prop.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-180:
    - {shard-lnl}:        [FAIL][129] -> [PASS][130]
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-2/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-lnl-8/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html

  * igt@kms_cursor_legacy@single-bo@pipe-b:
    - shard-dg2-set2:     [DMESG-WARN][131] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][132] +6 other tests pass
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-464/igt@kms_cursor_legacy@single-bo@pipe-b.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-435/igt@kms_cursor_legacy@single-bo@pipe-b.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank:
    - {shard-lnl}:        [FAIL][133] ([Intel XE#480]) -> [PASS][134] +1 other test pass
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-3/igt@kms_flip@flip-vs-blocking-wf-vblank.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-lnl-7/igt@kms_flip@flip-vs-blocking-wf-vblank.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y:
    - shard-adlp:         [FAIL][135] ([Intel XE#616]) -> [PASS][136] +2 other tests pass
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
    - shard-dg2-set2:     [FAIL][137] ([Intel XE#361]) -> [PASS][138] +2 other tests pass
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg2-set2:     [SKIP][139] ([Intel XE#1201] / [Intel XE#1211]) -> [PASS][140]
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-434/igt@kms_pm_rpm@modeset-non-lpsp.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-433/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area@psr2-pipe-b-edp-1:
    - {shard-lnl}:        [DMESG-WARN][141] ([Intel XE#1330]) -> [PASS][142] +9 other tests pass
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-5/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area@psr2-pipe-b-edp-1.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-lnl-2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area@psr2-pipe-b-edp-1.html

  * igt@kms_vblank@accuracy-idle:
    - {shard-lnl}:        [FAIL][143] ([Intel XE#1523]) -> [PASS][144] +1 other test pass
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-2/igt@kms_vblank@accuracy-idle.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-lnl-8/igt@kms_vblank@accuracy-idle.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-dg2-set2:     [DMESG-WARN][145] ([Intel XE#1162] / [Intel XE#1214]) -> [PASS][146]
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-466/igt@kms_vblank@ts-continuation-suspend.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-464/igt@kms_vblank@ts-continuation-suspend.html

  * igt@xe_evict@evict-beng-cm-threads-large-multi-vm:
    - shard-dg2-set2:     [INCOMPLETE][147] ([Intel XE#1195] / [Intel XE#1473]) -> [PASS][148]
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-436/igt@xe_evict@evict-beng-cm-threads-large-multi-vm.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-463/igt@xe_evict@evict-beng-cm-threads-large-multi-vm.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-dg2-set2:     [TIMEOUT][149] ([Intel XE#1473] / [Intel XE#392] / [Intel XE#931]) -> [PASS][150]
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-434/igt@xe_evict@evict-beng-mixed-threads-large.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-433/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict@evict-beng-threads-small-multi-vm:
    - shard-dg2-set2:     [FAIL][151] ([Intel XE#1259]) -> [PASS][152]
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-435/igt@xe_evict@evict-beng-threads-small-multi-vm.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-435/igt@xe_evict@evict-beng-threads-small-multi-vm.html

  * igt@xe_evict@evict-mixed-threads-small:
    - shard-dg2-set2:     [DMESG-WARN][153] ([Intel XE#1214]) -> [PASS][154]
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-436/igt@xe_evict@evict-mixed-threads-small.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-463/igt@xe_evict@evict-mixed-threads-small.html

  * igt@xe_evict@evict-threads-large:
    - shard-dg2-set2:     [TIMEOUT][155] ([Intel XE#1473] / [Intel XE#392]) -> [PASS][156]
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-464/igt@xe_evict@evict-threads-large.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-435/igt@xe_evict@evict-threads-large.html

  * igt@xe_exec_balancer@many-execqueues-virtual-userptr-invalidate-race:
    - {shard-lnl}:        [SKIP][157] ([Intel XE#1645]) -> [PASS][158] +3 other tests pass
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-4/igt@xe_exec_balancer@many-execqueues-virtual-userptr-invalidate-race.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-lnl-2/igt@xe_exec_balancer@many-execqueues-virtual-userptr-invalidate-race.html

  * igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate-race:
    - {shard-lnl}:        [SKIP][159] -> [PASS][160] +65 other tests pass
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-4/igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate-race.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-lnl-2/igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-rebind-prefetch:
    - {shard-lnl}:        [DMESG-WARN][161] ([Intel XE#1330] / [Intel XE#1537]) -> [PASS][162]
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-1/igt@xe_exec_fault_mode@many-execqueues-userptr-rebind-prefetch.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-lnl-7/igt@xe_exec_fault_mode@many-execqueues-userptr-rebind-prefetch.html

  * igt@xe_exec_reset@cm-cat-error:
    - shard-dg2-set2:     [ABORT][163] ([Intel XE#1304]) -> [PASS][164]
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-436/igt@xe_exec_reset@cm-cat-error.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-466/igt@xe_exec_reset@cm-cat-error.html

  * igt@xe_exec_threads@threads-bal-fd-userptr-invalidate:
    - shard-dg2-set2:     [TIMEOUT][165] ([Intel XE#1206] / [Intel XE#1261] / [Intel XE#1356]) -> [PASS][166] +1 other test pass
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-435/igt@xe_exec_threads@threads-bal-fd-userptr-invalidate.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-436/igt@xe_exec_threads@threads-bal-fd-userptr-invalidate.html

  * igt@xe_exec_threads@threads-hang-userptr-rebind-err:
    - {shard-lnl}:        [DMESG-WARN][167] -> [PASS][168] +2 other tests pass
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-5/igt@xe_exec_threads@threads-hang-userptr-rebind-err.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-lnl-2/igt@xe_exec_threads@threads-hang-userptr-rebind-err.html

  
#### Warnings ####

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [FAIL][169] ([Intel XE#1231]) -> [DMESG-FAIL][170] ([Intel XE#324])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_content_protection@legacy:
    - shard-dg2-set2:     [SKIP][171] ([Intel XE#1201] / [Intel XE#455]) -> [FAIL][172] ([Intel XE#1178])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-464/igt@kms_content_protection@legacy.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-435/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     [FAIL][173] ([Intel XE#1188]) -> [SKIP][174] ([Intel XE#1201] / [Intel XE#455])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-466/igt@kms_content_protection@uevent.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-464/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-adlp:         [DMESG-WARN][175] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [INCOMPLETE][176] ([Intel XE#1195] / [Intel XE#927])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-adlp-6/igt@kms_cursor_crc@cursor-suspend.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-9/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][177] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [INCOMPLETE][178] ([Intel XE#1195])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-adlp-6/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-9/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-dg2-set2:     [DMESG-WARN][179] ([Intel XE#1214] / [Intel XE#282]) -> [DMESG-WARN][180] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-463/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-435/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][181] ([Intel XE#1214] / [Intel XE#1608]) -> [DMESG-WARN][182] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) +2 other tests dmesg-warn
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-adlp:         [INCOMPLETE][183] ([Intel XE#1195] / [Intel XE#927]) -> [DMESG-WARN][184] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-pgflip-blt:
    - shard-adlp:         [SKIP][185] ([Intel XE#1201] / [Intel XE#1210]) -> [SKIP][186] ([Intel XE#1201])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-pgflip-blt.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-adlp:         [DMESG-WARN][187] ([Intel XE#1191] / [Intel XE#1214]) -> [INCOMPLETE][188] ([Intel XE#1195] / [Intel XE#927])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-adlp-4/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-1/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][189] ([Intel XE#1191] / [Intel XE#1214]) -> [INCOMPLETE][190] ([Intel XE#1195])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-adlp-4/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][191] ([Intel XE#1201]) -> [SKIP][192] ([Intel XE#1201] / [Intel XE#362])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:
    - shard-adlp:         [INCOMPLETE][193] ([Intel XE#1034] / [Intel XE#1195]) -> [DMESG-WARN][194] ([Intel XE#1191] / [Intel XE#1214]) +1 other test dmesg-warn
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-adlp-1/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-4/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html

  * igt@xe_gt_freq@freq_suspend:
    - shard-adlp:         [DMESG-WARN][195] ([Intel XE#1162] / [Intel XE#1191] / [Intel XE#1214]) -> [INCOMPLETE][196] ([Intel XE#1195])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-adlp-2/igt@xe_gt_freq@freq_suspend.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-1/igt@xe_gt_freq@freq_suspend.html

  * igt@xe_pm@s2idle-basic-exec:
    - shard-adlp:         [INCOMPLETE][197] ([Intel XE#1195] / [Intel XE#1358] / [Intel XE#927]) -> [DMESG-WARN][198] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-adlp-9/igt@xe_pm@s2idle-basic-exec.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-4/igt@xe_pm@s2idle-basic-exec.html

  * igt@xe_pm@s2idle-exec-after:
    - shard-adlp:         [INCOMPLETE][199] ([Intel XE#1044] / [Intel XE#1195] / [Intel XE#1358]) -> [DMESG-WARN][200] ([Intel XE#1191] / [Intel XE#1214])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-adlp-9/igt@xe_pm@s2idle-exec-after.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-6/igt@xe_pm@s2idle-exec-after.html

  * igt@xe_pm@s3-exec-after:
    - shard-adlp:         [DMESG-WARN][201] ([Intel XE#1191] / [Intel XE#1214]) -> [INCOMPLETE][202] ([Intel XE#1195] / [Intel XE#1358])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-adlp-6/igt@xe_pm@s3-exec-after.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-9/igt@xe_pm@s3-exec-after.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1034]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034
  [Intel XE#1041]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041
  [Intel XE#1043]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1043
  [Intel XE#1044]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044
  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
  [Intel XE#1080]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1080
  [Intel XE#1081]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081
  [Intel XE#1088]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1088
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
  [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
  [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1206]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1206
  [Intel XE#1210]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1210
  [Intel XE#1211]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211
  [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
  [Intel XE#1221]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1221
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1234
  [Intel XE#1235]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1235
  [Intel XE#1256]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1256
  [Intel XE#1259]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259
  [Intel XE#1261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1261
  [Intel XE#1304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1304
  [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
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
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1446
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1523]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1523
  [Intel XE#1537]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1537
  [Intel XE#1538]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1538
  [Intel XE#1558]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1558
  [Intel XE#1559]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1559
  [Intel XE#1577]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1577
  [Intel XE#1595]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1595
  [Intel XE#1603]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1603
  [Intel XE#1608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608
  [Intel XE#1619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1619
  [Intel XE#1645]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1645
  [Intel XE#1689]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1689
  [Intel XE#1693]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1693
  [Intel XE#1694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694
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
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#581]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/581
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#687]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/687
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/904
  [Intel XE#910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/910
  [Intel XE#927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/927
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#931]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/931
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274


Build changes
-------------

  * Linux: xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa -> xe-pw-132729v1

  IGT_7815: d5d516bfdf77898e934b4c7ed947a43711cfb226 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa: 5b3637fab551c28eef3e80d371ea7500e2aafbaa
  xe-pw-132729v1: 132729v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/index.html

--===============2305127867621256403==
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
<tr><td><b>Series:</b></td><td>drm/xe: make xe_pm_runtime_lockdep_map a static struct</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132729/">https://patchwork.freedesktop.org/series/132729/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa_full -&gt; xe-pw-132729v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-132729v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-132729v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-132729v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_tiled_display@basic-test-pattern:<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@core_getversion@basic:</p>
<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-lnl-4/igt@core_getversion@basic.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>
<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html">SKIP</a> +131 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_hdr@bpc-switch-suspend@pipe-a-edp-2}:</p>
<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-lnl-3/igt@kms_hdr@bpc-switch-suspend@pipe-a-edp-2.html">INCOMPLETE</a> +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-5/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-lnl-2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_store@page-sized:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-4/igt@xe_exec_store@page-sized.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-lnl-4/igt@xe_exec_store@page-sized.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-132729v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug-lateclose:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-2/igt@core_hotunplug@hotreplug-lateclose.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1538">Intel XE#1538</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1689">Intel XE#1689</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-4/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-436/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-4/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-463/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-2/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-4/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-463/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-2/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-466/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-hdmi-a-7:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-hdmi-a-7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +54 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +35 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-d-hdmi-a-7:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-d-hdmi-a-7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-6/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152">Intel XE#1152</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-436/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-2/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-6/igt@kms_chamelium_hpd@dp-hpd-storm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-463/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-8/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-435/igt@kms_content_protection@legacy@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-6/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-4/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-433/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-434/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-436/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-6/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-4/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-4/igt@kms_flip@2x-blocking-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-6/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a2:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-6/igt@kms_flip@flip-vs-suspend@a-hdmi-a2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-436/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +45 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1235">Intel XE#1235</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-accept-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-466/igt@kms_getfb@getfb2-accept-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/687">Intel XE#687</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-463/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-435/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-6/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1088">Intel XE#1088</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330">Intel XE#1330</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-hdmi-a-2:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-6/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-hdmi-a-2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-466/igt@kms_plane_cursor@primary.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/581">Intel XE#581</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-463/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-463/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-2/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@drm-resources-equal:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-435/igt@kms_pm_rpm@drm-resources-equal.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-433/igt@kms_pm_rpm@drm-resources-equal.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-2/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-466/igt@kms_psr@fbc-pr-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1234">Intel XE#1234</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-436/igt@kms_psr@fbc-psr2-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-page-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-6/igt@kms_psr@pr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rmfb@close-fd@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-8/igt@kms_rmfb@close-fd@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/294">Intel XE#294</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_rmfb@close-fd@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-435/igt@kms_rmfb@close-fd@pipe-b-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/294">Intel XE#294</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-4/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-436/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-4/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-2/igt@kms_vblank@ts-continuation-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-2/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-2/igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-4/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-8/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1080">Intel XE#1080</a>) +29 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-8/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-463/igt@xe_evict@evict-cm-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-435/igt@xe_evict@evict-cm-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041">Intel XE#1041</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-4/igt@xe_evict@evict-large-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-436/igt@xe_evict@evict-mixed-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-2/igt@xe_evict@evict-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-small-multi-vm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-434/igt@xe_evict@evict-threads-small-multi-vm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-466/igt@xe_evict@evict-threads-small-multi-vm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259">Intel XE#1259</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-cm-parallel-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-6/igt@xe_exec_balancer@once-cm-parallel-userptr-invalidate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@lr-mode-workload:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-2/igt@xe_exec_compute_mode@lr-mode-workload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1396">Intel XE#1396</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-bindexecqueue-rebind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-adlp-9/igt@xe_exec_compute_mode@twice-bindexecqueue-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-9/igt@xe_exec_compute_mode@twice-bindexecqueue-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-6/igt@xe_exec_fault_mode@many-execqueues-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-invalid-fault:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-463/igt@xe_exec_fault_mode@twice-invalid-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-fd-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-466/igt@xe_exec_threads@threads-bal-fd-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-466/igt@xe_exec_threads@threads-bal-fd-rebind.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1206">Intel XE#1206</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-fd-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-463/igt@xe_exec_threads@threads-cm-fd-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-435/igt@xe_exec_threads@threads-cm-fd-basic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1206">Intel XE#1206</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1261">Intel XE#1261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-6/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-463/igt@xe_peer2peer@read.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3-mmap-vram:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-8/igt@xe_pm@d3-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008">Intel XE#1008</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-463/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-config:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-4/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-463/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@bind-flag-invalid:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-4/igt@xe_vm@bind-flag-invalid.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1559">Intel XE#1559</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-binds-536870912:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-6/igt@xe_vm@large-split-binds-536870912.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1619">Intel XE#1619</a>) +1 other test dmesg-fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@invalid-set-prop:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-adlp-6/igt@kms_addfb_basic@invalid-set-prop.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-6/igt@kms_addfb_basic@invalid-set-prop.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-180:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-2/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-lnl-8/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-bo@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-464/igt@kms_cursor_legacy@single-bo@pipe-b.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-435/igt@kms_cursor_legacy@single-bo@pipe-b.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-3/igt@kms_flip@flip-vs-blocking-wf-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-lnl-7/igt@kms_flip@flip-vs-blocking-wf-vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-434/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-433/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area@psr2-pipe-b-edp-1:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-5/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area@psr2-pipe-b-edp-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330">Intel XE#1330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-lnl-2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area@psr2-pipe-b-edp-1.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@accuracy-idle:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-2/igt@kms_vblank@accuracy-idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1523">Intel XE#1523</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-lnl-8/igt@kms_vblank@accuracy-idle.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-466/igt@kms_vblank@ts-continuation-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-464/igt@kms_vblank@ts-continuation-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-large-multi-vm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-436/igt@xe_evict@evict-beng-cm-threads-large-multi-vm.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-463/igt@xe_evict@evict-beng-cm-threads-large-multi-vm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-434/igt@xe_evict@evict-beng-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/931">Intel XE#931</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-433/igt@xe_evict@evict-beng-mixed-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-small-multi-vm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-435/igt@xe_evict@evict-beng-threads-small-multi-vm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259">Intel XE#1259</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-435/igt@xe_evict@evict-beng-threads-small-multi-vm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-436/igt@xe_evict@evict-mixed-threads-small.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-463/igt@xe_evict@evict-mixed-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-464/igt@xe_evict@evict-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-435/igt@xe_evict@evict-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-virtual-userptr-invalidate-race:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-4/igt@xe_exec_balancer@many-execqueues-virtual-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1645">Intel XE#1645</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-lnl-2/igt@xe_exec_balancer@many-execqueues-virtual-userptr-invalidate-race.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate-race:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-4/igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate-race.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-lnl-2/igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate-race.html">PASS</a> +65 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-rebind-prefetch:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-1/igt@xe_exec_fault_mode@many-execqueues-userptr-rebind-prefetch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330">Intel XE#1330</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1537">Intel XE#1537</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-lnl-7/igt@xe_exec_fault_mode@many-execqueues-userptr-rebind-prefetch.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-cat-error:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-436/igt@xe_exec_reset@cm-cat-error.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1304">Intel XE#1304</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-466/igt@xe_exec_reset@cm-cat-error.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-fd-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-435/igt@xe_exec_threads@threads-bal-fd-userptr-invalidate.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1206">Intel XE#1206</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1261">Intel XE#1261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-436/igt@xe_exec_threads@threads-bal-fd-userptr-invalidate.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-userptr-rebind-err:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-5/igt@xe_exec_threads@threads-hang-userptr-rebind-err.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-lnl-2/igt@xe_exec_threads@threads-hang-userptr-rebind-err.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-464/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-435/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-466/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-464/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-adlp-6/igt@kms_cursor_crc@cursor-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-9/igt@kms_cursor_crc@cursor-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-adlp-6/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-9/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-463/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-435/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/910">Intel XE#910</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1210">Intel XE#1210</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-adlp-4/igt@kms_pipe_crc_basic@suspend-read-crc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-1/igt@kms_pipe_crc_basic@suspend-read-crc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-adlp-4/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-adlp-1/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034">Intel XE#1034</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-4/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-adlp-2/igt@xe_gt_freq@freq_suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-1/igt@xe_gt_freq@freq_suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-adlp-9/igt@xe_pm@s2idle-basic-exec.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-4/igt@xe_pm@s2idle-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-exec-after:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-adlp-9/igt@xe_pm@s2idle-exec-after.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044">Intel XE#1044</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-6/igt@xe_pm@s2idle-exec-after.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-exec-after:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-adlp-6/igt@xe_pm@s3-exec-after.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132729v1/shard-adlp-9/igt@xe_pm@s3-exec-after.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa -&gt; xe-pw-132729v1</li>
</ul>
<p>IGT_7815: d5d516bfdf77898e934b4c7ed947a43711cfb226 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa: 5b3637fab551c28eef3e80d371ea7500e2aafbaa<br />
  xe-pw-132729v1: 132729v1</p>

</body>
</html>

--===============2305127867621256403==--
